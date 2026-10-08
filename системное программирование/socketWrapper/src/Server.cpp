#include <SW/Server.h>

ServerSocket::ServerSocket(int port, bool isLocalHostOnly)
    :Socket(socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)){

    if(isValid()) throw NetworkException("invalid server socket");
    
    sockaddr_in serverAddress;
    serverAddress.sin_family = AF_INET;
   serverAddress.sin_port = htons(port);
    serverAddress.sin_addr.s_addr = isLocalHostOnly ? htonl(INADDR_LOOPBACK) : INADDR_ANY;

    if(::bind(socket_, reinterpret_cast<sockaddr*>(&serverAddress), sizeof(serverAddress)) == SOCKET_ERROR)
        throw NetworkException ("bind fail");

    if(::listen(socket_, SOMAXCONN) == SOCKET_ERROR)
        throw NetworkException ("listen fail");
    }

std::unique_ptr<Socket> ServerSocket::accept(){
    if(!isValid()) throw NetworkException("invalid server socket");
    sockaddr_in clientAddress;
    int szCliebtAddress = sizeof(clientAddress);
    SOCKET clientScoket = ::accept(
        socket_, reinterpret_cast<sockaddr*>(&clientAddress), &szCliebtAddress
    );

    if(clientScoket == INVALID_SOCKET)
        throw NetworkException("accept failed");

    return std::unique_ptr<Socket>();
}

void Server::run(int port){
    WsaInitializer wsa;
    ServerSocket server(port);
    
    std::cout << "Server started at port: " << port << std::endl;

    while(true) {
        auto client = server.accept();
        std::cout << "[Server] Client connected!" << std::endl;
        try {
            while(true) {
                std::string message = client->receive(2048);
                if(message.empty()) break;
                std::cout << "[Server] Message: " << message << std::endl;
                std::string response;
                std::getline(std::cin, response);
                 client->send(response);
            }
        }catch(const std::exception& e) {
            std::cout<< "[Server] Error: " << e.what() << std::endl;
        }
        std::cout << "[Server] Client disconnected!" << std::endl;
    }
}
