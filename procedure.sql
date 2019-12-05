create or replace procedure InsertEnroll(sStudentId in varchar2,
       sCourseId in varchar2,
       nCourseIdNo in number,
       sPoint in number,
       result out varchar2)
    is
       too_many_sumCourseUnit exception;
       too_many_courses exception;
       too_many_students exception;
       too_many_betting_point exception;
       duplicate_time exception;
       nYear number;
       nSemester number;
       nSumCourseUnit number;
       nCourseUnit number;
       nCnt number;
       nTeachMax number;
       nStudentPointRemained number;
   cursor n_cnt is
       select count(*)
       into nCnt
       from (select t_time
             from teach
             where t_year = nYear and t_semester = nSemester
             and c_id = sCourseId and c_id_no = nCourseIdNo
             intersect
             select t.t_time
             from teach t, enroll e
             where e.s_id = sStudentId and e.e_year = nYear
             and e.e_semester = nSemester and t.t_year = nYear
             and t.t_semester = nSemester and e.c_id = t.c_id
             and e.c_id_no = t.c_id_no);
   begin
       result := '';
       dbms_output.put_line('#');
       dbms_output.put_line(sStudentId || '님이 과목번호' || sCourseId ||
       ', 분반 ' || to_char(nCourseIdNo) || '의 수강등록을' || to_char(sPoint) || '포인트로 배팅하였습니다.');

       nYear := Date2EnrollYear(SYSDATE);
       nSemester := Date2EnrollSemester(SYSDATE);

       select sum(c.c_unit)
       into nSumCourseUnit
       from course c, enroll e
       where e.s_id = sStudentId and e.e_year = nYear and e.e_semester = nSemester
       and e.c_id = c.c_id and e.c_id_no = c.c_id_no;

       select c_unit
       into nCourseUnit
       from course
       where c_id = sCourseId and c_id_no = nCourseIdNo;

       select s_point
       into nStudentPointRemained
       from student
       where s_id = sStudentId;

       if (sPoint > nStudentPointRemained) then
        raise too_many_betting_point;
       end if;

       if (nSumCourseUnit + nCourseUnit > 18) then
           raise too_many_sumCourseUnit;
       end if;

       select count(*)
       into nCnt
       from enroll
       where s_id = sStudentId and c_id = sCourseId;

       if (nCnt > 0) then
           raise too_many_courses;
      end if;

      select t_max
      into nTeachMax
      from teach
      where t_year=nYear and t_semester=nSemester and c_id=sCourseId
      and c_id_no = nCourseIdNo;

      select count(*)
      into nCnt
      from enroll
      where e_year=nYear and e_semester=nSemester
      and c_id=sCourseId and c_id_no = nCourseIdNo;
      if (nCnt >= nTeachMax) then
          raise too_many_students;
      end if;

      open n_cnt;
      fetch n_cnt into nCnt;

      if (nCnt > 0) then
          raise duplicate_time;
      end if;

      close n_cnt;

      insert into enroll(s_id, c_id, c_id_no, e_year, e_semester)
      values (sStudentId, sCourseId, nCourseIdNo, nYear, nSemester);

      update student
      set s_point = (nStudentPointRemained - sPoint)
      where s_id = sStudentId;

      insert into point_history(s_id, c_id, c_id_no, p_amount, p_type)
      values (sStudentId, sCourseId, nCourseIdNo, sPoint, 'usage');

      commit;
       result := '수강신청 등록이 완료되었습니다.';
  exception
      when too_many_sumCourseUnit then
          result := '최대학점을 초과하였습니다.';
      when too_many_courses then
          result := '이미 등록된 과목을 신청하였습니다.';
      when too_many_students then
          result := '수강신청 인원이 초과되어 등록이 불가합니다.';
      when duplicate_time then
          result := '이미 등록된 과목중 중복되는 시간이 존재합니다.';
      when too_many_betting_point then
          result := '갖고있는 포인트보다 많은 포인트를 배팅하셨습니다.';
      when others then
          rollback;
      result := SQLCODE;
  end;
