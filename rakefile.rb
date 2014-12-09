janus_dotfiles_exclude = %w(.vimrc .gvimrc)
dotfiles = %w(.janus .vim .vimrc .gvimrc .vimrc.after .vimrc.before .gvimrc.after .gitconfig .gitignore_global .oh-my-zsh .zshrc .zsh_custom)

task :init => [:prepare_dotfiles, :prepare_home, :bootstrap_janus, :make_symlinks] do
end

desc "Prepare dotfiles"
task :prepare_dotfiles do
  puts "\nUpdating submodules"
  submodule_up_cmd = "git submodule update --init"
  sh submodule_up_cmd

  puts "\nUpdating plugins submodules"
  for plugin in Dir.glob File.join(".janus", "*")
    sh "cd #{plugin} && #{submodule_up_cmd}"
  end
end

desc "Prepare home folder"
task :prepare_home do
  puts "\nRemove dotfiles symbolik links"
  for dotfile in dotfiles
    dotfile_expanded_path = File.join File.expand_path("~"), dotfile
    rm_r dotfile_expanded_path, verbose: true if File.exists? dotfile_expanded_path
  end
end

desc "Boostrap janus"
task :bootstrap_janus do
  puts "\nInitializing janus"
  sh "cd .vim && git checkout master && git pull && rake"
end

desc "Make symlinks of all files into home folder"
task :make_symlinks do
  puts "\nCreating symbolik links"
  for dotfile in dotfiles - janus_dotfiles_exclude
    dotfile_expanded_path = File.expand_path(dotfile)
    dest_dotfile_expanded_path = File.join File.expand_path("~"), dotfile
    ln_s dotfile_expanded_path, dest_dotfile_expanded_path, verbose: true
  end
end

task :default => :init
