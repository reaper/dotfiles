@dotfiles = %w(.gitconfig .gitignore_global .oh-my-zsh .zshrc .zsh_custom .dotfiles)

def file_exists_or_symlink path
  File.exists?(path) || File.symlink?(path)
end

task :init => [:prepare_dotfiles, :prepare_home, :make_symlinks] do
  puts "Done"
end

desc "Prepare dotfiles"
task :prepare_dotfiles do
  puts "\nUpdate submodules"
  sh "git submodule update --init --remote"

  # Install vim-plug
  dotfiles_plug_path = File.join(File.dirname(__FILE__), ".dotfiles", "config", "vim", "vim", "autoload", "plug.vim")
  sh "curl -fLo #{dotfiles_plug_path} --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" unless File.exists?(dotfiles_plug_path)
end

desc "Prepare home folder"
task :prepare_home do
  home_path = File.expand_path("~")

  puts "\nRemove dotfiles symbolik links"
  for dotfile in @dotfiles
    dotfile_expanded_path = File.join home_path, dotfile
    rm_r dotfile_expanded_path, verbose: true if file_exists_or_symlink(dotfile_expanded_path)
  end
end

desc "Make symlinks of all files into home folder"
task :make_symlinks do
  home_path = File.expand_path("~")

  puts "\nCreate home symbolik links"
  for dotfile in @dotfiles
    dotfile_expanded_path = File.expand_path(dotfile)
    dest_dotfile_expanded_path = File.join home_path, dotfile
    ln_s dotfile_expanded_path, dest_dotfile_expanded_path, verbose: true
  end

  dotfiles_home_path = File.join home_path, ".dotfiles"

  puts "\nCreate applications symbolik links"

  # VIM
  vim_home_path = File.join home_path, ".vim"
  dotfiles_vim_path = File.join dotfiles_home_path, "config", "vim", "vim"

  rm_r vim_home_path, verbose: true if file_exists_or_symlink(vim_home_path)
  ln_s dotfiles_vim_path, vim_home_path, verbose: true

  vimrc_path = File.join home_path, ".vimrc"
  dotfiles_vimrc_path = File.join dotfiles_home_path, "config", "vim", "vimrc"

  rm_r vimrc_path, verbose: true if file_exists_or_symlink(vimrc_path)
  ln_s dotfiles_vimrc_path, vimrc_path, verbose: true
end

task :default => :init
