/*The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 863 ?*/

var num = 672

primeArray = new Array();
res = new Array();

for (var test = 1; test < num; test++) {

	var test_is_prime = true;

	for (var i = 1; i < primeArray.length; i++) {
		if (test % primeArray[i] !== 0) {
			test_is_prime = false;
		}
	}

	if (test_is_prime && (num % test === 0)) {
		res.push(test)
	}
}

console.log(res.pop())