require 'pg'

class Task
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def save
    database = PG.connect(:dbname => 'to_do')
    database.exec("INSERT INTO tasks (name) VALUES ('#{@name}');")

  end
end

