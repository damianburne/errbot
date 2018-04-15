$env:slack_api_key = 'xoxb-XXXXXXXXXXXXXXXXXXXXXXXXXX'
Start-Process -FilePath 'powershell.exe' -ArgumentList 'cd C:\errbot ; errbot -c .\config.py'
