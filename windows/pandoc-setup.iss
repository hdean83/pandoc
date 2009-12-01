; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{3CEE7B38-B19D-4980-9CAD-DF53600BD4CA}
AppName=Pandoc
AppVerName=Pandoc 1.2.2
AppPublisher=John MacFarlane
AppPublisherURL=http://johnmacfarlane.net/pandoc/
AppSupportURL=http://johnmacfarlane.net/pandoc/
AppUpdatesURL=http://johnmacfarlane.net/pandoc/
DefaultDirName={code:DefDirRoot}\Pandoc
DefaultGroupName=Pandoc
AllowNoIcons=yes
LicenseFile="..\COPYING.txt"
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes
ChangesEnvironment=yes
PrivilegesRequired=none

[Tasks]
Name: modifypath; Description: Add application directory to your path

[Code]
function ModPathDir(): TArrayOfString;
var
    Dir: TArrayOfString;
begin
    setArrayLength(Dir, 1)
    Dir[0] := ExpandConstant('{app}');
    Result := Dir;
end;
#include "modpath.iss"

function IsRegularUser(): Boolean;
begin
    Result := not (IsAdminLoggedOn or IsPowerUserLoggedOn);
end;

function DefDirRoot(Param: String): String;
begin
if IsRegularUser then
    Result := ExpandConstant('{localappdata}')
else
    Result := ExpandConstant('{pf}')
end;

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "..\dist\build\pandoc\pandoc.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\README.html"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\COPYRIGHT.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\COPYING.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "pcre-license.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "pcre3.dll"; DestDir: "{sys}"; Flags: onlyifdoesntexist sharedfile
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{cm:UninstallProgram,Pandoc}"; Filename: "{uninstallexe}"
Name: "{group}\Pandoc User's Guide"; Filename: "{app}\README.html"

