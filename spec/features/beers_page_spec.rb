require 'rails_helper'

include Helpers

describe "Beer" do
  let!(:brewery) { FactoryGirl.create :brewery, name: "Koff" }
  let!(:style) { FactoryGirl.create :style }
  let!(:user) { FactoryGirl.create :user }

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "when valid beer is added, it is also added to database" do
    visit new_beer_path
    fill_in('beer_name', with: 'Keskikeppana')
    select('Lager', from:'beer[style_id]')

    expect {
      click_button('Create Beer')
    }.to change { Beer.count }.by(1)
  end

  it "when trying to add invalid beer, its not added to database " do
    visit new_beer_path
    click_button('Create Beer')

    expect(page).to have_content('error')
    expect(Beer.count).to eq(0)
  end
end