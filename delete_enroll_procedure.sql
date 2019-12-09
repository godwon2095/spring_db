create or replace procedure DeleteEnroll(enrollId in number,
       studentId in varchar2,
       result out varchar2)
    is
      enrolledPoint number;
      newPId number;
      successedEnroll char;
      alreadySucceedEnroll exception;
    begin
      result := '';

      select e_success
      into successedEnroll
      from enroll
      where e_id = enrollId;

      if (successedEnroll = '1') then
        raise alreadySucceedEnroll;
      end if;

      select p_amount
      into enrolledPoint
      from point_history
      where e_id = enrollId;

      newPId := point_history_p_id_seq.NEXTVAL;

      insert into point_history(p_id, s_id, e_id, p_amount, p_type)
      values (newPId, studentId, enrollId, enrolledPoint, 'delete_enroll');

      delete from enroll
      where e_id = enrollId;

      commit;
      result := '수강신청이 성공적으로 삭제되었습니다.';
    exception
      when alreadySucceedEnroll then
          result := '이미 등록성공한 수강신청입니다.';
      when others then
          rollback;
      result := SQLCODE || SQLERRM;
    end;
