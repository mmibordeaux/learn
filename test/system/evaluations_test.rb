require "application_system_test_case"

class EvaluationsTest < ApplicationSystemTestCase
  setup do
    @evaluation = evaluations(:one)
  end

  test "visiting the index" do
    visit evaluations_url
    assert_selector "h1", text: "Evaluations"
  end

  test "creating a Evaluation" do
    visit evaluations_url
    click_on "New Evaluation"

    fill_in "Comment", with: @evaluation.comment
    fill_in "Content To Add", with: @evaluation.content_to_add
    fill_in "Content To Remove", with: @evaluation.content_to_remove
    fill_in "Course", with: @evaluation.course_id
    fill_in "Knowledge Acquired", with: @evaluation.knowledge_acquired
    fill_in "Quality", with: @evaluation.quality
    fill_in "Relevant Content", with: @evaluation.relevant_content
    fill_in "Soft Skills Acquired", with: @evaluation.soft_skills_acquired
    fill_in "Student", with: @evaluation.student_id
    fill_in "Technical Skills Acquired", with: @evaluation.technical_skills_acquired
    click_on "Create Evaluation"

    assert_text "Evaluation was successfully created"
    click_on "Back"
  end

  test "updating a Evaluation" do
    visit evaluations_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @evaluation.comment
    fill_in "Content To Add", with: @evaluation.content_to_add
    fill_in "Content To Remove", with: @evaluation.content_to_remove
    fill_in "Course", with: @evaluation.course_id
    fill_in "Knowledge Acquired", with: @evaluation.knowledge_acquired
    fill_in "Quality", with: @evaluation.quality
    fill_in "Relevant Content", with: @evaluation.relevant_content
    fill_in "Soft Skills Acquired", with: @evaluation.soft_skills_acquired
    fill_in "Student", with: @evaluation.student_id
    fill_in "Technical Skills Acquired", with: @evaluation.technical_skills_acquired
    click_on "Update Evaluation"

    assert_text "Evaluation was successfully updated"
    click_on "Back"
  end

  test "destroying a Evaluation" do
    visit evaluations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Evaluation was successfully destroyed"
  end
end
