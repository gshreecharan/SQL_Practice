create table employees(empid varchar2(100),name varchar2(150),jobid varchar2(100) null,deptid int null);
create table departments(depid int,deptname varchar2(50));
insert into employees values('emp01','charan','Srdeveloper',1);
insert into employees values('emp02','varun','trainee',2);
insert into employees values('emp03','karan','hr',3);
insert into employees(empid,name) values('emp04','arun');
insert into employees(empid,name) values('emp05','chetan');


SQL> select * from employees;

EMPID
--------------------------------------------------------------------------------
NAME
--------------------------------------------------------------------------------
JOBID
--------------------------------------------------------------------------------
    DEPTID
----------
emp01
charan
Srdeveloper
         1


EMPID
--------------------------------------------------------------------------------
NAME
--------------------------------------------------------------------------------
JOBID
--------------------------------------------------------------------------------
    DEPTID
----------
emp02
varun
trainee
         2


EMPID
--------------------------------------------------------------------------------
NAME
--------------------------------------------------------------------------------
JOBID
--------------------------------------------------------------------------------
    DEPTID
----------
emp03
karan
hr
         3


EMPID
--------------------------------------------------------------------------------
NAME
--------------------------------------------------------------------------------
JOBID
--------------------------------------------------------------------------------
    DEPTID
----------
emp04
arun




EMPID
--------------------------------------------------------------------------------
NAME
--------------------------------------------------------------------------------
JOBID
--------------------------------------------------------------------------------
    DEPTID
----------
emp05
chetan




SQL> insert into departments values(1,'Hr');

1 row created.

SQL> insert into departments values(2,'Pr');

1 row created.

SQL> insert into departments values(3,'manager');

1 row created.

SQL> commit;

Commit complete.

SQL> select * from departments;

     DEPID DEPTNAME
---------- --------------------------------------------------
         1 Hr
         2 Pr
         3 manager

SQL> select empid,name,deptname
  2  from employees,departments
  3  where employees.deptid=departments.deptid;
where employees.deptid=departments.deptid
                       *
ERROR at line 3:
ORA-00904: "DEPARTMENTS"."DEPTID": invalid identifier


SQL> select empid,name,deptname
  2  from employees,departments
  3  where employees.deptid=departments.depid;

EMPID
--------------------------------------------------------------------------------
NAME
--------------------------------------------------------------------------------
DEPTNAME
--------------------------------------------------
emp01
charan
Hr

emp02
varun
Pr

EMPID
--------------------------------------------------------------------------------
NAME
--------------------------------------------------------------------------------
DEPTNAME
--------------------------------------------------

emp03
karan
manager
