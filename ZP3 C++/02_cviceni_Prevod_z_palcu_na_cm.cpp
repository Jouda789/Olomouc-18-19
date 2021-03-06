#include "pch.h"
#include <iostream>
#include <cmath>

using namespace std;

class Cm {
private: float value;
public: Cm(float value) : value(value) {};
		float hodnota() { return value; }
		float palec() { return (value / 2.54); }
		float rozdil(Cm &x) { return fabs(value - x.value); }
		float rozdil(class Palec &x);
};

class Palec {
private: float value;
public: Palec(float value) : value(value) {};
		float hodnota() { return value; }
		float cm() { return (value * 2.54); }
		float rozdil(Palec &x) { return fabs(value - x.value); }
		float rozdil(Cm &x) { return fabs(value - x.palec()); }
};

float Cm::rozdil(Palec &x) { return fabs(value - x.cm()); }

int main(void) {
	Cm centimetry(10);
	Palec p1(100);
	Palec p2(10);
	Cm cm1(5);
	Cm cm2(80);

	cout << "Hodnota centimetru je: " << centimetry.hodnota() << endl;
	cout << "Hodnota centimeru v palcich je: " << centimetry.palec() << endl;
	cout << "Rozdil palcu a centimetru je: " << p1.rozdil(centimetry) << endl;
	cout << "Rozdil palcu je: " << p1.rozdil(p2) << endl;
	cout << "Rozdil centimetru je: " << cm1.rozdil(cm2) << endl;
	cout << "Hodnota palcu v cm je: " << p1.cm() << endl;
	cout << "Rozdil centimetru a palcu v centimetrech je: " << cm1.rozdil(p1) << endl;
}