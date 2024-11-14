#include <bits/stdc++.h>
using namespace std;
typedef long long ll;

void solve(string s){
    string buf;
    cout << "[\"";
    for(int i=0; i<s.size(); i++){
        if(s[i]=='\\') buf = "\\\\";
        else if(s[i]=='<') while(1){
            buf.push_back(s[i]);
            if(s[i]=='>') break;
            i++;
        }
        else buf.push_back(s[i]);
        cout << buf << (i==s.size()-1?"\"]\n":"\", \"");
        buf.clear();
    }
}

int main(){
    string s;
    while(cin >> s) solve(s);
    return 0;
}