# Deployment Script for Automation Blog
Write-Host "=== DEPLOYING AUTOMATION BLOG ===" -ForegroundColor Cyan
Write-Host ""

# Check Git status
Write-Host "1. Checking Git status..." -ForegroundColor Yellow
git status

# Add all changes
Write-Host "`n2. Adding changes to Git..." -ForegroundColor Yellow
git add .

# Commit changes
Write-Host "`n3. Committing changes..." -ForegroundColor Yellow
$commitMessage = "Update: Netlify Forms database integration and project management"
git commit -m $commitMessage

# Push to GitHub
Write-Host "`n4. Pushing to GitHub..." -ForegroundColor Yellow
git push origin main

Write-Host "`n✅ Deployment initiated!" -ForegroundColor Green
Write-Host ""
Write-Host "=== NEXT STEPS ===" -ForegroundColor Cyan
Write-Host "1. Netlify will automatically deploy your changes" -ForegroundColor Gray
Write-Host "2. Check deployment status: https://app.netlify.com/sites/utomation/deploys" -ForegroundColor Gray
Write-Host "3. Test the form: https://utomation.netlify.app/projects/" -ForegroundColor Gray
Write-Host "4. View form submissions: https://app.netlify.com/sites/utomation/forms" -ForegroundColor Gray
Write-Host ""
Write-Host "=== DATABASE FEATURES NOW AVAILABLE ===" -ForegroundColor Green
Write-Host "✅ 'Add New Project' form with Netlify Forms database" -ForegroundColor Gray
Write-Host "✅ Form validation and submission handling" -ForegroundColor Gray
Write-Host "✅ Success page for form submissions" -ForegroundColor Gray
Write-Host "✅ Database management PowerShell script" -ForegroundColor Gray
Write-Host "✅ Automatic form submission storage" -ForegroundColor Gray
Write-Host ""
Write-Host "To manually add projects, run: .\manage-database.ps1 -Action add" -ForegroundColor Yellow
