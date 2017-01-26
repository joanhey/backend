/*
 * File:        jquery.dataTables.esp.js
 * Version:     1.9.4
 * Author:      oneconsultores.com
 * 
 * This source file is distributed in the hope that it will be useful, but 
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
 * or FITNESS FOR A PARTICULAR PURPOSE. See the license files for details.
 */
 
function dataTableEsp(tablaID) {
    var cuenta = $("#" + tablaID).find('tr')[0].cells.length;
    var columnas= new Array();
    for (i = 0; i < cuenta -1; i++) {
      columnas[i] = i;
    }
	  $("#" + tablaID).dataTable({
      "aaSorting": [[ 0, "desc" ]],
    "oLanguage": {
      "sSearch": "Buscar:",
      "sInfoEmpty": "No se encontraron elementos",
      "sInfoFiltered": " - filtrando en _MAX_ filas",
      "sEmptyTable": "No hay datos que mostrar en la tabla",
      "sLengthMenu": "Mostrar _MENU_ filas",
      "sLoadingRecords": "Espere un momento - cargando...", 
      "sZeroRecords": "Sin filas que mostrar",
      "sInfo": "_TOTAL_ filas. Mostrando (_START_ a _END_)",
      "oPaginate": {
        "sFirst": "Primera",
        "sLast": "Última",
        "sNext": "Siguiente",
        "sPrevious": "Anterior"

      }
    },
	"sPaginationType": "full_numbers",
    "sDom": 'T<"clear">lfrtip',
    "oTableTools": {
      "sSwfPath": "/permisos/swf/copy_csv_xls_pdf.swf",
      "aButtons": [
        {
          "sExtends": "copy",
          'mColumns':columnas
          
        },
        {
          "sExtends": "csv",
          'mColumns':columnas
          
        },
        {
          "sExtends": "pdf",
          'mColumns':columnas,
          "sPdfOrientation": "landscape"
        },
        {'sExtends':'xls',
         'mColumns':columnas //set which columns here
        },
        {'sExtends':'print',
         'mColumns':columnas //set which columns here
        }        
      ]
    }
    
  });
}


  /*  t2n
  convierte el texto en un valor numérico útil para ser almacenado en la base de datos
  */
  function t2n(valor) {
      var salida = "0";
      ////console.log(valor);
      if (valor.length > 0 ) {
          salida = valor;
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
      ////console.log(salida);
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

function n2m(valor) {
  if (String(valor).length > 0) {
      return formatNumber.new(valor, '$');
  } else {
      return "";
  }
}      

function dataTableEspSumarizada(tablaID, columnaSuma, incluirUltimaColumna) {
    var cuenta = $("#" + tablaID).find('tr')[0].cells.length;
    var columnas= new Array();
    if (incluirUltimaColumna === true) {
      cuenta ++;
    }
    for (i = 0; i < cuenta -1; i++) {
      columnas[i] = i;
    }
    $("#" + tablaID).dataTable({
    "oLanguage": {
      "sSearch": "Buscar:",
      "sInfoEmpty": "No se encontraron elementos",
      "sInfoFiltered": " - filtrando en _MAX_ filas",
      "sEmptyTable": "No hay datos que mostrar en la tabla",
      "sLengthMenu": "Mostrar _MENU_ filas",
      "sLoadingRecords": "Espere un momento - cargando...", 
      "sZeroRecords": "Sin filas que mostrar",
      "sInfo": "_TOTAL_ filas. Mostrando (_START_ a _END_)",
      "oPaginate": {
        "sFirst": "Primera",
        "sLast": "Última",
        "sNext": "Siguiente",
        "sPrevious": "Anterior"

      }
    },
	"sDom": 'T<"clear">lfrtip',
    "oTableTools": {
      "sSwfPath": "/permisos/swf/copy_csv_xls_pdf.swf",
      "aButtons": [
        {
          "sExtends": "copy",
          'mColumns':columnas
          
        },
        {
          "sExtends": "csv",
          'mColumns':columnas
          
        },
        {
          "sExtends": "pdf",
          'mColumns':columnas,
          "sPdfOrientation": "landscape"
        },
        {'sExtends':'xls',
         'mColumns':columnas //set which columns here
        },
        {'sExtends':'print',
         'mColumns':columnas //set which columns here
        }        
      ]
    },
    "fnFooterCallback": function ( nRow, aaData, iStart, iEnd, aiDisplay ) {
      /*
       * Calculate the total market share for all browsers in this table (ie inc. outside
       * the pagination)
       */
      var total = 0;
      for ( var i=iStart ; i<iEnd ; i++ )
      {
        total += t2n(aaData[ aiDisplay[i] ][columnaSuma])*1;
      }
      
      /* Modify the footer row to match what we want */
      var nCells = nRow.getElementsByTagName('th');
      nCells[columnaSuma].innerHTML = n2m(parseInt(total));
    }
    
  });
}



function dataTableEspSinBotones(tablaID) {
    var cuenta = $("#" + tablaID).find('tr')[0].cells.length;
    var columnas= new Array();
    for (i = 0; i < cuenta -1; i++) {
      columnas[i] = i;
    }
    $("#" + tablaID).dataTable({
      "aaSorting": [[ 0, "desc" ]],
    "oLanguage": {
      "sSearch": "Buscar:",
      "sInfoEmpty": "No se encontraron elementos",
      "sInfoFiltered": " - filtrando en _MAX_ filas",
      "sEmptyTable": "No hay datos que mostrar en la tabla",
      "sLengthMenu": "Mostrar _MENU_ filas",
      "sLoadingRecords": "Espere un momento - cargando...", 
      "sZeroRecords": "Sin filas que mostrar",
      "sInfo": "_TOTAL_ filas. Mostrando (_START_ a _END_)",
      "oPaginate": {
        "sFirst": "Primera",
        "sLast": "Última",
        "sNext": "Siguiente",
        "sPrevious": "Anterior"
      }
    },
    "sDom": 'T<"clear">lfrtip',
    "oTableTools": {
      "aButtons": []
    }    
  });
}