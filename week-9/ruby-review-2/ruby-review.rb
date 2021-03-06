# Drawer Debugger

# I worked on this challenge [by myself, with: ].
# I spent [#] hours on this challenge.

# Original Code

class Drawer

attr_reader :contents

# Are there any more methods needed in this class?

  def initialize
    @contents = []
    @open = true
  end

  def open
    @open = true
  end

  def close
    @open = false
  end

  def add_item(item)
    @contents << item
  end

  def remove_item(item = @contents.pop) #what is `#pop` doing?
    @contents.delete(item)
  end

  def dump  # what should this method return?
    @contents = []
    puts "Your drawer is empty."
  end

  def view_contents
    puts "The drawer contains:"
    @contents.each {|silverware| puts "- " + silverware.type }
  end

end

class Silverware
  attr_reader :type
  attr_reader :clean

  # Are there any more methods needed in this class?

  def initialize(type, clean = true)
    @type = type
    @clean = clean
  end

  def eat
    puts "eating with the #{type}"
    @clean = false
  end

  def clean_silverware
    @clean = true
  end

end



# DO NOT MODIFY THE DRIVER CODE UNLESS DIRECTED TO DO SO
knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1)
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork"))
silverware_drawer.view_contents

silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware
raise Exception.new("Your silverware is not actually clean!") unless removed_knife.clean_silverware == true

silverware_drawer.view_contents
silverware_drawer.dump
raise Exception.new("Your drawer is not actually empty") unless silverware_drawer.contents.empty?
silverware_drawer.view_contents

# What will you need here in order to remove a spoon? You may modify the driver code for this error.
spoon = Silverware.new("spoon")
silverware_drawer.add_item(spoon)
raise Exception.new("You don't have a spoon to remove") unless
silverware_drawer.contents.include?(spoon)
silverware_drawer.remove_item(spoon) #What is happening when you run this the first time?
spoon.eat
puts spoon.clean #=> this should be false

# DRIVER TESTS GO BELOW THIS LINE

cat = Silverware.new("cat")
silverware_drawer.add_item(cat)
silverware_drawer.view_contents
cat1 = Silverware.new("cat")
silverware_drawer.add_item(cat1)
silverware_drawer.view_contents



# Reflection

# CORRECTIVE STEPS BELOW!
# 1. Add "end" to class Drawer
# 2. Line 27 added an argument to add_item method
# 3. Line 61-63 added clean_silverware method
# 4. Line 36, in dump method, made @contents = empty array
# 5. Line 99-100, create new spoon Silverware instance, then adding it to our Silverware_drawer (instance of Drawer)
# 6. Add attr_reader method to Silverware class

=begin

What concepts did you review in this challenge?
We reviewed debugging. It actually felt REALLY natural, which was quite a comfort to walk back into.

What is still confusing to you about Ruby?
I guess the limitations of classes, the different forms of variables, and how relationships work between objects in Ruby. That's a really nebulous way to put it, but the vocabulary and the bulk of the syntax itself is amazingly clear... there are just some dark spots and little questions lingering about access.

What are you going to study to get more prepared for Phase 1?
Going through the Ruby challenges! Rubeque, Codecademy, etc.

=end