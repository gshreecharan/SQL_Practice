
SQL> create user user1 identified by user1pwd
  2  create user user1 identified by user1pwd;
create user user1 identified by user1pwd
*
ERROR at line 2:
ORA-00922: missing or invalid option


SQL> create user user1 identified by user1pwd;
create user user1 identified by user1pwd
            *
ERROR at line 1:
ORA-65096: invalid common user or role name


SQL> alter session set "_ORACLE_SCRIPT"=true;

Session altered.

SQL> create user user1 identified by user1pwd;

User created.

SQL> create user user2 identified by user2pwd;

User created.

SQL> GRANT CREATE SESSION TO user1;

Grant succeeded.

SQL> GRANT CREATE SESSION TO user2;

Grant succeeded.

SQL> CONN user1/user1pwd;
Connected.
SQL> select * from tab
  2  select * from tab;
select * from tab
*
ERROR at line 2:
ORA-00933: SQL command not properly ended


SQL> select * from tab;

no rows selected

SQL> create table mytable(user name varchar2(100),password varchar2(100));
create table mytable(user name varchar2(100),password varchar2(100))
                     *
ERROR at line 1:
ORA-00904: : invalid identifier


SQL> create table mytable(username varchar2(100),password varchar2(100));
create table mytable(username varchar2(100),password varchar2(100))
*
ERROR at line 1:
ORA-01031: insufficient privileges


SQL> conn system/charan
ERROR:
ORA-01017: invalid username/password; logon denied


Warning: You are no longer connected to ORACLE.
SQL> conn system/charan456
Connected.
SQL> GRANT CREATE TABLE TO user1;

Grant succeeded.

SQL> CONN user1/user1pwd;
Connected.
SQL> create table mytable(user name varchar2(100),password varchar2(100));
create table mytable(user name varchar2(100),password varchar2(100))
                     *
ERROR at line 1:
ORA-00904: : invalid identifier


SQL> create table mytable(username varchar2(100),password varchar2(100));

Table created.

SQL> insert into mytables values('abc','abc123');
insert into mytables values('abc','abc123')
            *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> insert into mytable values('abc','abc123');
insert into mytable values('abc','abc123')
            *
ERROR at line 1:
ORA-01950: no privileges on tablespace 'USERS'


SQL> conn system/charan456
Connected.
SQL> GRANT UNLIMITED TABLESPACE TO user1;

Grant succeeded.

SQL> CONN user1/user1pwd;
Connected.
SQL> insert into mytable values('abc','abc123');

1 row created.

SQL> CONN user2/user2pwd;
Connected.
SQL> select * from tab;

no rows selected

SQL> CONN user1/user1pwd;
Connected.
SQL> GRANT SELECT,INSERT ON mytable TO user2;

Grant succeeded.

SQL> CONN user2/user2pwd;
Connected.
SQL> select * from tab;

no rows selected

SQL> select * from user1.mytable;

USERNAME
--------------------------------------------------------------------------------
PASSWORD
--------------------------------------------------------------------------------
abc
abc123


SQL> insert into user1.mytable values('xyz','xyz456');

1 row created.

SQL> select * from user1.mytable;

USERNAME
--------------------------------------------------------------------------------
PASSWORD
--------------------------------------------------------------------------------
abc
abc123

xyz
xyz456


SQL> commit;

Commit complete.

SQL> CONN user1/user1pwd;
Connected.
SQL> REVOKE insert on mytable from user2;

Revoke succeeded.

SQL> CONN user2/user2pwd;
Connected.
SQL> insert into user1.mytable values('mno','mno456');
insert into user1.mytable values('mno','mno456')
                  *
ERROR at line 1:
ORA-01031: insufficient privileges


SQL> select * from user1.mytable;

USERNAME
--------------------------------------------------------------------------------
PASSWORD
--------------------------------------------------------------------------------
abc
abc123

xyz
xyz456


SQL>