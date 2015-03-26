require "rubygems"

puts ".irbrc loaded"

# Ruby shit
@arr  = %w(dog cat horse)
@hash = { :dog => "woof", :cat => "meow", :horse => "neigh" }
@str  = "This is a test string."
@num  = 9001

# GitHub shit
if defined?(GitHub::Resources)
  @jake = GitHub::Resources.find_by_url("jakeboxer")
  @org  = GitHub::Resources.find_by_url("github")
  @repo = GitHub::Resources.find_by_url("github/github")
  @team = GitHub::Resources.find_by_url("@github/cream")

  @jessicard = GitHub::Resources.find_by_url("jessicard")
end

if require "awesome_print"
  AwesomePrint.irb!
end
