require "application_system_test_case"

class CarsTest < ApplicationSystemTestCase
  setup do
    @car = cars(:one)
    @person = people(:one)
    @person2 = people(:two)
    @car.people << @person
    @car.people << @person2
  end

  test "visiting the index" do
    visit cars_url
    assert_selector "h1", text: "Cars"
  end

  test "viewing a car with its ownership" do
    visit car_url(@car)
    assert_text @person.name
    assert_text @person.email
    assert_text @person.phone_number
    assert_text @person2.name
    assert_text @person2.email
    assert_text @person2.phone_number
  end

  test "creating a Car" do
    visit cars_url
    click_on "New Car"

    fill_in "Color", with: @car.color
    check "Is for sale" if @car.is_for_sale
    fill_in "Make", with: @car.make
    fill_in "Mileage", with: @car.mileage
    fill_in "Model", with: @car.model
    click_on "Save"

    assert_text "Car created!"
  end

  test "adding an ownership to a Car from edit" do
    visit cars_url
    click_on "Edit", match: :first

    click_on "Add New Owner"
    assert_text "New Owner"

    fill_in "Email", with: 'testperson@gmail.com'
    fill_in "Name", with: 'Test Person'
    fill_in "Phone number", with: '123-456-7899'
    click_on "Save"
    assert_text "Owner was successfully created."
  end

  test "adding an ownership to a Car from show" do
    visit cars_url
    click_on "Details", match: :first

    click_on "Add New Owner"
    assert_text "New Owner"

    fill_in "Email", with: 'testperson@gmail.com'
    fill_in "Name", with: 'Test Person'
    fill_in "Phone number", with: '123-456-7899'
    click_on "Save"
    assert_text "Owner was successfully created."
  end

  test "updating a Car" do
    visit cars_url
    click_on "Edit", match: :first

    fill_in "Color", with: @car.color
    check "Is for sale" if @car.is_for_sale
    fill_in "Make", with: @car.make
    fill_in "Mileage", with: @car.mileage
    fill_in "Model", with: @car.model
    click_on "Save"

    assert_text "Car updated!"
  end

  test "destroying a Car" do
    visit cars_url
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Car deleted!"
  end

  test "sorting cars" do
    visit cars_url
    assert_text "Chevrolet Impala Black 100000 close #{Time.now.strftime("%m-%d-%Y")} Details Edit Delete"
    click_on "Model"
    assert_text "Dodge Charger Red 3000 check #{Time.now.strftime("%m-%d-%Y")} Details Edit Delete\nChevrolet Impala Black 100000 close #{Time.now.strftime("%m-%d-%Y")} Details Edit Delete"
  end
end
