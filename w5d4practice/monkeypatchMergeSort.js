Array.prototype.mergeSort = function (comparator) {
    if (this.length <= 1) return this;

    if (comparator === undefined) {
        comparator = (x, y) => {
            switch(true) {
                case (x === y):
                    return 0;
                case (x < y):
                    return -1;
                case (x > y):
                    return 1;
            }
        };
    }

    var mid = Math.floor(this.length / 2);
    var left = (this.slice(0, mid).mergeSort());
    var right = (this.slice(mid).mergeSort());

   return merge(left, right, comparator);   
};

function merge(left, right, comparator) {
    var sortedArr = [];

        while  (left.length && right.length) {
            if (comparator(left[0], right[0]) <= 0) {
                sortedArr.push(left.shift());
            } else {
                sortedArr.push(right.shift());
            }
        }

        return sortedArr.concat(left, right);
};





console.log(`([4, 5, 2, 3, 1].mergeSort()) = ${([4, 5, 2, 3, 1].mergeSort())}`);