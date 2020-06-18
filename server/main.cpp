#define _WINSOCK_DEPRECATED_NO_WARNINGS
#pragma once
#include <iostream>
#include <thread>
#include <vector>
#include <sstream>
#include <WinSock2.h>
#include "db.h"


#pragma comment(lib, "ws2_32")

#define PORT 9999
#define PACKET_SIZE 1024
#define ERROR_MESSAGE "0@"
int sock_fail_cnt = 0;

std::vector<std::string> split(std::string str, char delimiter) {
	std::vector<std::string> internal;
	std::stringstream ss(str);
	std::string temp;
	while (getline(ss, temp, delimiter)) {
		internal.push_back(temp);
	}
	return internal;
}


void app_handle_thread(SOCKET clnt_sock) {
	int recvcnt, total_cnt = 0;
	char buf[PACKET_SIZE + 1];
	std::string data;

	while ((recvcnt = recv(clnt_sock, buf, sizeof(buf) - 1, 0)) > 0) {
		buf[recvcnt] = '\0';
		if (buf[recvcnt - 1] == ';') {
			buf[recvcnt - 1] = '\0';
			data += buf;
			break;
		}
		data += buf;
	}
	if (recvcnt <= 0) return;
	std::vector <std::string> vec_data = split(data, '@');
	std::cout << "recv op : " << vec_data[0] << std::endl;
	if (vec_data[0] == "1") {	// 도시 선택
		std::string tmp = "1@" + database->search_line(vec_data[1].c_str());
		send(clnt_sock, tmp.c_str(), tmp.size()+1, 0);
		std::cout << "send line list" << std::endl;
	}
	else if (vec_data[0] == "2") {	// 호선 선택
		std::string tmp = "2@" + database->search_station(vec_data[1].c_str(), vec_data[2].c_str());
		send(clnt_sock, tmp.c_str(), tmp.size() + 1, 0);
		std::cout << "send station list" << std::endl;
	}
	else if (vec_data[0] == "3") {	// 시작/도착역 선택
		std::string tmp = database->get_station_inteval(vec_data[1].c_str(), vec_data[2].c_str(), vec_data[3].c_str(), vec_data[4].c_str());
		if (tmp == "") {
			send(clnt_sock, ERROR_MESSAGE, sizeof(ERROR_MESSAGE), 0);
			std::cout << "send error" << std::endl;
		}
		else { 
			tmp = "3@" + tmp; 
			send(clnt_sock, tmp.c_str() , tmp.size() + 1, 0); 
			std::cout << "send interval" << std::endl;
		}
		
	}
	else send(clnt_sock, ERROR_MESSAGE, sizeof(ERROR_MESSAGE), 0);
	closesocket(clnt_sock);
}


bool app_handle() {
	SOCKET server_sock;
	try {
		if ((server_sock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) == SOCKET_ERROR)
			throw - 1;

		sockaddr_in server_addr = {};
		server_addr.sin_addr.s_addr = htonl(INADDR_ANY);
		server_addr.sin_port = htons(PORT + sock_fail_cnt);
		server_addr.sin_family = AF_INET;
		
		if (bind(server_sock, (SOCKADDR*)&server_addr, sizeof(server_addr)) == SOCKET_ERROR)
			throw - 2;
		if (listen(server_sock, SOMAXCONN) == SOCKET_ERROR)
			throw - 3;

		while (1) {
			sockaddr_in clnt_addr = {};
			int clnt_size = sizeof(clnt_addr);
			SOCKET clnt_sock = accept(server_sock, (SOCKADDR*)&clnt_addr, &clnt_size);
			if (clnt_sock == SOCKET_ERROR)
				throw - 4;
			std::thread clnt_thread = std::thread(&app_handle_thread, clnt_sock);
			clnt_thread.detach();
		}
		return true;
	}
	catch (int expn) {
		closesocket(server_sock);
		switch (expn) {
		case -1:
			std::cout << "socket fail, press any key to restart" << std::endl;
			return false;
		case -2:
			std::cout << "socket bind fail, press any key to restart" << std::endl;
			break;
		case -3:
			std::cout << "socket listen fail, press any key to restart" << std::endl;
			break;
		case -4:
			std::cout << "socket accept fail, press any key to restart" << std::endl;
			break;
		}
		std::cout << "code : " << ::WSAGetLastError() << std::endl;
		sock_fail_cnt = sock_fail_cnt > 50 ? 0 : sock_fail_cnt + 1;
		return false;
	}
}


int __cdecl main() {
	std::wcout.imbue(std::locale("kor"));  // windows only
	WSADATA data;
	::WSAStartup(MAKEWORD(2, 2), &data);

	while (!init_db()) {
		std::cout << "database open fail, press any key to retry" << std::endl;
		getchar();
	}
	while (!app_handle()) {
		getchar();
	}
	database->exit_db();
	::WSACleanup();
	return 0;
}

