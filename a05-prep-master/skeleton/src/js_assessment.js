// write String.prototype.mySlice. It should take a start index and an

String.prototype.mySlice = function(start, end){
    let returnStr = "";

    if (typeof end === 'undefined') {
        end = this.length;
    }
    for (let i = start; i < end && i < this.length; i++) {
        returnStr += this[i];
    }
    return returnStr;
};




// (optional) end index.
    // String.prototype.mySlice() {

    // }
// write Array.prototype.myReduce (analogous to Ruby's Array#inject).

Array.prototype.myReduce = function(cb, initialValue) {

    if (initialValue === undefined) {
        i = 1;
        accum = this[0];
    } else {
        i = 0;
    }

    this.slice(i).forEach( (ele) => {
        accum = cb(accum, ele);
    });
    return accum;
};

// write Array.prototype.quickSort(comparator). Here's a quick refresher if
// you've forgotten how quickSort works:
//   - choose a pivot element from the array (usually the first)
//   - for each remaining element of the array:
//     - if the element is less than the pivot, put it in the left half of the
//     array.
//     - otherwise, put it in the right half of the array.
//   - recursively call quickSort on the left and right halves, and return the
//   full sorted array.

Array.prototype.quickSort = function (comparator) {
    if (this.length <= 1) { return this; }

    if (typeof comparator !== 'function' ) {
       comparator = (x, y) => {
        switch (true) {
            case (x === y):
                return 0;
            case (x > y):
                return 1;
            case (x < y):
                return -1;
            }
        };
    }
    let pivot = this[0];
    let left = [];
    let right = [];

    for (let index = 1; index < this.length; index++) {
        if (comparator(this[index], pivot) <= 0) {
            left.push(this[index]);
        } else {
            right.push(this[index]);
        }
    }

return left.quickSort(comparator).concat([pivot]).concat(right.quickSort(comparator));
};

// write myFind(array, callback). It should return the first element for which
// callback returns true, or undefined if none is found.

// write sumNPrimes(n)

function sumNPrimes(n) {
    
    let sumNums = [];
    let count = 0;
    let sum = 0;
    let i = 2;

    while (sumNums.length < n) {
        if (isPrime(i)) {
            sumNums.push(i);
        }
        i++;
    }
    for (let i = 0; i < sumNums.length; i++) {
        sum += sumNums[i];
    }
    return sum;
}

function isPrime(num){
    if (num === 2){
        return true;
    }
    for (let index = 2; index < num; index++) {
        if (num % index === 0){
            return false;
        }
    }
    return true;
}
// write Function.prototype.myBind.
// Function.prototype.myBind = function(context, [...args]) {
//     return () => {
//         this.call(context, [...args]);
//     };
// };

Function.prototype.myBind = function (context, ...bindArgs) {
// How does Java know to pass the arguments into the return function
    let that = this;

    return function (arguments) {

        return that.apply(context, bindArgs.concat(arguments));
    };
};


// basketballPlayer.throw(50, receiver)

// player.throw.mybind(footballPlayer, 50, receiver) {

// }

// write Function.prototype.inherits.

Function.prototype.inherits =  function() {

    
};
