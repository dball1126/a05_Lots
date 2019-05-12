Array.prototype.uniq = function() {
    let uniqArr = [];

    for (let index = 0; index < this.length; index++) {
       if (!uniqArr.includes(this[index])) {
           uniqArr.push(this[index]);
       }
    }
    return uniqArr;
};

Array.prototype.twoSum = function() {
    const pairs = [];
    
    for (let i = 0; i < this.length; i++) {
        const ele1 = this[i];
        
        for (let j = i + 1; j < this.length; j++){
            const ele2 = this[j];
            
            if (ele1 + ele2 === 0) {
                pairs.push([i, j]);
            }
        }
    }
    return pairs;
};

Array.prototype.transpose = function () {
    const transposed = [];
    for (i = 0; i < this[0].length; i++) {
        const sub = [];
        for (j = 0; j < this.length; j++) {
            sub.push(this[j][i]);
        }
        transposed.push(sub);
    }
    return transposed;
};


// [[1, 2], [3, 4], [5, 6], [7, 8]]

// [ [1, 3, 5, 7], [2, 4, 6, 8] ]







