drop view final_enroll_view;

CREATE VIEW final_enroll_view AS
  select e.e_id e_id, e.s_id s_id, e.c_id c_id, e.c_id_no c_id_no, e.e_year v_year, e.e_semester v_semester, e.e_success v_success, p.p_id p_id, p.p_amount v_amount, p.p_type v_type, p.p_created_at v_created_at, t.t_id t_id, t.t_max v_max
  from enroll e, point_history p, teach t
  where e.e_id = p.e_id
  and e.c_id = t.c_id and e.c_id_no = t.c_id_no and e.e_year = t.t_year and e.e_semester = t.t_semester
  order by e.c_id , p.p_amount desc, p.p_created_at desc;

select * from final_enroll_view;

select f.c_id, count(1), t.t_max
from final_enroll_view f, teach t
where f.t_id = t.t_id
group by c_id;
