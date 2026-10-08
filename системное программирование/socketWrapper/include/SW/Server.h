#include <SW/SocketWrapper.h>
#include <memory>
#include <iostream>
#include <string>

class ServerSocket : public Socket {
public:
    ServerSocket(int port, bool isLocalHostOnly);
    std::unique_ptr<Socket> accept();    
};

class Server final{
public:
    void run (int port);
};
