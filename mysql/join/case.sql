# 1 A、B两表共有
select *
from tbl_emp a
         inner join tbl_dept b on a.deptId = b.id;

# 2 A、B两表共有+A的独有
select *
from tbl_emp a
         left join tbl_dept b on a.deptId = b.id;

# 3 A、B两表共有+B的独有
select *
from tbl_emp a
         right join tbl_dept b on a.deptId = b.id;

# 4 A的独有
select *
from tbl_emp a
         left join tbl_dept b on a.deptId = b.id
where b.id is null;

# 5 B的独有
select *
from tbl_emp a
         right join tbl_dept b on a.deptId = b.id
where a.deptId is null;

# 6 AB全有
select * from tbl_emp
union
select * from tbl_dept;

# 7 A的独有+B的独有
select *
from tbl_emp a
         left join tbl_dept b on a.deptId = b.id
where b.id is null
union
select * from tbl_emp a
         right join tbl_dept b on a.deptId = b.id
where a.deptId is null;