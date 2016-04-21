<?php
namespace Home\Controller;

use Think\Controller;

class InsertController extends Controller{

   public function index()
    {
     echo "debug";  
	  $model = D("Post");
	  for($i=1;$i<=100;$i++)
	  {
	  $data['title'] = 'ThinkPHP'.$i;
	  $data['content'] = 'ThinkPHP@gmail.com'.$i;
	  $data['advise'] = $i;
	  $data['rank'] = rand(0,10);
	  $data['type'] = rand(1,4);
	  $data['time'] = time();
      $data['user_id'] = 1;
	  $data['cate_id'] = rand(1,15);
	 // $model->field('title,user_id,cate_id,content')->create();
	  $model->add($data);
	  }
	  exit();
           $this->success("添加成功");
		   
            
    }

}