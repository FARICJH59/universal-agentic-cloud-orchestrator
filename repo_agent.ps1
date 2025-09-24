param(
    [string]$RepoName = "universal-agentic-cloud-orchestrator",
    [ValidateSet("public","private")] [string]$Visibility = "public"
)

Write-Host "🔎 Checking if repo $env:USERNAME/$RepoName exists..."

# Try to get repo info
$exists = gh repo view "$env:USERNAME/$RepoName" --json name 2>$null

if (-not $exists) {
    Write-Host "🚀 Creating repo $env:USERNAME/$RepoName as $Visibility..."
    gh repo create "$env:USERNAME/$RepoName" --$Visibility --description "Autonomous Agentic Cloud Orchestrator" --homepage "https://github.com/$env:USERNAME/$RepoName" --confirm
} else {
    Write-Host "ℹ️ Repo $RepoName already exists."
}

# Ensure README.md
if (-not (Test-Path "README.md")) {
    @"
# $RepoName

Autonomous cloud orchestration fabric for hybrid SaaS workflows.  
Powered by FastAPI, Docker, AI agents, and multi-cloud CI/CD (AWS/GCP/Azure).  
Quantum-secure and industry-aware.
"@ | Out-File -Encoding utf8 "README.md"
    git add README.md
    git commit -m "Add README.md"
}

# Push changes
git push origin main
Write-Host "✅ Repo ready at: https://github.com/$env:USERNAME/$RepoName"
