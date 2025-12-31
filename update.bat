@echo off
echo.
echo ========================================
echo  Saving changes and deploying
echo ========================================
echo.

REM Commit to Git with optional message
if "%~1"=="" (
    git add .
    git commit -m "Update: %date% %time%"
    git push
) else (
    git add .
    git commit -m "Update: %date% %time% - %~1"
    git push
)

REM Deploy to S3
aws s3 sync . s3://khumundu.com --delete --exclude ".git/*" --exclude ".gitignore" --exclude "deploy.bat" --exclude "update.bat" --exclude "update.bat" --exclude "READ ME.txt"

echo.
echo ========================================
echo  SUCCESS! 
echo  - Code backed up to GitHub
echo  - Website deployed to S3
echo ========================================
echo.
pause