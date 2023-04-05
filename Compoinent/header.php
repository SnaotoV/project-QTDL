<?php session_start();?>
<div class="header bg-primary">
        <div class="navbar-nav nav navbar-expand-md ml-3">
			<a href="<?=BASE_URL_PATH . 'index.php'?>" class="nav-link mr-3 text-white">Trang chủ</a>
			<a href="#" class="nav-link mr-3 text-white ">Đề Thi</a>
			<a href="#" class="nav-link mr-3 text-white ">Về chúng tôi</a>
			<a href="#" class="nav-link mr-3 text-white ">FAQ</a>
			<a href="#" class="nav-link mr-3 text-white ">Liên hệ</a>
			<?php if(empty($_SESSION['id'])):?>
				<a href="<?=BASE_URL_PATH.'login.php'?>" class="nav-link mr-3 text-white ">Đăng nhập</a>
				<a href="#" class="nav-link mr-3 text-white ">Đăng ký</a>
				<?php else :?>
					<div class="nav-link mr-3 text-white "><?=htmlspecialchars($_SESSION['hoten'])?></div>
					<a href="<?=BASE_URL_PATH.'logout.php'?>" class="nav-link mr-3 text-white ">Đăng xuất</a>
				<?php endif?>
			
		</div>
</div>