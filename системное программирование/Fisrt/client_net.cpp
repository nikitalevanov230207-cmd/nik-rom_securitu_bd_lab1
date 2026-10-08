#include <iostream>
#include <string>
#include <cstring>

#include <WinSock2.h>
#include <WS2tcpip.h>
#pragma comment(lib, "ws2_32.lib")

const int SERVER_PORT = 4444;
const int BUFFER_SIZE = 1024;

int main(){
 WSADATA wsaData;

    int res = WSAStartup(MAKEWORD(2, 2), &wsaData);
    if (res != 0) std::cerr << "WSA eror: " <<WSAGetLastError() << std::endl;
    else {
        std::cout << "WSA complited" << res << std::endl;
    }

    SOCKET clientSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (clientSocket == INVALID_SOCKET) {
        std::cerr <<"Socket error: " << WSAGetLastError() << std::endl;
        WSACleanup();
        return -1;
    }

    sockaddr_in serverAddress;
    serverAddress.sin_family = AF_INET;
    serverAddress.sin_port = SERVER_PORT;
    serverAddress.sin_addr.s_addr = INADDR_ANY;

    res = bind(clientSocket, reinterpret_cast<sockaddr*>(&serverAddress), sizeof(serverAddress));
    if (res != 0 ) {
        std::cerr << "Socket error: " << WSAGetLastError() << std::endl;
        WSACleanup();
        return -1;
    }

    std::string serverIP;
    std::cout << "Enter srv IP: "  << std::endl;
    std::getline(std::cin, serverIP);

    res = inet_pton(AF_INET, serverIP.c_str(), &serverAddress.sin_addr);
    if (res != 1 ){
        std::cerr << "Socket not valid IP: " << WSAGetLastError() << std::endl;
        WSACleanup();
        return -1;        
    }

    res = connect(clientSocket, reinterpret_cast<sockaddr*>(&serverAddress), sizeof(serverAddress));
    if (res < 0) {
        std::cerr << "Connection issues:" << WSAGetLastError() << std::endl;
        WSACleanup();
        return -1;        
    }

    std::cout << "Connected " << std::endl;

    char buffer[BUFFER_SIZE];

    while (true){
        std::string message;
        std::cout << "Enter message: ";
        std::getline (std::cin , message);

        int sent = send(clientSocket, message.c_str(), message.size() + 1, 0);

        if (sent < 0) {
        std::cerr << "Client connection error: " << WSAGetLastError() << std::endl;
            break;
        }
        memset(buffer, 0, BUFFER_SIZE);

        int  recieved = recv(clientSocket, buffer, BUFFER_SIZE, 0);

        if (recieved < 0){
            std::cerr << "Discon: " << std::endl;
            break;
        }
        std::cout << "Server: " << buffer << std::endl;

    }
    closesocket(clientSocket);
    
    WSACleanup();

    return 0;
}