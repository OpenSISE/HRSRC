<?php
namespace User\Controller;
use Think\Controller;

/**
 * @author Zhou Yuyang <1009465756@qq.com> 12:28 2016/1/23
 * @copyright 2105-2018 SRCMS 
 * @homepage http://www.src.pw
 * @version 1.5
 */

class LoginController extends Controller {
    //登陆主页
    public function index(){
		$tmodel= M('setting');
		$title = $tmodel->where('id=1')->select();
		$this->assign('title', $title);
        $this->display();
    }
    //登陆验证
    public function login(){
        if(!IS_POST)$this->error("非法请求");
        $member = M('member');
        $username =I('username');
        $password =I('password','','md5');
        $code = I('verify','','strtolower');
        //验证验证码是否正确
        if(!($this->check_verify($code))){
            $this->error('验证码错误');
        }
        //验证账号密码是否正确
        $user = $member->where(array('username'=>$username,'password'=>$password))->find();

        if(!$user) {
            $this->error('账号或密码错误 :(') ;
        }
        //验证账户是否被禁用
        if($user['status'] == 0){
            $this->error('账号被禁用，请联系超级管理员 :(') ;
        }

        //更新登陆信息
        $data =array(
            'id' => $user['id'],
            'update_at' => time(),
            'login_ip' => get_client_ip(),
        );
        
        //如果数据更新成功  跳转到后台主页
        if($member->save($data)){
            session('userId',$user['id']);
            session('username',$user['username']);
            $this->success("登陆成功",U('Index/index'));
        }
        //定向之后台主页
        

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

	
    //退出登录
    public function logout(){
        session('userId',null);
        session('username',null);
        redirect(U('Login/index'));
    }
}