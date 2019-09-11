import Foundation

//1. Find the smallest element in a queue

func smallestElement<T: Comparable>(in q: Queue<T>) -> T? {
    var myQueue = q
    var smallest = myQueue.peek()
    
    guard !myQueue.isEmpty else { return nil }
    
    while !myQueue.isEmpty {
        if let current = myQueue.dequeue() {
            if let smallestUnwrapped = smallest {
                if current < smallestUnwrapped {
                    smallest = current
                }
            }
        }
    }
    return smallest
}

//2. Find the sum of a queue of Ints

func sum(of q: Queue<Int>) -> Int {
    var myQueue = q
    var sum = 0
    
    guard !myQueue.isEmpty else { return 0 }
    
    while !myQueue.isEmpty {
        if let current = myQueue.dequeue() {
            sum += current
        }
    }
    return sum
}

//3. Find out whether or not a queue is in sorted order from smallest to biggest
/*
True example:   (Back) 9 - 6 - 2 - 1 (Front)
False example   (Back) 4 - 19 - 1 - 20 (Front)
False example   (Back) 4 - 19 - 134 - 200 (Front)
*/

func isSorted<T: Comparable>(q: Queue<T>) -> Bool {
    guard !q.isEmpty else { return true }
    
    var myQueue = q
    var smallest = myQueue.dequeue()!
    
    while !myQueue.isEmpty {
        let current = myQueue.dequeue()!
        if current < smallest {
            return false
        }
        smallest = current
    }
    return true
}


//4. Given a Queue as input, return a reversed queue. (Hint: A stack can be helpful here)

/*
Sample Input:   (Back) 9 - 16 - 2 - 31 (Front)
Sample Output:  (Back) 31 - 2 - 16 - 9 (Front)
 */

func reversed<T>(q: Queue<T>) -> Queue<T> {
    guard !q.isEmpty else { return q }
    
    var myQueue = q
    var revQueue = Queue<T>()
    var array = Array<T>()
    
    while !myQueue.isEmpty {
        array.append(myQueue.dequeue()!)
    }
    
    while !array.isEmpty {
        revQueue.enqueue(array.popLast()!)
    }
    
    return revQueue
}

//5 Determine if two Queues are equal

func areEqual<T: Equatable>(qOne: Queue<T>, qTwo: Queue<T>) -> Bool {
    var queueOne = qOne
    var queueTwo = qTwo
    
    while !queueOne.isEmpty && !queueTwo.isEmpty {
        if queueOne.dequeue() == queueTwo.dequeue() {
            return true
        }
    }
    return false
}

