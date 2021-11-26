if exist .git (
	TortoiseGitProc.exe /command:cleanup /path:./
) else (
	TortoiseProc.exe /command:cleanup /path:./
)