class PersonalChef
    def make_toast(color)
        puts "Making your toast #{color}!"
        return self
    end

    def make_milkshake(flavor)
        puts "Making milkshake #{flavor}"
        return self
    end

    def make_eggs(num)
        puts "Making #{num} eggs"
        return self
    end
end

class Butler
    def open_front_door(which)
        puts "open #{which} door"
    end
end