janus_dotfiles_exclude = %w(.vimrc .gvimrc)
dotfiles = %w(.janus .vim .vimrc .gvimrc .vimrc.after .vimrc.before .gvimrc.after .gitconfig .gitignore_global .oh-my-zsh .zshrc .zsh_custom .tools)

def file_exists_or_symlink path
  File.exists?(path) || File.symlink?(path)
end

task :init => [:prepare_dotfiles, :prepare_home, :bootstrap_janus, :make_symlinks] do
  puts "Done"
end

desc "Prepare dotfiles"
task :prepare_dotfiles do
  puts "\nUpdate submodules"
  submodule_up_cmd = "git submodule update --init"
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

  puts "\nRemove application symbolik links"
  #QT wombat colorscheme
  wombat_colorscheme_path = File.join home_path, ".config", "QtProject", "qtcreator", "styles", "wombat-style.xml"
  rm_r wombat_colorscheme_path, verbose: true if file_exists_or_symlink(wombat_colorscheme_path)
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

  puts "\nCreate applications symbolik links"
  #QT wombat colorscheme
  tools_wombat_colorscheme_path = File.join home_path, ".tools", "themes", "qt", "wombat-theme", "wombat-style.xml"
  wombat_colorscheme_path = File.join home_path, ".config", "QtProject", "qtcreator", "styles", "wombat-style.xml"
  mkdir_p File.dirname(wombat_colorscheme_path), verbose: true unless File.exists?(File.dirname(wombat_colorscheme_path))
  ln_s tools_wombat_colorscheme_path, wombat_colorscheme_path, verbose: true
end

task :default => :init
