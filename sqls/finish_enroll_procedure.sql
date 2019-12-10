create or replace procedure FinishEnroll
  is
    nYear number;
    nSemester number;
    cId varchar2(10);
    enrollsCount number;

    cursor enroll_count_list is
      select c_id, count(*) cnt
      from final_enroll_view
      group by c_id;
  begin
    nYear := Date2EnrollYear(SYSDATE);
    nSemester := Date2EnrollSemester(SYSDATE);

    for ec_list in enroll_count_list loop
      cId := ec_list.c_id;
      enrollsCount := ec_list.cnt;

      update enroll
      set e_success = '1'
      where e_id in (select * from(select e_id
                                  from final_enroll_view
                                  where c_id = cId) resultSet
                                  WHERE ROWNUM<=enrollsCount);
    end loop;

    commit;
  end;
