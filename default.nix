{ lib
, appimageTools
, fetchurl
, makeDesktopItem
}:

let
  pname = "t3code";
  version = "0.0.28";

  src = fetchurl {
    url = "https://github.com/pingdotgg/t3code/releases/download/v${version}/T3-Code-${version}-x86_64.AppImage";
    hash = "sha256-+mBp+wPrJRV/HpaimQHcqBuwqZcPWTbKJVNCVW7ELgo=";
  };

  desktopItem = makeDesktopItem {
    name = pname;
    desktopName = "T3 Code";
    comment = "T3 Chat desktop app";
    exec = pname;
    terminal = false;
    categories = [ "Development" "Utility" ];
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    mkdir -p $out/share/applications
    ln -s ${desktopItem}/share/applications/${pname}.desktop \
      $out/share/applications/${pname}.desktop
  '';

  meta = with lib; {
    description = "T3 Chat desktop app";
    homepage = "https://github.com/pingdotgg/t3code";
    downloadPage = "https://github.com/pingdotgg/t3code/releases/tag/v${version}";
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    license = licenses.mit;
    maintainers = [ ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "t3code";
  };
}
