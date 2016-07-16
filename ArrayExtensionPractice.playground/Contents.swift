//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Dog {
	func bark() {
		print("wooof")
	}
}

let dog = Dog()
dog.bark()
// wooof

let dogs = [Dog(), Dog(), Dog(), Dog(), Dog(), Dog(), Dog(), Dog()]
for dog in dogs {
	dog.bark()
}
// wooof
// wooof
// wooof
// ...

dogs.forEach { $0.bark() }
// wooof
// wooof
// wooof
// ...

extension Array where Element: Dog {
	func barkkk() {
		forEach { $0.bark() }
	}
}

dogs.barkkk()
// wooof
// wooof
// wooof
// ...

struct Cat {
	func meow() {
		print("meowwwww")
	}
}

extension SequenceType where Generator.Element == Cat {
	func meowwww() {
		forEach { $0.meow() }
	}
}

let cats = [Cat(),Cat(),Cat(),Cat(),Cat(),Cat(),Cat()]
cats.meowwww()
// meowwwww
// meowwwww
// meowwwww
// ...