To find the majority element in an array, you can use a voting algorithm called Boyer-Moore Voting Algorithm. It guarantees finding the majority element if it exists. The algorithm works by maintaining a count and a candidate variable. 

```js
function majorityElement() {
    let count = 0;
    let candidate = null

    for (let num of nums) {
        if (count == 0) candidate = num
        if (num == candidate) {
            count +=1
        } else {
            count -=1
        }
    }
    return candidate
  }
```