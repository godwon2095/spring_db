create or replace trigger update_student_point
AFTER
INSERT ON point_history
for each row

declare
  point_plus varchar2(50);
  v_type varchar2(50);
  v_amount number;
  v_s_id varchar2(50);
  v_students_point number;
  n_students_point number;
begin
  v_type := :new.p_type;
  v_amount := :new.p_amount;
  v_s_id := :new.s_id;

  if(v_type = 'enroll' or v_type = 'deduction') then
    point_plus := '000';
  elsif(v_type = 'charge' or v_type = 'delete_enroll') then
    point_plus := '111';
  end if;

  select s_point
  into v_students_point
  from student
  where s_id = v_s_id;

  if point_plus = '111' then
    n_students_point := v_students_point + v_amount;
  else
    n_students_point := v_students_point - v_amount;
  end if;

  update student
     set s_point = n_students_point
   where s_id = v_s_id;
end;
