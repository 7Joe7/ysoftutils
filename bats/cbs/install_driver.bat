rundll32 printui.dll PrintUIEntry /dl /n "SafeQ"
rundll32 printui.dll PrintUIEntry /dd /m "YSoft Printer Driver PCL"
rundll32 printui.dll PrintUIEntry /if /b "SafeQ" /r "IP_Local" /m "YSoft Printer Driver PCL" /f "build\universal-pcl-driver\YSoftPrinterDriverPCL.inf"
rundll32 printui.dll PrintUIEntry /y /n "SafeQ"
rundll32 printui.dll PrintUIEntry /Sr /n "SafeQ" /a "src\main\resources\settings\config-a4.dat" g d u p r
