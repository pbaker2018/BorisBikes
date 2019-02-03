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
This project was to help me understand OOP and TDD, and to start putting it in to practise.


## Code Example
Below is a sample of just two methods from my DockingStation class:
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
Below is an example of two of the tests for DockingStation class:
```
require 'docking_station'
require 'bike'

RSpec.describe DockingStation do

let (:station) { described_class.new }

let (:bike) { double :bike }
let (:bike2) { double :bike }

  describe '#release_bike' do
    it 'releases a bike' do
    allow(bike).to receive(:broken?).and_return(false) #mocking
    station.dock(bike)
    expect(station.release_bike).to eq bike
    end
  end

  it 'releases working bikes' do
    allow(bike).to receive(:broken?).and_return(false) #mocking
    station.dock(bike)
    allow(bike2).to receive(:broken?).and_return(true) #mocking
    station.dock(bike2)
    expect(station.release_bike).not_to be_broken
  end
```
