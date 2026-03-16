----SELF JOIN----


SQL> select e1.empid,e2.empid
  2  from employees e1,employees e2
  3  where e1.deptid<>e2.deptid;

EMPID
--------------------------------------------------------------------------------
EMPID
--------------------------------------------------------------------------------
emp01
emp02

emp01
emp03

emp02
emp01


EMPID
--------------------------------------------------------------------------------
EMPID
--------------------------------------------------------------------------------
emp02
emp03

emp03
emp01

emp03
emp02


6 rows selected.

SQL> SET PAGESIZE 100
SQL> SET LINESIZE 200
SQL>
SQL> COLUMN empid FORMAT A10
SQL> COLUMN name FORMAT A15
SQL> COLUMN deptname FORMAT A15
SQL> select e1.empid,e2.empid
  2  from employees e1,employees e2
  3  where e1.deptid<>e2.deptid;

EMPID      EMPID
---------- ----------
emp01      emp02
emp01      emp03
emp02      emp01
emp02      emp03
emp03      emp01
emp03      emp02

6 rows selected.

SQL> select e1.empid,e1.name,e2.empid,e2.name
  2  from employees e1,employees e2
  3  where e1.deptid<>e2.deptid;

EMPID      NAME            EMPID      NAME
---------- --------------- ---------- ---------------
emp01      charan          emp02      varun
emp01      charan          emp03      karan
emp02      varun           emp01      charan
emp02      varun           emp03      karan
emp03      karan           emp01      charan
emp03      karan           emp02      varun

6 rows selected.

----CROSS/CARTESIAN JOIN-----

SQL> select e.empid,e.name,d.deptname
  2  from employees e, departments d
  3  ;

EMPID      NAME            DEPTNAME
---------- --------------- ---------------
emp01      charan          Hr
emp02      varun           Hr
emp03      karan           Hr
emp04      arun            Hr
emp05      chetan          Hr
emp01      charan          Pr
emp02      varun           Pr
emp03      karan           Pr
emp04      arun            Pr
emp05      chetan          Pr
emp01      charan          manager
emp02      varun           manager
emp03      karan           manager
emp04      arun            manager
emp05      chetan          manager

15 rows selected.