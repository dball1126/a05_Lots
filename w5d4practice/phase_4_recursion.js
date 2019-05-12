function fib(n) {
    if (n <= 2) {
        return [0, 1].slice(0, n);
    }

    fibArr = fib(n-1);

    fibArr.push( fibArr[fibArr.length-1] + fibArr[fibArr.length-2] );

    return fibArr;
}

function recFact(n) {
    if (n === 1) return [1];

    recArr = recFact(n-1);
    recArr.push(recArr[recArr.length-1] * (n-1));
    return recArr;
}

Function.prototype.mybind = function (obj, ...bindArgs) {

    return (...callArgs) => {
        this.apply(obj, bindArgs.concat(callArgs));
    };
};


Function.prototype.myCall = function (context, ...args) {

        return context.this(args);
};


