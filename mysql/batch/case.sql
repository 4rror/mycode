use bigData;
################## 创建函数 ##################
# 1 随机产生字符串
delimiter $$
create function rand_string(n int) returns varchar(255)
begin
    declare chars_str varchar(100) default 'abcdefghijklmnopqrstuvwxyzABCDEFJHIJKLMNOPQRSTUVWXYZ';
    declare return_str varchar(255) default '';
    declare i int default 0;
    while i < n
        do
            set return_str = concat(return_str, substring(chars_str, floor(1 + rand() * 52), 1));
            set i = i + 1;
        end while;
    return return_str;
end $$
delimiter ;

# 删除
# drop function rand_string;

###################################
# 2 随机产生编号
delimiter $$
create function rand_num()
    returns int(5)
begin
    declare i int default 0;
    set i = floor(100 + rand() * 10);
    return i;
end $$
delimiter ;

# 删除
# drop function rand_num;

################## 创建函数 ##################
# 创建往emp表中插入数据的存储过程
delimiter $$
create procedure insert_emp(in START int(10), in max_num int(10))
begin
    declare i int default 0;
    # set autocommit =0 把autocommit设置成0
    set autocommit = 0;
    repeat
        set i = i + 1;
        insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
        values ((START + i), rand_string(6), 'SALESMAN', 0001, curdate(), 2000, 400, rand_num());
    until i = max_num
        end repeat;
    commit;
end $$
delimiter ;

# 删除
# drop PROCEDURE insert_emp;

###################################

#执行存储过程，往dept表添加随机数据
delimiter $$
create procedure insert_dept(in START int(10), in max_num int(10))
begin
    declare i int default 0;
    set autocommit = 0;
    repeat
        set i = i + 1;
        insert into dept (deptno, dname, loc) values ((START + i), rand_string(10), rand_string(8));
    until i = max_num
        end repeat;
    commit;
end $$
delimiter ;

#删除
# drop PROCEDURE insert_dept;

################## 调用存储过程 ##################
call insert_dept(100, 10);
call insert_emp(100001, 10000000);
