{
  fontconfig,
  freetype,
  imlib2,
  lib,
  libX11,
  libXft,
  ncurses,
  pkg-config,
  stdenv,
  zlib,
  ...
}:
stdenv.mkDerivation {
  pname = "st";
  version = "custom";

  src = ./st;

  strictDeps = true;

  nativeBuildInputs = [
    pkg-config
    ncurses
    fontconfig
    freetype
  ];
  buildInputs = [
    libX11
    libXft
    imlib2
    zlib
  ];

  makeFlags = ["PKG_CONFIG=${stdenv.cc.targetPrefix}pkg-config"];

  preInstall = ''
    export TERMINFO=$terminfo/share/terminfo
    mkdir -p $TERMINFO $out/nix-support
    echo "$terminfo" >> $out/nix-support/propagated-user-env-packages
  '';

  installFlags = ["PREFIX=${placeholder "out"}"];

  outputs = ["out" "terminfo"];

  meta = {
    homepage = "https://st.suckless.org/";
    description = "Simple Terminal from Suckless.org";
    license = lib.licenses.mit;
    maintainers = [];
    platforms = lib.platforms.unix;
    mainProgram = "st";
  };
}
