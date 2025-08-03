# 🔗 Git Submodules Setup Guide

This repository uses Git submodules to organize the three main components of the restaurant management system. This guide explains how to clone and work with the submodules.

## 📋 What are Git Submodules?

Git submodules allow you to keep a Git repository as a subdirectory of another Git repository. This lets you clone another repository into your project and keep your commits separate.

## 🚀 Quick Clone (All Submodules)

To clone the entire repository with all submodules:

```bash
# Clone the main repository with all submodules
git clone --recursive https://github.com/Tuhin-SnapD/Fullstack-Restaurant-App.git

# OR clone first, then initialize submodules
git clone https://github.com/Tuhin-SnapD/Fullstack-Restaurant-App.git
cd Fullstack-Restaurant-App
git submodule update --init --recursive
```

## 📁 Repository Structure

After cloning with submodules, your directory structure will be:

```
Fullstack-Restaurant-App/
├── README.md                    # Main documentation
├── SUBMODULE_SETUP.md          # This guide
├── .gitmodules                 # Submodule configuration
├── Server-Restaurant/          # Backend API (submodule)
│   ├── app.js
│   ├── package.json
│   └── ...
├── React-Restaurant-App/       # React Frontend (submodule)
│   ├── src/
│   ├── package.json
│   └── ...
└── Angular-Restaurant-App/     # Angular Frontend (submodule)
    ├── src/
    ├── package.json
    └── ...
```

## 🔧 Working with Submodules

### View Submodule Status

```bash
# Check submodule status
git submodule status

# Show detailed submodule information
git submodule foreach git status
```

### Update Submodules

```bash
# Update all submodules to their latest commits
git submodule update --remote

# Update specific submodule
git submodule update --remote Server-Restaurant
```

### Working in Submodules

```bash
# Navigate to a submodule
cd Server-Restaurant

# Make changes and commit them
git add .
git commit -m "Your changes"
git push origin main

# Return to main repository and update submodule reference
cd ..
git add Server-Restaurant
git commit -m "Update Server-Restaurant submodule"
git push origin main
```

### Pull Latest Changes

```bash
# Pull latest changes from main repository
git pull origin main

# Update submodules to match the committed versions
git submodule update --init --recursive
```

## 🛠️ Development Workflow

### 1. Initial Setup

```bash
# Clone with submodules
git clone --recursive https://github.com/Tuhin-SnapD/Fullstack-Restaurant-App.git
cd Fullstack-Restaurant-App

# Install dependencies for all components
cd Server-Restaurant && npm install && cd ..
cd React-Restaurant-App && npm install && cd ..
cd Angular-Restaurant-App && npm install && cd ..
```

### 2. Daily Development

```bash
# Start all services (in separate terminals)
# Terminal 1: Backend
cd Server-Restaurant && npm run dev

# Terminal 2: React Frontend
cd React-Restaurant-App && npm start

# Terminal 3: Angular Frontend
cd Angular-Restaurant-App && npm start
```

### 3. Making Changes

#### Backend Changes
```bash
cd Server-Restaurant
# Make your changes
git add .
git commit -m "Backend changes"
git push origin main
cd ..
git add Server-Restaurant
git commit -m "Update backend submodule"
git push origin main
```

#### Frontend Changes
```bash
cd React-Restaurant-App
# Make your changes
git add .
git commit -m "React frontend changes"
git push origin main
cd ..
git add React-Restaurant-App
git commit -m "Update React frontend submodule"
git push origin main
```

## 🔄 Submodule Commands Reference

| Command | Description |
|---------|-------------|
| `git submodule status` | Show status of all submodules |
| `git submodule update --init --recursive` | Initialize and update all submodules |
| `git submodule update --remote` | Update all submodules to latest commits |
| `git submodule foreach git pull origin main` | Pull latest changes for all submodules |
| `git submodule add <url> <path>` | Add a new submodule |
| `git submodule deinit <path>` | Remove a submodule |

## 🚨 Important Notes

### 1. Submodule Pointers
- The main repository stores **pointers** to specific commits in each submodule
- When you clone the main repo, submodules are in a "detached HEAD" state
- You need to explicitly update submodules to get the latest code

### 2. Working Directory
- Always work **inside** the submodule directory when making changes
- Commit changes in the submodule first, then update the main repository

### 3. Team Collaboration
- When team members pull changes, they need to update submodules
- Use `git submodule update --init --recursive` after pulling

### 4. CI/CD Considerations
- CI/CD pipelines need to handle submodules properly
- Use `--recursive` flag when cloning in automated environments

## 🔧 Troubleshooting

### Submodule Not Found
```bash
# If submodule directory is empty
git submodule update --init --recursive
```

### Detached HEAD State
```bash
# If you're in detached HEAD state in a submodule
cd Server-Restaurant
git checkout main
git pull origin main
```

### Submodule Conflicts
```bash
# If there are conflicts in submodules
git submodule foreach git reset --hard HEAD
git submodule update --init --recursive
```

## 📚 Additional Resources

- [Git Submodules Documentation](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
- [Git Submodules Tutorial](https://git-scm.com/docs/git-submodule)
- [Working with Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules#_submodules)

## 🎯 Best Practices

1. **Always initialize submodules** after cloning
2. **Update submodules regularly** to get latest changes
3. **Commit submodule changes first**, then update main repository
4. **Use descriptive commit messages** for submodule updates
5. **Document submodule dependencies** in your project documentation

---

**Happy coding with submodules! 🚀** 