require 'pg'
require './lib/task'
require './lib/list'
require 'pry'

DB = PG.connect({:dbname => 'to_do'})
@current_list = nil

def start
  puts "Welcome to the To Do list!"
  puts "Pick an option"

  puts "n = new list"
  puts "l = list lists"
  puts "s = select list"
  puts "c = create task"
  puts "t = list tasks"
  puts "d = delete a task"

  menu_option = gets.chomp

  if menu_option == 'n'
    create_list
  elsif menu_option == 'l'
    list_lists
  elsif menu_option == 'c'
    create_task
  elsif menu_option == 't'
    list_task
  elsif menu_option == 'd'
    delete_task
  end
end

def create_task
  puts "enter task name"
  task_name = gets.chomp
  Task.create(task_name)

  start
end

def list_task
  tasks = Task.all

  tasks.each do |task|
    p "#{task.name}"
  end

  start
end

def delete_task
  puts "enter name of task to delete"
  tasks = Task.all
  tasks.each do |task|
    p "#{task.name}"
  end
  delete_name = gets.chomp
  tasks.each do |task|
    if delete_name == task.name
      puts "in the delete"
      DB.exec("DELETE FROM tasks WHERE name LIKE '#{task.name}'")
    end
  end
  start
end

def create_list
  puts "enter list name"
  list_name = gets.chomp
  List.create(list_name)

  start
end

def list_lists
  lists = List.all

  lists.each do |list|
    p "#{list.name}"
  end

  start
end

# def select_list
#   puts "type the name of a list to select"
#   list_selector = gets.chomp
#   @current_list_id = DB.exec("SELECT FROM lists WHERE name LIKE #{list_selector}")

#   DB.exec("SELECT * FROM tasks WHERE list_id = #{@current_list_id};")
# end


start
