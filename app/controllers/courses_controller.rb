class CoursesController < ApplicationController
	before_filter :require_user

  def index
    @courses = Course.includes(:partner)
    @lists = WaitList.includes(:course, :users)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @courses }
    end
  end

  def add_to_user
    course = Course.find(params[:id])
    user = UserSession.find.user

    respond_to do |format|
      if course.users << user
        format.html { redirect_to(:courses, :notice => 'Registration on course successfull.') }
        format.xml  { head :ok }
      else
        format.html { render redirect_to(:courses) }
        format.xml  { render :xml => course.errors, :status => :unprocessable_entity }
      end
    end
  end

  def add_to_wait_list
    user = UserSession.find.user
    wait_list = WaitList.find_or_create_by_course_id(params[:id])

    respond_to do |format|
      if wait_list.save! and wait_list.users << user
        format.html { redirect_to(:courses, :notice => 'Added to wait list!') }
        format.xml  { head :ok }
      else
        format.html { render redirect_to(:courses) }
        format.xml  { render :xml => wait_list.errors, :status => :unprocessable_entity }
      end
    end
  end
end
