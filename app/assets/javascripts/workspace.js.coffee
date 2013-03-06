# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  # Execute this script only on index page.
  $('body.workspace.workspace-index').each ->

    # Load initial lists
    $.getScript('/lists')

    # Search the form
    $('#lists-container .search-form input').change ->
      $(this).parents('form').submit()

    # Show active list
    $('body').on 'click', '#task-lists li > a', ->
      $(this).parents('ul').find('li.active').removeClass('active')
      $(this).parents('li').addClass('active')

    # Update list title
    $('body').on 'keyup', '#list-detail textarea.list-title', ->
      $("#list-#{$(this).data('list-id')}-anchor").html($(this).val())

    # Update list
    $('body').on 'blur', '#list-detail textarea.list-title', ->
      $(this).parents('form').submit()

    # Update task
    $('body').on 'change', 'input.task-status-checkbox', ->
      $(this).parents('form').submit()

    # Show New Task form
    $('body').on 'click', '#add-new-task-anchor', ->
      $('#new-task-container').find('textarea.task-title').focus();

