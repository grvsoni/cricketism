require 'test_helper'

class MatchTypesControllerTest < ActionController::TestCase
  setup do
    @match_type = match_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:match_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create match_type" do
    assert_difference('MatchType.count') do
      post :create, match_type: { balls_per_over: @match_type.balls_per_over, dismiss_on_wicket: @match_type.dismiss_on_wicket, innings: @match_type.innings, last_man_bat: @match_type.last_man_bat, max_over_batting: @match_type.max_over_batting, max_over_bowling: @match_type.max_over_bowling, max_run_batting: @match_type.max_run_batting, name: @match_type.name, noball_runs: @match_type.noball_runs, player_count: @match_type.player_count, rebowl_noball: @match_type.rebowl_noball, wicket_value: @match_type.wicket_value }
    end

    assert_redirected_to match_type_path(assigns(:match_type))
  end

  test "should show match_type" do
    get :show, id: @match_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @match_type
    assert_response :success
  end

  test "should update match_type" do
    patch :update, id: @match_type, match_type: { balls_per_over: @match_type.balls_per_over, dismiss_on_wicket: @match_type.dismiss_on_wicket, innings: @match_type.innings, last_man_bat: @match_type.last_man_bat, max_over_batting: @match_type.max_over_batting, max_over_bowling: @match_type.max_over_bowling, max_run_batting: @match_type.max_run_batting, name: @match_type.name, noball_runs: @match_type.noball_runs, player_count: @match_type.player_count, rebowl_noball: @match_type.rebowl_noball, wicket_value: @match_type.wicket_value }
    assert_redirected_to match_type_path(assigns(:match_type))
  end

  test "should destroy match_type" do
    assert_difference('MatchType.count', -1) do
      delete :destroy, id: @match_type
    end

    assert_redirected_to match_types_path
  end
end
