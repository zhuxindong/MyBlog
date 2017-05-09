create table reply(
    id int not null auto_increment primary key,
    uid int not null,
    mid int not null,
    hid int not null,
    content text,
    createtime timestamp
)default charset=utf8;