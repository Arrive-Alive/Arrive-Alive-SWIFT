use ios_project;
SET GLOBAL log_bin_trust_function_creators = 1;
delimiter $$
drop function if exists get_interval;
create function get_interval(c_id int(2), l_id int(2), s_station varchar(20), e_station varchar(20)) returns varchar(20)
begin
	declare s_id int(2);
    declare s_val int(4);
    declare e_id int(2);
	declare t_id int(2);
    declare t_val int(2);
    declare t_name varchar(20);
    select sid into s_id from station where cid = c_id and lid = l_id and sname = s_station;
	select time into s_val from station where cid = c_id and lid = l_id and sname = s_station;
    select sid into e_id from station where cid = c_id and lid = l_id and sname = e_station;
    
    if (s_id<e_id) then
		if(e_id-s_id<=2) then return NULL; end if;
		set t_id = e_id - 2;
    else
		if(s_id-e_id<=2) then return NULL; end if;
		set t_id = e_id + 2;
	end if;
    
    select time into t_val from station where cid = c_id and lid = l_id and sid = t_id;
    select sname into t_name from station where cid = c_id and lid = l_id and sid = t_id;
    return concat(t_name, "@", abs(t_val - s_val));
end $$
delimiter ;

select *from station;
select get_interval(0, 1, '동대구역', '설화명곡');