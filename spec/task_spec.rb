require 'spec_helper'

describe Task do
  it 'is initialized with a name and a task ID' do
    task = Task.new('learn SQL', 1, 'active')
    task.should be_an_instance_of Task
  end

  it 'tells you its name' do
    task = Task.new('learn SQL', 1, 'active')
    task.name.should eq 'learn SQL'
  end

  it 'tells you its list ID' do
    task = Task.new("learn SQL", 1, 'active')
    task.list_id.should eq 1
  end

  it 'starts with no tasks' do
    Task.all.should eq []
  end

  it "lets you save tasks to the database" do
    task1 = Task.new('learn SQL', 1, 'active')
    task2 = Task.new('learn ruby', 2, 'active')
    task1.save
    task2.save
    Task.all.should eq [task1, task2]
  end

  it 'is the same task if it has the same name and list ID' do
    task1 = Task.new('learn SQL', 1, 'active')
    task2 = Task.new('learn SQL', 1, 'active')
    task1.should eq task2
  end
end
