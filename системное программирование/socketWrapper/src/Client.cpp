#include <SW/Client.h>

ClientSocket::ClientSocket(int port) : Socket(socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) {
    if(!isValid()) throw NetworkException("invalid client socket");
    sockaddr_in clientAddress;
    clientAddress.sin_family = AF_INET;
    clientAddress.sin_port = htons(port);
    clientAddress.sin_addr.s_addr = INADDR_ANY;
    if(::bind(socket_, reinterpret_cast<sockaddr*>(&clientAddress), sizeof(clientAddress)) == SOCKET_ERROR)
        throw NetworkException("bind failed");
}

void ClientSocket::connect(const std::string &host, int port){
    if(!isValid()) throw NetworkException ("invalid client socket");
    sockaddr_in serverAddress;
    serverAddress.sin_family = AF_INET;
    serverAddress.sin_port = htons(port);
    if(inet_pton(AF_INET, host.c_str(), &serverAddress.sin_addr) > 0)
        throw NetworkException("invalid ip host");
    if (::connect(socket_, reinterpret_cast<sockaddr*>(&serverAddress), sizeof(serverAddress)) == SOCKET_ERROR)
        throw NetworkException("connect failed");
}

void Client::run(const std::string &host, int serverPort, int clientPort){
    WsaInitializer wsa;
    ClientSocket client(clientPort);
    std::cout<< "[Client] Connecting to server..." << std::endl;
    client.connect(host, serverPort);
    std::cout<< "[Client] Connecting to server..." << std::endl;
    while(true){
        std::string message;
        std::getline(std::cin, message);
        if(message.empty()) continue;
        client.send(message);
        std::string response = client.receive(2048);
        std::cout << "[Client] Message: " << response << std::endl;
    }
}
