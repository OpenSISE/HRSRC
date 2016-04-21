<?php
namespace User\Model;
use Think\Model;
class MemberModel extends Model{
    protected $_validate = array(
        array('username','require','请填写用户名！'), //默认情况下用正则进行验证
        array('email','require','请填写邮箱！'), //默认情况下用正则进行验证
        array('email','email','邮箱格式错误！'), //默认情况下用正则进行验证
        array('password','require','请填写密码！','','',self::MODEL_INSERT), //默认情况下用正则进行验证
     	array('repassword','password','确认密码不正确',0,'confirm'), // 验证确认密码是否和密码一致
        array('username','','该用户名已存在',0,'unique',self::MODEL_BOTH), // 在新增的时候验证name字段是否唯一
        array('email','','该邮箱已存在',0,'unique',self::MODEL_BOTH), // 在新增的时候验证name字段是否唯一
    );

    protected $_auto = array(
    	array('password','md5',1,'function') , //添加时用md5函数处理 
        array('update_at','time',2,'function'), //更新时
        array('create_at','time',1,'function'), //新增时
        array('login_ip','get_client_ip',3,'function'), //新增时
    );


}
