Array.prototype.myEach = function (cb) {

    
    for (let i = 0; i < this.length; i++) {
      cb(this[i]);
    }
};

Array.prototype.myMap = function(callback) {
    mapArr = [];

    //1
    this.myEach(ele => mapArr.push(callback(ele)));
    //2
    this.myEach(function(ele) {
        mapArr.push(callback(ele));
    });
    //3
    const newfunc = function(ele) {
        mapArr.push(callback(ele));
    };
    this.myEach(newfunc);

    return mapArr;
};

Array.prototype.myReduce = function(cb, acc) {
    if (acc === undefined) {
        i = 1;
        acc = this[0];
    } else {
        i = 0;
    }

    // for (i; i < this.length; i++) {
    //     acc = cb(acc, this[i]);
    // }
    // this.slice(i).myEach(ele => {
    //     acc = cb(acc, ele);
    // });
    this.slice(i).myEach( function(ele) {
        acc = cb(acc, ele);
    });
    return acc;
};

console.log(NUMS.myReduce((total, item) => total + item));
[1, 2, 3, 4, 5]