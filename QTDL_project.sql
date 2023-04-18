create database project_QTDL;
-- 
use project_QTDL;
create table Khoa(
makhoa char(8) primary key NOT NULL,
tenKhoa varchar(50) NOT NULL
);
-- create table Nganh(
-- manganh char(8) primary key NOT NULL,
-- tennganh varchar(50) NOT NULL,
-- makhoa char(8) NOT NULL,
-- foreign key (makhoa) references khoa(makhoa)
-- );
create table Mon(
mamon char(8) primary key NOT NULL,
tenmon varchar(50) NOT NULL,
makhoa char(8) NOT NULL,
foreign key (makhoa) references khoa(makhoa)
);
create table DETHI (
maDT int(8) primary key NOT NULL auto_increment,
tenDT varchar(255) NOT NULL,
ngaythi date NOT NULL,
tgthi int,
makhoa char(8) NOT NULL,
-- manganh char(8) NOT NULL,
mamon char(8) NOT NULL,
foreign key (makhoa) references khoa(makhoa),
foreign key (mamon) references mon(mamon)
);
create table CAUHOI (
maCH int(8) primary key NOT NULL auto_increment,
maDT int(8),
ndCauHoi varchar(255),
foreign key (maDT) references DETHI(maDT)
);

create table TRALOI(
maTL int(8) primary key NOT NULL auto_increment,
maCH int(8) NOT NULL,
dapan int(1) NOT NULL,
ndTraLoi varchar(255) NOT NULL,
vitri char(1) Not null,
foreign key (maCH) references CAUHOI(maCH)
);
 create table NGUOIDUNG(
 id int(8)  primary key NOT NULL auto_increment,
 taikhoan varchar(16),
 matkhau varchar(16),
 hoten varchar(255),
 user_type varchar(50)
 );
  create table monday(
 id int(8),
 mamon char(8),
foreign key (id) references nguoidung(id),
foreign key (mamon) references mon(mamon) 
 );
 insert into nguoidung values(1,'AD123456','AD123456','Admin','admin');
 insert into nguoidung values(2,'Toan','Toan','Võ Phúc Toàn','user');

insert into Khoa values('DI','Công nghệ thông tin và truyền thông');
insert into Khoa values('KT','Kinh tế');
insert into Khoa values('SP','Sư Phạm');
insert into Khoa values('NN','Nông nghiệp');
insert into Khoa values('KL','Luật');
insert into Khoa values('MT','Chính Trị');
insert into Khoa values('KH','Khoa học tự nhiên');
insert into Khoa values('CN','Công Nghệ');
insert into Khoa values('XH','Xã hội nhân văn');

-- insert into Nganh values('7480201','Công Nghệ Thông Tin','DI');
-- insert into Nganh values('7480104','Hệ thống thông tin','DI');
-- insert into Nganh values('7480103','Kỹ thuật phần mềm','DI');
-- insert into Nganh values('7480102','Mạng máy tính và truyền thông dữ liệu','DI');
-- insert into Nganh values('7480106','Kỹ thuật máy tính','DI');
-- insert into Nganh values('7480101','Khoa học máy tính','DI');
-- insert into Nganh values('7480202','An toàn thông tin','DI');
-- insert into Nganh values('7320104','Truyền thông đa phương tiện','DI');



insert into mon values('CT101','Lập trình căn bản A','DI');
insert into mon values('CT200','Nền tảng công nghệ thông tin','DI');
insert into mon values('CT177','Cấu trúc dữ liệu','DI');
insert into mon values('CT188','Nhập môn lập trình Web','DI');
insert into mon values('CT173','Kiến trúc máy tính','DI');
insert into mon values('CT176','Lập trình hướng đối tượng','DI');
insert into mon values('CT174','Phân tích và thiết kế thuật toán','DI');
insert into mon values('CT182','Ngôn ngữ mô hình hóa','DI');
insert into mon values('CT178','Nguyên lý hệ điều hành','DI');
insert into mon values('KT101','Kinh tế vi mô 1','KT');
insert into mon values('KT108','Nguyên lý thống kê kinh tế','KT');
insert into mon values('KT120','Phương pháp nghiên cứu trong kinh doanh','KT');
insert into mon values('KL369','Luật kinh tế','KT');
insert into mon values('KT103','Quản trị học','KT');
insert into mon values('KT104','Marketing căn bản','KT');
insert into mon values('KT106','Nguyên lý kế toán','KT');
insert into mon values('KT111','Tài chính - Tiền tệ','KT');
insert into mon values('KT119','Phương pháp tư duy và kỹ năng giải quyết vấn đề','KT');

