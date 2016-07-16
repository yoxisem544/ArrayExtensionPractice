#來說說Array擴展的大小事吧
Swift 的 Array 是可以被擴展(extension)的。

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

