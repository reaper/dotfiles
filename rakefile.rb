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
  dotfiles_plug_path = File.join(File.dirname(__FILE__), ".dotfiles", "config", "nvim", "autoload", "plug.vim")
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

  # NVIM
  config_nvim_path = File.join home_path, ".config", "nvim"
  dotfiles_nvim_path = File.join dotfiles_home_path, "config", "nvim"

  rm_r config_nvim_path, verbose: true if file_exists_or_symlink(config_nvim_path)
  ln_s dotfiles_nvim_path, config_nvim_path, verbose: true

  styles_path = File.join home_path, ".config", "QtProject", "qtcreator", "styles"
  mkdir_p styles_path, verbose: true unless File.exists?(styles_path)

  # QTCreator wombat colorscheme
  tools_wombat_colorscheme_path = File.join dotfiles_home_path, "themes", "qt", "wombat-theme", "wombat-style.xml"
  wombat_colorscheme_path = File.join styles_path, "wombat-style.xml"

  rm_r wombat_colorscheme_path, verbose: true if file_exists_or_symlink(wombat_colorscheme_path)
  ln_s tools_wombat_colorscheme_path, wombat_colorscheme_path, verbose: true
end

task :default => :init
