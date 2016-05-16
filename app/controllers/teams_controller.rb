class TeamsController < ApplicationController
  include HTTParty
  base_uri 'http://mlb.mlb.com/pubajax/wf/flow/stats.splayer?season='

  def list_players
    reused_path_1 = "&sort_order=%27desc%27&sort_column=%27ab%27&stat_type="
    reused_path_2 = "&page_type=SortablePlayer&team_id="
    reused_path_3 = "&game_type=%27R%27&player_pool=ALL&season_type=ANY&sport_code=%27mlb%27&results=1000&recSP=1&recPP="
    year = params[:year] || "2016"
    stat_category = get_category
    team_id = get_team_code
    limit = params[:limit] || "20"
    response = self.class.get(year + reused_path_1 + stat_category + reused_path_2 + team_id + reused_path_3 + limit)
    @results = response["stats_sortable_player"]["queryResults"]["row"]
  end

  def get_category
    case params[:category].downcase
    when 'hitting'
      'hitting'
    when 'pitching'
      'pitching'
    else
      'hitting'
    end
  end

  def get_team_code
    case params[:team].downcase
    when 'angels'
      '108'
    when 'astros'
      '117'
    when 'athletics'
      '133'
    when 'bluejays'
      '141'
    when 'braves'
      '144'
    when 'brewers'
      '158'
    when 'cardinals'
      '138'
    when 'cubs'
      '112'
    when 'diamondbacks'
      '109'
    when 'dodgers'
      '119'
    when 'giants'
      '137'
    when 'indians'
      '114'
    when 'mariners'
      '136'
    when 'marlins'
      '146'
    when 'mets'
      '121'
    when 'nationals'
      '120'
    when 'orioles'
      '110'
    when 'padres'
      '135'
    when 'pirates'
      '134'
    when 'phillies'
      '143'
    when 'rangers'
      '140'
    when 'rays'
      '139'
    when 'reds'
      '113'
    when 'redsox'
      p "go yankees"
      '111'
    when 'rockies'
      '115'
    when 'royals'
      '118'
    when 'tigers'
      '116'
    when 'twins'
      '142'
    when 'whitesox'
      '145'
    when 'yankees'
      '147'
    else
      '147'
    end
  end
end
