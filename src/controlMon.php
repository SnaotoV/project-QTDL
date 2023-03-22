<?php
namespace QTDL\PROJECT;
class controlMon{

// khai báo
    private $db;
    public $mamon;
    public $tenmon;
    public $makhoa;

// khai báo

    public function __construct($pdo)
	    {
    		$this->db = $pdo;
	    }
    public function getIdMon(){
        return $this->mamon;
    }
    public function getMon(){
        $allMon = [];
        $statement = $this->db->prepare('select * from mon');
        $statement->execute();
        while($row = $statement->fetch()){
            $mon = new controlMon($this->db);
            $mon->fillFromMon($row);
            $allMon[] =$mon;
        }
        return $allMon;
    }
    public function getMonTheoKhoa($khoa){
        $allMon = [];
        $statement = $this->db->prepare('select * from mon where makhoa like :khoa');
        $statement->execute(array('khoa'=>$khoa));
        while($row = $statement->fetch()){
            $mon = new controlMon($this->db);
            $mon->fillFromMon($row);
            $allMon[] =$mon;
        }
        return $allMon;
    }
    protected function fillFromMon(array $row)
	{
		[
			'mamon' => $this->mamon,
			'tenmon' => $this->tenmon,
			'makhoa' => $this->makhoa
		] = $row;
		return $this;
	}
}