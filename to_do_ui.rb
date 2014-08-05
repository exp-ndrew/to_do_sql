require 'pg'
require './lib/task'

DB = PG.connect({:dbname => 'to_do'})

def welcome
  puts "Welcome to the To Do list!"
  menu
end

def root_menu

end

def list_menu

end

def list_show

end

def task_menu

end

def task_show

end

