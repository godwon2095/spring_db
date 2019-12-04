CREATE OR REPLACE PROCEDURE getCourseInfo(v_c_id IN VARCHAR2, t_max_num OUT VARCHAR2, enrolls_count OUT VARCHAR2)
IS
    CURSOR cur1 (course_id VARCHAR2)
    IS
    select t_max
    from teach
    where c_id = course_id;
BEGIN
    FOR cur_rec IN cur1(v_c_id)
    LOOP
        BEGIN
        t_max_num := TO_CHAR(cur_rec.t_max);
        EXCEPTION
            WHEN OTHERS THEN
                t_max_num := SQLERRM;
        END;
    END LOOP;

    select Count(*)
    into enrolls_count
    from enroll
    where c_id = v_c_id and e_year=2020 and e_semester=1;

    EXCEPTION
        WHEN no_data_found THEN
            t_max_num := SQLERRM;
        WHEN OTHERS THEN
            t_max_num := SQLERRM;
END;
