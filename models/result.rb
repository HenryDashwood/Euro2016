class Result

  attr_reader( :matches, :groups )

  def initialize( matches, groups )
    @matches = matches
    @groups = groups
  end

  def team_matches( team_id )
    return @matches.select { |match| match.home_team_id == team_id || match.away_team_id == team_id }
  end

  def team_matches_played( team_id )
    total = 0
    team_matches( team_id ).each do |match| 
      if ( match.home_team_id == team_id && match.home_team_won? ) 
        total += 1
      elsif ( match.away_team_id == team_id && match.away_team_won? ) 
        total += 1
      elsif ( match.home_team_id == team_id && match.draw? ) 
        total += 1
      elsif ( match.away_team_id == team_id && match.draw? ) 
        total += 1
      elsif ( match.home_team_id == team_id && match.away_team_won? ) 
        total += 1
      elsif ( match.away_team_id == team_id && match.home_team_won? ) 
        total += 1  
      end
    end
    return total
  end

  def team_wins( team_id )
    total = 0
    team_matches( team_id ).each do |match| 
      if ( match.home_team_id == team_id && match.home_team_won? ) 
        total += 1
      elsif ( match.away_team_id == team_id && match.away_team_won? ) 
        total += 1
      end
    end
    return total
  end

  def team_draws( team_id )
    total = 0 
    team_matches( team_id ).each do |match| 
      if ( match.home_team_id == team_id && match.draw? ) 
        total += 1
      elsif ( match.away_team_id == team_id && match.draw? ) 
        total += 1
      end
    end
    return total
  end

  def team_losses( team_id )
    total = 0
    team_matches( team_id ).each do |match| 
      if ( match.home_team_id == team_id && match.away_team_won? ) 
        total += 1
      elsif ( match.away_team_id == team_id && match.home_team_won? ) 
        total += 1
      end
    end
    return total
  end

  def team_goal_difference( team_id )
    total = 0 
    team_matches( team_id ).each do |match| 
      if match.home_team_id == team_id
        total += (match.home_team_score - match.away_team_score)
      elsif match.away_team_id == team_id
        total += (match.away_team_score - match.home_team_score)
      end
    end
    return total
  end

  def team_points( team_id )
    total = 0
    team_matches( team_id ).each do |match| 
      if ( match.home_team_id == team_id && match.home_team_won? ) 
        total += 3
      elsif ( match.away_team_id == team_id && match.away_team_won? ) 
        total += 3
      elsif ( match.draw? )
        total += 1
      end
    end
    return total
  end

  def sort_group( group )
    return group.sort { |team| team_points( team.id ) }.sort { |team| team_goal_difference( team.id ) }.reverse
  end

end