# Visual Studio Activity Monitor Log Viewer

It is developed for more readable Visual Studio Activity Logs.

###**Usage:**

```cmd
xcopy "VisualStudioActivityMonitorLog" "C:\inetpub\wwwroot\VisualStudioActivityMonitorLog\" /s/h/e/k/f/c/y
xcopy "%userprofile%\AppData\Roaming\Microsoft\VisualStudio\14.0\ActivityLog.xml" "C:\inetpub\wwwroot\VisualStudioActivityMonitorLog\ActivityLog.xml"*/y
start microsoft-edge:"http://localhost/VisualStudioActivityMonitorLog/ActivityLog.xml"
```

Visual Studio Versions
  * Visual Studio 2010 => 10.0
  * Visual Studio 2012 => 11.0
  * Visual Studio 2013 => 12.0
  * Visual Studio 2015 => 14.0
  * Visual Studio 2015 Extension=> 14.0Exp

###**Third Party Libraries:**

  * Bootstrap v4.0.0-alpha.2
  * jQuery v2.1.4


###**System Requirements**

This application has been tested on Microsoft Edge, IIS8, Visual Studio 2013/2015 on Windows 10. 

![Visual Studio Activity Monitor Log Viewer Redme.gif](https://raw.githubusercontent.com/tahaipek/VisualStudioActivityMonitorLogViewer/master/README.gif)
