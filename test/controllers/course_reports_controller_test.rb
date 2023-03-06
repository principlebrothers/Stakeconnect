require "test_helper"

class CourseReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_report = course_reports(:one)
  end

  test "should get index" do
    get course_reports_url, as: :json
    assert_response :success
  end

  test "should create course_report" do
    assert_difference("CourseReport.count") do
      post course_reports_url, params: { course_report: { course_id: @course_report.course_id, report_id: @course_report.report_id } }, as: :json
    end

    assert_response :created
  end

  test "should show course_report" do
    get course_report_url(@course_report), as: :json
    assert_response :success
  end

  test "should update course_report" do
    patch course_report_url(@course_report), params: { course_report: { course_id: @course_report.course_id, report_id: @course_report.report_id } }, as: :json
    assert_response :success
  end

  test "should destroy course_report" do
    assert_difference("CourseReport.count", -1) do
      delete course_report_url(@course_report), as: :json
    end

    assert_response :no_content
  end
end
