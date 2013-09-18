use `jadwal-mesin`;

create table DOSEN (
	ID int(11) primary key not null auto_increment,
	NIDN varchar(30) unique,
	Nama_Dosen varchar(50) not null,
	Alamat text,
	No_Telpon varchar(20),
	Email varchar(50)
);

create table KATEGORI_MATKUL(
	ID int(11) not null primary key auto_increment,
	Nama_Kategori varchar(30) not null
);

create table MATAKULIAH(
	ID int(11) not null primary key auto_increment,
	Kode_Matkul varchar(20) not null unique,
	Nama_Matkul varchar(50) not null unique,
	ID_Kategori_Matkul int(11)  not null,
	SKS tinyint not null,
	Semester tinyint not null,
	foreign key (ID_Kategori_Matkul) references KATEGORI_MATKUL(ID)
);

create table JADWAL(
	ID int(11) not null primary key auto_increment,
	ID_Matakuliah int(11) not null unique,
	ID_Dosen int(11) not null,
	Jam time not null,
	Hari enum('1','2','3','4','5','6','7'),
	foreign key (ID_Matakuliah) references MATAKULIAH(ID),
	foreign key (ID_Dosen) references DOSEN(ID)
	
)