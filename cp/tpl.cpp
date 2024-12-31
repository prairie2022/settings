#include <bits/stdc++.h>
using namespace std;

#ifdef MIKU
string dbmc = "\033[1;38;2;57;197;187m", dbrs = "\033[0m";
#define debug(x...) cout << dbmc << "[" << #x << "] : ", dout(x)
void dout() { cout << dbrs << endl; }
template <typename T, typename ...U>
void dout(T t, U ...u) { cout << t << (sizeof...(u) ? ", " : ""); dout(u...); }
#else
#define debug(...) 39
#endif

#define fs first
#define sc second
#define mp make_pair
#define FOR(i, j, k) for (int i = j, Z = k; i < Z; i++)
using ll = long long;
typedef pair<int, int> pii;

void miku(){

}

int32_t main() {
	cin.tie(0) -> sync_with_stdio(false);
	cin.exceptions(cin.failbit);
	miku();
	return 0;
}
