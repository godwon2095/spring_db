create or replace function get_student_point(student_id in varchar2)
  return student.s_point%TYPE
  is
    v_point student.s_point%TYPE;
  begin
    select s_point
    into v_point
    from student
    where s_id = student_id;

    return v_point;
  end;
