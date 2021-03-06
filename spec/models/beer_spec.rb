require 'rails_helper'

RSpec.describe Beer, type: :model do


  it "is saved with name and style" do
    beer = Beer.create name:"Keskikeppana", style: FactoryGirl.create(:style)
    expect(beer).to be_valid
    expect(Beer.count).to eq(1)
  end

  it "is not saved without name" do
    beer = Beer.create style: FactoryGirl.create(:style)
    expect(beer).to_not be_valid
    expect(Beer.count).to eq(0)
  end

  it "is not saved without style" do
    beer = Beer.create name: "Keskikeppana"
    expect(beer).to_not be_valid
    expect(Beer.count).to eq(0)
  end
end
