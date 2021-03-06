require 'spec_helper'
require 'line_item'

describe LineItem do
  let(:line_item) { described_class.new(dish, 2) }
  let(:dish) { double :dish, name: 'chips', price: 5 }

  it 'has name of a dish' do
    expect(line_item.dish.name).to eq 'chips'
  end

  it 'has the price of the dish' do
    expect(line_item.dish.price).to eq 5
  end

  it 'has a quantity of the dish ordered' do
    expect(line_item.quantity).to eq 2
  end

  it 'has a line total' do
    expect(line_item.line_total).to eq 10
  end
end
