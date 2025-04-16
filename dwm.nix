{
  lib,
  libX11,
  libXft,
  libXinerama,
  stdenv,
  ...
}:
stdenv.mkDerivation {
  pname = "dwm";
  version = "custom";

  src = ./dwm;

  buildInputs = [
    libX11
    libXft
    libXinerama
  ];

  prePatch = ''
    sed -i "s@/usr/local@$out@" config.mk
  '';

  makeFlags = ["CC=${stdenv.cc.targetPrefix}cc"];

  meta = {
    homepage = "https://dwm.suckless.org/";
    description = "Extremely fast, small, and dynamic window manager for X, modified for thou";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
    mainProgram = "dwm";
  };
}
