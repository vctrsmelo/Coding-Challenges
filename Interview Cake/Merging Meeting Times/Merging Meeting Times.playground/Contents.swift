/**
 Your company built an in-house calendar tool called HiCal. You want to add a feature to see the times in a day when everyone is available.
 Write a function mergeRanges() that takes an array of multiple meeting time ranges and returns an array of condensed ranges.
 For example, given:
 [
   Meeting(startTime: 0,  endTime: 1),
   Meeting(startTime: 3,  endTime: 5),
   Meeting(startTime: 4,  endTime: 8),
   Meeting(startTime: 10, endTime: 12),
   Meeting(startTime: 9,  endTime: 10)
 ]
 
 your function would return:
 
 [
   Meeting(startTime: 0, endTime: 1),
   Meeting(startTime: 3, endTime: 8),
   Meeting(startTime: 9, endTime: 12)
 ]
 */

class Meeting: CustomStringConvertible {

  var startTime: Int
  var endTime: Int

  init(startTime: Int, endTime: Int) {

      // number of 30 min blocks past 9:00 am
      self.startTime = startTime
      self.endTime = endTime
  }

  var description: String {
      return "(\(startTime), \(endTime))"
  }
}

// MARK: Solution

// O(nlogn)
func mergeRanges(meetings: [Meeting]) -> [Meeting] {
    if meetings.isEmpty { return [] }
    
    // ordenar pelo tempo de início
    let sortedMeetings = meetings.sorted(by: { $0.startTime < $1.startTime }) //O(nlogn)
    
    var mergedMeetings = [Meeting]()
    
    mergedMeetings.append(sortedMeetings.first!)
    
    for i in 1..<sortedMeetings.count { // O(n)
        let lastMergedMeeting = mergedMeetings.last!
        // it is new element or it will be absorved by lastMergedMeeting
        
        // its new element:
        if sortedMeetings[i].startTime > lastMergedMeeting.endTime {
            mergedMeetings.append(sortedMeetings[i])
        } else { // will be absorved
            lastMergedMeeting.endTime = max(lastMergedMeeting.endTime, sortedMeetings[i].endTime)
        }
    }
    
    return mergedMeetings
}

let result = mergeRanges(meetings: [
    Meeting(startTime: 1, endTime: 8),
    Meeting(startTime: 2, endTime: 6),
    Meeting(startTime: 3, endTime: 5),
    Meeting(startTime: 7, endTime: 9)
])

print(result)
