DROP TABLE AUDIT_DDL;

CREATE TABLE AUDIT_DDL (
  DATE_TIME date,
  OSUSER varchar2(255),
  CURRENT_USER varchar2(255),
  HOST varchar2(255),
  IP varchar2(30),
  TERMINAL varchar2(255),
  MODULE varchar2(255),
  CLIENT_PROGRAM varchar2(255),
  SID varchar2(30),
  CURRENT_SQL varchar2(255),
  ACTION varchar2(255),
  OWNER varchar2(30),
  OBJECT_TYPE varchar2(30),
  OBJECT_NAME varchar2(30),
  sysevent varchar2(30) );
  