<?php
namespace User\Controller;
use Think\Controller;

/**
 * @author Bison  20:58 2016/4/1
 * @copyright 2105-2018 HR·SRC
 * @version 2.0
 */


/**
 * 修改个人信息
 */
class UserinfoController extends Controller{
	
	 public function index(){
		 $id = session('userId');
		 $user = M('userinfo')->where('uid='.$id)->select();
		$this->assign('User',$user);
		$this->display();
	 }
	 /*
	 *add face and description
	 */
	public function add()
    {
        //默认显示添加表单
        if (!IS_POST) {
            $this->display();
        }
				
        if (IS_POST) {
            //如果用户提交数据
			$id = session('userId');
            $model = M("member");
			$user = $model->where('id='.$id)->select();
			if($_FILES){
			$filename= $this->UploadImg();
			}	
			$model->where('id='.$id)->setField('des',$_POST['des']);
			if(!empty($filename)){$data['face'] = $filename;$model->where('id='.$id)->setField('face',$filename);}
			$this->success("更新成功", U('index/index'));

            
		    
            
        }
    }
	 

	 public function UploadImg()
	 {
		// var_dump($_FILES);
	        if($_FILES){
	        $upload = new \Think\Upload();// 实例化上传类
		    $upload->maxSize   =     3145728 ;// 设置附件上传大小
			$upload->rootPath  =      './Public/';
			$upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
			$upload->savePath  =      './Upload/'; // 设置附件上传目录
			$upload->subName  = array('date','Ymd');		
			$info   =   $upload->upload();// 上传文件
			if(!$info) {
				// 上传错误提示错误信息
			    $this->error($upload->getError());
				}else{
					//var_dump($info);
				$file_newname = './Public'.substr($info['face']["savepath"],1);
				$file_newname .= $info['face']["savename"];
					// 上传成功 获取上传文件信息
                 switch($info['face']['error'])
             {
             case 0:
                 //echo $file_newname;
				 return $file_newname;
                 break;
             case 1:
                 echo "上传的文件超过了 php.ini 中 upload_max_filesize 选项限制的值";
                 break;
             case 2:
                 echo "上传文件的大小超过了 HTML 表单中 MAX_FILE_SIZE 选项指定的值";
                 break;
             case 3:
                 echo "文件只有部分被上传";
                 break;
             case 4:
                 echo "没有文件被上传";
                 break;
             }
		   }
		 
	    }
			
	 }
	
}