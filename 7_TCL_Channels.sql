
SQL> create table channels(name varchar2(100),category varchar2(100));

Table created.

SQL> desc channels;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NAME                                               VARCHAR2(100)
 CATEGORY                                           VARCHAR2(100)

SQL> show * from channels;
SP2-0158: unknown SHOW option "*"
SP2-0158: unknown SHOW option "from"
SP2-0158: unknown SHOW option "channels"
SQL> select * from channels;

no rows selected

SQL> insert into channels values('twg','education');

1 row created.

SQL> insert into channels values('t-series','music');

1 row created.

SQL> select * from channels;

NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
twg
education

t-series
music


SQL> commit;

Commit complete.

SQL> insert into channels values('bbc-english','community');

1 row created.

SQL> insert into channels values('movie reviews','movie');

1 row created.

SQL> commit;

Commit complete.

SQL> select * from channels;

NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
twg
education

t-series
music

bbc-english
community


NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
movie reviews
movie


SQL> rollback;

Rollback complete.

SQL> select * from channels;

NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
twg
education

t-series
music

bbc-english
community


NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
movie reviews
movie


SQL> insert into channels values('Discovery','animals');

1 row created.

SQL> insert into channels values('star sports','sports');

1 row created.

SQL> select * from channels;

NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
twg
education

t-series
music

bbc-english
community


NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
movie reviews
movie

Discovery
animals

star sports
sports


6 rows selected.

SQL> rollback;

Rollback complete.

SQL> select * from channels;

NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
twg
education

t-series
music

bbc-english
community


NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
movie reviews
movie


SQL> insert into channels values('star sports','sports');

1 row created.

SQL> insert into channels values('Discovery','animals');

1 row created.

SQL> savepoint sp1
  2  savepoint sp1;
savepoint sp1
*
ERROR at line 2:
ORA-00933: SQL command not properly ended


SQL> savepoint sp1;

Savepoint created.

SQL> insert into channels values('automation','technical');

1 row created.

SQL> savepoint sp2;

Savepoint created.

SQL> insert into channels values('Udemy','Learning ptform');

1 row created.

SQL> select*from channels;

NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
twg
education

t-series
music

bbc-english
community


NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
movie reviews
movie

star sports
sports

Discovery
animals


NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
automation
technical

Udemy
Learning ptform


8 rows selected.

SQL> rollback to sp2;

Rollback complete.

SQL> select*from channels;

NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
twg
education

t-series
music

bbc-english
community


NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
movie reviews
movie

star sports
sports

Discovery
animals


NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
automation
technical


7 rows selected.

SQL> rollback to sp1;

Rollback complete.

SQL> select*from channels;

NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
twg
education

t-series
music

bbc-english
community


NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
movie reviews
movie

star sports
sports

Discovery
animals


6 rows selected.

SQL> commit;

Commit complete.

SQL> select*from channels;

NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
twg
education

t-series
music

bbc-english
community


NAME
--------------------------------------------------------------------------------
CATEGORY
--------------------------------------------------------------------------------
movie reviews
movie

star sports
sports

Discovery
animals


6 rows selected.

