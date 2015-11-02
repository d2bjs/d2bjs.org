var idiLogo = {};
idiLogo.cookie = {name: 'idiLogoLoaded'};

idiLogo.cookie.set = function(){
  var now = new Date();
  var time = now.getTime();
  time += 300 * 1000;

  now.setTime(time);
  document.cookie = idiLogo.cookie.name+"=true; expires="+now.toUTCString()+";";
}

idiLogo.isLoaded = function(){
  return !(document.cookie.indexOf(idiLogo.cookie.name+"=true") > -1);
};

idiLogo.animate = function(){
  var logo = d3.select("#idi-logo").style('opacity', 0);
  var img = logo.select("img");
  var word = logo.selectAll(".idi-logo-word").style('width', 0);
  logo.transition().duration(1300).ease('quad-out').style('opacity', 1);

  setTimeout(function(){
    var _rotate = function(){
      var deg = d3.interpolate(0, 360);
      return function(t){
        return 'rotate('+deg(t)+'deg)';
      };
    };

    img.transition()
        .duration(1000)
        .styleTween('transform', _rotate)
        .styleTween('-webkit-transform', _rotate);
    word.transition()
        .duration(1000)
        .each(function(){
          var elem = d3.transition(d3.select(this));
          var width = elem.select('span').node().getBoundingClientRect().width;
          elem.style('width', width+'px');
        });
  }, 300);
};

$(document).ready(function(){
  // if(idiLogo.isLoaded()){
  //   idiLogo.animate();
  // }
  // idiLogo.cookie.set();
});
