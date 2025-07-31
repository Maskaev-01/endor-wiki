# PowerShell script for updating site via git (fixed)
# Usage: .\update_via_git_fixed.ps1

Write-Host "Updating site via git..." -ForegroundColor Green

$ServerIP = "185.121.13.129"
$Username = "root"

# Execute update commands directly
Write-Host "Running update on server..." -ForegroundColor Yellow
ssh "${Username}@${ServerIP}" "cd /var/www/deploy/endore-site && git pull origin master && source venv/bin/activate && pip install -r requirements.txt && mkdocs build --site-dir /var/www/sites/endore && chown -R root:root /var/www/sites/endore && chmod -R 755 /var/www/sites/endore && echo 'Site updated successfully!'"

Write-Host "Site updated via git!" -ForegroundColor Green
Write-Host "Check site at: http://185.121.13.129/endor" -ForegroundColor Cyan 