#include <SW/Client.h>

int main() {
    Client client;
    std::string host;
    int port;
    std::cout << "[Client] Enter host IP: ";
    std::cout << "[Client] Enter port: ";
    std::cin >> port;
    try{client.run(host, port, 8000); }
    catch (const std::exception& e) {
        std::cerr << "[Client] Error: " << e.what() << std::endl;
        return -1;
    }

    return 0;
}