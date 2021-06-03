create database QLSinhVien
use QLSinhVien
--com.microsoft.sqlserver.jdbc.SQLServerDriver
--jdbc:sqlseerver://DESKTOP-0NKDULM\SQLEXPRESS:1433;databaseName=QLSinhVien
drop table sinhvien
ALTER TABLE giangday ALTER COLUMN mnhom varchar(15);
create table sinhvien(
	mssv varchar(8) primary key,
	hten nvarchar(100),
	ngaysinh date,
	gtinh bit,
	lop nvarchar(100),
	mlop varchar(10),
	khoah varchar(3),
	khoa nvarchar(100),
	diemtl float ,
	sotc int,
	mk varchar(50)
)
drop table giaovien
create table giaovien(
	mcb varchar(8) primary key,
	hten nvarchar(100),
	ngaysinh date,
	gtinh bit,
	khoa nvarchar(100),
	mk varchar(50)
)
drop table monhoc
create table monhoc(
	mmon varchar(5) primary key,
	tenmon nvarchar(100),
	sotinchi int
)
drop table giangday
create table giangday(
	mnhom varchar(15) primary key,
	mcb varchar(8) constraint fk_mcbvsgiangday foreign key (mcb) references giaovien(mcb),
	mmon varchar(5) constraint fk_mmonvsmonhoc foreign key (mmon) references monhoc(mmon),
	kyhoc varchar(3),
	namhoc varchar(10)
)
drop table diem
create table diem
	so float(2),
	chu varchar(2),
	mssv varchar(8) constraint fk_mssvvsdiem foreign key (mssv) references sinhvien(mssv),
	mnhom varchar(15) constraint fk_mnhomvsdiem foreign key (mnhom) references giangday(mnhom)
)
select GETDATE()
select * from sinhvien where mssv = 'B1805784'
insert into sinhvien(mssv,hten,ngaysinh,gtinh,lop,mlop,khoah,khoa,mk) values ()
insert into sinhvien values ('B1805784',N'Vũ Ngọc Long','2000-03-30',1,N'Kỹ thuật Phần Mềm','DI1896A1','K44',N'Khoa Công Nghệ Thông Tin Và Truyền Thông',0,0,'long123')
select * from sinhvien s where s.mssv='B1805784' and s.mk='long123'
select * from giaovien
insert into giaovien values ('LPN05794',N'Lê Phúc Nguyên','2000-11-01',1,N'Khoa Công Nghệ Thông Tin Và Truyền Thông','nguyen123')
insert into giaovien values ('NTP05801',N'Nguyễn Tấn Phát','2000-11-04',1,N'Khoa Công Nghệ Thông Tin Và Truyền Thông','phat123')
insert into giaovien values ('NGH05761',N'Nguyễn Gia Huy','2000-11-05',1,N'Khoa Công Nghệ Thông Tin Và Truyền Thông','huy123')

select * from monhoc
delete from monhoc
insert into monhoc values('CT101',N'Lập trình căn bản A',4)
insert into monhoc values('CT172',N'Toán rời rạc',4)
insert into monhoc values('CT173',N'Kiến trúc máy tính',3)
insert into monhoc values('CT176',N'Lập trình hướng đối tượng',4)
insert into monhoc values('KL001',N'Pháp luật đại cương',4)
insert into monhoc values('CT171',N'Nhập môn công nghệ phần mềm',3)
insert into monhoc values('CT174',N'Phân tích và thiết kế thuật toán',3)
insert into monhoc values('CT175',N'Lý thuyết đồ thị',3)
insert into monhoc values('ML006',N'Mac-LeNin',4)
select * from giangday
select g.namhoc,g.kyhoc,m.tenmon from giangday g join monhoc m on g.mmon=m.mmon where mnhom = 'CT172-01-18191'
delete from giangday

insert into giangday values('CT101-01-18191','LPN05794','CT101',1,'2018-2019')
insert into giangday values('CT172-01-18191','LPN05794','CT172',1,'2018-2019')
insert into giangday values('CT101-02-8191','NGH05761','CT101',1,'2018-2019')
insert into giangday values('CT172-01-18192','NGH05761','CT172',2,'2018-2019')
insert into giangday values('CT173-01-18192','LPN05794','CT173',2,'2018-2019')
insert into giangday values('CT175-01-18192','LPN05794','CT175',2,'2018-2019')
insert into giangday values('KL001-01-19201','NGH05761','KL001',1,'2019-2020')
insert into giangday values('CT174-01-19201','NTP05801','CT174',1,'2019-2020')
insert into giangday values('ML006-01-19201','NGH05761','ML006',1,'2019-2020')
select mnhom from giangday where mcb = 'LPN05794'
delete from diem
select * from diem where mssv = 'B1805784' and mnhom = 'CT101-01-18191'
insert into diem(mssv,mnhom) values('B1805784','CT101-01-18191')
insert into diem(mssv,mnhom) values('B1805784','CT172-01-18191')
insert into diem(mssv,mnhom) values('B1805784','CT173-01-18192')
insert into diem(mssv,mnhom) values('B1805784','CT175-01-18192')
insert into diem(mssv,mnhom) values('B1805784','KL001-01-19201')
insert into diem(mssv,mnhom) values('B1805784','CT174-01-19201')
update diem set so='',chu='' where mssv='B1805784'
insert into diem(mssv,mnhom) values('B1805784','ML006-01-19201')
Update diem set so = 1,chu = 'F' where mssv = 'B1805784' and mnhom = 'CT101-01-18191'

select * from giangday
select distinct g.namhoc from sinhvien s join diem d on s.mssv = d.mssv join giangday g on g.mnhom = d.mnhom where s.mssv = 'B1805784'

select distinct m.mmon,m.tenmon,m.sotinchi,g.mnhom,d.so,d.chu from sinhvien s join diem d on s.mssv = d.mssv join giangday g on g.mnhom = d.mnhom join monhoc m on m.mmon = g.mmon where g.namhoc = '2018-2019' and g.kyhoc ='1' and s.mssv = 'B1805784'
select distinct s.hten,s.mssv,d.so from giaovien g join giangday gd on g.mcb = gd.mcb join diem d on d.mnhom = gd.mnhom join sinhvien s on s.mssv = d.mssv where g.mcb = 'LPN05794' and gd.mnhom ='CT101-01-18191'
select m.mmon,m.tenmon,m.sotinchi,g.mnhom,d.so,d.chu from sinhvien s join diem d on s.mssv = d.mssv join giangday g on g.mnhom = d.mnhom join monhoc m on m.mmon = g.mmon where    s.mssv = 'B1805784'