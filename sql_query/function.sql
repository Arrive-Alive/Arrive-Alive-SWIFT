use ios_project;
SET GLOBAL log_bin_trust_function_creators = 1;
delimiter $$
drop function if exists get_interval;
create function get_interval(c_name varchar(20), l_name varchar(20), s_station varchar(20), e_station varchar(20)) returns varchar(20)
begin
	declare s_id, e_id, t_id, c_id, l_id  int(2);
    declare s_val, t_val int(4);
    declare t_name varchar(20);
    
    select cid into c_id from city where cname=c_name;
    select lid into l_id from line where cid=c_id and lname=l_name;
    select sid, time into s_id, s_val from station where cid = c_id and lid = l_id and sname = s_station;
    select sid into e_id from station where cid = c_id and lid = l_id and sname = e_station;
    
    if (s_id<e_id) then
		if(e_id-s_id<=2) then return NULL; end if;
		set t_id = e_id - 2;
    else
		if(s_id-e_id<=2) then return NULL; end if;
		set t_id = e_id + 2;
	end if;
    
    select time, sname into t_val, t_name from station where cid = c_id and lid = l_id and sid = t_id;
    return concat(t_name, "@", abs(t_val - s_val));
end $$
delimiter ;

select *from station;
select get_interval("대구", "1호선", '동대구역', '설화명곡');