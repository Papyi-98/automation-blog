Write-Host "=== NAVIGATION TEST CHECKLIST ===" -ForegroundColor Cyan
Write-Host "`nTEST 1: Home button from Homepage" -ForegroundColor Yellow
Write-Host "1. Open: https://utomation.netlify.app/" -ForegroundColor Green
Write-Host "2. Click 'Home' button" -ForegroundColor Green
Write-Host "3. Expected: Page refreshes" -ForegroundColor Green

Write-Host "`nTEST 2: Home button from Projects" -ForegroundColor Yellow
Write-Host "1. Open: https://utomation.netlify.app/projects/" -ForegroundColor Green
Write-Host "2. Verify page shows 'My Projects' title" -ForegroundColor Green
Write-Host "3. Click 'Home' button" -ForegroundColor Green
Write-Host "4. Expected: Goes to homepage" -ForegroundColor Green

Write-Host "`nTEST 3: Home button from Blog" -ForegroundColor Yellow
Write-Host "1. Open: https://utomation.netlify.app/posts/" -ForegroundColor Green
Write-Host "2. Verify page shows 'Blog' title" -ForegroundColor Green
Write-Host "3. Click 'Home' button" -ForegroundColor Green
Write-Host "4. Expected: Goes to homepage" -ForegroundColor Green

Write-Host "`nTEST 4: Navigation completeness" -ForegroundColor Yellow
Write-Host "1. All 3 buttons visible: Home, Projects, Blog" -ForegroundColor Green
Write-Host "2. No extra buttons (no Contact, no Test)" -ForegroundColor Green

Write-Host "`n=== REPORT RESULTS ===`n" -ForegroundColor Cyan
Write-Host "After testing, answer:" -ForegroundColor Magenta
Write-Host "1. Projects page loads? (Yes/No)" -ForegroundColor White
Write-Host "2. Blog page loads? (Yes/No)" -ForegroundColor White
Write-Host "3. Home button from Projects works? (Yes/No)" -ForegroundColor White
Write-Host "4. Home button from Blog works? (Yes/No)" -ForegroundColor White
Write-Host "5. All 3 nav links show? (Yes/No)" -ForegroundColor White
