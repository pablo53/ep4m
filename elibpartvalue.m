function [tm] = elibpartvalue(partname, par1, par2)
  tm = [ NaN NaN ; NaN NaN ];
  if (nargin < 1)
	printf("Usage: [T] = elibpartvalue(partname, [...]): Returns ABCD matrix for a library element.\n");
	return;
  endif;
  if (nargin < 3)
    par2 = NaN;
  endif;
  if (nargin < 2)
    par1 = NaN;
  endif;
  switch (partname)
    case "MSA1105"
	  if (nargin < 2)
	    printf("Usage: [T] = elibpartvalue(\"MSA1105\", f0)\n");
	    return;
	  endif;
	  f0 = par1;
      f = [.0005 .005 .025 .050 .100 .200 .300 .400 .500 .600 .700 .800 .900 1.000 1.500 2.000 2.500 3.000] .* 1e+9;
	  s11mag = [.80 .26 .07 .06 .05 .06 .07 .09 .10 .11 .13 .15 .16 .18 .28 .38 .46 .53];
	  s11ang = [343 298 312 322 319 305 286 269 255 244 232 224 215 208 174 150 133 118];
	  s12mag = [.050 .144 .151 .153 .152 .155 .157 .163 .166 .171 .178 .184 .188 .197 .219 .248 .254 .262];
	  s12ang = [51 15 4 2 3 5 7 8 8 10 11 11 11 11 7 0 356 352];
	  s21mag = [8.94 4.98 4.36 4.33 4.31 4.26 4.19 4.10 4.00 3.88 3.76 3.63 3.49 3.37 2.75 2.28 1.90 1.62];
	  s21ang = [171 163 174 174 170 162 154 146 138 131 123 116 109 102 72 48 28 11];
	  s22mag = [.81 .26 .08 .06 .06 .08 .10 .12 .14 .17 .18 .21 .22 .24 .31 .34 .38 .40];
	  s22ang = [344 296 308 312 308 287 269 255 244 234 225 216 209 201 170 151 134 122];
	  smag = zeros(2, 2);
	  smag(1, 1) = spline(f, s11mag, f0);
	  smag(1, 2) = spline(f, s12mag, f0);
	  smag(2, 1) = spline(f, s21mag, f0);
	  smag(2, 2) = spline(f, s22mag, f0);
	  sang = zeros(2, 2);
	  sang(1, 1) = spline(f, s11ang, f0);
	  sang(1, 2) = spline(f, s12ang, f0);
	  sang(2, 1) = spline(f, s21ang, f0);
	  sang(2, 2) = spline(f, s22ang, f0);
	  s = cos(sang * pi / 180) .* smag + i * sin(sang * pi / 180) .* smag;
	  tm = ey2t(es2y(s, 50, 50));
    case "MSA2111"
	  if (nargin < 2)
	    printf("Usage: [T] = elibpartvalue(\"MSA2111\", f0)\n");
	    return;
	  endif;
	  f0 = par1;
      f =      [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.5 2.0 2.5 3.0 3.5 4.0] .* 1e+9;
	  s11mag = [.28 .26 .24 .21 .18 .15 .13 .11 .09 .07 .08 .11 .15 .27 .38 .46];
	  s11ang = [171 163 156 152 149 148 148 152 158 169 237 236 193 158 145 135];
	  s12mag = [.050 .053 .057 .063 .068 .074 .081 .088 .095 .101 .136 .167 .193 .211 .222 .234];
	  s12ang = [9 18 25 30 35 38 40 42 43 44 45 42 43 38 34 30];
	  s21mag = [14.1 13.4 12.5 11.5 10.6 9.7 8.9 8.2 7.6 7.0 5.0 3.9 3.2 2.6 2.2 1.9];
	  s21ang = [167 156 145 136 128 120 114 108 102 98 79 63 56 43 32 21];
	  s22mag = [.27 .27 .26 .26 .24 .24 .22 .21 .20 .19 .10 .06 .06 .12 .16 .17];
	  s22ang = [177 175 173 171 170 169 169 169 168 169 179 213 183 149 145 144];
	  smag = zeros(2, 2);
	  smag(1, 1) = spline(f, s11mag, f0);
	  smag(1, 2) = spline(f, s12mag, f0);
	  smag(2, 1) = spline(f, s21mag, f0);
	  smag(2, 2) = spline(f, s22mag, f0);
	  sang = zeros(2, 2);
	  sang(1, 1) = spline(f, s11ang, f0);
	  sang(1, 2) = spline(f, s12ang, f0);
	  sang(2, 1) = spline(f, s21ang, f0);
	  sang(2, 2) = spline(f, s22ang, f0);
	  s = cos(sang * pi / 180) .* smag + i * sin(sang * pi / 180) .* smag;
	  tm = ey2t(es2y(s, 50, 50));
    case "BF245"
	  if (nargin < 2)
	    printf("Usage: [T] = elibpartvalue(\"BF245\", f0)\n");
	    return;
	  endif;
	  f0 = par1;
      f = [50 70 100 200 300] .* 1e+6;
      bis = [ 1.2, 1.5, 2.2, 4.4, 7.0 ] .* 1e-3;
      gis = [ 0.03, 0.04, 0.08, 0.27, 0.6 ] .* 1e-3;
      yis = i .* bis + gis;
      brs = [ 0.2, 0.3, 0.43, 0.9, 1.4 ] .* 1e-3;
      grs = [ 1.0, 1.0, 1.0, 1.0, 1.0 ] .* 1e-3;
      yrs = i .* brs + grs;
      bfs = -[ 0.23, 0.5, 0.7, 1.0, 1.5 ] .* 1e-3;
      gfs = [ 5.5, 5.5, 5.5, 5.5, 5.5 ] .* 1e-3;
      yfs = i .* bfs + gfs;
      bos = [ 0.3, 0.5, 0.63, 1.3, 2.1 ] .* 1e-3;
      gos = [ 0.033, 0.033, 0.035, 0.05, 0.073 ] .* 1e-3;
      yos = i .* bos + gos;
	  y = zeros(2, 2);
	  y(1, 1) = spline(f, yis, f0);
	  y(1, 2) = spline(f, yrs, f0);
	  y(2, 1) = spline(f, yfs, f0);
	  y(2, 2) = spline(f, yos, f0);
	  tm = ey2t(y);
    case "BF245A"
	  if (nargin < 2)
	    printf("Usage: [t, v] = elibpartvalue(\"BF245A\", f0)\n");
	    return;
	  endif;
	  f = par1;
	  tm = elibpartvalue("BF245", f); # BF245
    case "BF245B"
	  if (nargin < 2)
	    printf("Usage: [t, v] = elibpartvalue(\"BF245B\", f0)\n");
	    return;
	  endif;
	  f = par1;
	  tm = elibpartvalue("BF245", f); # BF245
    case "BF245C"
	  if (nargin < 2)
	    printf("Usage: [t, v] = elibpartvalue(\"BF245C\", f0)\n");
	    return;
	  endif;
	  f = par1;
	  tm = elibpartvalue("BF245", f); # BF245
  endswitch;
endfunction