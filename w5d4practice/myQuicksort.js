Array.prototype.myQuickSort = function(compare) {
    if (this.length <= 1) return this;

    if (compare === undefined) {
     compare = (x, y) => {
        switch(true) {
            case ( x===y ):
                return 0;
            case ( x < y ):
                return -1;
            case ( x > y ):
                return 1;
        }
    };
    }


    let pivot = this[0];
    let left = [];
    let right = [];

    for (let i = 1; i < this.length; i++) {
       if(compare(this[i], pivot) <= 0) {
            left.push(this[i]);
       } else {
           right.push(this[i]);
       }
    }

    left = left.myQuickSort(compare);
    right = right.myQuickSort(compare);

    return left.concat(pivot).concat(right);
    
};