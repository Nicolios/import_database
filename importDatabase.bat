SET mysql=PATH_TO_MYSQL_INSTALLATION
for /f "skip=8 tokens=2,3,4,5,6,7,8 delims=: " %%D in ('robocopy /l * \ \ /ns /nc /ndl /nfl /np /njh /XF * /XD *') do (
    set "dow=%%D"
    set "month=%%E"
    set "day=%%F"
    set "HH=%%G"
    set "MM=%%H"
    set "SS=%%I"
    set "year=%%J"
)
set mois=%day:~0,4%


chcp 65001
mkdir %mysql%\tempsql
copy PATH_TO_DATABASE_NEED_TO_BE_IMPORTED %mysql%\tempsql
gzip -d %mysql%\tempsql\FILE_NAME.sql.gz
%mysql%\mysql -u root -p DATABASE_NAME < mysql.bat
rmdir /s /q %mysql%\tempsql