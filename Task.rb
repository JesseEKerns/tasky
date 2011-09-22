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
			line_array.delete_at(task_number - 1)
		File.open("Tasks.txt", "w") do |file|
			line_array.each{|line| file.puts(line)}
		end	
		#delete the line
		puts "Completed line #{task_number}! You rock!" 
	end
end

# def delete_lines_from_file(filename, lines_to_delete)
  # line_arr = File.readlines(filename)
  # lines_to_delete.each do |index|
    # line_arr.delete_at(index)
  # end 
  # File.open(filename, "w") do |f| 
    # line_arr.each{|line| f.puts(line)}
  # end
# end