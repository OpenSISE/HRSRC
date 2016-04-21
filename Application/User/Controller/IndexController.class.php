<?php
namespace User\Controller;
use Think\Controller;

/**
 * @author Zhou Yuyang <1009465756@qq.com> 12:28 2016/1/23
 * @copyright 2105-2018 SRCMS 
 * @homepage http://www.src.pw
 * @version 1.5
 */

class IndexController extends BaseController {
    public function index(){
		
		$id = session('userId');
		$user = M('member')->where('id='.$id)->select();
		//echo(strlen($user[0]['des']));	
		$id = session('userId');
		$tmodel= M('setting');
		$rModel = M('links');
		$rCount = $rModel->where('state=1')->count();
		$title = $tmodel->where('id=1')->select();
		$page = M('post')->where('user_id='.$id)->count();
		$user = M('member')->where('id='.$id)->select();
		$this->assign('title', $title);
        $this->assign('page',$page);
		$this->assign('user',$user);
		$this->assign('rcount',$rCount);
		$this->assign('info',$user);

		
        $this->display();
    }
}