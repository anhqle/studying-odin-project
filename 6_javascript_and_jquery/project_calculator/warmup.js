// 1. Build a function my_max() which takes an array and
// returns the maximum number.
var my_max = function(array) {
    current_max = array[0];
    array.forEach(function(element) {
        if (element > current_max) {
            current_max = element;
        }
    });
    return current_max
};

console.log("my_max([1,5,2,3,8,3] = " + my_max([1,5,2,3,8,3]))

var vowel_count = function(string) {
    vowels = "aeiouy";
    count = 0;
    string.split("").forEach(function(element) {
        if (vowels.indexOf(element) > -1) {
            count++ // ++count gives the same result
        }
    });
    return count;
};

console.log("vowel_count('abcde') = " + vowel_count("abcde"))

var reverse = function(string) {
    reverse_string = []
    string.split("").forEach(function(element) {
        reverse_string.unshift(element);
    });
    return reverse_string.join("");
};

console.log("reverse('This is bullshit!') = " + 
    reverse('This is bullshit!'))