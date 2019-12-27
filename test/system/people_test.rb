require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
    @car = cars(:one)
    @car2 = cars(:two)
    @person.cars << @car
    @person.cars << @car2
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "People"
  end

  test "viewing a person with their cars" do
    visit person_url(@person)
    assert_text @car.model
    assert_text @car.make
    assert_text @car2.model
    assert_text @car2.make
  end

  test "creating a Person" do
    visit people_url
    click_on "New Person"

    fill_in "Email", with: @person.email
    fill_in "Name", with: @person.name
    fill_in "Phone number", with: @person.phone_number
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "adding an ownership to a Person from edit" do
    visit people_url
    click_on "Edit", match: :first
    assert_text "Add New Car"

    click_on "Add New Car"
    assert_text "New Car"

    fill_in "Color", with: 'Black'
    check "Is for sale"
    fill_in "Make", with: 'Chevrolet'
    fill_in "Mileage", with: 1333333
    fill_in "Model", with: 'Impala'
    click_on "Create Car"
    assert_text "Car was successfully created."
  end

  test "adding an ownership to a Car from show" do
    visit people_url
    click_on "Show", match: :first
    assert_text "Add New Car"

    click_on "Add New Car"
    assert_text "New Car"

    fill_in "Color", with: 'Black'
    # have one test with a car not on sale.
    fill_in "Make", with: 'Chevrolet'
    fill_in "Mileage", with: 1333333
    fill_in "Model", with: 'Impala'
    click_on "Create Car"
    assert_text "Car was successfully created."
  end

  test "updating a Person" do
    visit people_url
    click_on "Edit", match: :first

    fill_in "Email", with: @person.email
    fill_in "Name", with: @person.name
    fill_in "Phone number", with: @person.phone_number
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "destroying a Person" do
    visit people_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Person was successfully destroyed"
  end
end
