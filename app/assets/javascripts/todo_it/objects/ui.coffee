class window.TodoIt.UI
  show_alert: (msg, css = 'alert')->
    if $("#flash_#{css}").length
      $("#flash_#{css}").html(msg).slideDown()
    else
      alert = $(@get_alert(msg, css)).hide().insertAfter('#main-nav-bar').slideDown()
    @hide_in_future("flash_#{css}")

  hide_in_future: (selector, time = 5000)->
    setTimeout("if($(#{selector}).length){ $(#{selector}).slideUp()}", time)

  get_alert: (msg, css = '') ->
    "<div class='alert-bar navbar navbar-static-top alert alert-#{css}' id='flash_#{css}'><button type='button' class='close' data-dismiss='alert'>&times;</button>#{msg}</div>"

  trigger_auto_resize: (selector)->
    $('textarea.expandable_text', selector).autosize().trigger('autosize').data('expandable', true)
