#include <stdio.h>

int main(void)
{
	unsigned char a = 0xff;
	unsigned char a_1 = a + 1;
	unsigned char a_3 = a + 3;

	printf("unsigned char a_1 = %u\n",a_1);
	printf("unsigned char a_3 = %u\n",a_3);
	printf("=========================\n");
	printf("signed char a_1 = %d\n",a_1);
	printf("signed char a_3 = %d\n",a_3);
	printf("a_3 - a_1 = %d\n",(char)a_3-(char)a_1);

	return 0;
}
