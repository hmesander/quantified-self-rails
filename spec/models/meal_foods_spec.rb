require 'rails_helper'

describe MealFood, type: :model do
  describe 'Relationships' do
    it { should belong_to(:foods) }
    it { should belong_to(:meals) }
  end
end
