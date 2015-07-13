$(document).on 'page:change page:restore', ->
	$('#category-dropdown-wrap').on 'click', ->
		$('#category-dropdown-wrap ul').toggleClass 'dropdown-collapse-toggle'
	
	$(document).on 'click', (e) ->
		if $(e.target).closest('#category-dropdown-wrap').length == 0
			$('#category-dropdown-wrap ul').removeClass 'dropdown-collapse-toggle'
