//: # Homework 1 - Swift Playground

//: In order to answer the [EXPLAIN YOUR ANSWER HERE] questions,
//: you must go to Editor -> Show Raw Markup and edit the bracketed text.
//: Once done, go to Editor -> Show Rendered Markup to return to the previous view mode.


import UIKit


//: ## Q1: Optionals
class Foo {
    var wordA : String!
    var wordB : String!
    
    init (words: [String?]) {
        wordA = words[0]
        wordB = words[1]
    }
}
//: ### We want to know why the code above works. Answer each question part below.


//: ### a) What data type is **words**, and what is the type of the data it can hold?

//: words is an array of String optionals, which means an array of nils and/or Strings.


//: ### b) What is the type of **words[0]** annd **words[1]**.


//: either a nil or a String depending on what the user passes in.


//: ### c) What is the type of **wordsA** and **wordsB?**? Why?


//: They are Strings with values because unwrapping a string gives you a string, and the ! makes
//: sure that they have a value.


//: ## Q2: Variable Types and Function Types
func arePalindromes(words: [String]) -> Bool! {
    let reversedWords = words.map() {String($0.characters.reverse())}
    let numElements = words.count
    
    for var i = 0; i < numElements; i++ {
        if words[i] != reversedWords[i] {
            return false
        }
    }
}
//: ### Debug the code above. Why did the compiler dislike the **for loop**?
//: ### What value should we expect to return?


//: Because let defines a constant variable, and you are trying to increment the variable, not ok!
//: This should return a boolean unwrapped optional that tells if are Palindromes


//: ## Q3: More functions, and object initialization
func isAnagram(wordA: String, wordB: String) -> Bool {
    var countLetters : [Character : Int]
    let lenA = wordA.characters.count
    let lenB = wordB.characters.count
    
    if lenA != lenB {
        return false
    }
    
    var arrA = Array(wordA.characters)
    var arrB = Array(wordB.characters)
    
    for i in 0...lenA-1 {
        let letter = arrA[i]
        if let val = countLetters[letter] {
            countLetters[letter] = val + 1
        } else {
            countLetters[letter] = 1
        }
    }
    
    for i in 0...lenB-1 {
        let letter = arrB[i]
        if let val = countLetters[letter] {
            countLetters[letter] = val - 1
        } else {
            return false
        }
    }
    
    for (_, count) in countLetters {
        if count != 0 {
            return false
        }
    }
    
    return true
}
//: ### The method above should be returning **true** or **false**. Debug the code so that
//: ### this is true. You should edit the isAnagram and ONLY the isAnagram function.
//: ### What was wrong?


//: This code returned nil at the end instead of true, and it returned an optional when it didn't need to.


//: ## Check Your Answers
//: ### If you now see an output stream in the right sidebar, you have successfully
//: ### debugged the code above. Remember that you must also fully and correctly answer
//: ### all of the written questions above to receive full credit for this homework.

//: **DO NOT** touch any code below this point.
Foo.isAnagram("anagram", wordB: "managra")
Foo.isAnagram("hello", wordB: "what")

var palindromes = ["hih", "racecar", "mom", "wow"]
var notPalindromes = ["gene", "shawn", "hello"]
Foo.arePalindromes(palindromes)
Foo.arePalindromes(notPalindromes)


