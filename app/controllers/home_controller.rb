class HomeController < ApplicationController
  def index

    @restaurant = Company.find_by(name: 'Restaurant')
    @airline = Company.find_by(name: 'Airline')

    render layout: 'landing'
  end
end
