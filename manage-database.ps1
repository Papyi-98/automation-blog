# Database Management Script for Automation Blog
# This script helps manage projects in the database

param(
    [Parameter(Mandatory=$false)]
    [ValidateSet("list", "add", "remove", "update", "export", "backup")]
    [string]$Action = "list",
    
    [Parameter(Mandatory=$false)]
    [string]$Id,
    
    [Parameter(Mandatory=$false)]
    [string]$File = "data/projects.json"
)

# Load projects database
function Get-Projects {
    param([string]$Path = $File)
    
    if (Test-Path $Path) {
        $content = Get-Content $Path -Raw
        return $content | ConvertFrom-Json
    } else {
        Write-Host "Database file not found: $Path" -ForegroundColor Red
        return @()
    }
}

# Save projects database
function Save-Projects {
    param(
        [array]$Projects,
        [string]$Path = $File
    )
    
    $Projects | ConvertTo-Json -Depth 10 | Set-Content -Path $Path -Encoding UTF8
    Write-Host "Database saved: $Path" -ForegroundColor Green
}

# List all projects
function List-Projects {
    $projects = Get-Projects
    Write-Host "=== PROJECTS DATABASE ===" -ForegroundColor Cyan
    Write-Host "Total projects: $($projects.Count)" -ForegroundColor Yellow
    Write-Host ""
    
    foreach ($project in $projects) {
        Write-Host "ID: $($project.id)" -ForegroundColor Green
        Write-Host "Title: $($project.title)" -ForegroundColor White
        Write-Host "Category: $($project.category)" -ForegroundColor Gray
        Write-Host "Status: $($project.status)" -ForegroundColor Gray
        Write-Host "Technologies: $($project.tech -join ', ')" -ForegroundColor Gray
        Write-Host "---"
    }
}

# Add a project
function Add-Project {
    Write-Host "=== ADD NEW PROJECT ===" -ForegroundColor Cyan
    
    $title = Read-Host "Project Title"
    $description = Read-Host "Description"
    $category = Read-Host "Category (web-development/devops/workflow-automation/data-processing)"
    $status = Read-Host "Status (planned/in-progress/completed) [in-progress]"
    if ([string]::IsNullOrEmpty($status)) { $status = "in-progress" }
    $tech = Read-Host "Technologies (comma-separated)"
    
    # Generate ID from title
    $id = $title.ToLower() -replace '[^a-z0-9\s-]', '' -replace '\s+', '-'
    
    $newProject = [PSCustomObject]@{
        id = $id
        title = $title
        description = $description
        category = $category
        status = $status
        tech = ($tech -split ',' | ForEach-Object { $_.Trim() }) -ne ''
        github = ""
        live = ""
        featured = $false
        icon = "🚀"
        readTime = "5 min"
        date = (Get-Date).ToString("yyyy-MM-dd")
    }
    
    $projects = Get-Projects
    $projects += $newProject
    Save-Projects -Projects $projects
    
    Write-Host "✅ Project added successfully!" -ForegroundColor Green
    Write-Host "ID: $id" -ForegroundColor Gray
}

# Backup database
function Backup-Database {
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $backupFile = "data/projects-backup-$timestamp.json"
    Copy-Item -Path $File -Destination $backupFile -Force
    Write-Host "✅ Database backed up to: $backupFile" -ForegroundColor Green
}

# Export database
function Export-Database {
    $projects = Get-Projects
    $exportFile = "data/projects-export-$(Get-Date -Format 'yyyyMMdd').json"
    $projects | ConvertTo-Json -Depth 10 | Set-Content -Path $exportFile -Encoding UTF8
    Write-Host "✅ Database exported to: $exportFile" -ForegroundColor Green
}

# Main execution
switch ($Action) {
    "list" {
        List-Projects
    }
    "add" {
        Add-Project
    }
    "backup" {
        Backup-Database
    }
    "export" {
        Export-Database
    }
    default {
        Write-Host "Action '$Action' not implemented yet." -ForegroundColor Yellow
        Write-Host "Available actions: list, add, backup, export" -ForegroundColor Gray
    }
}

Write-Host "`n=== DATABASE MANAGEMENT ===" -ForegroundColor Cyan
Write-Host "Usage: .\manage-database.ps1 [-Action <list|add|backup|export>]" -ForegroundColor Gray
Write-Host "Default action: list" -ForegroundColor Gray
