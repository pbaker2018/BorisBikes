require 'docking_station'
require 'bike'

RSpec.describe DockingStation do

let (:station) { described_class.new }

  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  describe '#release_bike' do
    it 'releases a bike' do
    bike = Bike.new
    station.dock(bike)
    expect(station.release_bike).to eq bike
    end
  end

  it 'releases working bikes' do
    bike = Bike.new
    station.dock(bike)
    bike = station.release_bike
    expect(bike).to be_working
  end

  describe '#release_bike' do
    it 'raises an error when no bikes available' do
      expect { station.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'raises an error when capacity full' do
      station.capacity.times do
        station.dock Bike.new
      end
      expect { station.dock Bike.new }.to raise_error 'Docking station full'
    end
  end

  it "docks a bike" do
    bike = Bike.new
    expect(station.dock(bike)).to eq bike
  end

  it "returns docked bikes" do
    bike = Bike.new
    station.dock(bike)
    expect(station.bikes).to eq [bike]
  end

  it 'has a default capacity' do
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    bike = Bike.new
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        station.dock(bike)
      end
      expect { station.dock(bike) }.to raise_error 'Docking station full'
    end
  end

  end
