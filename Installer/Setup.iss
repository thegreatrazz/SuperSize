; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "SuperSize"
#define MyAppPublisher "Raresh Nistor"
#define MyAppURL "https://github.com/thegreatrazz/SuperSize"
#define MyAppExeName "SuperSize.exe"

#ifndef MyAppVersion
#define MyAppVersion "TEST SETUP BUILD"
#endif

#ifndef AppPlatform
#define AppPlatform "win-x86"
#endif

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{E4538DE8-F9D4-422D-85FD-D7E25EBE6B56}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
OutputBaseFilename={#AppPlatform}-installer
SetupIconFile=..\Assets\Logo\Installer.ico
Compression=lzma
SolidCompression=yes
WizardImageFile=WizModernImage.bmp
WizardSmallImageFile=WizModernSmallImage.bmp

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\SuperSize\bin\Release\net7.0-windows\{#AppPlatform}\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\SuperSize\bin\Release\net7.0-windows\{#AppPlatform}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs 32bit
Source: "windowsdesktop-runtime-5.0.4-{#AppPlatform}.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Releases\Plugins\SuperSize.CoreLogic.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Flags: nowait postinstall skipifsilent; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"
Filename: "{app}\windowsdesktop-runtime-5.0.4-{#AppPlatform}.exe"; Parameters: "/install /quiet /norestart"; Description: "Install .NET Runtime"; StatusMsg: "Installing .NET 5 Desktop Runtime"

[InstallDelete]
Type: files; Name: "{app}\windowsdesktop-runtime-5.0.4-{#AppPlatform}.exe"
