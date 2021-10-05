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
  sh "curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
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

  nvim_init_path = File.join home_path, ".config", "nvim", "init.lua"
  dotfiles_nvim_init_path = File.join dotfiles_home_path, "config", "nvim", "init.lua"

  rm_r nvim_init_path , verbose: true if file_exists_or_symlink(nvim_init_path)
  mkdir_p File.dirname(nvim_init_path) unless File.directory?(nvim_init_path)
  ln_s dotfiles_nvim_init_path, nvim_init_path, verbose: true
end

task :default => :init
