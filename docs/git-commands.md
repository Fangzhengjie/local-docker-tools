# Git Command Reference

## Initial Setup

```bash
# Configure user name
git config --global user.name "Your Name"

# Configure user email
git config --global user.email "your.email@example.com"

# Configure default editor
git config --global core.editor "vim"

# Configure line endings (Windows)
git config --global core.autocrlf true

# Configure line endings (Linux/Mac)
git config --global core.autocrlf input

# List all configurations
git config --list

# List global configurations
git config --global --list

# Get specific configuration
git config user.name

# Remove configuration
git config --global --unset user.name

# Edit configuration file
git config --global --edit
```

## Repository Initialization

```bash
# Initialize new repository
git init

# Initialize with specific branch name
git init -b main

# Clone repository
git clone https://github.com/user/repo.git

# Clone to specific directory
git clone https://github.com/user/repo.git mydir

# Clone specific branch
git clone -b branch-name https://github.com/user/repo.git

# Clone with depth (shallow clone)
git clone --depth 1 https://github.com/user/repo.git

# Clone with submodules
git clone --recursive https://github.com/user/repo.git
```

## Basic Operations

```bash
# Check status
git status

# Check status (short format)
git status -s

# Add file to staging
git add filename

# Add all files
git add .

# Add all files (including deleted)
git add -A

# Add files interactively
git add -i

# Add parts of files
git add -p

# Commit changes
git commit -m "Commit message"

# Commit with detailed message
git commit

# Commit all tracked files
git commit -am "Commit message"

# Amend last commit
git commit --amend

# Amend without changing message
git commit --amend --no-edit

# View commit history
git log

# View compact history
git log --oneline

# View history with graph
git log --graph --oneline --all

# View history with changes
git log -p

# View history for specific file
git log -- filename

# View last N commits
git log -n 5

# View commits by author
git log --author="Author Name"

# View commits in date range
git log --since="2024-01-01" --until="2024-12-31"
```

## Branching

```bash
# List branches
git branch

# List all branches (including remote)
git branch -a

# List remote branches
git branch -r

# Create new branch
git branch branch-name

# Create and switch to branch
git checkout -b branch-name

# Switch to branch
git checkout branch-name

# Switch to branch (new syntax)
git switch branch-name

# Create and switch (new syntax)
git switch -c branch-name

# Rename branch
git branch -m old-name new-name

# Rename current branch
git branch -m new-name

# Delete branch
git branch -d branch-name

# Force delete branch
git branch -D branch-name

# Delete remote branch
git push origin --delete branch-name

# Track remote branch
git branch --set-upstream-to=origin/branch-name

# View branch tracking
git branch -vv
```

## Merging

```bash
# Merge branch into current branch
git merge branch-name

# Merge with commit message
git merge branch-name -m "Merge message"

# Merge without fast-forward
git merge --no-ff branch-name

# Merge and squash commits
git merge --squash branch-name

# Abort merge
git merge --abort

# Continue merge after resolving conflicts
git merge --continue
```

## Rebasing

```bash
# Rebase current branch onto another
git rebase branch-name

# Interactive rebase
git rebase -i HEAD~3

# Rebase onto remote branch
git rebase origin/main

# Continue rebase after resolving conflicts
git rebase --continue

# Skip current commit during rebase
git rebase --skip

# Abort rebase
git rebase --abort

# Rebase and preserve merges
git rebase -p branch-name
```

## Remote Operations

```bash
# List remotes
git remote

# List remotes with URLs
git remote -v

# Add remote
git remote add origin https://github.com/user/repo.git

# Remove remote
git remote remove origin

# Rename remote
git remote rename old-name new-name

# Change remote URL
git remote set-url origin https://github.com/user/repo.git

# Fetch from remote
git fetch

# Fetch from specific remote
git fetch origin

# Fetch all remotes
git fetch --all

# Fetch and prune deleted branches
git fetch --prune

# Pull changes
git pull

# Pull with rebase
git pull --rebase

# Pull from specific remote and branch
git pull origin main

# Push changes
git push

# Push to specific remote and branch
git push origin branch-name

# Push and set upstream
git push -u origin branch-name

# Push all branches
git push --all

# Push tags
git push --tags

# Force push (dangerous!)
git push --force

# Force push with lease (safer)
git push --force-with-lease
```

## Stashing

```bash
# Stash changes
git stash

# Stash with message
git stash save "Work in progress"

# Stash including untracked files
git stash -u

# Stash including ignored files
git stash -a

# List stashes
git stash list

# Apply latest stash
git stash apply

# Apply specific stash
git stash apply stash@{2}

# Pop latest stash (apply and remove)
git stash pop

# Drop latest stash
git stash drop

# Drop specific stash
git stash drop stash@{2}

# Clear all stashes
git stash clear

# Show stash contents
git stash show

# Show stash diff
git stash show -p
```

## Undoing Changes

```bash
# Discard changes in working directory
git checkout -- filename

# Discard all changes
git checkout -- .

# Restore file (new syntax)
git restore filename

# Unstage file
git reset HEAD filename

# Unstage file (new syntax)
git restore --staged filename

# Reset to specific commit (keep changes)
git reset --soft commit-hash

# Reset to specific commit (discard changes in staging)
git reset --mixed commit-hash

# Reset to specific commit (discard all changes)
git reset --hard commit-hash

# Reset to remote state
git reset --hard origin/main

# Revert commit (create new commit)
git revert commit-hash

# Revert merge commit
git revert -m 1 commit-hash

# Revert without committing
git revert --no-commit commit-hash
```

## Viewing Changes

