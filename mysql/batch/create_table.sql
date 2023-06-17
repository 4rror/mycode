# 新建库
create database bigData;
use bigData;

# 1 建表dept
create table dept
(
    id     int unsigned primary key auto_increment,
    deptno mediumint unsigned not null default 0,
    dname  varchar(20)        not null default "",
    loc    varchar(13)        not null default ""
) engine = innodb
  default charset = utf8;


# 2 建表emp
create table emp
(
    id       int unsigned primary key auto_increment,
    empno    mediumint unsigned not null default 0, /*编号*/
    ename    varchar(20)        not null default "", /*名字*/
    job      varchar(9)         not null default "",/*工作*/
    mgr      mediumint unsigned not null default 0,/*上级编号*/
    hiredate date               not null,/*入职时间*/
    sal      decimal(7, 2)      not null,/*薪水*/
    comm     decimal(7, 2)      not null,/*红利*/
    deptno   mediumint unsigned not null default 0 /*部门编号*/
) engine = innodb
  default charset = utf8;
