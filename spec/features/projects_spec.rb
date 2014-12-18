require 'rails_helper'

feature "Projects" do

  scenario "User wants to create a new project" do

    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "gCamp"
    click_on "Create Project"

    expect(page).to have_content("gCamp")
  end

  scenario "User wants to see a project" do
    test_project = Project.create!(
      name: "gCamp"
    )

    visit projects_path
    click_on "project#{test_project.id}-show-action"

    expect(page).to have_content("gCamp")
  end

  scenario "User wants to edit a project" do
    Project.create!(
      name: "gProject"
    )

    visit projects_path
    click_on "gProject"
    click_on "Edit"
    fill_in "Name", with: "gCamp"
    click_on "Update Project"

    expect(page).to have_content("gCamp")
    expect(page).to have_no_content("gProject")
  end

  scenario "User wants to delete a project" do
    Project.create!(
      name: "gProject"
    )

    visit projects_path
    click_on "gProject"
    click_on "Delete"

    expect(page).to have_no_content("gProject")
  end

end
