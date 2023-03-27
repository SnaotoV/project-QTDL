<?php
namespace QTDL\PROJECT;
class controlDeThi{
private $db;
public $maDT;
public $tenDT;
public $ngaythi;
public $tgthi;
public $mamon;
public $makhoa;
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
    if(!$this->tenDT){
        $this->errors['tenDT']='Tên đề thi không được trống.';
    }
    if(!$this->ngaythi){
        $this->errors['ngaythi']='Ngày thi không được trống.';
    }
    if(!$this->tgthi){
        $this->errors['tgthi']='Thời gian thi không được trống.';
    }
    return empty($this->errors);
	}
public function fillDeThi(array $Dethi){
    if(isset($Dethi['makhoa'])){
        $this->makhoa = trim($Dethi['makhoa']);
    }
    if(isset($Dethi['mamon'])){
        $this->mamon = trim($Dethi['mamon']);
    }
    if(isset($Dethi['tenDT'])){
        $this->tenDT = trim($Dethi['tenDT']);
    }
    if(isset($Dethi['ngaythi'])){
        $this->ngaythi = trim($Dethi['ngaythi']);
    }
    if(filter_var($Dethi['tgthi'], FILTER_SANITIZE_NUMBER_INT)>0){
        $this->tgthi = $Dethi['tgthi'];
    }
    return $this;
}
public function getDeThi(){
    $allDeThi = [];
    $statement = $this->db->prepare('select * from dethi');
    $statement->execute();
    while($row = $statement->fetch()){
        $dethi = new controlDeThi($this->db);
        $dethi->fillFromDT($row);
        $allDeThi[] =$dethi;
    }
    return $allDeThi;
}
public function getDeThiTheoMon($mamon){
    $allDeThi = [];
    $statement = $this->db->prepare('select * from dethi where mamon like :mamon');
    $statement->execute(array('mamon'=>$mamon));
    while($row = $statement->fetch()){
        $dethi = new controlDeThi($this->db);
        $dethi->fillFromDT($row);
        $allDeThi[] =$dethi;
    }
    return $allDeThi;
}
public function getDeThiMaDeThi($maDT){
    $statement = $this->db->prepare('select * from dethi where maDT like :maDT');
    $statement->execute(array('maDT'=>$maDT));
    while($row = $statement->fetch()){
        $dethi = new controlDeThi($this->db);
        $dethi->fillFromDT($row);
    }
    return $dethi;
}
protected function fillFromDT(array $row)
{
    [
        'maDT' => $this->maDT,
        'tenDT' => $this->tenDT,
        'ngaythi'=>$this->ngaythi,
        'tgthi'=>$this->tgthi,
        'mamon'=>$this->mamon
    ] = $row;
    return $this;
}
public function autoIdDeThi($mamon){
    $statement = $this->db->prepare('select count(maDT) as slDe from dethi where mamon like :mamon');
    $statement->execute(array('mamon'=>$mamon));
    $countDeThi = $statement->fetch();
    return $mamon.'D'.$countDeThi['slDe']+1;
}
public function saveDeThi(){
    $result = false;
    if(!$this->maDT){
        $statement = $this->db->prepare(
            'insert into Dethi values(:maDT,:tenDT,:ngaythi,:tgthi,:makhoa,:mamon);'
        );
        $mauDT = new controlDeThi($this->db);
        $result = $statement->execute([
            'maDT'=> $mauDT->autoIdDeThi($this->mamon),
            'tenDT'=> $this->tenDT,
            'ngaythi'=> $this->ngaythi,
            'tgthi'=> $this->tgthi,
            'makhoa'=> $this->makhoa,
            'mamon'=> $this->mamon
        ]);
        if ($result) {
            $this->maDT = $this->db->lastInsertId();
        }
    }
    return $result;
}
}