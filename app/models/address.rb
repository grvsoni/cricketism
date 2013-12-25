module Address
  def states
    if country.present?
      country.states
    else
      State.all
    end
  end

  def cities
    if state.present?
      state.cities
    else
      City.all
    end
  end
end