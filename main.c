/*
 *
 * Copyright (c) 2016  Embest-tech, Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License.
 *
 */
#include <stdio.h>

void coredump_case1()
{
        char *ptr="my name is john";
        *ptr=0;
}


/*
 * Main function
 */
int main(int argc, char *argv[])
{
	printf("main function\n");
	coredump_case1();
	return 0;
}
