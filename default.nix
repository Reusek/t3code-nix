{ lib
, appimageTools
, fetchurl
}:

let
  pname = "t3code";
  version = "0.0.4";

  src = fetchurl {
    url = "https://github.com/pingdotgg/t3code/releases/download/v${version}/T3-Code-${version}-x86_64.AppImage";
    hash = "sha256-HlkQ/uPLXHh2Duamrmhp31yQqnETawQ4Ru7kg2MmpVs=";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  meta = with lib; {
    description = "T3 Chat desktop app";
    homepage = "https://github.com/pingdotgg/t3code";
    downloadPage = "https://github.com/pingdotgg/t3code/releases/tag/v0.0.4";
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    license = licenses.mit;
    maintainers = [ ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "t3code";
  };
}
