require 'rails_helper'

RSpec.describe 'mechanics index page', type: :feature do
  describe 'As a visitor' do
    describe 'When I visit the mechanics index page' do
        before :each do
          @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
          @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
          @disney = AmusementPark.create!(name: 'Disney', admission_cost: 100)
          
          
          @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
          @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
          @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
          
          @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
          @teacups = @universal.rides.create!(name: 'Teacups', thrill_rating: 2, open: true)
          
          @superman = @disney.rides.create!(name: 'Superman', thrill_rating: 9, open: false)
          @little_mermaid = @disney.rides.create!(name: 'Little Mermaid', thrill_rating: 3, open: true)
          @smallworld = @disney.rides.create!(name: 'Small World', thrill_rating: 5, open: true)
          
          @alaina = Mechanic.create!(name:"Alaina", years_experience: 6)
          @ryan = Mechanic.create!(name:"Ryan", years_experience: 7)
          @whitney = Mechanic.create!(name:"Whitney", years_experience: 2)
          @eddie = Mechanic.create!(name:"Eddie", years_experience: 10)
          @sydney = Mechanic.create!(name:"Sydney", years_experience: 9)
          
          @alaina_superman = MechanicRide.create!(mechanic_id: @alaina.id, ride_id: @superman.id)
          @ryan_superman = MechanicRide.create!(mechanic_id: @ryan.id, ride_id: @superman.id)
          @alaina_jaws = MechanicRide.create!(mechanic_id: @alaina.id, ride_id: @jaws.id)
          @whitney_jaws = MechanicRide.create!(mechanic_id: @whitney.id, ride_id: @jaws.id)
          @eddie_smallworld = MechanicRide.create!(mechanic_id: @eddie.id, ride_id: @smallworld.id)
          @sydney_teacups = MechanicRide.create!(mechanic_id: @sydney.id, ride_id: @teacups.id)
          @alaina_teacups = MechanicRide.create!(mechanic_id: @alaina.id, ride_id: @teacups.id)
        end

      it 'I see a header saying All Mechanics' do

        visit "/mechanics"
        expect(page).to have_content('All Mechanics')
      end

      it 'And I see a list of all mechanics names and their years of experience' do
        visit "/mechanics"
        expect(page).to have_content('Alaina')
        expect(page).to have_content('Ryan')
        expect(page).to have_content('Eddie')
        expect(page).to have_content('Whitney')
        expect(page).to have_content('Sydney')
        expect(page).to_not have_content('Sally')
        within("#mechanic_#{@alaina.id}") do 
          expect(page).to have_content("Years Experience:#{@alaina.years_experience}")
          expect(page).to_not have_content("Years Experience:#{@eddie.years_experience}")
        end

      end

      it 'And I see the average years of experience across all mechanics' do
        visit "/mechanics"
          expect(page).to have_content('Average Years Experience of All Mechanics:7')
          # expect(page).to_not have_content('Average Years Experience of All Mechanics: 40')
      end

    end
  end
end

