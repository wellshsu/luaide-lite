if exist .git (
	TortoiseGitProc.exe /command:revert /path:./
) else (
	TortoiseProc.exe /command:revert /path:./
)