#pragma once
#include <cpprest/http_client.h>
#include <cpprest/filestream.h>
#pragma comment(lib, "cpprest142_2_10")
#pragma comment(lib, "cpprest142_2_10d")
class rest_api{
public:
	static void get_http();
	static void get_http_async();
	static void get_json();
	rest_api();
	~rest_api();
};

