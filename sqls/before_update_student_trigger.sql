create or replace trigger BeforeUpdateStudent
before update on student
for each row
declare
    underflow_length exception;
    invalid_value exception;
    nLength number;
    nBlank number;
begin
    select length(:new.s_pwd), instr(:new.s_pwd, ' ')
    into nLength, nBlank
    from dual;
    if (nLength < 4) then
        raise underflow_length;
    elsif (nBlank > 0) then
        raise invalid_value;
    end if;
exception
    when underflow_length then
        raise_application_error(-20002, '암호는 4자리 이상이어야 합니다.');
    when invalid_value then
        raise_application_error(-20003, '암호에 공란은 입력되지 않습니다.');
end;
