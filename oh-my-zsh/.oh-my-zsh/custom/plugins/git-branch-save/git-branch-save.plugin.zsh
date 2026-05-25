   # Variable to store the branch name
   local gitbranch=""

   # Function to save the current Git branch
   function git_branch_save {
       gitbranch=$(git rev-parse --abbrev-ref HEAD)
       echo "Branch saved: $gitbranch"
   }

   # Function to load the saved Git branch
   function git_branch_load {
       if [[ -n $gitbranch ]]; then
           git checkout $gitbranch
       else
           echo "No branch saved."
       fi
   }

   alias gbs='git_branch_save'
   alias gbl='git_branch_load'
