#pragma once
#include <iostream>
#include <mysql.h>
#include <string>
#include <mutex>
#pragma comment (lib , "libmysql.lib")


#define HOST "127.0.0.1"
#define USER "latter2005"
#define PASSWORD "opentime4132@"
#define DB_NAME "ios_project"

class DB {
private:
	MYSQL * connection, conn;
	MYSQL_RES *sql_result;
	MYSQL_ROW sql_row;
	int query_stat;
	std::mutex DB_mtx;

public:
	int class_stat;
	DB();
	DB(const char* host, const char* user, const char* passwd, const char* db);
	bool exit_db();
	std::string search_line(const char* city);
	std::string search_station(const char* city, const char* line);
	std::string get_station_inteval(const char* state, const char *line, const char* s, const char* e);
};

extern DB *database;

bool init_db();