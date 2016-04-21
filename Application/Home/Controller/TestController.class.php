<?php
namespace Home\Controller;

use Think\Controller;

class TestController extends Controller{

   public function hh()
    {
/*     echo "debug";  
	 $User = M("member"); // 实例化User对象// 要修改的数据对象属性赋值
	 $data['jifen'] = 'jifen'+8;
	 $User->where('id >= 1')->save($data); // 根据条件更新记录*/ 
	 $model = M('comments');
	 $data['uid']=1;
	 $data['page_id']=105;
	 for($i=1;$i<=100;$i++)
	  {
	  $data['content']="Bs Test Text ".$i;
	  $model->field()->add($data);
	  }
    }

}