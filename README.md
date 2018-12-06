# Boris Bikes

## What does it do?
A replica of London's Boris Bikes.
A person should be able to:

- return a used bike to a docking station
- release a working bike from a docking station
- report a broken bike
- docking stations should not release bikes that are broken
- docking stations should not release a bike if docking station is empty.


## Motivation
This is a project given in my first week at Makers Academy, to help us understand OOP and TDD.


## Code Example
Below are two methods from my DockingStation class. There are more methods than this, but below is just a sample from this class:
```
class DockingStation

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
    bike
  end

end
```

## Tests
(Describe and show how to run the tests with code examples)


## How to use?
(If people like your project they’ll want to learn how they can use it. To do so include step by step guide to use your project)