insert into Dethi values('1','Thi giữa kỳ lập trình căn bản','2020-12-02',45,'DI','CT101');
insert into Dethi values('2','Thi giữa kỳ lập trình căn bản','2020-3-22',45,'DI','CT101');

insert into cauhoi values('1','1','lệnh scanf dùng để');
insert into cauhoi values('2','1','lệnh printf dùng để');
insert into cauhoi values('3','1','int là kiểu');

	insert into traloi values('1','1',1,'in ra màn hình','A');
	insert into traloi values('2','1',0,'chỉnh sửa nội dung','B');	
	insert into traloi values('3','1',0,'nhập vào nội dung','C');
	insert into traloi values('4','1',0,'xóa nội dung','D');
	insert into traloi values('5','2',0,'in ra màn hình','A');
	insert into traloi values('6','2',0,'chỉnh sửa nội dung','B');
	insert into traloi values('7','2',1,'nhập vào nội dung','C');
	insert into traloi values('8','2',0,'xóa nội dung','D');
	insert into traloi values('9','3',0,'số thực','A');
	insert into traloi values('10','3',0,'chuỗi','B');
	insert into traloi values('11','3',1,'số nguyên','C');
	insert into traloi values('12','3',0,'ký tự','D');
    insert into monday values(2,'CT101');
Delimiter $$
drop function if exists KIEM_TRA_user $$
CREATE FUNCTION KIEM_TRA_user(ptaikhoan varchar(16), pmatkhau varchar(16) ) RETURNS boolean
begin
if exists(select * from nguoidung where taikhoan like ptaikhoan and matkhau like pmatkhau)
then return true;
else return false;
end if;
end;
Delimiter $$
CREATE PROCEDURE insertDeThi(tenDt varchar(255), ngaythi date, tgthi int, makhoa char(8), mamon char(8))
BEGIN
	insert into Dethi (tenDT,ngaythi,tgthi,makhoa,mamon) 
     values(tenDT,ngaythi,tgthi,makhoa,mamon);
END;
select * from traloi;
Delimiter $$ 
	drop function if exists delete_question $$
    CREATE  FUNCTION delete_question(maCH int(8))
	RETURNS boolean
	READS SQL DATA
	DETERMINISTIC
	BEGIN
		delete from traloi where traloi.maCH = maCH;
        return true;
	END;
select delete_question(1);
Delimiter $$
drop trigger if exists delete_question $$
create trigger delete_question after delete on traloi
for each row
begin
SET FOREIGN_KEY_CHECKS=0;
delete from cauhoi where cauhoi.maCH = old.maCH;
SET FOREIGN_KEY_CHECKS=1;
end;
delete from traloi where traloi.maCH = 1;
update set user_type = "teacher"
                where id = :id;
select * from nguoidung;

Delimiter $$
drop procedure if exists registerUser $$
CREATE PROCEDURE registerUser(taikhoan varchar(16), matkhau varchar(16), hoten varchar(255), user_type varchar(50))
BEGIN
	insert into nguoidung (taikhoan,matkhau,hoten,user_type) 
                values(taikhoan,matkhau,hoten,user_type);
END;
create table list_monday(
mamon varchar(8);
);
Delimiter $$
drop procedure if exists monday $$
CREATE PROCEDURE monday(list_monday varchar(4000),idnd int(8))
BEGIN
	DECLARE v_finished INTEGER DEFAULT 0;
	DECLARE v_mon varchar(100) DEFAULT "";
	declare monday_cursor cursor for select mon.mamon from mon, monday where mon.mamon = monday.mamon and monday.id = idnd;
    DECLARE CONTINUE HANDLER
	FOR NOT FOUND SET v_finished = 1;
	OPEN monday_cursor;
    get_mon: LOOP
	FETCH monday_cursor INTO v_mon;
	IF v_finished = 1 THEN
	LEAVE get_mon;
	END IF;
    SET list_monday = CONCAT(v_mon,";",list_monday );
    END LOOP get_mon;
    CLOSE monday_cursor;
END;
Delimiter $$
drop procedure if exists SDmonday $$
CREATE PROCEDURE SDmonday(idnd int(8))
BEGIN
	DECLARE list_monday varchar(4000) DEFAULT "";
	call monday(list_monday,idnd);
	select * from list_monday;
END;

call SDmonday(2);