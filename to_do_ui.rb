require 'pg'
require './lib/task'
require './lib/list'

DB = PG.connect({:dbname => 'to_do'})

def start
  puts "Welcome to the To Do list!"
  list_menu
end

def list_menu
  puts "Enter 'm' to make a new list."

  if List.all != nil
    puts "Enter a list's number to select it."
    puts "Enter '-' to delete a list."
  end

  user_input = gets.chomp

  if user_input == 'm'
    #list_new
    puts "Type your new list name:"
    user_input = gets.chomp
    List.create(user_input)

    list_show

  elsif List.all != nil

    if user_input == '-'
      #list_delete
      puts "Enter the number of the list to delete:"
      list_number = gets.chomp
      list_delete(list_number) ## WRITE THIS
    elsif user_input.class == "Fixnum"
      #list_show
      list_show
    end

  else puts "I'm sorry, I can't do that."
  end

end

def list_show  # shows a list of lists
 lists = List.all
 lists.each_with_index do |list, index|
   puts "#{(index+1)} #{list.name}"
 end
  list_menu
end

def tasks_show(list_id) # shows a list of tasks
  # "#{current list name} List"
  # puts "\n"
  tasks = Task.all
  tasks.each_with_index do |task, index|
    db_status = task.status
    is_complete = nil
    if db_status == "complete"
      is_complete = "\u2713"
    elsif db_status == "active"
      is_complete = " "
    elsif db_status == "delete"
      # task.delete method WRITE THIS
    end
    puts "#{(index+1)} [ #{is_complete} ] #{task.name}"
  end
  tasks_menu
end

def tasks_menu
  if List.all != nil
    puts "Enter a task's number to mark it complete."
  end
  puts "\n"
  puts "To add a task, press 'a'"
  if List.all != nil
    puts "To delete a task, press 'd'"
  end
  puts "\n"
  puts "To return to the list menu, press 'l'"

  user_input = gets.chomp

  if user_input == "a"
    puts "Type a description for your new task:"
    name = Task.new(name,@list_id)
  elsif user_input == "d"
    puts "Enter a task's number to delete it:"
    delete_number = gets.chomp
    Task.task_delete(delete_number)
  end
end

start
