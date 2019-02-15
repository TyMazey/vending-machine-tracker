require 'rails_helper'

RSpec.describe 'as a visitor' do

  it 'shows me a snack show page and info for that snack' do
    owner = Owner.create(name: "Sam's Snacks")
    snack_1 = Snack.create(name: 'Cheetos', price: 1.5)
    dons  = owner.machines.create(location: "Don's Mixed Drinks", snacks: [snack_1])
    dons  = owner.machines.create(location: "another place", snacks: [snack_1])

    visit snack_path(snack_1)

    expect(page).to have_content('Price: $1.5')

    within '.locations' do
      expect(page).to have_content("Don's Mixed Drinks")
      expect(page).to have_content("Average Price: $1.5")
      expect(page).to have_content("Number of snacks: 1")
      expect(page).to have_content('another place')
      expect(page).to have_content("Average Price: $1.5")
      expect(page).to have_content("Number of snacks: 1")
    end 
  end
end
