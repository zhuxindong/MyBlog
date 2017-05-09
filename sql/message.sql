create table message(
    id int not null auto_increment primary key,
    uid int not null,
    content text,
    createtime timestamp
)default charset=utf8;