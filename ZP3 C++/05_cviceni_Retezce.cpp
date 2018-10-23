#include <iostream>
#include <cstring>

using namespace std;

class Retez {
	char *retez;
    public: Retez(const char *);
		Retez(unsigned);
		~Retez();
		void vypsat();
		friend Retez *levy(const Retez &, int);
		friend Retez *pravy(const Retez &, int);
		friend Retez *stred(const Retez &, int, int);
};

Retez::Retez(const char *r) {
	retez = new char[strlen(r) + 1];
	strcpy(retez, r);
}

Retez::Retez(unsigned n) {
	this->retez = new char[n];
}

Retez::~Retez() {
	delete this->retez;
}

void Retez::vypsat() {
	cout << this->retez << endl;
}

Retez *stred(const Retez &r, int m, int n) {
	Retez *ret = new Retez(n);
	memcpy(ret->retez, r.retez + m, n);
	ret->retez[n] = '\0';
	return ret;
}

Retez *levy(const Retez &r, int n) {
	return stred(r, 0, n);
}

Retez *pravy(const Retez &r, int n) {
	return stred(r, strlen(r.retez) - n, n);
}

int main()
{
	Retez M("Mesic je prirozena druzice Zeme");
	levy(M, 5)->vypsat();
	pravy(M, 4)->vypsat();
	stred(M, 19, 7)->vypsat();
}
