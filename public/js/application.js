$(document).ready(function() {

 $('td a').on('click', function(event) {
    var counter_ele = $(event.target).parent().next()
    num = parseInt(counter_ele.text()) + 1
    counter_ele.text(num)
  })



  $('form').on('submit', function(event) {
    event.preventDefault()
    $.ajax({
      url: '/long_url',
      method: 'post',
      data: $(this).serialize(),

      success: function(data) {
   
        res = JSON.parse(data)
        $('tr:first-child').after('<tr><td>' +  res.long_url + '</td><td><a href="' + res.short_url + '" target="_blank">' + res.short_url + '</td><td>0</td></tr>')
      },

      error: function (data) {
        // body...

        $('#error').html(data.responseText)
      }



    })
  })
});