# GIT EXTRA
#
# Created by Pierre FILSTROFF

# Fix slow git completion
function __git_files () { 
  _wanted files expl 'local files' _files
}

# Check if Git repository type is svn
# Return 1 if true, 0 if false
function is_git_svn_clone() { 
  git_svn_info=$(git config -z --get-regexp '^(svn-remote\..*\.url|bash\.showupstream)$' 2>/dev/null | tr '\0\n' '\n ')
  if [ -n "$git_svn_info" ]; then echo 1; else echo 0; fi
}

# Pull with svn rebase if git repository type is svn
# or pull with git
function up() { 
  if [ $(is_git_svn_clone) -eq 1 ]; then git svn rebase; else git pull; fi
}

# Push with svn dcommit if git repository type is svn
# or push with git
function push() { 
  if [ $(is_git_svn_clone) -eq 1 ]; then git svn dcommit; else git push; fi
}
