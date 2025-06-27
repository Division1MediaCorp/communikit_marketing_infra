# INFRASTRUCTURE OF COMMUNIKIT MARKETING

---

## Working with Submodules

Clone the infrastructure repo with submodules
```
git clone --recursive https://github.com/yourusername/communikit-infrastructure.git
```

If you already cloned without --recursive
```
git submodule update --init --recursive
```

Update a specific submodule
```
cd base
git pull origin main
cd ..
git add base
git commit -m "Update base application"
```
Update all submodules to latest
```
git submodule update --remote --merge
```