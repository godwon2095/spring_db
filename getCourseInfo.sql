CREATE OR REPLACE PROCEDURE getCourseInfo
(v_c_id IN VARCHAR2, v_c_id_no NUMBER, t_max_num OUT NUMBER, enrolls_count OUT NUMBER)
IS
    CURSOR get_t_maxes
    IS
    select t_max
    from teach
    where c_id = v_c_id and c_id_no = v_c_id_no;

    nYear number;
    nSemester number;
BEGIN
    FOR t_max_list IN get_t_maxes
    LOOP
        BEGIN
          t_max_num := t_max_list.t_max;
        END;
    END LOOP;

    nYear := Date2EnrollYear(SYSDATE);
    nSemester := Date2EnrollSemester(SYSDATE);

    select Count(*)
    into enrolls_count
    from enroll
    where c_id = v_c_id
      and c_id_no = v_c_id_no
      and e_year=nYear
      and e_semester=nSemester;
END;
