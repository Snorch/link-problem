#include <stdio.h>
#include <stdlib.h>

#include "second.h"

int main(int argc, char *argv[])
{
	if (argc != 3) {
		printf("Usage: %s <num1> <num2>\n", argv[0]);
		return 1;
	}

	printf("%d\n", test_function(atoi(argv[1]), atoi(argv[2])));
	return 0;
}
