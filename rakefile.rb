janus_dotfiles_exclude = %w(.vimrc .gvimrc)
dotfiles = %w(.janus .vim .vimrc .gvimrc .vimrc.after .vimrc.before .gvimrc.after .gitconfig .gitignore_global .oh-my-zsh .zshrc .zsh_custom)

task :init => [:prepare_home, :bootstrap_janus, :make_symlinks] do
end

desc "Prepare home folder"
task :prepare_home do
  for dotfile in dotfiles
    dotfile_expanded_path = File.join File.expand_path("~"), dotfile
    rm_r dotfile_expanded_path, verbose: true if File.exists? dotfile_expanded_path
  end
end

desc "Boostrap janus"
task :bootstrap_janus do
  sh "cd .vim && git checkout master && git pull && rake"
end

desc "Make symlinks of all files into home folder"
task :make_symlinks do
  for dotfile in dotfiles - janus_dotfiles_exclude
    dotfile_expanded_path = File.expand_path(dotfile)
    dest_dotfile_expanded_path = File.join File.expand_path("~"), dotfile
    ln_s dotfile_expanded_path, dest_dotfile_expanded_path, verbose: true
  end
end

task :default => :init
