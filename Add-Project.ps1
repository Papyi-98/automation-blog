# Add-Project.ps1 - Script to add new projects to projects.json
# Usage: .\Add-Project.ps1 -Category "web-development" -Title "New Project" -Description "Project description" -Status "completed" -Tech "Python,JavaScript"

param(
    [Parameter(Mandatory=$true)]
    [string]$Category,
    
    [Parameter(Mandatory=$true)]
    [string]$Title,
    
    [Parameter(Mandatory=$true)]
    [string]$Description,
    
    [Parameter(Mandatory=$true)]
    [ValidateSet("planned","in-progress","completed")]
    [string]$Status = "completed",
    
    [Parameter(Mandatory=$true)]
    [string]$Tech,
    
    [string]$GitHub = "",
    
    [string]$Live = "",
    
    [switch]$Featured = $false,
    
    [string]$Icon = "??",
    
    [string]$ReadTime = "5 min"
)

# Function to generate a project ID from title
function Get-ProjectId {
    param([string]$Title)
    $id = $Title.ToLower() -replace '[^a-z0-9\s-]', '' -replace '\s+', '-'
    return $id
}

# Read current projects
$projectsFile = ".\data\projects.json"
$projects = Get-Content $projectsFile -Raw | ConvertFrom-Json

# Create new project object
$newProject = [PSCustomObject]@{
    id          = Get-ProjectId -Title $Title
    title       = $Title
    description = $Description
    category    = $Category
    status      = $Status
    tech        = ($Tech -split ',' | ForEach-Object { $_.Trim() }) -ne ''
    github      = $GitHub
    live        = $Live
    date        = (Get-Date).ToString("yyyy-MM-dd")
    featured    = $Featured
    icon        = $Icon
    readTime    = $ReadTime
}

# Add to projects array
$projects += $newProject

# Save back to file with pretty formatting
$projects | ConvertTo-Json -Depth 10 | Set-Content $projectsFile

Write-Host "? Project added successfully!" -ForegroundColor Green
Write-Host "Project ID: $($newProject.id)" -ForegroundColor Cyan
Write-Host "Category: $Category" -ForegroundColor Cyan
Write-Host "Total projects: $($projects.Count)" -ForegroundColor Cyan

# Show the new project
$newProject | Format-List
