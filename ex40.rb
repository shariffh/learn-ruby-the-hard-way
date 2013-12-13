mystuff = {'apple' => "I AM APPLES!"}
puts mystuff['apple']

# this goes in mystuff.rb
module MyStuff
    def MyStuff.apple()
        puts "I AM APPLES!"
    end
end



require 'mystuff'

MyStuff.apple()

module MyStuff
    def MyStuff.apple()
        puts "I AM APPLES!"
    end

    # this is just a variable
    TANGERINE = "Living reflection of a dream"
end

require 'mystuff'

MyStuff.apple()
puts MyStuff::TANGERINE

mystuff['apple'] # get apple from hash
MyStuff.apple() # get apple from the module
MyStuff::TANGERINE # same thing, it's just a variable


class MyStuff

    def initialize()
        @tangerine = "And now a thousand years between"
    end

    attr_reader :tangerine

    def apple()
        puts "I AM CLASSY APPLES!"
    end
end


thing = MyStuff.new()
thing.apple()
puts thing.tangerine

# hash style
mystuff['apples']

# module style
mystuff.apples()
puts mystuff.tangerine

# class style
thing = MyStuff.new()
thing.apples()
puts thing.tangerine