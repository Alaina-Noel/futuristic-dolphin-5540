require 'rails_helper'

RSpec.describe 'amusement park show page', type: :feature do
  describe 'As a visitor' do
    describe 'When I visit the amusement park show page' do
        before :each do
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
          
          @alaina = Mechanic.create!(name:"Alaina", years_experience: 6)
          @ryan = Mechanic.create!(name:"Ryan", years_experience: 7)
          @whitney = Mechanic.create!(name:"Whitney", years_experience: 2)
          @eddie = Mechanic.create!(name:"Eddie", years_experience: 10)
          @sydney = Mechanic.create!(name:"Sydney", years_experience: 9)
          
          @alaina_superman = MechanicRide.create!(mechanic_id: @alaina.id, ride_id: @superman.id)
          @alaina_jaws = MechanicRide.create!(mechanic_id: @alaina.id, ride_id: @jaws.id)
          @alaina_teacups = MechanicRide.create!(mechanic_id: @alaina.id, ride_id: @teacups.id)
          @alaina_smallworld = MechanicRide.create!(mechanic_id: @alaina.id, ride_id: @smallworld.id)
          @ryan_superman = MechanicRide.create!(mechanic_id: @ryan.id, ride_id: @superman.id)
          @whitney_jaws = MechanicRide.create!(mechanic_id: @whitney.id, ride_id: @jaws.id)
          @eddie_smallworld = MechanicRide.create!(mechanic_id: @eddie.id, ride_id: @smallworld.id)
          @sydney_teacups = MechanicRide.create!(mechanic_id: @sydney.id, ride_id: @teacups.id)
        end

      it 'I see the name and price of admissions for that amusement park' do

        visit "/amusement_parks/#{@six_flags.id}"
        expect(page).to have_content("#{@six_flags.name}")
        expect(page).to have_content("#{@six_flags.admission_cost}")
      end
      
      xit 'And I see the names of all the rides that are at that theme park listed in alphabetical order' do
        visit "/amusement_parks/#{@six_flags.id}"
        save_and_open_page
        expect("Ferris Wheel").to appear_before('The Hurler')
        expect("The Hurler").to appear_before('The Scrambler')
      end


      xit "And I see the average thrill rating of this amusement parks rides" do
        visit "/amusement_parks/#{@six_flags.id}"
        expect(page).to have_content('Average Thrill Rating for All Rides: 6')
        expect(page).to_not have_content('Average Thrill Rating for All Rides: 10')
      end

    end
  end
end

