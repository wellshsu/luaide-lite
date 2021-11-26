if exist .git (
	TortoiseGitProc.exe /command:commit /path:./
) else (
	TortoiseProc.exe /command:commit /path:./
)