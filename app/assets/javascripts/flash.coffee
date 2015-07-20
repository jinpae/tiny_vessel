$(document).on 'page:change', ->
	$('#flash-wrap').fadeIn 'slow'

	setTimeout ->
		$('#flash-wrap').fadeOut 'slow', ->
			$(this).remove()
	, 4000

	$('#flash-wrap .close').on 'click', (e) ->
		e.preventDefault()
		flashWrap = $('#flash-wrap')
		flashWrap.off()
		flashWrap.fadeOut 'slow', ->
			flashWrap.remove()

$(document).on 'page:before-unload', ->
	$('#flash-wrap').off()
