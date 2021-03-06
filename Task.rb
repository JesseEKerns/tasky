class Task

  def initialize(task_string)
    @name = task_string
  end

  def save
    File.open("Tasks.txt", "a") do |file|
      file.puts @name
    end
  end

  def self.list_tasks
    File.open("Tasks.txt", "r") do |file|
      file.each_line do |line| 
        puts "#{file.lineno}: #{line}"
      end
    end
  end

  def self.complete_task(task_number)
  #open the file 
    line_array = File.readlines("Tasks.txt")
    deleted = line_array.delete_at(task_number - 1).chomp
    File.open("Tasks.txt", "w") do |file|
      line_array.each{|line| file.puts(line)}
    end
   
    puts "You completed task '#{deleted}'!"
    print_congrats

  end
  def self.print_congrats
    cmessages = ["Rock On!", "Oh Yeah!", "Woot woot!", "Ohhh"]
    congrats = cmessages.sample
    puts congrats
  end
end