<?php

function functionAddQuest($PDO,array $Data,$maDT){
$statement = $PDO->prepare('insert into cauhoi (maDT,ndCauHoi) values(:maDT,:ndCauHoi);');
$statement->execute([
    'maDT'=>$maDT,
    'ndCauHoi'=>$Data['ndCauHoi']
]);
$maCH=$PDO->lastInsertId();
$statement = $PDO->prepare('insert into traloi(maCH,dapan,ndTraLoi,vitri) values(:maCH,:dapan,:ndTraLoi,:vitri)');
$statement->execute([
    'maCH'=>$maCH,
    'dapan'=>$Data['dapan']==1,
    'ndTraLoi'=>$Data['ndTraLoi1'],
    'vitri'=>'A'
]);
$statement->execute([
    'maCH'=>$maCH,
    'dapan'=>$Data['dapan']==2,
    'ndTraLoi'=>$Data['ndTraLoi2'],
    'vitri'=>'B'
]);
$statement->execute([
    'maCH'=>$maCH,
    'dapan'=>$Data['dapan']==3,
    'ndTraLoi'=>$Data['ndTraLoi3'],
    'vitri'=>'C'
]);
$statement->execute([
    'maCH'=>$maCH,
    'dapan'=>$Data['dapan']==4,
    'ndTraLoi'=>$Data['ndTraLoi4'],
    'vitri'=>'D'
]);
return true;
}