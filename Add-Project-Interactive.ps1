# Add-Project-Interactive.ps1 - Interactive script to add projects

Write-Host "=== Add New Project ===" -ForegroundColor Cyan
Write-Host ""

# Get project details interactively
$Category = Read-Host "Category (web-development/devops/workflow-automation/data-processing)"
$Title = Read-Host "Project Title"
$Description = Read-Host "Description"
$Status = Read-Host "Status (planned/in-progress/completed) [completed]"
if ([string]::IsNullOrEmpty($Status)) { $Status = "completed" }
$Tech = Read-Host "Technologies (comma-separated, e.g., Python,JavaScript,Docker)"
$GitHub = Read-Host "GitHub URL (optional)"
$Live = Read-Host "Live Demo URL (optional)"
$Featured = Read-Host "Featured? (y/n) [n]"
$Icon = Read-Host "Icon emoji (optional) [??]"
if ([string]::IsNullOrEmpty($Icon)) { $Icon = "??" }
$ReadTime = Read-Host "Read time (optional) [5 min]"
if ([string]::IsNullOrEmpty($ReadTime)) { $ReadTime = "5 min" }

# Convert featured to boolean
$isFeatured = $Featured -eq "y" -or $Featured -eq "yes" -or $Featured -eq "true"

# Show confirmation
Write-Host "`n=== Project Details ===" -ForegroundColor Yellow
Write-Host "Category: $Category"
Write-Host "Title: $Title"
Write-Host "Status: $Status"
Write-Host "Technologies: $Tech"
Write-Host "Featured: $isFeatured"
Write-Host ""

$confirm = Read-Host "Add this project? (y/n)"
if ($confirm -eq "y" -or $confirm -eq "yes") {
    # Run the main add script
    .\Add-Project.ps1 -Category $Category -Title $Title -Description $Description -Status $Status -Tech $Tech -GitHub $GitHub -Live $Live -Featured:$isFeatured -Icon $Icon -ReadTime $ReadTime
} else {
    Write-Host "Project addition cancelled." -ForegroundColor Yellow
}
