class List

  attr_accessor(:name, :id)

  def initialize(name)
    @name = name
  end

  def self.create(name)
    list = List.new(name)
    list.save
  end

  def list_delete
      #make List method which contains
      #puts 'This will delete all tasks in the "House".'
      #puts 'Is this okay? Type yes or no:"
      # House list deleted!
  end

  def ==(another_list)
    self.name == another_list.name
  end

  def save
    results = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    results = DB.exec("SELECT * FROM lists;")
    lists = []
    results.each do |result|
      name = result['name']
      lists << List.new(name)
    end
    lists
  end
end
