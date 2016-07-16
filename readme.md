#來說說Array擴展的大小事吧
## Swift 的 Array 是可以被擴展(extension)的。

為什麼要這樣做呢？

譬如說我有一隻狗，他會叫（汪！）。

```swift
class Dog {
	func bark() {
		print("wooof")
	}
}

let dog = Dog()
dog.bark()
// wooof
```
那如果我有一堆狗，我要讓他們都叫，我可以這樣做

```swift
let dogs = [Dog(), Dog(), Dog(), Dog(), Dog(), Dog(), Dog(), Dog()]
for dog in dogs {
	dog.bark()
}
// wooof
// wooof
// wooof
// ...
```

這樣寫好像也不太好看，不如我們用forEach好了！
```swift
dogs.forEach { $0.bark() }
// wooof
// wooof
// wooof
// ...
```

嘿！好像好一點囉，但是好像還是有一點不好閱讀
也許可以看看怎麼擴展 `Array` 吧！

我想要讓是 `Dog` array 的 array 有一個方法 `barkkk`，讓所有的狗都叫一次，那麼我可以這樣做：
```swift
extension Array where Element: Dog {
	func barkkk() {
		forEach { $0.bark() }
	}
}
```

我先 extend `Array`，然後後面的 `where` 是要限制他只有在 `Element` 為 `Dog` 時才能呼叫的方法。

於是～～～你可以一行解決，閱讀性也滿好的！
```swift
dogs.barkkk()
// wooof
// wooof
// wooof
// ...
```

## Class vs Struct
在 Swift 中，有struct, enum, class 這幾個資料結構可以用。這幾個都有不同的特性，譬如call by ref, 有些則是 value type。
而 protocol 跟 class 有點類似，所以我們在上面的練習，可以看到
```swift
extension Array where Element: Dog {}
```

我可以用 `:` 來限制他要是 Dog 這個 `class`。

但只要今天不是 class，則不能這樣做。

假設我們今天有 `Cat` 這個 `struct`，我們嘗試去擴展`[Cat]`，那就發生下面這件事：
```
type 'Element' constrained to non-protocol type 'Cat'
```

那現在該怎麼辦呢？

你現在可以按住option去點Array看看，可以看到Array是 conform 了 CollectionType 這個 protocol，而CollectionType 又 conform 了 SequenceType 這個 protocol。那我們現在就可以用 `SequenceType` 來實現我們剛剛所做的事。

我們擴展 `SequenceType`，然後把他的Element限制在Cat這個struct下，就是下面這樣：
```swift
extension SequenceType where Generator.Element == Cat {
	func meowwww() {
		forEach { $0.meow() }
	}
}
```

我們可以得到這樣的執行結果：
```swift
let cats = [Cat(),Cat(),Cat(),Cat(),Cat(),Cat(),Cat()]
cats.meowwww()
// meowwwww
// meowwwww
// meowwwww
// ...
```

## Conclusion
可以這樣擴展 Array 會讓很多地方需要for-loop執行的程式碼，在短短的一行內就解決，而且閱讀性遠優於裸露的loop。















