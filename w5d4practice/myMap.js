Array.prototype.myMap = function(cb) {
    let arr = [];

    this.forEach(ele => {
        arr.push(cb(ele));
    });
    return arr;
};