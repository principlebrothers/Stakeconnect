require "test_helper"

class HomeworksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @homework = homeworks(:one)
  end

  test "should get index" do
    get homeworks_url, as: :json
    assert_response :success
  end

  test "should create homework" do
    assert_difference("Homework.count") do
      post homeworks_url, params: { homework: { course_id: @homework.course_id, end_date: @homework.end_date, question: @homework.question, start_date: @homework.start_date } }, as: :json
    end

    assert_response :created
  end

  test "should show homework" do
    get homework_url(@homework), as: :json
    assert_response :success
  end

  test "should update homework" do
    patch homework_url(@homework), params: { homework: { course_id: @homework.course_id, end_date: @homework.end_date, question: @homework.question, start_date: @homework.start_date } }, as: :json
    assert_response :success
  end

  test "should destroy homework" do
    assert_difference("Homework.count", -1) do
      delete homework_url(@homework), as: :json
    end

    assert_response :no_content
  end
end
