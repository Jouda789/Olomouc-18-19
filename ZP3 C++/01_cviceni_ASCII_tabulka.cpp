#include "pch.h" // toto je PreCompiled Header
#include <iostream>

using namespace std;

int main()
{
	int i;
	int j;

	int citac = 0;

	for (i = 0; i < 16; i++)
	{
		if (i == 0) cout << "    ";
		if (i == 1) cout << "  -";

		for (j = 0; j < 16; j++)
		{
			if (i == 0) { cout << uppercase << hex << j << " "; }
			else if (i == 1) { cout << "--"; }
			else {
				if (j == 0) { cout << i << '0' << '|' << " "; }

				char c = citac;
				cout << static_cast<char>(c) << ' ';


				if (j == 15) cout << "|";
			}
			citac++;
		}

		if (i == 1) { cout << "--"; }
		cout << '\n';
	}
	cout << "  -----------------------------------";
	return 0;
}