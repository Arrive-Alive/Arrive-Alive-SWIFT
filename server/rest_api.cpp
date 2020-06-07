#include "rest_api.h"

using namespace utility;                    // Common utilities like string conversions
using namespace web;                        // Common features like URIs.
using namespace web::http;                  // Common HTTP functionality
using namespace web::http::client;          // HTTP client features
using namespace concurrency::streams;       // Asynchronous streams

rest_api::rest_api(){

}


rest_api::~rest_api(){

}
void GetHttp()
{
	http_client client(U("http://en.cppreference.com/w/"));
	auto resp = client.request(U("GET")).get();

	std::wcout << U("STATUS : ") << resp.status_code() << endl;
	std::wcout << "content-type : " << resp.headers().content_type() << endl;
	std::wcout << resp.extract_string(true).get() << endl;
}

void GetHttpAsync()
{
	http_client client(U("http://en.cppreference.com/w/"));

	client.request(U("GET")).then([](http_response resp) {
		std::wcout << U("STATUS : ") << resp.status_code() << endl;
		std::wcout << "content-type : " << resp.headers().content_type() << endl;

		resp.extract_string(true).then([](string_t sBoby) {
			wcout << sBoby << endl;
			}).wait();

		}).wait();

}


void GetJson()
{
	http_client client(U("http://date.jsontest.com/"));

	http_request req(methods::GET);

	client.request(req).then([=](http_response r) {
		std::wcout << U("STATUS : ") << r.status_code() << endl;
		std::wcout << "content-type : " << r.headers().content_type() << endl;

		//{
		//		"time": "11:25:23 AM",
		//		"milliseconds_since_epoch" : 1423999523092,
		//		"date" : "02-15-2015"
		//}

		r.extract_json(true).then([](json::value v) {
			std::wcout << v.at(U("date")).as_string() << endl;
			std::wcout << v.at(U("time")).as_string() << endl;
			}).wait();

		}).wait();

}

