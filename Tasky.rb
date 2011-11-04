require_relative "Task.rb"
def list_tasks
  puts
  puts "TASKS TO COMPLETE:"
  puts "=" * 17
  Task.list_tasks
  puts
end

def run_command(command)
  case command
  when "a" 
    print("What's the new task?: ")
    task_string = STDIN.gets
    task = Task.new(task_string)
    task.save
    list_tasks

  when "l"
    list_tasks
  when "c"
    list_tasks
    print("What number task did you complete?: ")
    Task.complete_task(gets.to_i)
    list_tasks
  when "s"
    puts "Sort the list"
  when "q"
    puts "Later homie!"
    return false
  else 
    puts
    puts "Invalid command. Try again you lazy bum!"
  end
  true
end

def get_input
  gets.chomp
end

def print_menu
  puts
  puts "What do you want to do?"
  commands = ["add task", "list task", "complete task", "sort tasks", "quit program"]
  commands.sort.each do |command| 
    puts "   (#{command[0]})#{command[1..-1]}"
  end
end

while(true)
  print_menu
  input = get_input
  break unless run_command(input)
end

