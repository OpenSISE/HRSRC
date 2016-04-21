<?php

/**
 * @author Zhou Yuyang <1009465756@qq.com> 12:28 2016/1/23
 * @copyright 2105-2018 SRCMS 
 * @homepage http://www.src.pw
 * @version 1.5
 */

namespace Home\Controller;

use Think\Controller;

class IndexController extends Controller{

    public function index(){
		
		//$model = M('hall');
		$model = M('member');
		$tmodel= M('setting');
		$title = $tmodel->where('id=1')->select();
		$introduce = $tmodel->where('id=7')->select();
		$meaning = $tmodel->where('id=8')->select();
		$hall = $model->order('rank DESC')->limit(3)->select();
        $this->assign('model', $hall);
		$this->assign('title', $title);
		$this->assign('intro',$introduce);
		$this->assign('mean',$meaning);
        $this->display();
    }
	
}
