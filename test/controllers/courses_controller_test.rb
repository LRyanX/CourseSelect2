require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
	
	def setup
		@course1 = courses(:one)
   	@course2 = courses(:two)
		@course3 = courses(:three)
		@course4 = courses(:four)
		@user = users(:peng)
	end
   
	 test "should redirect index when create" do
	  get root_path
		#post sessions_login_path(params:{session:{email: @user.email, password: 'password'}})
		#assert_redirected_to controller: homes, action: :index
		#follow_redirect!
		#assert_template 'home/index'
		#assert_redirected_to list_courses_path
		assert_response :success
	 end	
end
