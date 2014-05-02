## **Numbers, Operators and Expressions:**

1. What's the difference between an `Integer` and a `Float?`

`Integer` and `Float` have different algebra, especially with regards to division.
Example: 3 / 2 = 1 (integer), 3.0 / 2 = 1.5 (float)

2. Why should you be careful when converting back and forth between integers and floats?

Converting from integers to float should not be a problem (?). Converting float to integer may lead you to have different result in division.

3. What's the difference between `=`, `==`, and `===`?

* `=` is for assigment. Ex: `a = 3` assigns value 3 to `a`
* `==` is for comparison / checking equality. Ex: `a == 3` returns a Boolean
* `===` is for checking equality in both type and value

4. How do you do exponents in Ruby?
5. What is a `range`?
6. How do you create a range?
7. What's the difference between `(1..3)` and `(1...3)`?

* `(1..3)` produces a range from 1 to 3, **including** 3
* `(1...3)` produces a range from 1 to 3, **excluding** 3

8. What are three ways to create a range?

* (1..10)
* Range.new(1..10)
* **Can't think of the third way...**

## **Strings:**

1. What's the difference between single and double quotes?

Single quoted strings do not process ASCII escape code and cannot be used in string interpolation
Source: [StackOverflow](http://stackoverflow.com/questions/13159166/ruby-whats-the-difference-between-single-and-double-quotes)

2. What is string interpolation?

We use string interpolation to embed expressions (and logic) directly into strings.
Example: `x = 10`, `puts "I have #{x} apples" will produce `"I have 10 apples"`

3. What are escape characters?

Some characters have a special meaning in Regular Expression, e.g `\n, a line break`. To turn `\n` into a real string that can be printed, we have to put `\` (the escape character) in front, i.e. `\\n`

    * What are line breaks?
    * How do you make other things into strings?
    * How do you concatenate strings?
    * How do you access a specific character or substring?
    * How do you split up strings into arrays?
    * How are strings and arrays similar?
    * How do you get and clean up user input on the command line?
    * What does it mean that strings are "mutable" and why care?
    * What is a symbol?
    * How is a symbol different from a string?
    * What is a Regular Expression (RegEx)?
    * How can you center or right-justify a string?

* **Arrays:**
  
    * What are three ways to create an array?
    * How do you prepopulate the array with default data?
    * How do you access items in an array?
    * How can you access a specific group of items in an array?
    * How do you modify the items in an array?
    * How do you combine arrays? 
    * How do you find the values in one array that aren't in another?
    * How do you find values in both arrays?
    * What is the difference between `push`/`pop` and `shift`/`unshift`?
    * What is the shovel operator?
1. How is `> arr.pop` different from `> arr[-1]`?

`> arr.pop` removes the last element from the array and returns it. `> arr[-1]` returns the last element without modifying the array.

1. How is `push`ing or `<<`ing another array into your array different from just adding them together?

* `[1] << [2,3]` produces a nested array `[1, [2, 3]]`, 
* `[1] + [2, 3]` produces a flat array `[1, 2, 3]`

    * How do you delete items in an array?
    * Why should you be careful deleting items in an array?
    * How can you convert arrays to strings?
    * How can you convert from other data types to arrays?
    
1. How can you figure out if an array contains a particular value? --> Use `Array.include?(value_to_check)`
1. How do you find the biggest/smallest item in an array? --> Use `Array.max` and `Array.min`
1. How do you remove any duplicates from your array? --> Use `Array.uniq`
1. How to you find out how big an array is? --> Use `Array.size`
2. How do you put an array in order? --> Use `Array.sort`

    * What are the naming conventions for arrays?
    * What should you store in arrays?

* **Hashes:**

    * What is a hash?
    * What are keys and values?
    * How is a hash similar to an Array?
    * How is a hash different from an Array?
    * What are 3 ways to create a hash?
    * What is the hash rocket?
    * How do you access data in a hash?
    * How do you change data in a hash?
    * What types of data are good to store in a hash?
    * What are options hashes?
    * How do you delete data from a hash?
    * How do you add hashes together?
    * How do you list out all the keys or values?
    * How do you see if the hash contains a key or value?
    * What is a set?

* **Dates and Times:**

    * How do you get the current date and time?
    * How do you find just the Year?  Month? Hour? Second? Weekday?
    * How do you create a `Time` specifically for 12/25/2013?  
    * How do you find how many days have passed between two `Time`'s?
    * What's the difference between UTC and GMT and Local times?
    * How would you find out the time that was 100 seconds ago? 10 days ago?

* **Other Random Stuff:**

  * What is `nil`?
  * How do you check if something is `nil`?
  * What's the difference between `nil` and `blank` and `empty`?
  * Are the following `nil` or `empty`?
      * `" "`, `""`, `[]`, `[""]`, `{}` 
  * What's the difference between `puts` and `p` and `print`?
  * What does `inspect` do?
  * What do `+=`, `-=`, `*=` and `/=` do?
1. What is parallel assignment?

Assign multiple variables at once, like this: `x, y = 1, 2`
A cool use to split `name = "John Doe"`, we can do `first_name, last_name = name.split(" ")`

1. What's the easiest way to swap two variables?

Using parallel (or multiple) assignment: `x, y = y, x`
