create or replace procedure SelectTimeTable
    (sStudentId in varchar2,
    nYear in number,
    nSemester in number)
is
    sId course.c_id%type;
    sName course.c_name%type;
    nIdNo course.c_id_no%type;
    nUnit course.c_unit%type;
    nTime teach.t_time%type;
    sWhere teach.t_where%type;
    nTotUnit number := 0;
cursor cur(sStudentId varchar2, nYear number, nSemester number) is
    select e.c_id , c.c_name, e.c_id_no, c.c_unit, t.t_time, t.t_where
    from enroll e, course c, teach t
    where e.s_id = sStudentId and e.e_year = nYear
    and e.e_semester = nSemester
    and t.t_year = nYear and t.t_semester = nSemester
    and e.c_id = c.c_id and e.c_id_no = c.c_id_no
    and c.c_id = t.c_id and c.c_id_no = t.c_id_no
    order by 5;
begin
    open cur(sStudentId, nYear, nSemester);
    dbms_output.put_line('#');
    dbms_output.put_line(to_char(nYear) || '년도' || to_char(nSemester) ||
        '학기의' || sStudentId || '님의 수강신청 시간표입니다.');
    loop
    fetch cur into sId, sName, nIdNo, nUnit, nTime, sWhere;
    exit when cur%NOTFOUND;
    dbms_output.put_line('교시 : ' || to_char(nTime) || ', 과목번호 : ' || sId ||
        ', 과목명 : ' || sName || ', 분반 : ' || to_char(nIdNo) ||
        ', 학점 : ' || to_char(nUnit) || ', 장소 : ' || sWhere);
    nTotUnit := nTotUnit + nUnit;
    end loop;
    dbms_output.put_line('총 ' || to_char(cur%rowcount) || ' 과목과 총 ' ||
        to_char(nTotUnit) || '학점을 신청하였습니다.');
    close cur;
end;
