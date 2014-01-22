module ApplicationHelper

  def sidebar(user)
    if user.is_admin?
      render("layouts/sidebars/admin")
    elsif user.is_club_admin?
      render("layouts/sidebars/club_admin")
    elsif user.is_organizer?
      render("layouts/sidebars/organizer")
    else
      render("layouts/sidebars/other")
    end
  end

end
