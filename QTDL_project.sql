create database project_QTDL;
-- drop database project_QTDL;
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
 maND char(8)primary key NOT NULL,
 taikhoan varchar(16),
 matkhau varchar(16)
 );
 create table AD(
 maAD char(8)primary key NOT NULL,
 taikhoan varchar(16),
 matkhau varchar(16)
 );
 
 insert into ad values('AD123456','AD123456','AD123456');

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

select * from traloi;
select * from cauhoi;
delete from cauhoi where maDT like 'CT101010';
delete from dethi where maDT like 'CT101D6';
select * from mon where makhoa like "DI";
select * from khoa;
select * from dethi where maDT like 'CT10101';
select * from cauhoi where maDT like 'CT10101';
select * from traloi where maCH like'CT1011';
