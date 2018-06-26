module SchoolCreationWorld

  def fill_in_unique_timestamped_address
    # this may need to be renamed in future
    current = Time.now.to_i
    select 'United Kingdom', from: 'organisation_country_code'
    fill_in 'organisation_postcode', with: current
    fill_in 'organisation_name', with: "Test#{current}"
    fill_in 'organisation_address', with: "#{current} Glorious Soviet Avenue"
  end

end

World(SchoolCreationWorld)
