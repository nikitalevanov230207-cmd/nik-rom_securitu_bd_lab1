#include <iostream>
#include <string>
#include <cstring>

#include <WinSock2.h>
#include <WS2tcpip.h>
#pragma comment(lib, "ws2_32.lib")

const int SERVER_PORT = 4444;
const int BUFFER_SIZE = 1024;

int main (){
    WSADATA wsaData;

    int res = WSAStartup(MAKEWORD(2, 2), &wsaData);
    if (res != 0) std::cerr << "WSA eror: " <<WSAGetLastError() << std::endl;
    else {
        std::cout << "WSA complited" << res << std::endl;
    }

    SOCKET serverSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (serverSocket == INVALID_SOCKET) {
        std::cerr <<"Socket error: " << WSAGetLastError() << std::endl;
        WSACleanup();
        return -1;
    }

    sockaddr_in serverAddress;
    serverAddress.sin_family = AF_INET;
    serverAddress.sin_port = SERVER_PORT;
    serverAddress.sin_addr.s_addr = INADDR_ANY;

    res = bind(serverSocket, reinterpret_cast<sockaddr*>(&serverAddress), sizeof(serverAddress));
    if (res != 0 ) {
        std::cerr << "Socket error: " << WSAGetLastError() << std::endl;
        WSACleanup();
        return -1;
    }

    res = listen(serverSocket, SOMAXCONN);
    if (res != 0) {
        std::cerr << "Socket error: " << WSAGetLastError() << std::endl;
        WSACleanup();
        return -1;
    }

    std::cout << "Server listen port: " << SERVER_PORT << std::endl;

    sockaddr_in client_address;
    int szclient_address = sizeof (client_address);
    SOCKET client_socket = accept(serverSocket, reinterpret_cast<sockaddr*>(&client_address), &szclient_address);
    if (client_socket == INVALID_SOCKET) {
        std::cerr << "Client connection error: " << WSAGetLastError() << std::endl;
        WSACleanup();
        return -1;
    }
    char client_IP[INET_ADDRSTRLEN];
    inet_ntop(AF_INET,&client_address.sin_addr, client_IP, INET_ADDRSTRLEN);
    std::cout << "Client connected from: " << client_IP << std::endl;
    char buffer[BUFFER_SIZE];
    
    while (true) {
        memset(buffer, 0 , BUFFER_SIZE);
        int recived = recv(client_socket, buffer, BUFFER_SIZE, 0);
        if (recived < 0){
            std::cerr << "Discon: " << std::endl;
            break;
        }

        std::cout << "Client: " << buffer << std::endl;

        std::string response;
        std::cout << "Enter response: ";
        std::getline(std::cin, response);
        int sent = send(client_socket, response.c_str(), response.size() + 1, 0);

        if (sent < 0) {
        std::cerr << "Client connection error: " << WSAGetLastError() << std::endl;
        WSACleanup();
        return -1;
        }
    }

    closesocket(client_socket);
    closesocket(serverSocket);
    WSACleanup();

    return 0;
}



