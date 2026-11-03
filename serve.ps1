# Serves "Quiet Engine.html" on http://localhost so YouTube's player works: it refuses to play in a page opened straight from a file.
# Started by "Start Quiet Engine.cmd". Close its window to stop it. Nothing is reachable from other computers.
$dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$file = Join-Path $dir 'Quiet Engine.html'
$port = 5180
$url = "http://localhost:$port/"
$Host.UI.RawUI.WindowTitle = 'Quiet Engine - close this window to stop'
if (-not (Test-Path $file)) { Write-Host 'Quiet Engine.html is missing. Put it in the same folder as this file.'; Read-Host 'Press Enter to close'; exit 1 }

$l = New-Object System.Net.HttpListener
$l.Prefixes.Add($url)
try { $l.Start() } catch {
  # Already running from an earlier double-click? Then just open it again (same address, so your playlist and settings carry over).
  try { if ((Invoke-WebRequest -UseBasicParsing -TimeoutSec 3 $url).Content -match 'Quiet Engine') { Start-Process $url; exit 0 } } catch {}
  Write-Host "Port $port is taken by another program, so Quiet Engine can't start."; Read-Host 'Press Enter to close'; exit 1
}

Start-Process $url
Write-Host "Quiet Engine is running at $url"
Write-Host 'Close this window to stop it.'
while ($l.IsListening) {
  $ctx = $l.GetContext(); $res = $ctx.Response
  if ($ctx.Request.Url.AbsolutePath -in '/', '/index.html') {
    $b = [IO.File]::ReadAllBytes($file); $res.ContentType = 'text/html; charset=utf-8'; $res.Headers.Add('Cache-Control', 'no-cache')
  } else { $res.StatusCode = 404; $b = [Text.Encoding]::UTF8.GetBytes('Not found') }
  $res.ContentLength64 = $b.Length; $res.OutputStream.Write($b, 0, $b.Length); $res.Close()
}
