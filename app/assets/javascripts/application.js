// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets

var countryStateInfo = {
	"USA": {
		"California": {
			"Los Angeles": ["90001", "90002", "90003", "90004"],
			"San Diego": ["92093", "92101"]
		},
		"Texas": {
			"Dallas": ["75201", "75202"],
			"Austin": ["73301", "73344"]
		}
	},
	"India": {
		"Assam": {
			"Dispur": ["781005"],
			"Guwahati" : ["781030", "781030"]
		},
		"Gujarat": {
			"Vadodara" : ["390011", "390020"],
			"Surat" : ["395006", "395002"]
		}
	}
}


window.onload = function () {
	
	//Get html elements
	var countrySel = document.getElementById("countrySel");
	var stateSel = document.getElementById("stateSel");	
	var citySel = document.getElementById("citySel");
	var zipSel = document.getElementById("zipSel");
	
	//Load countries
	for (var country in countryStateInfo) {
		countrySel.options[countrySel.options.length] = new Option(country, country);
	}
	
	//country Changed
	countrySel.onchange = function () {
		 
		 stateSel.length = 1; // remove all options bar first
		 citySel.length = 1; // remove all options bar first
		 zipSel.length = 1; // remove all options bar first
		 
		 if (this.selectedIndex < 1)
			 return; // done
		 
		 for (var state in countryStateInfo[this.value]) {
			 stateSel.options[stateSel.options.length] = new Option(state, state);
		 }
	}
	
	//State Changed
	stateSel.onchange = function () {		 
		 
		 citySel.length = 1; // remove all options bar first
		 zipSel.length = 1; // remove all options bar first
		 
		 if (this.selectedIndex < 1)
			 return; // done
		 
		 for (var city in countryStateInfo[countrySel.value][this.value]) {
			 citySel.options[citySel.options.length] = new Option(city, city);
		 }
	}
	
	//City Changed
	citySel.onchange = function () {
		zipSel.length = 1; // remove all options bar first
		
		if (this.selectedIndex < 1)
			return; // done
		
		var zips = countryStateInfo[countrySel.value][stateSel.value][this.value];
		for (var i = 0; i < zips.length; i++) {
			zipSel.options[zipSel.options.length] = new Option(zips[i], zips[i]);
		}
	}	
}
