def ftoc(temp_in_f)
    return (temp_in_f.to_f - 32) * 5 / 9
end

def ctof(temp_in_c)
    return (temp_in_c.to_f * 9 / 5) + 32
end