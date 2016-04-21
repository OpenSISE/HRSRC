<?php
namespace User\Controller;
use Think\Controller;

/**
 * @author Zhou Yuyang <1009465756@qq.com> 11:28 2016/1/26
 * @copyright 2105-2018 SRCMS 
 * @homepage http://www.src.pw
 * @version 1.6
 */


/**
 * 注册页面
 */
class RegController extends Controller{
    /**
     * 用户列表
     * @return [type] [description]
     */
    public function index()
    {
		$tmodel= M('setting');
		$title = $tmodel->where('id=1')->select();
		$this->assign('title', $title);
        $this->display();
    }

    /**
     * 添加用户
     */
    public function add()
    {
        //默认显示添加表单
        if (!IS_POST) {
            $this->display();
        }
        if (IS_POST) {
            //如果用户提交数据
            $model = D("Member");
            if (!$model->field('username,email,password,repassword')->create()) {
                // 如果创建失败 表示验证没有通过 输出错误提示信息
                $this->error($model->getError());
                exit();
            } else {
                if ($model->add()) {
                    $this->success("注册成功", U('index/index'));
                } else {
                    $this->error("注册失败");
                }
            }
        }
    }
}
