create database project_QTHT;
-- drop database project_QTHT;
use project_QTHT;
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
tennganh varchar(50) NOT NULL,
makhoa char(8) NOT NULL,
foreign key (makhoa) references khoa(makhoa)
);
create table DETHI (
maDT char(8) primary key NOT NULL,
ngaythi date NOT NULL,
tgthi int,
makhoa char(8) NOT NULL,
manganh char(8) NOT NULL,
mamon char(8) NOT NULL,
foreign key (makhoa) references khoa(makhoa),
foreign key (mamon) references mon(mamon)
);
create table CAUHOI (
maCH char(8) primary key NOT NULL,
maDT char(8),
ndCauHoi varchar(255),
foreign key (maDT) references DETHI(maDT)
);
create table TRALOI(
maTL char(8) primary key NOT NULL,
maCH char(8) NOT NULL,
dapan int NOT NULL,
ndTraLoi varchar(255) NOT NULL,
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


select * from mon where makhoa like 'KT';