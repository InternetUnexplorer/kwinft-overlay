{ stdenv, lib, fetchFromGitLab, extra-cmake-modules, wrapQtAppsHook, qtx11extras
, plasma-framework, wrapland }:

stdenv.mkDerivation rec {
  pname = "disman";
  version = "5.26.0";

  src = fetchFromGitLab {
    owner = "kwinft";
    repo = "disman";
    rev = "disman@0.526.0";
    hash = "sha256-kpHoJnnCUJk5ZJVzSmCALRbbihGw4owKWdMyd+jigGU=";
  };

  nativeBuildInputs = [ extra-cmake-modules wrapQtAppsHook ];

  buildInputs = [ qtx11extras plasma-framework wrapland ];

  meta = with lib; {
    description = "Qt/C++ library wrapping libwayland";
    inherit (src.meta) homepage;
    license = licenses.lgpl21Plus;
    platforms = platforms.linux;
  };
}
