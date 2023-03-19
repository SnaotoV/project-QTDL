<?php
    require_once '../connectData.php';
    use QTDL\PROJECT\controlMon;
    $controlMon= new controlMon($PDO);
    $allMon = $controlMon->getMonTheoKhoa($khoa);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đề Thi CTU</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
		integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
		</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous">
		</script>
</head>
<body>
    <div class="header">
        <div class="navbar-nav nav navbar-expand-md">
			<a href="#" class="nav-link mr-3 ">Trang chủ</a>
			<a href="#" class="nav-link mr-3 ">Đề Thi</a>
			<a href="#" class="nav-link mr-3 ">Về chúng tôi</a>
			<a href="#" class="nav-link mr-3 ">FAQ</a>
			<a href="#" class="nav-link mr-3 ">Liên hệ</a>
		</div>
    </div>
    <div class="main">
        <?php?>
        <table>
            <?php foreach($allMon as $mon): ?>
                <tr>
                    <td><a href=""><?=htmlspecialchars($mon->mamon)?></a> - </td>
                    <td><a href=""><?=htmlspecialchars($mon->tenmon)?></a></td>
                </tr>
                <?php endforeach?>
        </table>
    </div>
    <div class="footer">

    </div>
</body>
</html>