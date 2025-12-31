aws s3 sync . s3://khumundu.com --delete --exclude ".git/*" --exclude "deploy.bat"
echo Website deployed to S3!
pause