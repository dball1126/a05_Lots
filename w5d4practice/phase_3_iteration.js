String.prototype.substrings = function() {
    let subbies = [];
    words = this.split(' ');

    words.forEach(word => {
        subbies.push(allSubs(word));
    });
    return subbies.;
};
    // _______________________________________
    
    function allSubs(string) {
    
    let subs = [];

    for (let i = 0; i < string.length; i++) {
        const ele1 = string[i];
        // console.log(ele1);

        for (let j = i; j < string.length; j++) {
            const ele2 = string[j];
            // console.log(`${i} = ${ele1}, ${j} = ${ele2}`);
            sub = string.slice(i, j + 1);
            if (sub.length > 1) {
                subs.push(sub);
            }
            
        }
        
    }

    return subs;

}

console.log('brian crawford socio'.substrings());