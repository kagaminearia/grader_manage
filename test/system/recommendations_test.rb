require "application_system_test_case"

class RecommendationsTest < ApplicationSystemTestCase
  setup do
    @recommendation = recommendations(:one)
  end

  test "visiting the index" do
    visit recommendations_url
    assert_selector "h1", text: "Recommendations"
  end

  test "should create recommendation" do
    visit recommendations_url
    click_on "New recommendation"

    fill_in "Course index", with: @recommendation.course_index
    fill_in "Course section", with: @recommendation.course_section
    fill_in "Reasons", with: @recommendation.reasons
    fill_in "Student email", with: @recommendation.student_email
    fill_in "Student firstname", with: @recommendation.student_firstname
    fill_in "Student lastname", with: @recommendation.student_lastname
    click_on "Create Recommendation"

    assert_text "Recommendation was successfully created"
    click_on "Back"
  end

  test "should update Recommendation" do
    visit recommendation_url(@recommendation)
    click_on "Edit this recommendation", match: :first

    fill_in "Course index", with: @recommendation.course_index
    fill_in "Course section", with: @recommendation.course_section
    fill_in "Reasons", with: @recommendation.reasons
    fill_in "Student email", with: @recommendation.student_email
    fill_in "Student firstname", with: @recommendation.student_firstname
    fill_in "Student lastname", with: @recommendation.student_lastname
    click_on "Update Recommendation"

    assert_text "Recommendation was successfully updated"
    click_on "Back"
  end

  test "should destroy Recommendation" do
    visit recommendation_url(@recommendation)
    click_on "Destroy this recommendation", match: :first

    assert_text "Recommendation was successfully destroyed"
  end
end
