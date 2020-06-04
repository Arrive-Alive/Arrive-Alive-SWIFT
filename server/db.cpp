#include "db.h"

DB::DB() : connection(NULL) {};
DB::DB(const char* host, const char* user, const char* passwd, const char* db) {
	mysql_init(&conn);
	if ((connection = mysql_real_connect(&conn, host, user, passwd, db, 3306, (char*)NULL, 0)) == NULL) {
		std::cout << "Mysql 에러 : " << mysql_error(&conn) << std::endl;
		class_stat = false;
		return;
	}

	if (mysql_select_db(&conn, db)) {
		std::cout << mysql_errno(&conn) << " 에러 : " << mysql_error(&conn) << std::endl;
		class_stat = false;
		return;
	}
	mysql_query(connection, "set session character_set_connection=utf8;");
	mysql_query(connection, "set session character_set_results=utf8;");
	mysql_query(connection, "set session character_set_client=utf8;");
	class_stat = true;
}
bool DB::exit_db() {
	if (class_stat) {
		mysql_close(connection);
		return true;
	}
	return false;
}
std::string DB::search_line(const char* line) {
	std::string tmp = "select sname from station where cid=0 and lid=", result_str;
	tmp = tmp + line[0];
	std::lock_guard<std::mutex> guard(DB_mtx);
	if ((query_stat = mysql_query(connection, tmp.c_str())) != 0) {
		std::cout << "Mysql 에러 : " << mysql_error(&conn) << std::endl;
		return NULL;
	}
	if ((sql_result = mysql_store_result(connection)) == NULL) {
		std::cout << "Mysql 에러 : " << mysql_error(&conn) << std::endl;
		return NULL;
	}
	int num_fields = mysql_num_fields(sql_result);
	while ((sql_row = mysql_fetch_row(sql_result)) != NULL) {
		for (int i = 0; i < num_fields; i++)
			result_str = result_str + sql_row[i] + "@";
	}
	mysql_free_result(sql_result);
	return result_str;
}
std::string DB::get_station_inteval(const char *line, const char* s, const char* e) {
	std::string tmp = std::string("select get_interval(0, ") + line[0] + ", '" + s + "', '" + e + "');", result_str;
	
	std::lock_guard<std::mutex> guard(DB_mtx);
	if ((query_stat = mysql_query(connection, tmp.c_str())) != 0) {
		std::cout << "Mysql 에러 : " << mysql_error(&conn) << std::endl;
		return NULL;
	}
	if ((sql_result = mysql_store_result(connection)) == NULL) {
		std::cout << "Mysql 에러 : " << mysql_error(&conn) << std::endl;
		return NULL;
	}
	int num_fields = mysql_num_fields(sql_result);
	while ((sql_row = mysql_fetch_row(sql_result)) != NULL && *sql_row != NULL) {
		for (int i = 0; i < num_fields; i++)
			result_str = result_str + sql_row[i] + "@";
	}
	mysql_free_result(sql_result);
	return result_str;
}

DB *database;

bool init_db() {
	database = new DB(HOST, USER, PASSWORD, DB_NAME);
	if (!database->class_stat) {
		return false;
	}
		
	return true;
}