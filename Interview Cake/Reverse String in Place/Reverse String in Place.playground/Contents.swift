//O(n) time complexity
//O(1) space complexity
func reverse(_ list: inout [Character]) {
    if list.count < 2 { return } // deals with base cases ([] or [n], for any char n).
    
    // creates two pointers that will go through the array from its extremity to the center, flipping the chars.
    var p1 = 0
    var p2 = list.count-1
    
    while (p1 < p2) {
        let aux = list[p1]
        list[p1] = list[p2]
        list[p2] = aux
        
        p1 += 1
        p2 -= 1
    }
}

var list1: [Character] = []
var list2: [Character] = ["a"]
var list3: [Character] = ["a", "b"]
var list4: [Character] = ["a", "b", "c"]
var list5: [Character] = ["a", "b", "c", "d", "e", "f", "g"]

reverse(&list1)
reverse(&list2)
reverse(&list3)
reverse(&list4)
reverse(&list5)
