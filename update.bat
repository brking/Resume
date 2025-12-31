@echo off
echo.
echo ========================================
echo  Saving changes and deploying
echo ========================================
echo.

REM Commit to Git
git add .
git commit -m "Update: %date% %time%"
git push

REM Deploy to S3
aws s3 sync . s3://khumundu.com --delete --exclude ".git/*" --exclude --exclude ".gitignore" --exclude "deploy.bat" --exclude "update.bat" --exclude "READ ME.txt"

echo.
echo ========================================
echo  SUCCESS! 
echo  - Code backed up to GitHub
echo  - Website deployed to S3
echo ========================================
echo.
pause