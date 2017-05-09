create table score(
	id int not null auto_increment primary key,
	uid int not null,
	isscored int not null default 0,
	tzs_1 int,
	tzs_2 int,
	tzs_3 int,
	tzs_4 int,
	tzs_5 int,

	bz_1 int,
	bz_2 int,
	bz_3 int,
	bz_4 int,
	bz_5 int,

	dxwy_1 int,
	dxwy_2 int,
	dxwy_3 int,
	dxwy_4 int,
	dxwy_5 int,

	xxwy_1 int,
	xxwy_2 int,
	xxwy_3 int,
	xxwy_4 int,
	xxwy_5 int,

	wtwy_1 int,
	wtwy_2 int,
	wtwy_3 int,
	wtwy_4 int,
	wtwy_5 int,

	xlwy_1 int,
	xlwy_2 int,
	xlwy_3 int,
	xlwy_4 int,
	xlwy_5 int,

	shwy_1 int,
	shwy_2 int,
	shwy_3 int,
	shwy_4 int,
	shwy_5 int,

	zzwy_1 int,
	zzwy_2 int,
	zzwy_3 int,
	zzwy_4 int,
	zzwy_5 int,

	evaluate text,

	foreign key(uid) references dq1401(id)
)default charset=utf8;