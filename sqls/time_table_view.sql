drop view time_table_view;

CREATE VIEW time_table_view AS
  select s.s_id s_id, e.e_year year, e.e_semester semester, c.c_name c_name, t.t_time t_time
  from course c, teach t, enroll e, student s
  where c.c_id = t.c_id and c.c_id_no = t.c_id_no
  and e.c_id = c.c_id and e.c_id_no = c.c_id_no
  and e.e_semester = t.t_semester and e.e_year = t.t_year
  and s.s_id = e.s_id;
