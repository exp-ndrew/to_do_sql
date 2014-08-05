class List

  attr_accessor(:name, :id)

  def initialize(name, id=nil)
    @name = name
    @id = id
  end

  def self.create(name)
    list = List.new(name)
    list.save
  end

  def save
    results = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def delete
    DB.exec("DELETE FROM lists WHERE id = #{self.id}")
  end

  def ==(another_list)
    self.name == another_list.name
  end

  def self.all
    results = DB.exec("SELECT * FROM lists;")
    lists = []
    results.each do |result|
      name = result['name']
      id = result['id']
      lists << List.new(name, id)
    end
    lists
  end
end
