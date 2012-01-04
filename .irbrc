# General awesome. From: http://drnicwilliams.com/2006/10/12/my-irbrc-for-consoleirb/
require 'rubygems'
require 'irb/completion'
require 'map_by_method' # gem install map_by_method
require 'what_methods'# gem install what_methods
require 'pp'

# Test Hash
h = { :one => 'sup', :two => 'nmu' }

# Test Array
a = [2, 4, 6, 8]

# Method to pretty-print object methods
# Coded by sebastian delmont
# http://snippets.dzone.com/posts/show/2916
class Object
  # Print object's methods
  def pm(*options)
    methods = self.methods
    methods -= Object.methods unless options.include? :more
    filter = options.select {|opt| opt.kind_of? Regexp}.first
    methods = methods.select {|name| name =~ filter} if filter

    data = methods.sort.collect do |name|
      method = self.method(name)
      if method.arity == 0
        args = "()"
      elsif method.arity > 0
        n = method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")})"
      elsif method.arity < 0
        n = -method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")}, ...)"
      end
      klass = $1 if method.inspect =~ /Method: (.*?)#/
      [name, args, klass]
    end
    max_name = data.collect {|item| item[0].size}.max
    max_args = data.collect {|item| item[1].size}.max
    data.each do |item| 
      print " #{ANSI_BOLD}#{item[0].to_s.rjust(max_name)}#{ANSI_RESET}"
      print "#{ANSI_GRAY}#{item[1].ljust(max_args)}#{ANSI_RESET}"
      print "   #{ANSI_LGRAY}#{item[2]}#{ANSI_RESET}\n"
    end
    data.size
  end
end

# Easily print methods local to an object's class
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

# Simple prompt. From: http://linux.die.net/man/1/irb
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:PROMPT][:SIMPLE] = {
  :PROMPT_I => ">> ",
  :PROMPT_S => "%l> ",
  :PROMPT_C => "%i> ",
  :RETURN => "%s\n"
}
IRB.conf[:PROMPT_MODE] = :SIMPLE

# Enable history. From: http://blog.nicksieger.com/articles/2006/04/23/tweaking-irb
require 'irb/ext/save-history'
IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
