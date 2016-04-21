<?php

/**
 * @author Bison <491463471@qq.com> 1:59 2016/4/1
 * @copyright 2105-2018 HR·SRC
 * @version 2.0
 */

namespace Home\Controller;

use Think\Controller;

class ListController extends Controller{

     public function index($key="")
    {	
		
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
		
        $post = $model->limit($Page->firstRow.','.$Page->listRows)->where('post.type!=1 and post.type!=2',$where)->order('post.id DESC')->select();   //where('user_id='.$id)->
        
	    $ncount  = $model->where('post.type=1',$where)->count();// 查询满足要求的总记录数
        $nPage = new \Extend\Page($ncount,5);// 实例化分页类 传入总记录数和每页显示的记录数(15)
        $nshow = $nPage->show();// 分页显示输出
		
		$new  = $model->limit('1,'.$nPage->listRows)->where('post.type=1',$where)->order('post.id DESC')->select();
		
		$this->assign('newBug', $new);
		$this->assign('nCount',$ncount);
		$this->assign('Count',$count);
		$this->assign('model', $post);
        $this->assign('page',$show);
	
		
        $this->display();   
    }
	public function newlist($key="")
	{
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
	    $ncount  = $model->where('post.type=1',$where)->count();// 查询满足要求的总记录数
        $nPage = new \Extend\Page($ncount,5);// 实例化分页类 传入总记录数和每页显示的记录数(15)
        $nshow = $nPage->show();// 分页显示输出
		
		$new  = $model->limit($nPage->firstRow.','.$nPage->listRows)->where('post.type=1',$where)->order('post.id DESC')->select();
		$this->assign('newBug', $new);
		$this->assign('npage',$nshow);
		$this->assign('nCount',$ncount);
		$this->assign('Count',$count);
		$this->display();  
	}
		public function view(){
		$id = session('userId');
		$rid = I('get.rid',0,'intval');
	    $model = M("Post");

	    $post = $model->where('type!=1 ANd  id='.$rid)->find();  //修复越权漏洞
		if(empty($post))
		{echo '<script LANGUAGE=\'javascript\'>alert(\'通过审核的漏洞才能查看细节!\');window.history.back();</script>';}       
		$tmodel= M('setting');
		$cModel = M('comments');
		$count = $cModel->where('page_id='.$rid)->count();
		$nPage = new \Extend\Page($count,8);
		$Comments = $cModel->limit($nPage->firstRow.','.$nPage->listRows)->join('member on comments.uid=member.id','left')->field('member.username,comments.*')->where('page_id='.$rid)->select();

		$nshow = $nPage->show();		
		$title = $tmodel->where('id=1')->select();
		$startNum=$nPage->firstRow>1?$nPage->firstRow+1:1;
		$this->assign('title', $title);
        $this->assign('model', $post);
		$this->assign('comment',$Comments);
		$this->assign('page_id',$rid);
		$this->assign('npage',$nshow);
		$this->assign('NumStart',$startNum);
		$ListIndex = 0;
        $this->display();
    }
	
	public function reply()
	{
		 if(!IS_POST)$this->error("非法请求");
		 if(empty(session('userId')))$this->error("请登录后再评论!","/user.php");
		  $content =I('ReplyText');
		  $rid=I('rid');
		 $code = I('verify','','strtolower');
        //验证验证码是否正确
        if(!($this->check_verify($code))){
            $this->error('验证码错误');
        }
		$data['uid'] = session('userId');
		$data['content'] = $content;
		$data['page_id'] = $rid;
		$cModel = M('comments');
		$cModel->create($data);

		if ($cModel->add($data)) {
                    $this->success("评论成功!", U('list/view?rid='.$rid));
                } else {
                    $this->error("评论失败!");
                }	
	} 
		//验证码
    public function verify(){
		ob_clean();
		$config =  array(    'fontSize'    =>    30,    // 验证码字体大小
		    'length'      =>    3,     // 验证码位数 
			   'useNoise'    =>    false, // 关闭验证码杂点
			   );
        $Verify = new \Think\Verify($config);
        $Verify->codeSet = '1234567890abcdefghijklmnopqrstuvwxyz';
        $Verify->fontSize = 35;
        $Verify->length = 4;
        $Verify->entry();
    }
    protected function check_verify($code){
		$config =  array(    'fontSize'    =>    35,    // 验证码字体大小
		    'length'      =>    3,     // 验证码位数 
			   'useNoise'    =>    false, // 关闭验证码杂点
			   );
        $verify = new \Think\Verify($config);
        return $verify->check($code);
    }
	
}
