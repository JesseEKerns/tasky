require_relative "Task.rb"
def list_tasks
  puts
  puts "TASKS TO COMPLETE:"
  puts "=" * 18
  puts Task.list_tasks
end

command = ARGV.first
command2 = ARGV[1] 

case command
when "add" 
  print("What do you need to do?: ")
  task_string = STDIN.gets
  task = Task.new(task_string)
  task.save
  list_tasks

when "list"
  list_tasks
when "complete"
  Task.complete_task(command2.to_i)
  list_tasks

else 
  print("Re-type command: ")
  abort
end	