function [ ex, ey, ez, hx, hy, hz, epsr, mur, sgmr, gr, dt, da ] = eemempty(dx, dy, dz, da)
  ex = [];
  ey = [];
  ez = [];
  hx = [];
  hy = [];
  hz = [];
  epsr = [];
  mur = [];
  sgmr = [];
  gr = [];
  dt = 0;
  if (nargin != 4)
    da = 0;
    printf("\neemempty(dx, dy, dz, delta): Prepares empty space (vacuum) for EM simulation.\n");
	printf("  dx - the number of grids in the X direction\n");
	printf("  dy - the number of grids in the Y direction\n");
	printf("  dz - the number of grids in the Z direction\n");
	printf("  da - grid dimension in each of 3 directoins (X, Y, Z) [m] \n");
	printf("\n");
	printf("returns [ electric field (x3)\n");
    printf("          magnetic field (x3)\n");
	printf("          dielectric permittivity (N x N x N)\n");
	printf("          magnetic permeability (N x N x N)\n");
	printf("          relative magnetic resistivity (N x N x N)\n");
	printf("          relative electric conductivity (N x N x N)\n");
	printf("          cell dimension (delta x = delta y = delta z)\n");
    printf("          discrete time unit ]\n");
	return;
  endif;
  
  ex = zeros(dx, dy + 1, dz + 1);
  ey = zeros(dx + 1, dy, dz + 1);
  ez = zeros(dx + 1, dy + 1, dz);
  hx = zeros(dx + 1, dy, dz);
  hy = zeros(dx, dy + 1, dz);
  hz = zeros(dx, dy, dz + 1);
  epsr = ones(dx, dy, dz); # .* eps0()
  mur = ones(dx, dy, dz); # .* emu0()
  sgmr = zeros(dx, dy, dz);
  gr = zeros(dx, dy, dz);
  dt = da / (ec() * sqrt(3)); # Courant limit
endfunction
  