<img src="https://raw.githubusercontent.com/the-hypermedia-project/Hyperdrive/master/Hyperdrive.png" width=51 height=49 alt="Hyperdrive Logo" />

# RxHyperdrive

RxSwift extensions for [Hyperdrive](https://github.com/the-hypermedia-project/Hyperdrive), the generic Swift Web API client.

## Usage

```swift
let hyperdrive = Hyperdrive()
```

RxHyperdrive adds extensions to Hyperdrive to provide an `enter` and
`request` function that returns an observable.

```swift
hyperdrive.enter("https://polls.apiblueprint.org/")
  .subscribeNext { representor in
    // We've successfully connected and we have a representor
    // representing the APIs "root" resource.

    print(representor)
  }
```

Once we've got a representor representing the root resource, we can follow
any available transitions such as a transition to the `questions`
collection resource.

```swift
let questions = representor.transitions["questions"]

hyperdrive.request(questions)
  .subscribeNext { representor in
    print(representor)
  }
```

Using `flatMap` we can chain both of these operations together producing
an observer of the questions resource.

```swift
hyperdrive.enter("https://polls.apiblueprint.org/")
  .flatMap { representor in
    hyperdrive.request(representor.transitions["questions"])
  }
  .subscribeNext { representor in
    print(representor)
  }
```

## Installation

[CocoaPods](http://cocoapods.org) is the recommended way to add RxHyperdrive
to your project.

```ruby
pod 'RxHyperdrive'
```

## License

RxHyperdrive is released under the MIT license. See [LICENSE](LICENSE).