```bash
# Show unstaged changes
git diff

# Show staged changes
git diff --staged

# Show changes between branches
git diff branch1..branch2

# Show changes for specific file
git diff filename

# Show changes between commits
git diff commit1 commit2

# Show changes with word diff
git diff --word-diff

# Show file changes only
git diff --name-only

# Show file changes with status
git diff --name-status

# Show commit details
git show commit-hash

# Show file at specific commit
git show commit-hash:filename
```

## Tagging

```bash
# List tags
git tag

# List tags with pattern
git tag -l "v1.*"

# Create lightweight tag
git tag tag-name

# Create annotated tag
git tag -a tag-name -m "Tag message"

# Tag specific commit
git tag tag-name commit-hash

# Delete tag
git tag -d tag-name

# Delete remote tag
git push origin --delete tag-name

# Push tag to remote
git push origin tag-name

# Push all tags
git push --tags

# Checkout tag
git checkout tag-name

# Show tag information
git show tag-name
```

## Cherry-picking

```bash
# Cherry-pick commit
git cherry-pick commit-hash

# Cherry-pick multiple commits
git cherry-pick commit1 commit2

# Cherry-pick without committing
git cherry-pick --no-commit commit-hash

# Continue cherry-pick after resolving conflicts
git cherry-pick --continue

# Abort cherry-pick
git cherry-pick --abort
```

## Searching

```bash
# Search in files
git grep "search-term"

# Search in specific files
git grep "search-term" -- "*.java"

# Search with line numbers
git grep -n "search-term"

# Search for commits
git log --grep="search-term"

# Search for commits that changed specific text
git log -S "search-term"

# Search for commits by author
git log --author="Author Name"

# Find who changed a line
git blame filename

# Find who changed lines in range
git blame -L 10,20 filename
```

## Submodules

```bash
# Add submodule
git submodule add https://github.com/user/repo.git path/to/submodule

# Initialize submodules
git submodule init

# Update submodules
git submodule update

# Clone with submodules
git clone --recursive https://github.com/user/repo.git

# Update submodules to latest
git submodule update --remote

# Remove submodule
git submodule deinit path/to/submodule
git rm path/to/submodule
```

## Cleaning

```bash
# Show what would be removed
git clean -n

# Remove untracked files
git clean -f

# Remove untracked files and directories
git clean -fd

# Remove ignored files
git clean -fX

# Remove all untracked and ignored files
git clean -fx

# Interactive clean
git clean -i
```

## Advanced Operations

```bash
# Bisect to find bug
git bisect start
git bisect bad
git bisect good commit-hash

# Mark current as good/bad
git bisect good
git bisect bad

# End bisect
git bisect reset

# Reflog (view all reference changes)
git reflog

# Recover deleted branch
git checkout -b branch-name commit-hash

# Recover deleted commit
git cherry-pick commit-hash

# Archive repository
git archive --format=zip --output=archive.zip HEAD

# Create patch
git format-patch -1 commit-hash

# Apply patch
git apply patch-file

# Show file history
git log --follow filename

# Find merge base
git merge-base branch1 branch2

# List files in commit
git diff-tree --no-commit-id --name-only -r commit-hash
```

## Git Aliases

```bash
# Create alias
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

# Useful aliases
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
git config --global alias.visual 'log --graph --oneline --all'
git config --global alias.amend 'commit --amend --no-edit'
```

## Git Hooks

```bash
# Hooks are located in .git/hooks/

# Common hooks:
# - pre-commit: Run before commit
# - post-commit: Run after commit
# - pre-push: Run before push
# - post-merge: Run after merge

# Make hook executable
chmod +x .git/hooks/pre-commit

# Skip hooks
git commit --no-verify
```

## Git LFS (Large File Storage)

```bash
# Install Git LFS
git lfs install

# Track file type
git lfs track "*.psd"

# Track specific file
git lfs track "large-file.bin"

# List tracked files
git lfs ls-files

# Fetch LFS files
git lfs fetch

# Pull LFS files
git lfs pull

# Untrack file type
git lfs untrack "*.psd"
```

## Troubleshooting

```bash
# Verify repository
git fsck

# Garbage collection
git gc

# Aggressive garbage collection
git gc --aggressive

# Prune unreachable objects
git prune

# Show repository size
git count-objects -vH

# Fix corrupted repository
git fsck --full

# Recover lost commits
git reflog
git checkout -b recovery-branch commit-hash

# Reset author for last commit
git commit --amend --reset-author

# Change commit author
git commit --amend --author="Name <email@example.com>"
```

## Git Workflows

### Feature Branch Workflow
```bash
# Create feature branch
git checkout -b feature/new-feature

# Work on feature
git add .
git commit -m "Add new feature"

# Push feature branch
git push -u origin feature/new-feature

# Merge feature (after PR approval)
git checkout main
git merge feature/new-feature
git push origin main
```

### Gitflow Workflow
```bash
# Start new feature
git checkout -b feature/feature-name develop

# Finish feature
git checkout develop
git merge --no-ff feature/feature-name
git branch -d feature/feature-name

# Start release
git checkout -b release/1.0.0 develop

# Finish release
git checkout main
git merge --no-ff release/1.0.0
git tag -a 1.0.0
git checkout develop
git merge --no-ff release/1.0.0
git branch -d release/1.0.0
```

## Tips

- Use `git status` frequently to check repository state
- Commit often with meaningful messages
- Pull before push to avoid conflicts
- Use branches for features and bug fixes
- Review changes before committing with `git diff`
- Use `.gitignore` to exclude files from version control
- Use `git stash` when switching branches with uncommitted changes
- Use `git rebase -i` to clean up commit history before pushing
- Use `git reflog` to recover lost commits
- Use `--force-with-lease` instead of `--force` for safer force pushes
- Set up SSH keys for easier authentication
- Use Git aliases for frequently used commands
- Keep commits atomic (one logical change per commit)
- Write descriptive commit messages (what and why, not how)
