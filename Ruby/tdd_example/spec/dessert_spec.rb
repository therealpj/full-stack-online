require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) { Dessert.new('Brownies', 1000, chef)}
  let(:chef) { double("chef", :name => "pj", :titleize => "Chef pj the Great Baker") }

  describe "#initialize" do
    
    it "sets a type" do 
      expect(dessert.type).to eq('Brownies')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(1000)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])  
    end
    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new('Brownies', '1000', chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do 
        dessert.add_ingredient('love')
      end
    it "adds an ingredient to the ingredients array" do   
      expect(dessert.ingredients).to include('love')
    end
  end

  describe "#mix!" do
  before(:each) do 
    dessert.add_ingredient('love')
    dessert.add_ingredient('patience')
    dessert.add_ingredient('sugar')
    dessert.add_ingredient('more_sugar')
    dessert.add_ingredient('choclate_syrup!')
    
  end
  let(:unmixed) { ['love', 'patience', 'sugar', 'more_sugar', 'choclate_syrup!']}
  
  it "shuffles the ingredient array" do
    expect(dessert.ingredients).to eq(unmixed)
    dessert.mix!
    expect(dessert.ingredients).not_to eq(unmixed)
  end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
    dessert.eat(5)
    expect(dessert.quantity).to eq(1000 - 5)
  end

    it "raises an error if the amount is greater than the quantity" do
    expect {dessert.eat(10000)}.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include("Chef #{chef.name} the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
