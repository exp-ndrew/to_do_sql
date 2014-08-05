require 'pg'
require './lib/task'
require './lib/list'

DB = PG.connect({:dbname => 'to_do'})

def root_menu
  puts "Welcome to the To Do list!"
  puts "Enter 'm' to make a new list."

  if List.all != nil
    puts "Enter a list's number to select it."
    puts "Enter '-' to delete a list."
  end

  user_input = gets.chomp
  if user_input == 'm'
    list_show
  elsif List.all != nil
    if user_input == '-'
      puts "Enter the number of the list to delete:"
      list_number = gets.chomp
      list_delete(list_number)
    elsif user_input == #digit
      list_show(digit)
    end
  else puts "Sorry, that was not a valid input. Try again."
  end

end

# def menu_status

# end

def list_show(digit)
  tasks = Task.all
  tasks.each_with_index do |task, index|
    puts "#{(index+1)} [ #{task.status} ] #{task.name}"
  end
  list_menu
end


def list_menu

end


def task_show

  task_menu
end


def task_menu

end

list_show(1)

