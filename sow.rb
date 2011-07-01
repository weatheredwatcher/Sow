#
#  Basic Ruby script to create a new project for basic web development
#
#  Author: David Duggins
#  Email: weatheredwatcher@gmail.com
#
#  Created: 5/4/2010
#  License: GPL2
#

require 'fileutils'
require 'net/http'
#OPTIONS

# Here you can define the directory structure that you want on the base level
dir_structure = ['stylesheets','javascript','images','db']
javascript_dir = 'javascript'

#TODO Need to add some code for css and maybe some automatic image stuff
css_dir = 'stylesheets'


# This makes sure that a variable has been passed
if ARGV.length == 0
  puts "Please enter the name of your Project"
  exit 0
end

# Sets the project name
project = ARGV[0]
FileUtils.mkdir_p project
puts "#{project}:CREATED"
FileUtils.cd project
# Creates a XHTML Strict Doctype Index file
File.open("index.html", 'w') {|file|
file.puts "<!DOCTYPE html>"
file.puts "<html>"
file.puts " <head>"
file.puts "   <title></title>"
file.puts " </head>"
file.puts " <body>"
file.puts " "
file.puts " </body>"
file.puts "</html>"}
puts "index.html........done"



# Runs through the array defined in options to create the Directory Structure.

dir_structure.each do |i|
  FileUtils.mkdir_p i
  puts "#{i}:CREATED"
end
#Here we load the base CSS file
File.open("stylesheets/style.css", 'w'){ |file|
file.puts "# Insert style Here"
}
puts "style.css.....done"
#this is where we load the JavaScript Libraries into the JavaScript folder
FileUtils.cd javascript_dir
Net::HTTP.start("script.aculo.us") { |http|
  resp = http.get("/dist/scriptaculous-js-1.8.3.tar.bz2")
  open("scriptaculous-js-1.8.3.tar.bz2", "wb") { |file|
    file.write(resp.body)
   }
}
puts "Prototype.........Downloaded"
puts "Scriptaculous.....Downloaded"
=begin
  TODO Need to add some code to extract the prototype/scriptaculous libraries
=end
Net::HTTP.start("code.jquery.com") { |http|
  resp = http.get("/jquery-1.4.2.js")
  open("jquery-1.4.2.js", "wb") { |file|
    file.write(resp.body)
   }
}
puts "JQuery............Downloaded"

Net::HTTP.start("mootools.net") { |http|
  resp = http.get("/download/get/mootools-1.2.4-core-nc.js")
  open("mootools-1.2.4-core-nc.js", "wb") { |file|
    file.write(resp.body)
   }
}
puts "MooTools..........Downloaded"

