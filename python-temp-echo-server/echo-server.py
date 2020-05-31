import socket
from _thread import *

# 쓰레드에서 실행되는 코드입니다.
# 접속한 클라이언트마다 새로운 쓰레드가 생성되어 통신을 하게 됩니다.
def threaded(client_socket, addr):
    print('Connected by :', addr[0], ':', addr[1])

    # 클라이언트가 접속을 끊을 때 까지 반복합니다.
    while True:

        try:
            # 데이터가 수신되면 클라이언트에 다시 전송합니다.(에코)
            data = client_socket.recv(1024)

            if not data:
                print('Disconnected by ' + addr[0], ':', addr[1])
                break

            decoded_data = str(data.decode())
            print('Received from ' + addr[0], ':', addr[1], data.decode())

            if ("2@" in decoded_data) :
                if ("강아지" in decoded_data):
                    client_socket.send("0@".encode())
                else :
                    client_socket.send("2@14@강아지".encode())


            elif ("1@" in decoded_data):
                if "1호선" in decoded_data:
                    client_socket.send("1@형진역@주홍역@효상역@영욱역@강아지@고양이@사자".encode())
                elif "2호선" in decoded_data:
                    client_socket.send("1@애플역@과자역@사과역@등등역@하이염".encode())
                else :
                    client_socket.send("1@삼성역@가방역@충전기@역우역@우웩염".encode())


        except ConnectionResetError as e:

            print('Disconnected by ' + addr[0], ':', addr[1])
            break

    client_socket.close()


HOST = '127.0.0.1'
PORT = 9997

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server_socket.bind((HOST, PORT))
server_socket.listen()

print('server start')

# 클라이언트가 접속하면 accept 함수에서 새로운 소켓을 리턴합니다.
# 새로운 쓰레드에서 해당 소켓을 사용하여 통신을 하게 됩니다.
while True:
    print('wait')

    client_socket, addr = server_socket.accept()
    start_new_thread(threaded, (client_socket, addr))

server_socket.close()