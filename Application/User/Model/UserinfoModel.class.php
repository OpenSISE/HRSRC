<?php
namespace User\Model;
use Think\Model;
class UserinfoModel extends Model{
   protected $_validate = array(
        array('des','require','请填写个性签名！'), //默认情况下用正则进行验证
        array('face','require','请认证上传头像'), // 
    );
   protected $_auto = array ( 
        array('uid','getUid',1,'callback'), // 对update_time字段在更新的时候写入当前用户ID
    );
   protected function getUid(){
    	return session('userId');
    }

}