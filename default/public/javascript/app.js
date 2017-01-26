$('.flash').addClass("flashContent");
$('.flash').fadeIn("slow", function(){
    setTimeout(function(){
        $('.flash').fadeOut();
    }, 5000);
});
$(document).on('click', '.flash', function(){
   $(this).hide(); 
});

function t2f(valor) 
{
  var salida = "";
  if (String(valor).length > 0) {
    if (valor.indexOf("-") != -1) {
      var fecha = valor.split("-");
      salida = fecha[2] + "-" + fecha[1] + "-" + fecha[0];      
    }
  }
  return salida;
}

function t2n(valor) 
{
  var salida = "0";
  //////console.log(valor);
  if (String(valor).length > 0 ) {
      salida = String(valor);
      if (salida.indexOf("$") != -1) {
        salida = salida.replace("$", "");
      }
      while (salida.indexOf(".") != -1) {
        salida = salida.replace(".", "");
      }
      while (salida.indexOf(",") != -1) {
        salida = salida.replace(",", ".");
      }  
  }
  //////console.log(salida);
  return salida;
}

var formatNumber = {
  separador: ".", // separador para los miles
  sepDecimal: ',', // separador para los decimales
  formatear:function (num){
      num +='';
      var splitStr = num.split('.');
      var splitLeft = splitStr[0];
      var splitRight = splitStr.length > 1 ? this.sepDecimal + splitStr[1] : '';
      var regx = /(\d+)(\d{3})/;
      while (regx.test(splitLeft)) {
        splitLeft = splitLeft.replace(regx, '$1' + this.separador + '$2');
      }
      return this.simbol + splitLeft  +splitRight;
  },
  new:function(num, simbol){
      this.simbol = simbol ||'';
      return this.formatear(num);
  }
}

function n2m(valor) 
{
	if (String(valor).length > 0) {
		return formatNumber.new(valor, '$');
	} else {
		return "";
	}
}


function PrintElem(elem, title, settings, hide, copies)
{
    copies = copies == undefined ? 1 : parseInt(copies);
    Popup($(elem).html(), title, settings, hide, copies);
}

function Popup(data, title, settings, hide, copies) 
{
    var mywindow = window.open('', title, settings);
    mywindow.document.write('<html><head><title>'+title+'</title>');
    mywindow.document.write('<link rel="stylesheet" href="' + PUBLIC_RUTA + 'css/bootstrap.min.css" type="text/css" />');
    if (hide !== '') {
        var content = "";
        content += '<style type="text/css">\n';
        content += '.' + hide + ' { \n';
        content += ' display: none; \n';
        content += '}\n';
        content += settings;
        content += '</style>';
        mywindow.document.write(content);
    }
    mywindow.document.write('</head><body >');
    mywindow.document.write(data);
    
    mywindow.document.write('</body></html>');

    for (i = 1; i <= copies; i++) {
        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10

        mywindow.print();
    }
    mywindow.close();
    

    return true;
}
