create or replace procedure FinishEnroll
  is
    nYear number;
    nSemester number;
  begin
    nYear := Date2EnrollYear(SYSDATE);
    nSemester := Date2EnrollSemester(SYSDATE);

    update enroll
    set e_success = '1'
    where e_id = ()
  end;
