$content = Get-Clipboard;
$mtchs = [regex]::Matches($content, "kittens?\s\S+");
Write-Output $mtchs.value;
$c = 0;
$mtchs | ForEach-Object { $c++ }
Write-Output $c