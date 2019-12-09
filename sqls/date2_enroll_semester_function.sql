create or replace function Date2EnrollSemester(dDate in date)
return number
is
    nSemester number;
    sMonth char(2);
begin
    select to_char(dDate, 'MM')
    into sMonth
    from dual;
    if (sMonth = '11' or sMonth = '12' or (sMonth >= '01' and sMonth <= '04')) then
        nSemester := 1;
    else
        nSemester := 2;
    end if;
return nSemester;
end;
