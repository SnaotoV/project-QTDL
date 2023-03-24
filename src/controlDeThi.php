<?php
namespace QTDL\PROJECT;
class controlDeThi{
private $db;
public $maDT;
public $tenDT;
public $ngaythi;
public $slCH;
public $tgthi;
public $mamon;

public function __construct($pdo)
{
    $this->db = $pdo;
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
        'slCH'=>$this->slCH,
        'mamon'=>$this->mamon
    ] = $row;
    return $this;
}
public function auToIdDeThi($mamon){
    $statement = $this->db->prepare('select count(maDT) as slDe from dethi');
    $statement->execute();
    $countDeThi = $statement->fetch();
    return $mamon.'D'.$countDeThi['slDe']+1;
}
}