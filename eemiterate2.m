function [ ex, ey, ez, hx, hy, hz ] = eemiterate2(ex, ey, ez, hx, hy, hz, epsr, mur, sgmr, gr, dt, da)
  if (nargin != 12)
    printf("\neemiterate2(ex, ey, ez, hx, hy, hz, epsr, mur, sgmr, gr, dt, da[, verbose]): Runs iteration in EM simulation.\n");
	printf("  e*   - electric field (x3)\n");
	printf("  h*   - magnetic field (x3)\n");
	printf("  epsr - relative permittivity (3 dimensional array)\n");
	printf("  mur  - relative permeability (3 dimensional array)\n");
	printf("  sgmr - magnetic resistivity\n");
	printf("  gr   - electric conductivity\n");
	printf("  dt   - time step\n");
	printf("  da   - cube dimension (\"space step\" dx = dy = dz)\n");
	printf("\n");
	printf("returns [ (\"next\") electric field (x3)\n");
    printf("          (\"next\") magnetic field (x3) ]\n");
	return;
  endif;
  
  m0 = emu0();
  e0 = eps0();
  sizemur = size(mur);
  sizesgmr = size(sgmr);
  sizegr = size(gr);
  sizeepsr = size(epsr);
  sizehx = size(hx);
  sizehy = size(hy);
  sizehz = size(hz);
  sizeex = size(ex);
  sizeey = size(ey);
  sizeez = size(ez);
  size1 = [1, 1, 1];

# hx
  for x=1:sizehx(1)
    for y=1:sizehx(2)
      for z=1:sizehx(3)
		if (x >= 2)
		  sgmr1 = sgmr(x - 1, y, z);
		  mur1 = mur(x - 1, y, z);
		else
		  sgmr1 = 0;
		  mur1 = 1.0;
		endif;
		if (x <= sizesgmr(1))
		  sgmr2 = sgmr(x, y, z);
		else
		  sgmr2 = 0;
		endif;
		if (x <= sizemur(1))
		  mur2 = mur(x, y, z);
		else
		  mur2 = 1.0;
		endif;
		sgmravg = (sgmr1 + sgmr2) / 2;
		muravg = (mur1 + mur2) / 2;
		h1 = (1 - sgmravg * dt / (2 * m0 * muravg)) / (1 + sgmravg * dt / (2 * m0 * muravg));
		h2 = (dt / (da * m0 * muravg)) / (1 + sgmravg * dt / (2 * m0 * muravg));
		edf = ((ey(x, y, z + 1) - ey(x, y, z)) - (ez(x, y + 1, z) - ez(x, y, z)));
		hx(x, y, z) = h1 * hx(x, y, z) + h2 * edf;
      endfor;
    endfor;
  endfor;
  
# hy
  for x=1:sizehy(1)
    for y=1:sizehy(2)
      for z=1:sizehy(3)
		if (y >= 2)
		  sgmr1 = sgmr(x, y - 1, z);
		  mur1 = mur(x, y - 1, z);
		else
		  sgmr1 = 0;
		  mur1 = 1.0;
		endif;
		if (y <= sizesgmr(2))
		  sgmr2 = sgmr(x, y, z);
		else
		  sgmr2 = 0;
		endif;
		if (y <= sizemur(2))
		  mur2 = mur(x, y, z);
		else
		  mur2 = 1.0;
		endif;
		sgmravg = (sgmr1 + sgmr2) / 2;
		muravg = (mur1 + mur2) / 2;
		h1 = (1 - sgmravg * dt / (2 * m0 * muravg)) / (1 + sgmravg * dt / (2 * m0 * muravg));
		h2 = (dt / (da * m0 * muravg)) / (1 + sgmravg * dt / (2 * m0 * muravg));
		edf = ((ez(x + 1, y, z) - ez(x, y, z)) - (ex(x, y, z + 1) - ex(x, y, z)));
		hy(x, y, z) = h1 * hy(x, y, z) + h2 * edf;
      endfor;
    endfor;
  endfor;
  
