require 'task'
require 'rspec'

describe Task do
  it 'is initialized with a name' do
    task = Task.new('learn SQL')
    task.should be_an_instance_of Task
  end

  it 'tells you its name' do
    task = Task.new('learn SQL')
    task.name.should eq 'learn SQL'
  end

  it 'starts with no tasks' do
    Task.all.should eq []
  end

  it "lets you save tasks to the database" do
    task = Task.new('learn SQL')
    task.save
    Task.all.should eq [task]
  end
end
