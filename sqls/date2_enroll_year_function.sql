create or replace function Date2EnrollYear(dDate in date)
return number
is
    nYear number;
    sMonth char(2);
begin
    select to_number(to_char(dDate, 'YYYY')), to_char(dDate, 'MM')
    into nYear, sMonth
    from dual;
    if (sMonth = '11' or sMonth = '12') then
        nYear := nYear + 1;
    end if;
    return nYear;
end;
