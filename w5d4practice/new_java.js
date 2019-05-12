function mergeSort(arr, comparator) {
    if(arr.length <= 1) return arr;

    if (comparator === undefined ){
        comparator = function(x, y){
            if (x === y){
                return 0;
            } else if (x > y) {
                return 1;
            } else {
                return -1;
            }
        };
    }
    let mid = Math.floor(arr.length / 2);
    let left = mergeSort(arr.slice(0, mid));
    let right = mergeSort(arr.slice(mid));

    return merge(left, right, comparator);
}

function merge(left, right, comparator) {
    
    let sortedArr = [];
        while (left.length && right.length) {
         if (comparator(left[0], right[0]) <= 0) {
             sortedArr.push(left.shift());
         } else {
             sortedArr.push(right.shift());
         }
           
        }

        return sortedArr.concat(left, right);
}
console.log(`mergeSort([4, 5, 2, 3, 1]) = ${mergeSort([4, 5, 2, 3, 1])}`);
