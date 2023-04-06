<?php

namespace QTDL\PROJECT;

class controlUser{
    private $db;

    public $id;
    public $taikhoan;
    public $matkhau;
    public $hoten;
    private $user_type;
    public $errors = [];

    public function __construct($pdo)
	    {
    		$this->db = $pdo;
	    }
        public function getValidationErrors()
	{
		return $this->errors;
	}
public function validate(){
    if(!$this->taikhoan){
        $this->errors['taikhoan']='Tài khoản không được trống.';
    }
    if(!$this->matkhau){
        $this->errors['matkhau']='Mật khẩu không được trống.';
    }
    if(!$this->hoten){
        $this->errors['hoten']='Họ và tên không được trống.';
    }
    if($this->findUsertheoTaiKhoan($this->taikhoan)){
        $this->errors['taikhoan']='Tài khoản đã tồn tại.';
    }
    return empty($this->errors);
	}
public function fillUser(array $User){
    if(isset($User['taikhoan'])){
        $this->taikhoan = trim($User['taikhoan']);
    }
    if(isset($User['matkhau'])){
        $this->matkhau = trim($User['matkhau']);
    }
    if(isset($User['hoten'])){
        $this->hoten = trim($User['hoten']);
    }
    return $this;
}
    public function getUserType(){
        return $this->user_type;
    }
    public function findUsertheoTaiKhoan($taikhoan){
        $statement = $this->db->prepare('select * from nguoidung where taikhoan like :taikhoan');
        $statement->execute(array('taikhoan'=>$taikhoan));
        if($row = $statement->fetch()){
            $this->fillFromUser($row);
        }
        return isset($this->id);
    }
    public function getUsertheoTaiKhoan($User){
        $statement = $this->db->prepare('select * from nguoidung where taikhoan like :taikhoan and matkhau like :matkhau');
        $statement->execute(['taikhoan'=>$User['taikhoan'],'matkhau'=>$User['matkhau']]);
        if($row = $statement->fetch()){
            $this->fillFromUser($row);
        }
        return $this;
    }
    protected function fillFromUser(array $row)
	{
		[
			'id' => $this->id,
			'taikhoan' => $this->taikhoan,
			'matkhau' => $this->matkhau,
            'hoten' => $this->hoten,
            'user_type' => $this->user_type
		] = $row;
		return $this;
	}
    public function checkUser(){
        if(!$this->taikhoan){
            return false;
        }
        if(!$this->matkhau){
            return false;
        }
        return true;
    }
    public function saveUser(){
        $result = false;
        if(!$this->id){
            $statement = $this->db->prepare(
                'insert into nguoidung (taikhoan,matkhau,hoten,user_type) 
                values(:taikhoan,:matkhau,:hoten,:user_type);'
            );
            $result = $statement->execute([
                'taikhoan'=> $this->taikhoan,
                'matkhau'=> $this->matkhau,
                'hoten'=> $this->hoten,
                'user_type'=> 'user'
            ]);
            if ($result) {
                $this->maUser = $this->db->lastInsertId();
            }
        }
        return $result;
    }
}