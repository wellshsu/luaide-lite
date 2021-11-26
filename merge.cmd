if exist .git (
	TortoiseGitProc.exe /command:merge /path:./
) else (
	TortoiseProc.exe /command:merge /path:./
)