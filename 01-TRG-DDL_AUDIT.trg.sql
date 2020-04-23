DROP TRIGGER audit_ddl_trg
/
create or replace trigger audit_ddl_trg after ddl on schema 
declare
       sql_text ora_name_list_t;
       stmt varchar2(4000) := '';
       n number;
begin
 -- if (ora_sysevent='TRUNCATE')
 -- then
 --   null; -- I do not care about truncate
 -- else
 n:=ora_sql_txt(sql_text);
 for i in 1..n loop
   stmt:=substr(stmt||sql_text(i),1,4000);
 end loop;
    insert into audit_ddl(date_time,osuser,current_user,host,ip,terminal,module,client_program,sid,current_sql,action,owner,object_type,object_name,sysevent)
    values(
      sysdate,
      sys_context('USERENV','OS_USER') ,
      sys_context('USERENV','CURRENT_USER') ,
      sys_context('USERENV','HOST') ,
      SYS_CONTEXT('USERENV','IP_ADDRESS') , 
      sys_context('USERENV','TERMINAL') ,
      sys_context('USERENV','MODULE') ,
      sys_context('USERENV','CLIENT_PROGRAM_NAME') ,
      SYS_CONTEXT('USERENV','SID') ,
      stmt , -- SYS_CONTEXT('USERENV','CURRENT_SQL') ,
      SYS_CONTEXT('USERENV','ACTION') ,
      ora_dict_obj_owner,
      ora_dict_obj_type,
      ora_dict_obj_name,
      ora_sysevent
    );
 -- end if;
end;
/

