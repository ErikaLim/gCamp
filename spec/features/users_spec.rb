require 'rails_helper'

feature "Users" do
  scenario "User wants to create a new user" do

    visit users_path
    click_on "New User"
    fill_in "First name", with: "Erika"
    fill_in "Last name", with: "Lim"
    fill_in "Email", with: "Erika.Megan.Lim@gmail.com"
    click_on "Create User"

    expect(page).to have_content("Erika")
    expect(page).to have_content("Lim")
    expect(page).to have_content("Erika.Megan.Lim@gmail.com")

  end

  scenario "User edits a user" do
    User.create!(
      first_name: "Erika",
      last_name: "Lim",
      email: "Erika.Megan.Lim@gmail.com"
    )
    visit users_path
    expect(page).to have_content("Erika Lim")
    click_on "Edit"
    fill_in "First name", with: "Eka"
    fill_in "Last name", with: "Lim"
    fill_in "Email", with: "Erika.Megan.Lim@gmail.com"
    click_on "Update User"

    expect(page).to have_content("Eka")
    expect(page).to have_content("Lim")
    expect(page).to have_content("Erika.Megan.Lim@gmail.com")
  end

  scenario "User sees a user" do
    test_user = User.create!(
      first_name:"John",
      last_name:"Smith",
      email:"g@g.com"
      )

    visit users_path
    click_on "user#{test_user.id}-show-action"

    expect(page).to have_content("John Smith")
    expect(page).to have_content("g@g.com")
  end

  scenario "User deletes a user" do
    User.create!(
      first_name: "Erika",
      last_name: "Lim",
      email: "ekalim@mail.sfsu.edu"
    )

    visit users_path
    click_on "Edit"
    click_on "Delete User"

    expect(page).to have_no_content("Erika")
    expect(page).to have_no_content("Lim")
    expect(page).to have_no_content("ekalim@mail.sfsu.edu")

  end

end
