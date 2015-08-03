janus_dotfiles_exclude = %w(.vimrc .gvimrc)
dotfiles = %w(.janus .vim .vimrc .gvimrc .vimrc.after .vimrc.before .gvimrc.after .gitconfig .gitignore_global .oh-my-zsh .zshrc .zsh_custom .dotfiles)

def file_exists_or_symlink path
  File.exists?(path) || File.symlink?(path)
end

task :init => [:prepare_dotfiles, :prepare_home, :bootstrap_janus, :make_symlinks] do
  puts "Done"
end

desc "Prepare dotfiles"
task :prepare_dotfiles do
  puts "\nUpdate submodules"
  submodule_up_cmd = "git submodule update --init --remote"
  sh submodule_up_cmd

  puts "\nUpdating plugins submodules"
  for plugin in Dir.glob File.join(".janus", "*")
    sh "cd #{plugin} && #{submodule_up_cmd}"
  end
end

desc "Prepare home folder"
task :prepare_home do
  home_path = File.expand_path("~")

  puts "\nRemove dotfiles symbolik links"
  for dotfile in dotfiles
    dotfile_expanded_path = File.join home_path, dotfile
    rm_r dotfile_expanded_path, verbose: true if file_exists_or_symlink(dotfile_expanded_path)
  end
end

desc "Boostrap janus"
task :bootstrap_janus do
  puts "\nInitializing janus"
  sh "cd .vim && git checkout master && git pull && rake"
end

desc "Make symlinks of all files into home folder"
task :make_symlinks do
  home_path = File.expand_path("~")

  puts "\nCreate home symbolik links"
  for dotfile in dotfiles - janus_dotfiles_exclude
    dotfile_expanded_path = File.expand_path(dotfile)
    dest_dotfile_expanded_path = File.join home_path, dotfile
    ln_s dotfile_expanded_path, dest_dotfile_expanded_path, verbose: true
  end

  dotfiles_home_path = File.join home_path, ".dotfiles"

  puts "\nCreate applications symbolik links"
  styles_path = File.join home_path, ".config", "QtProject", "qtcreator", "styles"
  mkdir_p styles_path, verbose: true unless File.exists?(styles_path)

  #QTCreator wombat colorscheme
  tools_wombat_colorscheme_path = File.join dotfiles_home_path, "themes", "qt", "wombat-theme", "wombat-style.xml"
  wombat_colorscheme_path = File.join styles_path, "wombat-style.xml"

  rm_r wombat_colorscheme_path, verbose: true if file_exists_or_symlink(wombat_colorscheme_path)
  ln_s tools_wombat_colorscheme_path, wombat_colorscheme_path, verbose: true

  #QTCreator themes
  for theme_file_path in Dir.glob(File.join(dotfiles_home_path, "themes", "qt", "qtcreator-themes", "*.xml"))
    style_file_path = File.join styles_path, File.basename(theme_file_path)

    rm_r style_file_path, verbose: true if file_exists_or_symlink(style_file_path)
    ln_s theme_file_path, style_file_path, verbose: true
  end
end

task :default => :init
