# esallenkeyopamp.m

opt = menu("Choose the Sallen-Key op.amp. topology:", "Low-pass filter", "High-pass filter", "Band-pass filter");

switch opt
	case 1
		printf("                        o \n");
		printf("                        |  \n");
		printf("                       [ ] \n");
		printf("                   R1  | | \n");
		printf("                       |_| \n");
		printf("                        |  \n");
		printf("                        +------+  \n");
		printf("                        |      |  \n");
		printf("                       [ ]     |  \n");
		printf("                   R2  | |    === \n");
		printf("                       |_|  C2 |  \n");
		printf("            C1          |      |  \n");
		printf(" |----------||----------+      |  \n");
		printf("      _____             |      |  \n");
		printf(" |---[_____]-+----      |      |  \n");
		printf("       R3    |    |     |      |  \n");
		printf("             | -------------   |  \n");
		printf("            [ ] \\ -     + /    |  \n");
		printf("         R4 | |  \\       /     |  \n");
		printf("            |_|   \\     /      |  \n");
		printf("             |     \\   /       |  \n");
		printf("             |      \\ /        |  \n");
		printf("             |       |         |  \n");
		printf("             --------+----------  \n");
		printf("                     |            \n");
		printf("                     o            \n");
	case 2
		printf("                        o \n");
		printf("                        |  \n");
		printf("                        |  \n");
		printf("                   C1  === \n");
		printf("                        |  \n");
		printf("                        |  \n");
		printf("                        +------+  \n");
		printf("                        |      |  \n");
		printf("                        |      |  \n");
		printf("                   C2  ===    [ ] \n");
		printf("                        |   R2| | \n");
		printf("        R1 _____        |     |_| \n");
		printf(" |--------[_____]-------+      |  \n");
		printf("      _____             |      |  \n");
		printf(" |---[_____]-+----      |      |  \n");
		printf("       R3    |    |     |      |  \n");
		printf("             | -------------   |  \n");
		printf("            [ ] \\ -     + /    |  \n");
		printf("         R4 | |  \\       /     |  \n");
		printf("            |_|   \\     /      |  \n");
		printf("             |     \\   /       |  \n");
		printf("             |      \\ /        |  \n");
		printf("             |       |         |  \n");
		printf("             --------+----------  \n");
		printf("                     |            \n");
		printf("                     o            \n");
	case 3
endswitch;
