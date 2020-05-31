#include <iostream>
#include <thread>
#include <vector>
#include <sstream>
#include <WinSock2.h>
#include "db.h"
#pragma comment(lib, "ws2_32")

#define _WINSOCK_DEPRECATED_NO_WARNINGS
#define PORT 8888
#define PACKET_SIZE 1024
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
	if (vec_data[0] == "1") {	// 호선 선택
		std::string tmp = "1@" + database->search_line(vec_data[1].c_str());
		send(clnt_sock, tmp.c_str(), tmp.size(), 0);
	}
	else if (vec_data[0] == "2") {	// 시작/도착역 선택

	}




	closesocket(clnt_sock);
	std::cout << "end" << std::endl;
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
		if (listen(server_sock, SOMAXCONN) == -1)
			throw - 3;

		while (1) {
			sockaddr_in clnt_addr = {};
			size_t clnt_size;
			SOCKET clnt_sock = accept(server_sock, (SOCKADDR*)&clnt_addr, (int*)&clnt_size);
			if (clnt_sock == SOCKET_ERROR)
				throw - 4;

			//std::cout << "new connection : " << inet_ntoa(clnt_addr.sin_addr) << std::endl;
			std::thread clnt_thread = std::thread();
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

		sock_fail_cnt = sock_fail_cnt > 50 ? 0 : sock_fail_cnt + 1;
		return false;
	}
}


int main() {
	WSADATA data;
	::WSAStartup(MAKEWORD(2, 2), &data);

	/*while (!init_db()) {
		std::cout << "database open fail, press any key to retry" << std::endl;
		getchar();
	}*/
	//app_handle();

	database->exit_db();
	::WSACleanup();
	return 0;
}

