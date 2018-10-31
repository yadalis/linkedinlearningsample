# linkedinlearningsample

Hooking VS Code project to an existing github repo

    After opening a new folder in VS code, click on init git icon under Code-Repo icon, which creates a local git repo and then do the following to connect local workspace to github repo
        git remote add origin https://github.com/yadalis/RODashboard.git
        git pull origin master
        git branch --set-upstream-to=origin/Master Master

git remote -v -  to check the git repo name