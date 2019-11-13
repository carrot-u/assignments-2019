# How To Turn In Carrot U Assignments

You will be turning in assignments by using Git, creating Pull Requests, and merging them into this repo.

Let's go over what that means.  All `code` examples are things to type in to the command line.

## First Time You Do This On A Computer

Clone the repo to your local machine. Navigate to a directory that you want to keep this repo. Running this command will create a new directory called `assignments-2019` in that directory.

```
git clone https://github.com/carrot-u/assignments-2019
```

## Whenever You Want To Submit An Assignment

1) navigate to the assignments directory
```bash
cd assignments-2019 # or however you need to get there
```
2) make sure you're on the master branch  
```bash
git checkout master
```

3) update your local copy of master from the remote (the version on Github)
```bash
git pull -r origin master
```

4) start a new branch for your changes
```bash
git checkout -b dave-assignment-0 # this creates a git branch called "dave-assignment-0" and checks it out for you
```

4) navigate to the assignment directory and create a folder for your work
```bash
cd assignment-0
mkdir dschwantes # note: "dschwantes" is just an example directory name, please use your own name or username
cd dschwantes
```

5) Add your files/folder for your solution to this directory

6) When you're done. Stage the files and make a commit.
```bash
git add . # this will add all of the new files you've created
git commit -m "files for Assignment 0" # the `-m` means you're adding a message or comment, the stuff in "quotes" is the comment for the commit
```

6) Push your branch to the remote repo (Github)
```bash
git push origin -u dave-assignment-0 # the `-u` links the remote branch to this local one so you can pull without arguments, remember `dave-assignment-0` is the branch name for this example
```

7) Go to the [Carrot U Assignments Github page](https://github.com/carrot-u/assignments-2019) and [create a Pull Request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request) for your branch.

8) Merge it to master

9) Now check out master and pull again to see your changes
```bash
git checkout master
git pull -r origin master
```

## Other Resources On Git
- [Using Git by Github](https://help.github.com/en/github/using-git)
