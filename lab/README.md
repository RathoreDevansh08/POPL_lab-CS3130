# Laboratory problems

In this directory you will find the set of problems for the lab
session of PoPL course. Please follow the instructions given below for
ensuring easy evaluation of your lab assignments.

## Instructions.

* Create an repository on your local machine/laptop with the
  following format whose name is your rollnumber-popl-lab.

```sh
   mkdir -p code/git/111601007-popl-lab
   cd code/git/111601007-popl-lab
   git init

```

* Add a `README.md` in the top level with your details like Name and
  Roll number.

```sh
   cat > README.md <<EOF
   # README for PoPL lab
   * __Name:__ James Bond
   * __Rollnow:__ 111601007
   EOF
   git add README.md
   git commit -am 'added README'

```

* Create a _private git repository_ on bitbucket

```sh
   # start browser and create a repository on bitbucket 111601007-popl-lab
   # set it as the remote origin.
   git remote add origin https://bitbucket.org/james-bond/111601007-popl-lab
   git pu origin/master -u master

```

* Give _read-only_ access to the instructor and the TA in charge of
   this course. We can thus get hold of your assignments easily.

* Add a _separate directory_ for each assignment with the following
   format `DD-MM-YYYY-Title`, where `DD-MM-YYYY` is the date of upload
   of the assignment (not the deadline of the assignment). I will be
   uploading the problem statement with the file name
   `DD-MM-YYYY-Title.md` in this directory.

```sh
   mkdir 01-01-2000-First-Assignment
```

* Solve the assignment problem and ensure that all the source files
  required to build and run your code are within the directory
  created above. Follow good coding practices by making commits that
  are small and meaningful.

```sh
   cd 01-01-2000
   echo 'fun id x = x' > file.ml
   git add file.md
   git commit -am 'wrote identity function'
```

7. Push your changes to bitbucket. We will sync from your repository
   on the deadline. You do not have to worry about any last minute
   change. Keep pushing changes but do not force commit or merge and
   we will get the latest one as of the assignment deadline.

```sh
    git push origin
```

8. You do not have to explicitly submit the assignments, just ensure
   that your submission related work is merged to your `master` branch
   and pushed to your bitbucket account.

## Our workflow (for the curious).

We have a private repository on bitbucket where each of your
repositories are [submodules]. At the end of each deadline, we update
the submodules thereby getting all your assignments in one go. So if
you have missed on some commits, all you need to do is push them to
your repository and inform the TA.

[submodules]: <https://git-scm.com/book/en/v2/Git-Tools-Submodules>
