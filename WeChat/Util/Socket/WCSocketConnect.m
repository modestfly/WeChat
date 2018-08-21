//
//  WCSocketConnect.m
//  WeChat
//
//  Created by test on 2018/8/20.
//  Copyright © 2018年 SkyFly. All rights reserved.
//

#import "WCSocketConnect.h"

#import <sys/types.h>
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>

@interface WCSocketConnect()

@property (nonatomic,assign)int clientSocket;

@end

@implementation WCSocketConnect

//单例的一个方法
+(instancetype)shareinstance{
    
    static dispatch_once_t onceToken;
    static WCSocketConnect * instance = nil;
    dispatch_once(&onceToken,^{
       
        instance = [[self alloc]init];
        [instance initSocket];
        [instance publlMsg];
        
    });
    
    return instance;
}
-(void)initSocket{
    
    if(_clientSocket != 0){
        [self disconnect];
        _clientSocket = 0;
    }
    //创建客户端socket
    _clientSocket = CreatClinetSocket();
    
    //服务器Ip
    const char *server_ip = "127.0.0.1";
    //服务器端口
    short server_port = 6969;
    //等于0说明连接失败
    if(ConnectToServer(_clientSocket, server_ip, server_port) == 0){
        printf("error connect");
        return ;
    }
    //连接成功
    printf("112");
}

static int CreatClinetSocket(){
    int ClinetSocket = 0;
    //创建一个socket,返回值为Int.(注socket其实就是Int类型)
    //第一个参数addressFamily IPv4(AF_INET)或IPv6(AF_INET6).
    //第二个参数type表示socket的类型，通常是流stream(SOCK_STREAM)或数据报文datagram
    //第三个参数prorocol参数通常设置为0，以便让系统自动选择我们合适的协议
    ClinetSocket = socket(AF_INET, SOCK_STREAM, 0);
    return ClinetSocket;
}

static int ConnectToServer(int client_socket,const char *server_ip,unsigned short port){
    //生成一个sockaddr_in类型结构体
    struct sockaddr_in sAddr={0};
    sAddr.sin_len = sizeof(sAddr);
    //设置Ipv4
    sAddr.sin_family = AF_INET;
    //inet_aton是一个改进的方法将一个字符串IP地址转换为一个32位的网络序列IP地址
    //如果这个函数成功，函数的返回值非零，如果输入地址不正确则会返回零
    inet_aton(server_ip, &sAddr.sin_addr);
    //htons是将整形变量从主机字节顺序转变成网络字节顺序，赋值端口号
    sAddr.sin_port = htons(port);
    //用socket和服务端地址，发起连接。
    //客户端向特定网络地址的服务器发送连接请求，连接成功返回0，失败则返回-1.
    //注意：该接口调用会阻塞当前线程，直到服务器返回
    if(connect(client_socket, (struct sockaddr *)&sAddr, sizeof(sAddr))== 0){
        return client_socket;
    }
    return 0;
}

#pragma mark -新线程来接受消息
-(void)publlMsg{
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(receiveAction) object:nil];
    
    [thread start];
}
//连接
-(void)connect{
    
    [self initSocket];
    
}
//断开连接
-(void)disconnect{
    
    close(self.clientSocket);
}
//发送消息
-(void)sendMsg:(NSString *)msg{
    const char *send_Message = [msg UTF8String];
    send(self.clientSocket, send_Message, strlen(send_Message) +1, 0);
    
}
//收取服务端发送的消息
-(void)receiveAction{
    while (1) {
        char recv_Message[1024] = {0};
        recv(self.clientSocket, recv_Message, sizeof(recv_Message), 0);
        printf("%s",recv_Message);
    }
}

@end
