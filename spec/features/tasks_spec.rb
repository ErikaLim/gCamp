require 'rails_helper'

feature "Tasks" do

  scenario "User makes a task" do

    visit tasks_path
    click_on "New Task"
    fill_in "Description", with: "Finish gCamp"
    fill_in "Due date", with: "01/01/2015"
    click_on "Create Task"

    expect(page).to have_content("Finish gCamp")
    expect(page).to have_content("01/01/2015")
  end

  scenario "User wants to see a task" do
    Task.create!(
      description: "Finish gCamp"
    )
    visit tasks_path
    expect(page).to have_content("Finish gCamp")
    click_on "Show"

    expect(page).to have_content("Finish gCamp")
  end

  scenario "User edits a task" do
    Task.create!(
      description: "Finish gCamp"
    )
    visit tasks_path
    expect(page).to have_content("Finish gCamp")
    click_on "Edit"
    fill_in "Description", with: "Fix gCamp"
    check "Completed"
    click_on "Update Task"

    expect(page).to have_content("Fix gCamp")
    expect(page).to have_no_content("Finish gCamp")
    expect(page).to have_content("Completed")
  end

  scenario "User destroys a task" do
    Task.create!(
      description: "Fix gCamp"
    )
    visit tasks_path
    expect(page).to have_content("Fix gCamp")
    click_on "Destroy"

    expect(page).to have_no_content("Fix gCamp")
  end



end
