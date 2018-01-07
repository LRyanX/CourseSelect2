require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
	 @course = Course.new(name: "高级体系结构",course_type:"专业核心课",credit:"60/3.0",course_week: "第2-20周",course_time: "第一(9-11)", class_room: "教1-107", teaching_type: "课堂讲授为主",exam_type: "闭卷考试")
	end

	test "should be valid" do
		assert @course.valid?
	end

	test "should be present?" do
		@course.name = "    "
		@course.course_type = "   "
		@course.credit= "  "
		@course.course_week = "  "
		@course.course_time = "  "
		@course.class_room = "  "
		@course.teaching_type = "  "
		@course.exam_type = "  " 
		assert_not @course.valid?
	end

	test "should be too long?" do
		@course.course_type = "a" * 51
    @course.name = "a" * 51
		@course.course_type = "a" * 51
		@course.credit= "a" * 51
		@course.course_week = "a" * 51
	  @course.course_time = "a" * 51
		@course.class_room = "a" * 51
		@course.teaching_type = "a" * 51
	  @course.exam_type = "a" * 51 
		assert_not @course.valid?
	end

end
