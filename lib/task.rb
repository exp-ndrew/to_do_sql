require 'pg'

class Task

  attr_accessor(:name, :list_id, :status)

  def initialize(name, list_id)
    @name = name
    @list_id = list_id
    @status = "active"
  end

  def task_delete
      # make task delete method which contains
      # puts 'This will delete the task "@name".'
      # puts 'Is this okay? Type yes or no:"
      # "#{@name} deleted!"
  end

  def save
    DB.exec("INSERT INTO tasks (name, list_id, status) VALUES ('#{@name}', #{@list_id}, '#{@status}');")
  end

  def self.all
    results = DB.exec("SELECT * FROM tasks;")
    tasks = []
    results.each do |result|
      name = result['name']
      list_id = result['list_id'].to_i
      status = result['status']
      tasks << Task.new(name, list_id, status)
    end
    tasks
  end

  def ==(another_task)
    self.name == another_task.name && self.list_id == another_task.list_id
  end

end

