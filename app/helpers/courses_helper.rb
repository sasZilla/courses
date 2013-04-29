module CoursesHelper
	def places_left(course)
		left = course.size - course.users.size

		return left > 0 ? left : 0
	end

	def add_course_path(course)
		left = course.size - course.users.size

		return left > 0 ? "/courses/#{course.id}/add_to_user" : "/courses/#{course.id}/add_to_wait_list"
	end
end
