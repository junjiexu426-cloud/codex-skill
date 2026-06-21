# Codex Skill Backup

This repository stores a restorable backup of the non-system Codex skills from `C:\Users\许俊杰\.codex\skills` as of 2026-06-21.

Included skills:

- `final-exam-review`
- `research-vault-literature-retrieval`
- `wrong-question-book`
- `xujunjie-wrong-question-book`
- `zotero-analytical-writer`
- `zotero-collection-manager`
- `zotero-data-fetcher`

Not included:

- `.system`
  Those are bundled with Codex rather than user-installed custom skills.

## Repository Layout

- `backup/skill_backup_20260621.zip`
- `restore/restore_from_repo.ps1`
- `skills-list.txt`

## Restore

Run this from the repository root in PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File .\restore\restore_from_repo.ps1
```

Manual restore:

1. Extract `backup/skill_backup_20260621.zip`.
2. Copy the folders inside `skill_backup_20260621\skills\` to `%USERPROFILE%\.codex\skills\`.
3. Restart Codex.

## Notes

- This is a snapshot backup for recovery.
- If your local skills change later, you can update this repository with a newer snapshot.
