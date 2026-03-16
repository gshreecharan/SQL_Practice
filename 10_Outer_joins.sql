''''LEFT OUTER JOIN'''



SQL> select*from departments;

     DEPID DEPTNAME
---------- --------------------------------------------------
         1 Hr
         2 Pr
         3 manager

SQL> SET PAGESIZE 100
SQL> SET LINESIZE 200
SQL>
SQL> COLUMN empid FORMAT A10
SQL> COLUMN name FORMAT A15
SQL> COLUMN deptname FORMAT A15
SQL> select*from departments;

     DEPID DEPTNAME
---------- ---------------
         1 Hr
         2 Pr
         3 manager

SQL> select*from employees;

EMPID      NAME            JOBID                                                                                                    DEPTID
---------- --------------- ---------------------------------------------------------------------------------------------------- ----------
emp01      charan          Srdeveloper                                                                                                   1
emp02      varun           trainee                                                                                                       2
emp03      karan           hr                                                                                                            3
emp04      arun
emp05      chetan

SQL> select e.empid,e.name,d.deptname
  2  from employees e,departments d
  3  where e.deptid=d.deptid(+);
where e.deptid=d.deptid(+)
               *
ERROR at line 3:
ORA-00904: "D"."DEPTID": invalid identifier


SQL> desc departments;
 Name                                                                                                              Null?    Type
 ----------------------------------------------------------------------------------------------------------------- -------- ----------------------------------------------------------------------------
 DEPID                                                                                                                      NUMBER(38)
 DEPTNAME                                                                                                                   VARCHAR2(50)

SQL> desc employees;
 Name                                                                                                              Null?    Type
 ----------------------------------------------------------------------------------------------------------------- -------- ----------------------------------------------------------------------------
 EMPID                                                                                                                      VARCHAR2(100)
 NAME                                                                                                                       VARCHAR2(150)
 JOBID                                                                                                                      VARCHAR2(100)
 DEPTID                                                                                                                     NUMBER(38)

SQL> select e.empid,e.name,d.deptname
  2  from employees e,departments d
  3  where e.deptid=d.depid(+);;
where e.deptid=d.depid(+);
                         *
ERROR at line 3:
ORA-00933: SQL command not properly ended


SQL> select e.empid,e.name,d.deptname
  2  from employees e,departments d
  3  where e.deptid=d.depid(+);

EMPID      NAME            DEPTNAME
---------- --------------- ---------------
emp01      charan          Hr
emp02      varun           Pr
emp03      karan           manager
emp04      arun
emp05      chetan


''''ANSI STYLE'''''


SQL> select e.empid,e.name,d.deptname
  2  from employees e LEFT OUTER JOIN departments d
  3  ON e.deptid=d.depid;

EMPID      NAME            DEPTNAME
---------- --------------- ---------------
emp01      charan          Hr
emp02      varun           Pr
emp03      karan           manager
emp04      arun
emp05      chetan

SQL> select e.empid,e.name,d.deptname
  2  from employees e LEFT JOIN departments d
  3  ON e.deptid=d.depid;

EMPID      NAME            DEPTNAME
---------- --------------- ---------------
emp01      charan          Hr
emp02      varun           Pr
emp03      karan           manager
emp04      arun
emp05      chetan

'''RIGHT OUTER JOIN'''

SQL> select e.empid,e.name,d.deptname
  2  from employees e,departments d
  3  where e.deptid(+)=d.depid;

EMPID      NAME            DEPTNAME
---------- --------------- ---------------
emp01      charan          Hr
emp02      varun           Pr
emp03      karan           manager

SQL> select e.empid,e.name,d.deptname
  2  from employees e RIGHT JOIN departments d
  3  ON e.deptid=d.depid;

EMPID      NAME            DEPTNAME
---------- --------------- ---------------
emp01      charan          Hr
emp02      varun           Pr
emp03      karan           manager

'''' FULL JOIN''''


SQL> select e.empid,e.name,d.deptname
  2  from employees e FULL JOIN departments d
  3  ON e.deptid=d.depid;

EMPID      NAME            DEPTNAME
---------- --------------- ---------------
emp01      charan          Hr
emp02      varun           Pr
emp03      karan           manager
emp04      arun
emp05      chetan

''''ORACLE STYLE'''''


SQL> select e.empid,e.name,d.deptname
  2  from employees e,departments d
  3  where e.deptid=d.depid(+)
  4  UNION
  5  select e.empid,e.name,d.deptname
  6  from employees e,departments d
  7  where e.deptid(+)=d.depid;

EMPID      NAME            DEPTNAME
---------- --------------- ---------------
emp01      charan          Hr
emp02      varun           Pr
emp03      karan           manager
emp04      arun
emp05      chetan

SQL>