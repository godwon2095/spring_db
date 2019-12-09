create or replace procedure FinishEnroll
  is
  begin
    update enroll
    set e_success = '1'
    where e_id = (select e.e_id
                  from course c, enroll e, point_history p
                  where e.c_id = c.c_id
                  and p.e_id = e.e_id
                  and e.s_id = p.s_id
                  order by
                  limit )
  end;
