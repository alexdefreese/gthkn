module UsersHelper
  def comps_format(completed)
    if completed == true
      "Completed"
    else
      "Still Required"
    end
  end
end
