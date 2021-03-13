create or REPLACE TRIGGER user_after_delete 
after delete 
    on users
    for each row
    
declare
    v_username varchar2(50);
begin
    SELECT user INTO v_username
        FROM dual;
    insert into users_log(actionauthor,action,old_name,old_id,OPERATION_DATE) values(v_username,'DELETE',:old_name,:old_id,SYSDATE);
end;

CREATE OR REPLACE TRIGGER users_after_insert
AFTER INSERT
   ON users
   FOR EACH ROW

DECLARE
   v_username varchar2(10);
BEGIN
 SELECT user INTO v_username
   FROM dual;
   insert into users_log(actionauthor,action,new_name,new_id,OPERATION_DATE) values(v_username,'INSERT',:new.name,:new.id,SYSDATE);

END;



CREATE OR REPLACE TRIGGER users_after_update
AFTER UPDATE
   ON users
   FOR EACH ROW

DECLARE
   v_username varchar2(10);

BEGIN
   SELECT user INTO v_username
   FROM dual;
   insert into users_log(actionauthor,action,new_name,new_id,old_name,old_id,OPERATION_DATE) values(v_username,'UPDATE',:new.name,:new.id,:old.name,:old.id,SYSDATE);

END;