require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :snacks }
  end

  describe 'instance methods' do
    describe '.average_snack_price' do
      it 'should return the average cost of all snacks in the machine' do
        owner = Owner.create(name: "Sam's Snacks")
        snack_1 = Snack.create(name: 'Cheetos', price: 10)
        snack_2 = Snack.create(name: 'Jerky', price: 5)
        snack_3 = Snack.create(name: 'Jerky', price: 15)
        dons  = owner.machines.create(location: "Don's Mixed Drinks", snacks: [snack_1, snack_2, snack_3])

        expect(dons.average_snack_price).to eq(10)
      end
    end
  end
end
