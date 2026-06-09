# Privacy review

Last reviewed: 2026-06-09

This repository is public and intentionally stores personal blocker setup data. Keep that in mind before adding new exports, screenshots, or archives.

## Automated scan

The repository was scanned for common token and private-key patterns across tracked text files, excluding `.git`, platform-tools binaries, archives, and images. No obvious API keys, GitHub tokens, OpenAI-style keys, AWS access keys, or private-key blocks were found.

## Known public-sensitive content

- `README.md` contains screenshots and notes about password-storage and permission-restriction locations.
- `Windows Apps Applications List.ctbal` contains a `Master Password` window-title rule and a personal Windows path.
- Exported blocker lists reveal blocked websites, apps, YouTube channels, and other personal filtering preferences.
- Archive files may contain older copies of the same blocker exports and screenshots.
- `Screenshot 2026-04-23 081220.png` and README-hosted images should be manually checked before publishing new screenshots.

## Review checklist for future updates

- Search new text exports for real passwords, tokens, recovery codes, emails, phone numbers, account IDs, and private URLs.
- Manually inspect new screenshots for names, usernames, account avatars, browser tabs, file paths, and password-manager windows.
- List archive contents before committing, and extract locally only when necessary.
- Do not add `.env`, browser profile exports, password-manager exports, or raw application data directories.
