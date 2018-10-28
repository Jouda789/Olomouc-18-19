//#include "pch.h"
#include <iostream>
using namespace std;

class Struktura {
public:
	virtual void pridat(int) =0;
	virtual int odebrat() =0;
};

class Zasobnik : public Struktura {
public: int* pole;
		int zarazka = 0;
		int velikost = 0;

	Zasobnik (int vel) : velikost(vel) {
		int* pole = new int[vel];	
	};

	void pridat(int cislo) {
		pole[zarazka % velikost] = cislo;
		zarazka++;
	}
	
	int odebrat() {
		int pom = pole[zarazka];
		zarazka--;
		return pom;
	}

};

class Fronta : public Struktura {
public: int* pole;
		int zarazka = 0;
		int zacatek = 0;

		Fronta(int vel) {
			int* pole = new int[vel];
		};

		void pridat(int cislo) {
			pole[zarazka] = cislo;
			zarazka++;
		}

		int odebrat() {
			int pom = zacatek;
			zacatek++;
			return pom;
		}
};

void Pridat(Struktura &str, int m, int n) {
	int i;
	for (i = m; i <= n; i++) {
		str.pridat(i);
	}
};

void Odebrat(Struktura &str, int n) {
	while (n) {
		cout << str.odebrat();
		n--;
	}
	cout << endl;
};

int main()
{
	Zasobnik Z(6); Fronta F(6);
	Pridat(Z, 0, 5); Odebrat(Z, 4);
	Pridat(Z, 6, 9); Odebrat(Z, 6);
	Pridat(F, 0, 5); Odebrat(F, 4);
	Pridat(F, 6, 9); Odebrat(F, 6);
}

