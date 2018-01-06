require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
	
	def setup
		@course1 = courses(:one)
   	@course2 = courses(:two)
		@course3 = courses(:three)
		@course4 = courses(:four)
	end
   
	 test "should redirect index when create" do
	  assert_redirected_to list_courses_url
		assert_response :success
	 end	
end
