jQuery(document).on 'turbolinks:load', ->
  comments = $('#comments')
  if comments.length > 0
    App.global_chat = App.cable.subscriptions.create {
      channel: "ShoesChannel"
      shoe_id: comments.data('shoe-id')
    },
    connected: ->
    disconnected: ->
    received: (data) ->
      comments.append data['comment']
    send_comment: (comment, shoe_id) ->
      @perform 'send_comment', comment: comment, shoe_id: shoe_id
  $('#new_comment').submit (e) ->
    $this = $(this)
    textarea = $this.find('#comment_body')
    if $.trim(textarea.val()).length > 1
      App.global_chat.send_comment textarea.val(),
      comments.data('shoe-id')
      textarea.val('')
    e.preventDefault()
    return false
