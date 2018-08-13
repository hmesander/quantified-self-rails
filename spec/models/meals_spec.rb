require 'rails_helper'

describe Meal, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'Relationships' do
    it { should have_many(:meal_foods) }
    it { should have_many(:foods) }
  end
end
