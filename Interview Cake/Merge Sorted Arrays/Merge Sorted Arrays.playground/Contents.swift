func mergeArrays(_ array1: [Int], _ array2: [Int]) -> [Int] {
    guard !array1.isEmpty else { return array2 }
    guard !array2.isEmpty else { return array1 }
    
    var result = Array(repeating: 0, count: array1.count + array2.count)
    var p1 = 0, p2 = 0, pr = 0
    
    while p1 < array1.count && p2 < array2.count {
        if array1[p1] > array2[p2] {
            result[pr] = array2[p2]
            p2 += 1
        } else {
            result[pr] = array1[p1]
            p1 += 1
        }
        
        pr += 1
    }
    
    while p1 < array1.count { result[pr] = array1[p1]; p1 += 1; pr += 1 }
    while p2 < array2.count { result[pr] = array2[p2]; p2 += 1; pr += 1 }
    
    return result
}

mergeArrays([], [])
mergeArrays([23], [])
mergeArrays([], [6])
mergeArrays([1,5], [3,7,10,17])
mergeArrays([1,2,6], [8,9,230])