# hz
  for x=1:sizehz(1)
    for y=1:sizehz(2)
      for z=1:sizehz(3)
		if (z >= 2)
		  sgmr1 = sgmr(x, y, z - 1);
		  mur1 = mur(x, y, z - 1);
		else
		  sgmr1 = 0;
		  mur1 = 1.0;
		endif;
		if (z <= sizesgmr(3))
		  sgmr2 = sgmr(x, y, z);
		else
		  sgmr2 = 0;
		endif;
		if (z <= sizemur(3))
		  mur2 = mur(x, y, z);
		else
		  mur2 = 1.0;
		endif;
		sgmravg = (sgmr1 + sgmr2) / 2;
		muravg = (mur1 + mur2) / 2;
		h1 = (1 - sgmravg * dt / (2 * m0 * muravg)) / (1 + sgmravg * dt / (2 * m0 * muravg));
		h2 = (dt / (da * m0 * muravg)) / (1 + sgmravg * dt / (2 * m0 * muravg));
		edf = ((ex(x, y + 1, z) - ex(x, y, z)) - (ey(x + 1, y, z) - ey(x, y, z)));
		hz(x, y, z) = h1 * hz(x, y, z) + h2 * edf;
      endfor;
    endfor;
  endfor;
  
# ex
  for x=1:sizeex(1)
    for y=1:sizeex(2)
      for z=1:sizeex(3)
        if (eisbounded([x, y - 1, z], size1, sizegr))
          gr21 = gr(x, y - 1, z);
        else
          gr21 = 0;
        endif;
        if (eisbounded([x, y, z - 1], size1, sizegr))
          gr12 = gr(x, y, z - 1);
        else
          gr12 = 0;
        endif;
        if (eisbounded([x, y, z], size1, sizegr))
          gr11 = sgmr(x, y, z);
        else
          gr11 = 0;
        endif;
        if (eisbounded([x, y - 1, z - 1], size1, sizegr))
          gr22 = gr(x, y - 1, z - 1);
        else
          gr22 = 0;
        endif;
        if (eisbounded([x, y - 1, z], size1, sizeepsr))
          epsr21 = epsr(x, y - 1, z);
        else
          epsr21 = 1.0;
        endif;
        if (eisbounded([x, y, z - 1], size1, sizeepsr))
          epsr12 = epsr(x, y, z - 1);
        else
          epsr12 = 1.0;
        endif;
        if (eisbounded([x, y, z], size1, sizeepsr))
          epsr11 = epsr(x, y, z);
        else
          epsr11 = 1.0;
        endif;
        if (eisbounded([x, y - 1, z - 1], size1, sizeepsr))
          epsr22 = epsr(x, y - 1, z - 1);
        else
          epsr22 = 1.0;
        endif;
        gravg = (gr11 + gr12 + gr21 + gr22) / 4;
        epsravg = (epsr11 + epsr12 + epsr21 + epsr22) / 4;
        e1 = (1 - gravg * dt / (2 * e0 * epsravg)) / (1 + gravg * dt / (2 * e0 * epsravg));
        e2 = (dt / (da * e0 * epsravg)) / (1 + gravg * dt / (2 * e0 * epsravg));
        if (eisbounded([x, y, z], size1, sizehy))
          dhy1 = hy(x, y, z);
        else
          dhy1 = 0;
        endif;
        if (eisbounded([x, y, z - 1], size1, sizehy))
          dhy2 = hy(x, y, z - 1);
        else
          dhy2 = 0;
        endif;
        dhy = dhy1 - dhy2;
        if (eisbounded([x, y, z], size1, sizehz))
          dhz1 = hz(x, y, z);
        else
          dhz1 = 0;
        endif;
        if (eisbounded([x, y - 1, z], size1, sizehz))
          dhz2 = hz(x, y - 1, z);
        else
          dhz2 = 0;
        endif;
        dhz = dhz1 - dhz2;
        hdf = -(dhy - dhz);
        ex(x, y, z) = e1 * ex(x, y, z) + e2 * hdf;
      endfor;
    endfor;
  endfor;
  
