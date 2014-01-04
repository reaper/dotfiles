#!/usr/bin/env ruby

git_bundles = [ 
  "git://github.com/astashov/vim-ruby-debugger.git",
  "git://github.com/majutsushi/tagbar.git",
  "git://github.com/ervandew/supertab.git",
  "git://github.com/vim-scripts/The-NERD-tree.git",
  "git://github.com/vim-scripts/The-NERD-Commenter.git",
  "git://github.com/tomtom/tcomment_vim.git",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-haml.git",
  "git://github.com/tpope/vim-rails.git",
  "git://github.com/tpope/vim-surround.git",
  "git://github.com/tsaleh/vim-matchit.git",
  "git://github.com/vim-ruby/vim-ruby.git",
  "git://github.com/vim-scripts/Gist.vim.git",
  "git://github.com/vim-scripts/jQuery.git",
  "git://github.com/othree/html5.vim.git",
  "git://github.com/Lokaltog/powerline.git",
  "git://github.com/mileszs/ack.vim.git",
  "git://github.com/tpope/vim-bundler.git",
  "git://github.com/hron84/Gemfile.vim.git",
  "git://github.com/kchmck/vim-coffee-script.git",
  "git://github.com/tpope/vim-rvm.git",
  "git://github.com/ecomba/vim-ruby-refactoring.git",
  "git://github.com/clones/vim-zsh.git",
  "git://github.com/xolox/vim-session.git",
  "git://github.com/nathanaelkane/vim-indent-guides.git",
  "git://github.com/jabbourb/omnicpp.git",
  "https://bitbucket.org/kh3phr3n/vim-qt-syntax.git",
  "git://github.com/vim-jp/cpp-vim.git",
  "git://github.com/msanders/cocoa.vim.git",
  "git://github.com/vim-scripts/DoxygenToolkit.vim.git",
  "git://github.com/plasticboy/vim-markdown.git",
  "git://github.com/sjl/gundo.vim.git",
  "git://github.com/vim-scripts/L9.git",
  "git://github.com/vim-scripts/FuzzyFinder.git",
  "git://github.com/nanotech/jellybeans.vim.git",
  "git://github.com/tpope/vim-abolish.git",
  "git://github.com/xolox/vim-misc.git",
  "git://github.com/scrooloose/syntastic.git",
  "git://github.com/vim-scripts/rails.vim.git",
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
