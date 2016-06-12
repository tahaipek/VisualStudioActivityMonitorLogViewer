xcopy "VisualStudioActivityMonitorLog" "C:\inetpub\wwwroot\VisualStudioActivityMonitorLog\" /s/h/e/k/f/c
xcopy "%userprofile%\AppData\Roaming\Microsoft\VisualStudio\14.0\ActivityLog.xml" "C:\inetpub\wwwroot\VisualStudioActivityMonitorLog\ActivityLog.xml"*
start iexplore.exe "http://localhost/VisualStudioActivityMonitorLog/ActivityLog.xml"
