#pragma once
#include <iostream>
#include <mysql.h>

#include <string>
#include <mutex>
#pragma comment (lib , "libmysql.lib")


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
	std::string search(const char* table, int args, ...);

};