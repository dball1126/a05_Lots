// write String.prototype.mySlice. It should take a start index and an
// (optional) end index.

// write Array.prototype.myReduce (analogous to Ruby's Array#inject).

// write Array.prototype.quickSort(comparator). Here's a quick refresher if
// you've forgotten how quickSort works:
//   - choose a pivot element from the array (usually the first)
//   - for each remaining element of the array:
//     - if the element is less than the pivot, put it in the left half of the
//     array.
//     - otherwise, put it in the right half of the array.
//   - recursively call quickSort on the left and right halves, and return the
//   full sorted array.

// write myFind(array, callback). It should return the first element for which
// callback returns true, or undefined if none is found.

// write sumNPrimes(n)

// write Function.prototype.myBind.
// Function.prototype.myBind = function(context, [...args]) {
//     return () => {
//         this.call(context, [...args]);
//     };
// };

Function.prototype.myBind = function (ctx, ...bindArgs) {
    // let args = [...arguments];
    let that = this;
    console.log(bindArgs);
    return function (args) {
        console.log(bindArgs);
        console.log(args);
        return that.apply(ctx, bindArgs.concat(args));
    };
};


// basketballPlayer.throw(50, receiver)

// player.throw.mybind(footballPlayer, 50, receiver) {

// }

// write Function.prototype.inherits.
