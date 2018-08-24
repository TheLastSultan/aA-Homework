# # As you saw in the videos for tonight, a map can be implemented using a 2D array. 
# Let's write a Map class (following a similar pattern to Stack and Queue) that implements a 
# map using only arrays.

# # Remember, a map stores information in key-value pairs, where the keys are always unique.
#  When implemented with arrays, a map might look something like this:
#   my_map = [[k1, v1], [k2, v2], [k3, v2], ...].

# # Our Map class should have the following instance methods: set(key, value), get(key), delete(key), show. Note that the set method can be used to either create a new key-value pair or update the value for a pre-existing key. It's up to you to check whether a key currently exists!

# # As always, test your code thoroughly to make sure all properties of maps are enforced.

class Map

    attr_accessor :map

    def initialize
        @map = [[7,"whopper"]]
    end 

    def set(key,value)
        self.map << [key,value] unless self.map_include?(key)
    end

    def get(key)
        self.map.each do |el|
            return el if el[0] == key
        end
        p "can't find key to get"
        nil
    end

    def delete(key)
        deleted_key = 
        self.map = self.map.select{|el| el unless el.include?(key) }
    end

    # private

    def map_include?(key)
        self.map.length.times do |i|
            return true if self.map[i][0] == key
        end
        false
    end

end
