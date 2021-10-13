# RxCraft

- Observable properties:
```
@RxCraft.Property var value: Int = 0
...
$value.filter { $0.isEven }
  .distinct() // Emits only values that differ from initial one
  .skip(1)    // Skips initial value on subscription
  .take(1)    // Takes only one value then finishes
  .subscribe(on: .main) { value in ... }
```
