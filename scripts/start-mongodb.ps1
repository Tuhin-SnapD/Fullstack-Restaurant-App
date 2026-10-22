# Starts the portable MongoDB instance used by this project.
$ErrorActionPreference = 'Stop'

$tools   = Join-Path $env:LOCALAPPDATA 'mongodb-restaurant'
$data    = Join-Path $tools 'data'
$log     = Join-Path $tools 'mongod.log'
$port    = 27017

New-Item -ItemType Directory -Force -Path $data | Out-Null

$mongod = Get-ChildItem -Path $tools -Filter 'mongod.exe' -Recurse -ErrorAction SilentlyContinue |
    Select-Object -First 1

if (-not $mongod) {
    throw "mongod.exe not found under $tools. Re-run the setup steps in LOCAL_SETUP.md."
}

# Already running?
$client = New-Object Net.Sockets.TcpClient
try {
    $client.Connect('127.0.0.1', $port)
    $client.Close()
    Write-Host "MongoDB is already listening on 127.0.0.1:$port"
    return
} catch {
    $client.Dispose()
}

Start-Process -FilePath $mongod.FullName -WindowStyle Hidden -ArgumentList @(
    '--dbpath', "`"$data`"",
    '--port', $port,
    '--bind_ip', '127.0.0.1',
    '--logpath', "`"$log`"",
    '--logappend'
) | Out-Null

for ($i = 0; $i -lt 60; $i++) {
    $c = New-Object Net.Sockets.TcpClient
    try {
        $c.Connect('127.0.0.1', $port)
        $c.Close()
        Write-Host "MongoDB started on 127.0.0.1:$port"
        return
    } catch {
        $c.Dispose()
        Start-Sleep -Milliseconds 500
    }
}

throw "MongoDB did not start. Check $log"
