require 'colorize'

actions = [
	"install",	# 0
	"uninstall",	# 1
	"search",	# 2

	"help", 	# 3
	"-h"		# 4
]

action = ARGV[0]
packet = ARGV[1]
repository = "https://bacalex.github.io/PacalexRepository/#{packet}.html"

if action == actions[0]
	wget = system("wget #{repository}")
	puts "#{wget}".green
	puts "parsing repository..".yellow
	touch = system("touch #{packet}.zip")
	puts "#{touch}".green
	puts "add packet..".yellow

	x = File.read("#{packet}.html")
	File.write("#{packet}.zip",x)
	puts "unzip packet..".yellow
	unzip = system("unzip #{packet}.zip")
	puts "#{unzip}".yellow
	
	system("rm #{packet}.zip")
	system("rm #{packet}.html")	
	
	begin
		config = File.write("#{packet}.conf")
	rescue
		puts "config is not found"
	end

	eval(config)
	puts "config start.."

elsif action == actions[1]
	puts "soon.."
elsif action == actions[2]
	puts "soon.."
else
	puts false
end
