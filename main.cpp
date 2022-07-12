#include <iostream>
using namespace std;

int main(void) {
    int rule_code;
    int width, height;

    cout << "Input Wolfram Code..." << endl;
    cin >> rule_code;

    cout << "Input width and height..." << endl;
    cin >> width >> height;
}
/*rule_code = 30
mes "Wolfram code : " + rule_code
dim rule, 8
repeat 8
    if rule_code and int(powf(2,cnt)) : rule(cnt) = 1
loop
size = 70
dim cells, size
cells(int(size/2)) = 1
dim tmp, size
repeat 25
    repeat size - 2, 1
        //出力
        mes cells(cnt),1
        tmp(cnt) = rule((cells(cnt - 1) * 4) + (cells(cnt) * 2) + (cells(cnt+1) * 1))
    loop
    repeat size - 2, 1
        cells(cnt) = tmp(cnt)
    loop
    mes
    pos 0,
    wait 1
loop*/