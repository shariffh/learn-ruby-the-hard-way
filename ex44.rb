class Parent

    def override()
        puts "PARENT override()"
    end

    def implicit()
        puts "PARENT implicit()"
    end

    def altered()
        puts "PARENT altered()"
    end
end

class Child < Parent
    
    def override()
        puts "CHILD override()"
    end

    def altered()
        puts "CHILD, BEFORE PARENT altered()"
        super()
        puts "CHILD, AFTER PARENT altered()"
    end
end
puts "\n INHEHERITANCE"
puts "**************"
dad = Parent.new() # PARENT implicit()
son = Child.new()  # PARENT implicit()

dad.implicit()     # PARENT override()
son.implicit()     # CHILD implicit()

dad.override()     # PARENT altered()
son.override()     # CHILD, BEFORE PARENT altered()

dad.altered()      # PARENT altered()
son.altered()      # CHILD, AFTER PARENT altered()


puts "\n COMPOSITION"
puts "**************"
class Other

    def override()
        puts "OTHER override()"
    end

    def implicit()
        puts "OTHER implicit()"
    end

    def altered()
        puts "OTHER altered()"
    end
end

class Child

    def initialize()
        @other = Other.new()
    end

    def implicit()
        @other.implicit()
    end
    
    def override()
        puts "CHILD override()"
    end

    def altered()
        puts "CHILD, BEFORE OTHER altered()"
        @other.altered()
        puts "CHILD, AFTER OTHER altered()"
    end
end

son = Child.new()

son.implicit()
son.override()
son.altered()
