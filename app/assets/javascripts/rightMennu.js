$(document).ready(function () {
  var has_layout = document.getElementById('ui-exist');
    if (has_layout != null) {
      var menuLayout = $("body > .screen").layout({ 
        livePaneResizing: true,
        applyDemoStyles: false,
        resizable: true,
        initClosed: true,
        east__size: 350,
        togglerLength_closed: 0,
        togglerLength_open: 0,
        spacing_open: 6 
      });
      menuLayout
        .bindButton('#menuToggler', 'toggle', 'east');
    }
});
