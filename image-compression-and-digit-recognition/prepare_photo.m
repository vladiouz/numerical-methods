function sir = prepare_photo (im)
  %initializare sirul final.
  sir = zeros (1, 784);

  % TODO: inverseaza pixelii imaginii im.
  im_inversata = 255 - uint8(im);

  % TODO: transpune imaginea, iar apoi transforma imaginea intr-un vector linie.
  % HINT: functia reshape
  im_inv_si_transp = im_inversata';
  sir = reshape(im_inv_si_transp, [1, 784]);

endfunction
