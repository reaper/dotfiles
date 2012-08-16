#!/usr/bin/env ruby

git_bundles = [ 
  "git://github.com/astashov/vim-ruby-debugger.git",
  "git://github.com/ervandew/supertab.git",
  "git://github.com/godlygeek/tabular.git",
  "git://github.com/msanders/snipmate.vim.git",
  "git://github.com/jelera/vim-javascript-syntax.git",
  "git://github.com/vim-scripts/The-NERD-tree.git",
  "git://github.com/vim-scripts/The-NERD-Commenter.git",
  "git://github.com/timcharper/textile.vim.git",
  "git://github.com/tomtom/tcomment_vim.git",
  "git://github.com/tpope/vim-cucumber.git",
  "git://github.com/tpope/vim-endwise.git",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-git.git",
  "git://github.com/tpope/vim-haml.git",
  "git://github.com/tpope/vim-markdown.git",
  "git://github.com/tpope/vim-rails.git",
  "git://github.com/tpope/vim-repeat.git",
  "git://github.com/tpope/vim-surround.git",
  "git://github.com/tpope/vim-vividchalk.git",
  "git://github.com/tsaleh/vim-matchit.git",
  "git://github.com/tsaleh/vim-shoulda.git",
  "git://github.com/tsaleh/vim-tmux.git",
  "git://github.com/vim-ruby/vim-ruby.git",
  "git://github.com/vim-scripts/Gist.vim.git",
  "git://github.com/altercation/vim-colors-solarized.git",
  "git://github.com/vim-scripts/IndexedSearch.git",
  "git://github.com/vim-scripts/jQuery.git",
  "git://github.com/othree/html5-syntax.vim.git",
  "git://github.com/scrooloose/syntastic.git",
  "git://github.com/Lokaltog/vim-powerline.git",
  "git://github.com/akitaonrails/vimfiles.git",
  "git://github.com/mileszs/ack.vim.git",
  "git://github.com/tpope/vim-bundler.git",
  "git://github.com/hron84/Gemfile.vim.git",
  "git://github.com/kchmck/vim-coffee-script.git",
  "git://github.com/tpope/vim-rvm.git",
  "git://github.com/vim-scripts/Better-CSS-Syntax-for-Vim.git",
  "git://github.com/ecomba/vim-ruby-refactoring.git",
  "git://github.com/clones/vim-zsh.git",
  "git://github.com/xolox/vim-session.git",
  "git://github.com/nathanaelkane/vim-indent-guides.git"
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end
