# frozen_string_literal: true

@dotfiles = %w[.gitconfig .gitignore_global .oh-my-zsh .zshrc .zsh_custom .dotfiles]

def file_exists_or_symlink(path)
  File.exist?(path) || File.symlink?(path)
end

task init: %i[prepare_dotfiles prepare_home make_symlinks] do
  puts "Done"
end

desc "Prepare dotfiles"
task :prepare_dotfiles do
  puts "\nUpdate submodules"
  sh "git submodule update --init --remote --force"

  # Install vim-plug
  sh "curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
end

desc "Prepare home folder"
task :prepare_home do
  home_path = File.expand_path("~")

  puts "\nRemove dotfiles symbolik links"
  @dotfiles.each do |dotfile|
    dotfile_expanded_path = File.join home_path, dotfile
    rm_r dotfile_expanded_path, verbose: true if file_exists_or_symlink(dotfile_expanded_path)
  end
end

desc "Make symlinks of all files into home folder"
task :make_symlinks do
  home_path = File.expand_path("~")

  puts "\nCreate home symbolik links"
  @dotfiles.each do |dotfile|
    dotfile_expanded_path = File.expand_path(dotfile)
    dest_dotfile_expanded_path = File.join home_path, dotfile
    ln_s dotfile_expanded_path, dest_dotfile_expanded_path, verbose: true
  end

  dotfiles_home_path = File.join home_path, ".dotfiles"

  puts "\nCreate applications symbolik links"

  %w[
    .config/nvim/init.lua
    .config/nvim/coc-settings.json
    .config/nvim/lua
    .p10k.zsh
  ].each do |file|
    file_path = File.join(home_path, *file.split("/"))
    dotfiles_file_path = File.join(dotfiles_home_path, *file.delete_prefix(".").split("/"))

    rm_r file_path, verbose: true if file_exists_or_symlink(file_path)
    mkdir_p(File.dirname(file_path)) unless File.exist?(file_path)
    ln_s dotfiles_file_path, file_path, verbose: true
  end
end

task default: :init
