{ stdenv, lib, fetchFromGitLab, extra-cmake-modules, wrapQtAppsHook, wayland
, wayland-protocols }:

stdenv.mkDerivation rec {
  pname = "wrapland";
  version = "5.26.0";

  src = fetchFromGitLab {
    owner = "kwinft";
    repo = "wrapland";
    rev = "wrapland@0.526.0";
    hash = "sha256-WvVv5JiOPwPWN+PUD6mgklh3TZnUUt/yO0ZdnaiD51c=";
  };

  nativeBuildInputs = [ extra-cmake-modules wrapQtAppsHook ];

  buildInputs = [ wayland wayland-protocols ];

  meta = with lib; {
    description = "Qt/C++ library wrapping libwayland";
    inherit (src.meta) homepage;
    license = licenses.lgpl21Plus;
    platforms = platforms.linux;
  };
}
