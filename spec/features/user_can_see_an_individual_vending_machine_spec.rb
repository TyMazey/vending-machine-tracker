require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it 'shows all the snacks inside the machine and the price' do
    owner = Owner.create(name: "Sam's Snacks")
    snack_1 = Snack.create(name: 'Cheetos', price: 1.5)
    snack_2 = Snack.create(name: 'Jerky', price: 3.5)
    dons  = owner.machines.create(location: "Don's Mixed Drinks", snacks: [snack_1, snack_2])

    visit machine_path(dons)

    expect(page).to have_content('Cheetos: $1.5')
    expect(page).to have_content('Jerky: $3.5')
  end
end
