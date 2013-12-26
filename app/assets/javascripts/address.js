$(document).ready(function(){
  $('select#profile_country_id').change(function(){
    state_wrapper = $('#state_wrapper');
    $('select', state_wrapper).attr('disabled', true);
    country = $('select#profile_country_id').val();
    url = "/states/"+country;
    state_wrapper.load(url);
    $('#city_wrapper').html("<em>Please select a state above</em>");
  });
});