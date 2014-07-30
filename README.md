### SGL - Swift Generic Library. Highly inspired by C++ STL

This simple code
```swift
import sgl

func print_array<T, S: iterator_strategy_protocol>(begin: forward_iterator<T, S>, end: forward_iterator<T, S>) {
    var it = begin
    while it != end {
        print("\((it++).value()!)")
        print(" ")
    }
    println()
}

var a = array<Int>(1, 2, 3, 4, 5)

print_array(a.begin(), a.end())
print_array(a.rbegin(), a.rend())
```

will print
```
1 2 3 4 5 
5 4 3 2 1 
```

### TODO

##### Containers

- [x] array
- [ ] vector
- [ ] deque
- [ ] list
- [ ] forward_list
- [ ] set
- [ ] multiset
- [ ] unordered set
- [ ] map
- [ ] multimap
- [ ] unordered map
- [ ] stack
- [ ] queue
- [ ] priority queue

##### Iterators

- [ ] input iterator
- [ ] output iterator
- [x] forward iterator
- [x] bidirectional iterator
- [x] random access iterator

##### Algorithms

_to be added_

##### Numerics

_to be added_

### License

The source code distributed under MIT license. See LICENSE for details.
