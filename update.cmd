if exist .git (
	TortoiseGitProc.exe /command:pull /path:./
) else (
	TortoiseProc.exe /command:update /path:./
)