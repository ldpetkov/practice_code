module Proficiency

  def proficiency_get_legend
    legend = find(:css, "div.legend")
  end

  def proficiency_hide_student_data(student_name)
    legend = proficiency_get_legend
    student = legend.find(:css, "div.series", :text => student_name)

    student.click unless student[:class].include?("inactive")
  end

    def proficiency_show_student_data(student_name)
    legend = proficiency_get_legend
    student = legend.find(:css, "div.series", :text => student_name)

    student.click if student[:class].include?("inactive")
  end

end
World(Proficiency)
