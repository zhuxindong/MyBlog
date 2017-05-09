create table dq1401(
	id int not null auto_increment primary key,
	username varchar(50) not null,
	password varchar(50) not null,
	name varchar(50) not null,
	sex varchar(20) not null,
	image longblob,
	description text
) default charset=utf8;