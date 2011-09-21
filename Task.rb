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
		File.read("Tasks.txt") 
	end
	def delete
		File.open("Tasks.txt", "a") do |file|
			file.delete @name
		end
	end	
end
