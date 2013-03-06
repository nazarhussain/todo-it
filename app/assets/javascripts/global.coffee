jQuery ->

  # Display Toogle Class
  $('body').on 'click', '[data-toggle-display]', (event)->
    $($(this).data('toggle-display')).slideToggle()

  # Date picker
  $('body').on 'focus', 'input.date-time-picker-date', (event)->
    id = $(this).attr('id')
    console.log id
    $(this).datepicker
      autoclose: true
      todayBtn: true
      todayHighlight: true
      format: 'yyyy/mm/dd'
      weekStart: $(this).data('first-day')

  # Live anchors
  $('body').on 'click', 'a[href="#"]', (event)->
    event.preventDefault()

  # Expandable text areas
  $('body').on 'keydown', 'textarea.expandable_text', (event)->
    if $(this).data('expandable') == undefined
      $(this).autosize().trigger('autosize').data('expandable', true)
    else
      $(this).unbind 'keydown'

  # Tooltip
  $("*[rel='tooltip']").tooltip
    trigger: "hover"
    html: true

  # Sort links
  $('body').on 'click', 'a.sort_link', ->
    $.getScript($(this).attr('href'))
    false

  console.log 'Initialized all global events...'
  window.TODO_IT = TodoIt.getInstance()
  TODO_IT.UI.trigger_auto_resize($('body'))

