task :default => [:install]

@backup_folder = ".dotfiles"
@home_path = File.expand_path('~')
@file_dir_path = File.dirname(__FILE__)

@vim_files = FileList["vimrc", "vim"]
@git_files = FileList["gitconfig", "gitignore_global"]
@zsh_files = FileList["zshrc", "oh-my-zsh/custom/reaper.zsh", "oh-my-zsh/custom/reaper/git_extra.zsh"]
@script_files = FileList["scripts"]

@files = [@vim_files, @git_files, @zsh_files, @script_files].flatten


desc "Copy files from dotfiles to home directory and build"
task :install do
  # Backup files
  Rake::Task["backup"].invoke

  # Replace files from dotfiles folder to home
  Rake::Task["replace"].invoke

  # Cleanup dotfiles backup folder 
  Rake::Task["cleanup"].invoke

  # Update vim plugins
  Rake::Task["get_vim_plugins"].invoke

  # Post install
  Rake::Task["post_install"].invoke
end


desc "Cleanup backup directory"
task :cleanup do

  puts "\nCleanup ~/.dotfiles directory"
  puts "------------------------------------------------"

  destination_dir = File.join(@home_path, @backup_folder)

  # Get folders list
  folders = Dir.entries(destination_dir).reject{|entry| entry == "." || entry == ".."}.sort.reverse

  # Remove old folders and keep five lasts
  if folders.size > 10
    first_ten_folder = folders[0, 10]
    folders_to_remove = folders - first_ten_folder

    for folder in folders_to_remove
      folder_path = File.join(destination_dir, folder)
      FileUtils.rm_rf(folder_path)
      puts "Removed '#{folder_path}'"
    end
    puts "Done."
  else
    puts "Nothing to remove."
  end
end


desc "Backup dot files"
task :backup do

  puts "\nBackup dot files in ~/.dotfiles directory"
  puts "------------------------------------------------"

  timestamp = Time.now.getutc.strftime("%Y%m%d%H%M%S")
  destination_dir = File.join(@home_path, @backup_folder, timestamp)

  FileUtils.mkdir_p(destination_dir, :verbose => true)
  copy_files(@files, @home_path, destination_dir)

  puts "Done."
end


desc "Replace files"
task :replace do

  puts "\nReplace files to the home directory"
  puts "------------------------------------------------"

  copy_files(@files, @file_dir_path, @home_path)

  puts "Done."
end


desc "Get vim plugins"
task :get_vim_plugins do

  puts "\nGet vim plugins"
  puts "------------------------------------------------"

  vim_path = File.join(@home_path, ".vim")

  FileUtils.mkdir_p(File.join(vim_path, "bundle"), :verbose => true)
  ruby File.join(vim_path, "update_vim.rb")

  puts "Done."
end


desc "Do post installation tasks"
task :post_install do

  puts "\nPost install tasks"
  puts "------------------------------------------------"

  cmds << "sudo apt install -y clang exuberant-ctags"
  cmds << "cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer"

  for cmd in cmds
    system cmd
  end

  puts "Done."
end


# Copy files from a source dir to a destination dir
def copy_files(files, source_dir, destination_dir)

  for file in files
    file_path = File.join(source_dir, file) 

    if File.exist?(file_path)
      if File.directory?(file_path)

        full_destination_folder = File.join(destination_dir, File.basename(file).prepend("."))
        FileUtils.rm_r(full_destination_folder, :force => true, :verbose => true)
        FileUtils.cp_r(file_path, full_destination_folder, :verbose => true)
      else
        dir_name = File.dirname(file)

        if(dir_name.eql?("."))
          FileUtils.mkdir_p(destination_dir, :verbose => true)
          FileUtils.cp_r(file_path, File.join(destination_dir, File.basename(file).prepend(".")), :verbose => true)
        else
          full_destination_folder = File.join(destination_dir, dir_name.prepend("."))
          FileUtils.mkdir_p(full_destination_folder, :verbose => true)
          FileUtils.cp_r(file_path, File.join(full_destination_folder, File.basename(file)), :verbose => true)
        end
      end
    end
  end
end
