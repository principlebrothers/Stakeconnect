require 'test_helper'

class AttendancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attendance = attendances(:one)
  end

  test 'should get index' do
    get attendances_url, as: :json
    assert_response :success
  end

  test 'should create attendance' do
    assert_difference('Attendance.count') do
      post attendances_url,
           params: { attendance: { absent: @attendance.absent, date: @attendance.date, present: @attendance.present, student_id: @attendance.student_id } }, as: :json
    end

    assert_response :created
  end

  test 'should show attendance' do
    get attendance_url(@attendance), as: :json
    assert_response :success
  end

  test 'should update attendance' do
    patch attendance_url(@attendance),
          params: { attendance: { absent: @attendance.absent, date: @attendance.date, present: @attendance.present, student_id: @attendance.student_id } }, as: :json
    assert_response :success
  end

  test 'should destroy attendance' do
    assert_difference('Attendance.count', -1) do
      delete attendance_url(@attendance), as: :json
    end

    assert_response :no_content
  end
end
