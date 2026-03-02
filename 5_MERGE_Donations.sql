
SQL> create table donations(mobile varchar2(10), name varchar2(500), amount int);

Table created.

SQL> desc donations
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 MOBILE                                             VARCHAR2(10)
 NAME                                               VARCHAR2(500)
 AMOUNT                                             NUMBER(38)

SQL> create table donationscopy(mobile varchar2(10), name varchar2(500), amount int);

Table created.

SQL> desc donations
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 MOBILE                                             VARCHAR2(10)
 NAME                                               VARCHAR2(500)
 AMOUNT                                             NUMBER(38)

SQL> insert into donations values('987','aaa',500);

1 row created.

SQL> insert into donations values('997','bbb',1000);

1 row created.

SQL> insert into donations values('977','ccc',2000);

1 row created.

SQL> desc donations
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 MOBILE                                             VARCHAR2(10)
 NAME                                               VARCHAR2(500)
 AMOUNT                                             NUMBER(38)

SQL> select * from donations
  2  select * from donations;
select * from donations
*
ERROR at line 2:
ORA-00933: SQL command not properly ended


SQL> select * from donations;

MOBILE
----------
NAME
--------------------------------------------------------------------------------
    AMOUNT
----------
987
aaa
       500

997
bbb
      1000

MOBILE
----------
NAME
--------------------------------------------------------------------------------
    AMOUNT
----------

977
ccc
      2000


SQL> select * from donations copy;

MOBILE
----------
NAME
--------------------------------------------------------------------------------
    AMOUNT
----------
987
aaa
       500

997
bbb
      1000

MOBILE
----------
NAME
--------------------------------------------------------------------------------
    AMOUNT
----------

977
ccc
      2000


SQL> select * from donations;

MOBILE
----------
NAME
--------------------------------------------------------------------------------
    AMOUNT
----------
987
aaa
       500

997
bbb
      1000

MOBILE
----------
NAME
--------------------------------------------------------------------------------
    AMOUNT
----------

977
ccc
      2000


SQL> select * from donations copy;

MOBILE
----------
NAME
--------------------------------------------------------------------------------
    AMOUNT
----------
987
aaa
       500

997
bbb
      1000

MOBILE
----------
NAME
--------------------------------------------------------------------------------
    AMOUNT
----------

977
ccc
      2000


SQL> select * from donationscopy;

no rows selected

SQL> MERGE INTO donationscopy d
  2  USING donations s
  3  ON (d.mobile = s.mobile)
  4  WHEN MATCHED THEN
  5  UPDATE SET d.name = s.name,d.amount = s.amount
  6  WHEN NOT MATCHED THEN
  7  INSERT (d.mobile,d.name,d.amount)
  8  VALUES (s.mobile,s.name,s.amount);

3 rows merged.

SQL> select * from donationscopy;

MOBILE
----------
NAME
--------------------------------------------------------------------------------
    AMOUNT
----------
997
bbb
      1000

987
aaa
       500

MOBILE
----------
NAME
--------------------------------------------------------------------------------
    AMOUNT
----------

977
ccc
      2000