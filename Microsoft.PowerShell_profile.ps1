# starship
Invoke-Expression (&starship init powershell)

# neovim
function vim { nvim }
function vi { nvim }

# busybox
function l { busybox ls -al }
function ll { busybox ls }

# https://github.com/simnalamburt/cgitc/issues/48
# Abbreviations sorted in alphabetically
function g                    { git @Args }

function ga                   { git add @Args }
function gaa                  { git add --all @Args }
function gapa                 { git add --patch @Args }
function gau                  { git add --update @Args }
function gav                  { git add --verbose @Args }
function gap                  { git apply @Args }

function gb                   { git branch @Args }
function gba                  { git branch -a @Args }
function gbd                  { git branch -d @Args }
function gbD                  { git branch -D @Args }
function gbl                  { git blame -b -w @Args }
function gbnm                 { git branch --no-merged @Args }
function gbr                  { git branch --remote @Args }
function gbs                  { git bisect @Args }
function gbsb                 { git bisect bad @Args }
function gbsg                 { git bisect good @Args }
function gbsr                 { git bisect reset @Args }
function gbss                 { git bisect start @Args }

function gc                   { git commit -v @Args }
function gc!                  { git commit -v --amend @Args }
function gcn!                 { git commit -v --no-edit --amend @Args }
function gca                  { git commit -v -a @Args }
function gca!                 { git commit -v -a --amend @Args }
function gcan!                { git commit -v -a --no-edit --amend @Args }
function gcans!               { git commit -v -a -s --no-edit --amend @Args }
function gcam                 { git commit -a -m @Args }
function gcsm                 { git commit -s -m @Args }
function gcb                  { git checkout -b @Args }
function gcf                  { git config --list @Args }
function gcl                  { git clone --recurse-submodules @Args }
function gclean               { git clean -id @Args }
function gcm                  { git checkout master @Args }
function gcd                  { git checkout develop @Args }
function gcmsg                { git commit -m @Args }
function gco                  { git checkout @Args }
function gcount               { git shortlog -sn @Args }
function gcp                  { git cherry-pick @Args }
function gcpa                 { git cherry-pick --abort @Args }
function gcpc                 { git cherry-pick --continue @Args }
function gcs                  { git commit -S @Args }

function gd                   { git diff @Args }
function gdca                 { git diff --cached @Args }
function gdcw                 { git diff --cached --word-diff @Args }
function gdt                  { git diff-tree --no-commit-id --name-only -r @Args }
function gdw                  { git diff --word-diff @Args }

function gf                   { git fetch @Args }
function gfa                  { git fetch --all --prune @Args }
function gfo                  { git fetch origin @Args }

function gg                   { git gui citool @Args }
function gga                  { git gui citool --amend @Args }

function ghh                  { git help @Args }

function gignore              { git update-index --assume-unchanged @Args }

function gk                   { gitk --all --branches @Args }

function gl                   { git pull @Args }
function glg                  { git log --stat @Args }
function glgp                 { git log --stat -p @Args }
function glgg                 { git log --graph @Args }
function glgga                { git log --graph --decorate --all @Args }
function glgm                 { git log --graph --max-count=10 @Args }
function glo                  { git log --oneline --decorate @Args }
function glol                 { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' @Args }
function glols                { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat @Args }
function glod                 { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' @Args }
function glods                { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short @Args }
function glola                { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all @Args }
function glog                 { git log --oneline --decorate --graph @Args }
function gloga                { git log --oneline --decorate --graph --all @Args }

function gm                   { git merge @Args }
function gmom                 { git merge origin/master @Args }
function gmt                  { git mergetool --no-prompt @Args }
function gmtvim               { git mergetool --no-prompt --tool=vimdiff @Args }
function gmum                 { git merge upstream/master @Args }
function gma                  { git merge --abort @Args }

function gp                   { git push @Args }
function gpd                  { git push --dry-run @Args }
function gpf                  { git push --force-with-lease @Args }
function gpf!                 { git push --force @Args }
function gpu                  { git push upstream @Args }
function gpv                  { git push -v @Args }

function gr                   { git remote @Args }
function gra                  { git remote add @Args }
function grb                  { git rebase @Args }
function grba                 { git rebase --abort @Args }
function grbc                 { git rebase --continue @Args }
function grbd                 { git rebase develop @Args }
function grbi                 { git rebase -i @Args }
function grbm                 { git rebase master @Args }
function grbs                 { git rebase --skip @Args }
function grev                 { git revert @Args }
function grh                  { git reset @Args }
function grhh                 { git reset --hard @Args }
function grm                  { git rm @Args }
function grmc                 { git rm --cached @Args }
function grmv                 { git remote rename @Args }
function grrm                 { git remote remove @Args }
function grs                  { git restore @Args }
function grset                { git remote set-url @Args }
function grss                 { git restore --source @Args }
function gru                  { git reset -- @Args }
function grup                 { git remote update @Args }
function grv                  { git remote -v @Args }

function gsb                  { git status -sb @Args }
function gsd                  { git svn dcommit @Args }
function gsh                  { git show @Args }
function gsi                  { git submodule init @Args }
function gsps                 { git show --pretty=short --show-signature @Args }
function gsr                  { git svn rebase @Args }
function gss                  { git status -s @Args }
function gst                  { git status @Args }

function gstaa                { git stash apply @Args }
function gstc                 { git stash clear @Args }
function gstd                 { git stash drop @Args }
function gstl                 { git stash list @Args }
function gstp                 { git stash pop @Args }
function gsts                 { git stash show --text @Args }
function gstall               { git stash --all @Args }
function gsu                  { git submodule update @Args }
function gsw                  { git switch @Args }
function gswc                 { git switch -c @Args }

function gts                  { git tag -s @Args }

function gunignore            { git update-index --no-assume-unchanged @Args }
function gup                  { git pull --rebase @Args }
function gupv                 { git pull --rebase -v @Args }
function gupa                 { git pull --rebase --autostash @Args }
function gupav                { git pull --rebase --autostash -v @Args }
function glum                 { git pull upstream master @Args }

function gwch                 { git whatchanged -p --abbrev-commit --pretty=medium @Args }


#
# cgitc extensions
#
function gbm                  { git branch -m @Args }
function gcaa                 { git commit -v -a --amend @Args }
function gdl                  { git difftool @Args }
function gds                  { git diff --stat @Args }
function ggpush               { git push --set-upstream origin HEAD @Args }
function gp!                  { git push --force-with-lease @Args }
function grhd                 { git reset HEAD @Args }
function grhhd                { git reset --hard HEAD @Args }
function grhh1                { git reset --hard HEAD~1 @Args }
function gsta                 { git stash @Args }
function gc-                  { git checkout - @Args }
