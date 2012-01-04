# General awesome. From: http://drnicwilliams.com/2006/10/12/my-irbrc-for-consoleirb/
require 'rubygems'
require 'irb/completion'
require 'pp'

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

# Test Hash
def th
  @th ||= { :one => 'sup', :two => 'nmu' }
end

# Test Array
def ta
  @ta ||= [2, 4, 6, 8]
end
