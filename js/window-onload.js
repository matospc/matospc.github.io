window.onload = function(){

	// Removing no-js class for every js-enabled user (modernizr).
	document.documentElement.classList.remove("no-js");

	// Clear search bar.
	clearSearchInput();
}

var clearSearchInput = function() {
	var element = document.getElementById("search-input");
	if(!element) return;

	element.value = '';
}

