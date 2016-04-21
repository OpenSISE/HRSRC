<?php

/**
 * @author Zhou Yuyang <1009465756@qq.com> 13:59 2016/1/25
 * @copyright 2105-2018 SRCMS 
 * @homepage http://www.src.pw
 * @version 1.5
 */

namespace Home\Controller;

use Think\Controller;

class HallController extends Controller{

     public function index($key="")
    {
       $xuhao = 1;
       $model = M('member');
       $tmodel= M('setting');
	   $Condition['jifen'] = array('egt',0);
	   $Condition['type'] = 1;
	$title = $tmodel->where('id=1')->select();
        $user = $model->order('rank DESC')->where($Condition)->limit(10)->select();  // fix bug issued by phith0n  13:59 2016/1/25
        $this->assign('title', $title);
	$this ->assign('xuhao',$xuhao);
        $this->assign('user',getSortedCategory($user));
		
		
		
     if($key == ""){
            $model = D('PostView'); 
        }else{
            $where['post.title'] = array('like',"%$key%");
            $where['member.username'] = array('like',"%$key%");
            $where['category.title'] = array('like',"%$key%");
            $where['_logic'] = 'or';
            $model = D('PostView')->where($where); 
        } 		      
		$id = session('userId');        //->where('user_id='.$id)
        $count  = $model->where('post.type!=1 and post.type!=2',$where)->count();// 查询满足要求的总记录数
        $Page = new \Extend\Page($count,5);// 实例化分页类 传入总记录数和每页显示的记录数(15)
        $show = $Page->show();// 分页显示输出
        $post = $model->limit($Page->firstRow.','.$Page->listRows)->where('post.type!=1 and post.type!=2',$where)->order('post.rank DESC')->select();   //where('user_id='.$id)->
        $this->assign('model', $post);
        $this->assign('page',$show);
		
		
        $this->display();   
    }
}
