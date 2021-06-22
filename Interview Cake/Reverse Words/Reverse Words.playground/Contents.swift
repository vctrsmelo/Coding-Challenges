/*
 Write a function reverseWords() that takes a message as an array of characters and reverses the order of the words in place
 
 Example:
    - input: ["c", "a", "k", "e", " ", "p", "o", "u", "n", "d", " ", "s", "t", "e", "a", "l"]
    - output: ["s", "t", "e", "a", "l", " ", "p", "o", "u", "n", "d", " ", "c", "a", "k", "e"]
 
 Constraints: it should reverse the words in place (changing the inputted array, not creating a new one).
 
 Assume the message contains only letters and spaces, and all words are separated by one space.
 */

func reverse(_ p1In: Int, _ p2In: Int, _ list: inout [Character]) {
    guard p1In < p2In else { return }

    var p1 = p1In
    var p2 = p2In
    
    while p1 < p2 {
        let aux = list[p1]
        list[p1] = list[p2]
        list[p2] = aux
        p1 += 1
        p2 -= 1
    }
}


// n = number of characters

// Should not have blank space at the beginning or the ending of the list.
func reverseWords(_ list: inout [Character]) {
    guard list.count > 2 else { return }
    guard list.contains(where: { $0 == Character(" ") }) else { return }
    
    // O(n)
    reverse(0, list.count-1, &list) // O(n) in time and O(1) in space.
    
    var p1 = 0
    
    // O(n)
    for i in 0 ..< list.count {
        let isLastChar = i == list.count-1
        if list[i] == Character(" ") || isLastChar {
            // the sum of all the calls of line 46 ~= half of the array length.
            reverse(p1, isLastChar ? i : i-1, &list)
            p1 = i+1
        }
    }
    
    // O(n/2) + O(n) + O(n/2) = O(2n) = O(n)
}

var input1: [Character] = []
var input2: [Character] = ["a"]
var input3: [Character] = ["c", "a", "k", "e"]
var input4: [Character] = ["c", "a", "k", "e", " ", "p", "o", "u", "n", "d", " ", "s", "t", "e", "a", "l"]
var input5: [Character] = ["c", "a", "k", "e", " ", "p", "o", "u", "n", "d", " ", "s", "t", "e", "a", "l", " ", "V", "i", "c", "t", "o", "r"]

reverseWords(&input1)
reverseWords(&input2)
reverseWords(&input3)
reverseWords(&input4)
reverseWords(&input5)
