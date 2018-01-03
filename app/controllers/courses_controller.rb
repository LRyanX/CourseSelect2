class CoursesController < ApplicationController

  before_action :student_logged_in, only: [:select, :quit, :selectd, :schedule]
  before_action :teacher_logged_in, only: [:new, :create, :edit, :destroy, :update, :open, :close, :advselect]#add open by qiao
  before_action :logged_in, only: :index
  before_action :credit 
  #-------------------------for teachers----------------------

  def new
    @course=Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      current_user.teaching_courses<<@course
      redirect_to courses_path, flash: {success: "新课程申请成功"}
    else
      flash[:warning] = "信息填写有误,请重试"
      render 'new'
    end
  end

  def edit
    @course=Course.find_by_id(params[:id])
  end

  def update
    @course = Course.find_by_id(params[:id])
    if @course.update_attributes(course_params)
      flash={:info => "更新成功"}
    else
      flash={:warning => "更新失败"}
    end
    redirect_to courses_path, flash: flash
  end

  def open
    @course=Course.find_by_id(params[:id])
    @course.update_attributes(open: true)
    redirect_to courses_path, flash: {:success => "已经成功开启该课程:#{ @course.name}"}
  end

  def close
    @course=Course.find_by_id(params[:id])
    @course.update_attributes(open: false)
    redirect_to courses_path, flash: {:success => "已经成功关闭该课程:#{ @course.name}"}
  end

  def destroy
    @course=Course.find_by_id(params[:id])
    current_user.teaching_courses.delete(@course)
    @course.destroy
    flash={:success => "成功删除课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end


  def advselect
    @course=Course.find_by_id(params[:id])
    current_user.students.each do |student|
      student.student_courses<<@course
    end

    flash={:suceess => "成功选择课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end

  #-------------------------for students----------------------

  def list
    #-------QiaoCode--------
    @course=Course.where(:open=>true)
    if student_logged_in?
       @adv_course=current_user.student_courses-current_user.courses
       @course=@course-current_user.courses-current_user.student_courses
    end
    if teacher_logged_in?
       if current_user.students.length > 0
          @course=@course-current_user.students[0].student_courses
       end
    end
    tmp=[]
    @course.each do |course|
      if course.open==true
        tmp<<course
      end
    end
    @course=tmp
  end

  def schedule

    @section1=Array.new 
    @section2=Array.new
    @section3=Array.new
    @section4=Array.new
    @section5=Array.new
    @section6=Array.new
    @section7=Array.new
    @section8=Array.new
    @section9=Array.new
    @section10=Array.new
    @section11=Array.new

    @courses=current_user.courses
    @courses.each do |course|
      week=course.course_time.split("(")[0]
      start=course.course_time.split("(")[1].split("-")[0].to_i
      end_c=course.course_time.split("(")[1].split("-")[1].split(")")[0].to_i

	  inter=end_c-start+1
      if start == 1
		if inter == 1
			@section1<<course
		end
		if inter == 2
			@section1<<course
			@section2<<course
		end
		if inter == 3
			@section1<<course
			@section2<<course
			@section3<<course
		end
		if inter == 4
			@section1<<course
			@section2<<course
			@section3<<course
			@section4<<course
		end

      end
      if start == 2
		if inter == 1
			@section2<<course
		end
		if inter == 2
			@section2<<course
			@section3<<course
		end
		if inter == 3
			@section2<<course
			@section3<<course
			@section4<<course
		end
		if inter == 4
			@section2<<course
			@section3<<course
			@section4<<course
			@section5<<course
		end
      end
      if start == 3
		if inter == 1
			@section3<<course
		end
		if inter == 2
			@section3<<course
			@section4<<course
		end
		if inter == 3
			@section3<<course
			@section4<<course
			@section5<<course
		end
		if inter == 4
			@section3<<course
			@section4<<course
			@section5<<course
			@section6<<course
		end
      end
      if start == 4
		if inter == 1
			@section4<<course
		end
		if inter == 2
			@section4<<course
			@section5<<course
		end
		if inter == 3
			@section4<<course
			@section5<<course
			@section6<<course
		end
		if inter == 4
			@section4<<course
			@section5<<course
			@section6<<course
			@section7<<course
		end
      end
      if start == 5
		if inter == 1
			@section5<<course
		end
		if inter == 2
			@section5<<course
			@section6<<course
		end
		if inter == 3
			@section5<<course
			@section6<<course
			@section7<<course
		end
		if inter == 4
			@section5<<course
			@section6<<course
			@section7<<course
			@section8<<course
		end
      end
      if start == 6
		if inter == 1
			@section6<<course
		end
		if inter == 2
			@section6<<course
			@section7<<course
		end
		if inter == 3
			@section6<<course
			@section7<<course
			@section8<<course
		end
		if inter == 4
			@section6<<course
			@section7<<course
			@section8<<course
			@section9<<course
		end
      end
      if start == 7
		if inter == 1
			@section7<<course
		end
		if inter == 2
			@section7<<course
			@section8<<course
		end
		if inter == 3
			@section7<<course
			@section8<<course
			@section9<<course
		end
		if inter == 4
			@section7<<course
			@section8<<course
			@section9<<course
			@section10<<course
		end
      end
      if start == 8
		if inter == 1
			@section8<<course
		end
		if inter == 2
			@section8<<course
			@section9<<course
		end
		if inter == 3
			@section8<<course
			@section9<<course
			@section10<<course
		end
		if inter == 4
			@section8<<course
			@section9<<course
			@section10<<course
			@section11<<course
		end
      end
      if start == 9
		if inter == 1
			@section9<<course
		end
		if inter == 2
			@section9<<course
			@section10<<course
		end
		if inter == 3
			@section9<<course
			@section10<<course
			@section11<<course
		end

      end
      if start == 10
		if inter == 1
			@section10<<course
		end
		if inter == 2
			@section10<<course
			@section11<<course
		end

      end
      if start == 11
		if inter == 1
			@section11<<course
		end
      end


    end
    


  end

  def select
    @course=Course.find_by_id(params[:id])
    current_user.courses<<@course

    credit = @course.credit.split("/")[1].to_i
    current_user.sum_credit += credit

    current_user.save(:validate => false)

    flash={:suceess => "成功选择课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end

  def quit
    @course=Course.find_by_id(params[:id])
    current_user.courses.delete(@course)

    credit = @course.credit.split("/")[1].to_i
    current_user.sum_credit -= credit

    if @course.is_degree

       @course.is_degree = false
       @course.save(:validate => false)
       current_user.degree_credit -= credit
    end
    
    current_user.save(:validate => false)

    flash={:success => "成功退选课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end
  
  def selectd
    @course=Course.find_by_id(params[:id])
    current_user.courses<<@course

    credit = @course.credit.split("/")[1].to_i
    current_user.sum_credit += credit
    current_user.degree_credit += credit

    @course.is_degree = true
    @course.save(:validate => false)
    
    current_user.save(:validate => false)

    flash={:suceess => "成功选择课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end


  #-------------------------for both teachers and students----------------------

  def index
    @course=current_user.teaching_courses if teacher_logged_in?
    @course=current_user.courses if student_logged_in?
  end


  private

  # Confirms a student logged-in user.
  def student_logged_in
    unless student_logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  # Confirms a teacher logged-in user.
  def teacher_logged_in
    unless teacher_logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  # Confirms a  logged-in user.
  def logged_in
    unless logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  def course_params
    params.require(:course).permit(:course_code, :name, :course_type, :teaching_type, :exam_type,
                                   :credit, :limit_num, :class_room, :course_time, :course_week)
  end

  def credit

    sum_credit = 0
    current_user.courses.each do |course|
        sum_credit += course.credit.split("/")[1].to_i
    end
    current_user.sum_credit = sum_credit
    current_user.save(:validate => false)
  end
end
