{ stdenv, lib, fetchFromGitLab, extra-cmake-modules, wrapQtAppsHook, disman
, plasma-framework, qtsensors, kcmutils }:

stdenv.mkDerivation rec {
  pname = "kdisplay";
  version = "5.26.0";

  src = fetchFromGitLab {
    owner = "kwinft";
    repo = "kdisplay";
    rev = "kdisplay@5.26.0";
    hash = "sha256-eiBC9er5JRs96NZQw25XIn42bmqCtzn+ivDuQ7MAxaM=";
  };

  nativeBuildInputs = [ extra-cmake-modules wrapQtAppsHook ];

  buildInputs = [ disman plasma-framework qtsensors kcmutils ];

  meta = with lib; {
    description = "Qt/C++ library wrapping libwayland";
    inherit (src.meta) homepage;
    license = licenses.lgpl21Plus;
    platforms = platforms.linux;
  };
}
