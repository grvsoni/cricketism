<%= options_for_select(@teams.map { |team| [team.name, team.id] }) %>