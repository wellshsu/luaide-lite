if exist .git (
	TortoiseGitProc.exe /command:log /path:./
) else (
	TortoiseProc.exe /command:log /path:./
)