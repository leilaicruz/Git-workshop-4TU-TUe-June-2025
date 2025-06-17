---

title: "Version Control with Git: Beginner's Workshop"
author: "Leila Iñigo de la Cruz"
date: "Workshop Day 1"
format: gfm
-----------

# 🎓 Workshop Lesson Plan: Git Basics

**Note:** Instructor comments are marked as `> Instructor Note:` and should help guide the pacing, demonstration strategy, and what to emphasize. Everything else is intended for participants or for use during live demos.

## 🛠️ Preparation (Before Start)

To prepare your terminal for dual-pane command tracking:

```bash
# Main terminal (record command history live)
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Second terminal (display ongoing history)
tail -f ~/.bash_history

# Clear history if needed
dhistory -c
```

For Windows/WSL setup:

```bash
cd /mnt/c/Users/<your-username>/OneDrive - Delft University of Technology/
export PS1='$ '
```

---

## 📍 Part 1: Getting Started with Git

### 🧊 Introduction \[10 min]

* Start with [CodeiMD collaborative notes](https://edu.nl/htaw9) and icebreaker.
* Transition to Git introduction with [slides](Lesson_development/Presentations/Git-intro-lesson.pptx).
* Use [Mentimeter poll](https://www.mentimeter.com/app/presentation/alf22ui5d9tf7reg41ksg1ksojnusgh6/edit?question=pjxghpfddrmb) in presenter mode.

### 🔧 Step 1: Setting Up Git \[6 min]

> Instructor Note: Sometimes Git Bash won't open via shortcut. Direct students to `C:/Git/git-bash.exe` if needed.

Test installation:

```bash
git --version
```

Get help:

```bash
git --help
# or for specific command
git init -h
```

Configure Git (only needed once):

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

Comments:
- Use the email associated with your GitHub, GitLab, Bitbucket, etc., account.

- Ensures commits are linked to your user profile.

- Enables activity tracking, avatars, and contribution graphs.

- If using Git in a university/research group context:

    - Use your institutional email if commits should be traceable to that identity.

### Configure line endings:

```bash
# Windows
git config --global core.autocrlf true
# Mac/Linux
git config --global core.autocrlf input
```

### Check configuration:

```bash
git config --global --list
```

### 📦 Step 2: Creating a Repository \[4 min]

Create and initialize project folder:

```bash
mkdir patients
cd patients
git init
```

Verify repo status:

```bash
ls -a
# Shows .git folder
git status
```

> Instructor Note: Explain that `.git` is the hidden folder tracking everything.
> Do **not** initialize repos inside subfolders—this breaks versioning logic.

---

### 📝 Step 3: Tracking Your First Change \[10 min]

Create a script:

```bash
touch calculate_mean.py
nano calculate_mean.py
```

Add the code:

```python
import numpy as np

def calculate_mean(data):
    mean = np.mean(data)
    return mean
```

Check status:

```bash
git status
```

Track and commit:

```bash
git add calculate_mean.py
# Git may show CRLF warning (safe to ignore)
git commit -m "create script for analysis"
```

> Instructor Note: Explain staging area vs history. Use slides to illustrate the **modify → add → commit** cycle.

---

### 🛠️ Step 4: Making Additional Changes \[5 min]

Add documentation to the script:

```python
""" This function computes the mean of an array.
Input: A one dimensional array
Output: The mean of the array
"""
```

Check and review differences:

```bash
git status
git diff
```

Add and commit the changes:

```bash
git add calculate_mean.py
git diff --staged
git commit -m "add docstring"
```

---

### 📁 Step 5: Working with Empty Directories \[4 min]

Git won't track empty directories:

```bash
mkdir treatments
git status
git add treatments
git status  # Still no changes detected
```

Add files to track the folder:

```bash
touch treatments/aspirin.txt treatments/advil.txt
git add treatments/
git commit -m "add some treatments for patients"
ls -R
```

---

### 🚫 Step 6: Ignoring Files \[6 min]

Simulate a scenario with large/unwanted files:

```bash
mkdir data
touch data/a.dat data/b.dat big-data.zip
```

Create a `.gitignore`:

```bash
nano .gitignore
```

Contents:

```bash
# data files:
big-data.zip
data/
```

Track the ignore file:

```bash
git add .gitignore
git commit -m "Ignoring data files"
git status --ignored
```

---

## 🧪 Hands-On Exercise: Modify, Add, Commit \[15 min]

> Instructor Note: Use breakout groups. Let participants try each step, then show the solution. Each task: 1–2 minutes.

Assignment:

**Create new repository and use the modify-add-commit cycle.**
- Create and initialize a repository called ‘my-repo’
- Create a file ‘research.txt’ with the sentence “Science is awesome”.
- Add and commit the changes. Remember to use a meaningful message.
- Change sentence in ‘research.txt’ to “Science is messy”
Add and commit.
- Create a folder called “raw-data”
- Ignore the raw-data folder and commit it 
- ( bonus) Check your history log – you should have 3 commits. 


Steps:

```bash
mkdir my-repo && cd my-repo
git init
nano research.txt  # Add "Science is awesome"
git add research.txt
git commit -m "add awesome science"

nano research.txt  # Change to "Science is messy"
git add research.txt
git commit -m "change to messy science"

mkdir raw-data
touch .gitignore
nano .gitignore  # Add: raw-data/
git add .gitignore
git commit -m "ignore raw data folder"

git log --oneline --graph
```

---

## 🔍 Part 2: Exploring Git History \[16 min]

### a. View the Log

```bash
git log
git log --oneline
git log --graph
git log > changelog.txt
```

> Instructor Note: Explain paging (Q = quit, / = search, N = next match).

### b. Understanding HEAD

> HEAD is a reference to the most recent commit in the current branch (`main` or `master`).

### c. Add a Usage Example

```bash
nano calculate_mean.py
```

```python
# Usage:
# data=np.array([0,10,20,30])
# mean=calculate_mean(data)
```

### d. Compare Differences

```bash
git diff HEAD calculate_mean.py
# or previous versions:
git diff HEAD~1 calculate_mean.py
git diff HEAD~3 calculate_mean.py
```

### e. Use Specific Commit IDs

```bash
git log --oneline  # Copy a commit ID
git diff <commit-id> HEAD calculate_mean.py
```

### f. Use `git show`

```bash
git show HEAD~2 calculate_mean.py
```

---

## ⏪ Reverting Changes \[9 min]

> Instructor Note: Let participants follow if they are confident. Otherwise, demo it.

Ensure changes are committed:

```bash
git add calculate_mean.py
git commit -m "add usage"
```

Revert to last commit:

```bash
git restore calculate_mean.py
cat calculate_mean.py
```

Revert to specific commit:

```bash
git log --oneline
git restore -s <commit-id> calculate_mean.py
```

Restore latest version:

```bash
git restore calculate_mean.py
git add calculate_mean.py
git commit -m "usage message added"
```

> Instructor Note: Wrap up with summary of `git log`, `diff`, `show`, and `restore`

---

✅ End of Morning Session


## Lunch 

13:30 Afternoon session
----

## 🛰️ Part 3: Working with Remotes and Collaborating on GitHub

### 🧭 13:30 — Intro to Remotes

> **Instructor Note:** Introduce the idea of remote repositories using slides. Explain what GitHub is, how it connects to local repositories, and why remotes are important for collaboration and backup.

---

### 🌐 8. Connecting to GitHub \[20 min]

#### a. Create a GitHub Repository

> Ask participants to log into GitHub and create an **empty public repository** named `patients-analysis`.

* Description suggestion: *Analysis of different clinical treatments*

#### b. Connect Local Repo to Remote

##### b0. SSH Setup for GitHub Access (**Technical Break**, 30 min)

> **Instructor Note:** Use slides or a diagram to explain SSH authentication, its benefits over HTTPS, and GitHub’s two-factor authentication requirements.

Steps to generate and configure an SSH key:

```bash
cd ~
ssh-keygen -t ed25519 -C "your_email@example.com"
# Choose default location: ~/.ssh/id_ed25519
```

✅ **Email requirements:**

* The email in this command doesn't need to match your GitHub account.
* Still, using a verified GitHub email is recommended for clarity and organization.

Check generated files:

```bash
ls ~/.ssh/
```

Start the SSH agent and add the key:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Copy the public key:

```bash
clip < ~/.ssh/id_ed25519.pub  # Windows
# or
cat ~/.ssh/id_ed25519.pub     # For manual copy
```

On GitHub:

* Go to **Settings → SSH and GPG keys → New SSH key**
* Paste the key and name it clearly (e.g., `workshop-laptop`)

Test the SSH connection:

```bash
ssh -T git@github.com
```

🔗 Resources:

* [GitHub SSH Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
* [Troubleshooting SSH](https://docs.github.com/en/authentication/troubleshooting-ssh)

#### b1. Add the Remote and Push

Return to your project folder:

```bash
cd ~/Desktop/patients
```

Link to the remote repository:

```bash
git remote add origin git@github.com:<your-username>/patients-analysis.git
git remote -v
```

Set default branch and push:

```bash
git branch -M main
git push -u origin main
```

To pull future updates:

```bash
git pull origin main
```

> Questions? Clarify remote tracking, default branches, and pushing/pulling.

---

### 🖥️ Optional: Explore GitHub Web GUI

> **Instructor Note:** Quickly tour the GitHub interface: file browser, commit history, branches, issues, pull requests.

---

## ☕ 14:30 – Break

Invite participants to join `workshop-check-in` repo as collaborators before resuming.

---

## 🤝 Collaboration Practice: Hands-On Session

### a. Clone a Shared Repository

> Instructor shares repo URL: `https://github.com/leilaicruz/workshop-checkin`

Clone it locally:

```bash
cd ~/Desktop
git clone git@github.com:leilaicruz/workshop-checkin.git
```

> **Instructor Note:** Now contrast cloning vs forking using the table below.

| Aspect                | 🌀 Cloning                      | 🍴 Forking                               |
| --------------------- | ------------------------------- | ---------------------------------------- |
| **What it does**      | Local copy of existing repo     | Your own copy under your GitHub account  |
| **Who owns the repo** | The original owner              | You (your GitHub username)               |
| **Use case**          | Team projects with write access | Contributing to external/public projects |
| **How to contribute** | Direct push or PRs to original  | PRs from fork to upstream                |
| **Remote origin**     | Points to source repo           | Points to your fork                      |

### b. Make a Check-in Entry

Create a copy of the template and edit it:

```bash
cd workshop-checkin
cp check-in/template.md check-in/<first-two-letters-name-last-two-digits-phone>.md
nano check-in/le71.md
```

> Example name: `le71.md`. Add your name, research field and your ideal job an ideal world.

### c. Collaborative Git Workflow

A typical workflow:

```bash
git pull origin main
git add .
git commit -m "check <your-name> in"
git push origin main
```

> **Note:** This requires that participants have been added as **collaborators**.

---

### 🪄 Optional: Branches and Pull Requests (if time allows)

Create and switch to a new branch:

```bash
git switch -c <your-branch-name>
```

Edit your check-in file, stage, commit, and push:

```bash
git add check-in/<your-id>.md
git commit -m "add check-in info"
git push origin <your-branch-name>
```

> Instructor can then demonstrate how to open a Pull Request (PR) via the GitHub interface.

---

## 🧩 Final Exercise: Working with Issues and PRs

> Instructor Note: Display this on a shared screen or slide.

**Assignment:**

1. Write an Issue in your `patients-analysis` repo. Options:

   * Add a multiplication function
   * Improve `calculate_mean` with full documentation
   * Create a `README.md` file

2. Pair up:

   * Clone or fork each other’s repositories.
   * Create a branch, solve the issue.
   * Open a Pull Request with your changes.

3. Review and integrate PRs if possible.

4. Reflect:

   * What worked well?
   * What was confusing?
   * Did you encounter merge conflicts?
   * How would you improve the process next time?

---

### 🪪 12. Licensing & Citation \[Optional, 5 min]

> Instructor Note: Briefly explain why software licensing matters for reuse and collaboration.

* Share TU Delft software template repo: [https://github.com/manuGil/fair-code](https://github.com/manuGil/fair-code)

Encourage:

* Adding a LICENSE file
* Including CITATION metadata in the repo

---

### ❓ 13. Q\&A

Open floor for questions, clarifications, and sharing experiences.