# ey
  for x=1:sizeey(1)
    for y=1:sizeey(2)
      for z=1:sizeey(3)
        if (eisbounded([x, y, z - 1], size1, sizegr))
          gr21 = gr(x, y, z - 1);
        else
          gr21 = 0;
        endif;
        if (eisbounded([x - 1, y, z], size1, sizegr))
          gr12 = gr(x - 1, y, z);
        else
          gr12 = 0;
        endif;
        if (eisbounded([x, y, z], size1, sizegr))
          gr11 = sgmr(x, y, z);
        else
          gr11 = 0;
        endif;
        if (eisbounded([x - 1, y, z - 1], size1, sizegr))
          gr22 = gr(x - 1, y, z - 1);
        else
          gr22 = 0;
        endif;
        if (eisbounded([x, y, z - 1], size1, sizeepsr))
          epsr21 = epsr(x, y, z - 1);
        else
          epsr21 = 1.0;
        endif;
        if (eisbounded([x - 1, y, z], size1, sizeepsr))
          epsr12 = epsr(x - 1, y, z);
        else
          epsr12 = 1.0;
        endif;
        if (eisbounded([x, y, z], size1, sizeepsr))
          epsr11 = epsr(x, y, z);
        else
          epsr11 = 1.0;
        endif;
        if (eisbounded([x - 1, y, z - 1], size1, sizeepsr))
          epsr22 = epsr(x - 1, y, z - 1);
        else
          epsr22 = 1.0;
        endif;
        gravg = (gr11 + gr12 + gr21 + gr22) / 4;
        epsravg = (epsr11 + epsr12 + epsr21 + epsr22) / 4;
        e1 = (1 - gravg * dt / (2 * e0 * epsravg)) / (1 + gravg * dt / (2 * e0 * epsravg));
        e2 = (dt / (da * e0 * epsravg)) / (1 + gravg * dt / (2 * e0 * epsravg));
        if (eisbounded([x, y, z], size1, sizehz))
          dhz1 = hz(x, y, z);
        else
          dhz1 = 0;
        endif;
        if (eisbounded([x - 1, y, z], size1, sizehz))
          dhz2 = hz(x - 1, y, z);
        else
          dhz2 = 0;
        endif;
        dhz = dhz1 - dhz2;
        if (eisbounded([x, y, z], size1, sizehx))
          dhx1 = hx(x, y, z);
        else
          dhx1 = 0;
        endif;
        if (eisbounded([x, y, z - 1], size1, sizehx))
          dhx2 = hx(x, y, z - 1);
        else
          dhx2 = 0;
        endif;
        dhx = dhx1 - dhx2;
        hdf = -(dhz - dhx);
        ey(x, y, z) = e1 * ey(x, y, z) + e2 * hdf;
      endfor;
    endfor;
  endfor;
  
# ez
  for x=1:sizeez(1)
    for y=1:sizeez(2)
      for z=1:sizeez(3)
        if (eisbounded([x - 1, y, z], size1, sizegr))
          gr21 = gr(x - 1, y, z);
        else
          gr21 = 0;
        endif;
        if (eisbounded([x, y - 1, z], size1, sizegr))
          gr12 = gr(x, y - 1, z);
        else
          gr12 = 0;
        endif;
        if (eisbounded([x, y, z], size1, sizegr))
          gr11 = sgmr(x, y, z);
        else
          gr11 = 0;
        endif;
        if (eisbounded([x - 1, y - 1, z], size1, sizegr))
          gr22 = gr(x - 1, y - 1, z);
        else
          gr22 = 0;
        endif;
        if (eisbounded([x - 1, y, z], size1, sizeepsr))
          epsr21 = epsr(x - 1, y, z);
        else
          epsr21 = 1.0;
        endif;
        if (eisbounded([x, y - 1, z], size1, sizeepsr))
          epsr12 = epsr(x, y - 1, z);
        else
          epsr12 = 1.0;
        endif;
        if (eisbounded([x, y, z], size1, sizeepsr))
          epsr11 = epsr(x, y, z);
        else
          epsr11 = 1.0;
        endif;
        if (eisbounded([x - 1, y - 1, z], size1, sizeepsr))
          epsr22 = epsr(x - 1, y - 1, z);
        else
          epsr22 = 1.0;
        endif;
        gravg = (gr11 + gr12 + gr21 + gr22) / 4;
        epsravg = (epsr11 + epsr12 + epsr21 + epsr22) / 4;
        e1 = (1 - gravg * dt / (2 * e0 * epsravg)) / (1 + gravg * dt / (2 * e0 * epsravg));
        e2 = (dt / (da * e0 * epsravg)) / (1 + gravg * dt / (2 * e0 * epsravg));
        if (eisbounded([x, y, z], size1, sizehx))
          dhx1 = hx(x, y, z);
        else
          dhx1 = 0;
        endif;
        if (eisbounded([x, y - 1, z], size1, sizehx))
          dhx2 = hx(x, y - 1, z);
        else
          dhx2 = 0;
        endif;
        dhx = dhx1 - dhx2;
        if (eisbounded([x, y, z], size1, sizehy))
          dhy1 = hy(x, y, z);
        else
          dhy1 = 0;
        endif;
        if (eisbounded([x - 1, y, z], size1, sizehy))
          dhy2 = hy(x - 1, y, z);
        else
          dhy2 = 0;
        endif;
        dhz = dhz1 - dhz2;
        hdf = -(dhx - dhy);
        ez(x, y, z) = e1 * ez(x, y, z) + e2 * hdf;
      endfor;
    endfor;
  endfor;
  
endfunction