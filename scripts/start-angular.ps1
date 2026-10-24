# Starts the Angular app on http://localhost:4200
# Angular 6 + node-sass 4 cannot build on modern Node, so the bundled
# portable Node 12 is used for this app only.
$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot
$portableNode = Join-Path $env:LOCALAPPDATA 'mongodb-restaurant\node-v12.22.12-win-x64'
$workspaceNode = Join-Path $repo '.runtime\node-v12.22.12-win-x64'
$node12 = if (Test-Path (Join-Path $portableNode 'node.exe')) { $portableNode } else { $workspaceNode }

if (-not (Test-Path (Join-Path $node12 'node.exe'))) {
    throw "Portable Node 12 not found at $node12. See LOCAL_SETUP.md."
}

$env:Path = "$node12;$env:Path"

Push-Location (Join-Path $repo 'Angular-Restaurant-App')
try {
    # Run ng directly: the package.json script sets --openssl-legacy-provider,
    # which does not exist in Node 12.
    node node_modules/@angular/cli/bin/ng serve --host 127.0.0.1
} finally {
    Pop-Location
}
