#include<stdio.h>
#include <iostream>
#include <unistd.h>
__global__ void hello_world(void)
{
  printf("GPU: Hello world!\n");
  // std::cout << "Hello GPU" << std::endl;
}
int main(int argc,char **argv)
{
  printf("CPU: Hello world!\n");
  std::cout << "Hello CPU" << std::endl;
  hello_world<<<2,10>>>();
  sleep(5);
  std::cout << "sleep over " << std::endl; 
  cudaDeviceReset();//if no this line ,it can not output hello world from gpu 将当前GPU状态恢复到初始状态
  return 0;
}
