/**
 * jQuery-Skript for extracting automatic point label placement test instances
 */

var height = $('#faces img').height();
var persons = $('map').children();
var out = persons.length + "\n";

persons.each(function() {
  var title = $(this).attr("title");
  var name = (title !== '' && title !== '(Unbekannt)') ? ($(this).attr("title").split(',')[0].split(' ')[0]) : 'Empty';

  var pointX = Math.round($(this).attr('data-x'));
  var pointY = Math.round(height - $(this).attr('data-y'));
  var pointL = name.length * 2 + 4;
  var pointH = 8;
  out += pointX + " " + pointY + " " + pointL + " " + pointH + " " + name + " 0 0 0\n";
});

console.log(out);
