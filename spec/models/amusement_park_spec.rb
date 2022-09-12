require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  before(:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
    @disney = AmusementPark.create!(name: 'Disney', admission_cost: 100)
      
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    
    @teacups = @universal.rides.create!(name: 'Teacups', thrill_rating: 2, open: true)
    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
    
    @superman = @disney.rides.create!(name: 'Superman', thrill_rating: 9, open: false)
    @little_mermaid = @disney.rides.create!(name: 'Little Mermaid', thrill_rating: 3, open: true)
    @smallworld = @disney.rides.create!(name: 'Small World', thrill_rating: 4, open: true)
  end


  describe 'instance methods' do
    describe '#rides_alpha_ordered' do
     it 'can list all rides for a park in alphabetical order by name' do
      expect(@six_flags.rides_alpha_ordered).to eq([@ferris, @hurler, @scrambler])
     end
    end
  end



end