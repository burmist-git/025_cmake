#include <iostream>

float add(float a, float b);

int main(){
  std::cout<<"main()"<<std::endl;
  std::cout<<add(5.1,4.3)<<std::endl;
  std::cout<<add(10.7f,11.5f)<<std::endl;
  return 0;
}
