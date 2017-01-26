/**
 * 
 */
/* esRutValido
       permite validar el contenido de un rut
    */
    function esRutValido(valorRut) {
        var salida = valorRut;
        while (salida.indexOf(".") != -1) {
            salida = salida.replace(".", "");
        } 
        while (salida.indexOf("-") != -1) {
            salida = salida.replace("-", "");
        } 
        salida = salida.trim();

        return validarRut(salida);
    }
    
	function CalcularCaracteres(mensaje,objContador,largo) {  
		if ( document.getElementById(mensaje).value.length > largo ) {  
		  document.getElementById(mensaje).value = document.getElementById(mensaje).value.substring(0,largo)  
		  libres = 0  
		} else {  
		  libres = largo - document.getElementById(mensaje).value.length  
		}  
		document.getElementById(objContador).innerHTML = libres  
	}
	
    function mano(a) {
    //muestra como cursor la mano(hand) cuando se pasa por encima de un boton
	    if (navigator.appName=="Netscape") {
		    a.style.cursor='pointer';
	    } else {
		    a.style.cursor='hand';
	    }
    }

function dejaCero(control){
	var valor=document.getElementById(control).value;
	if(valor == ""){
		document.getElementById(control).value = "0";
		return;
	}
}

function dejaVacio(control){
    var valor=document.getElementById(control).value;
    if(valor == "0"){
        document.getElementById(control).value ="";
    }
}

function soloNumeros(e){
    tecla = (document.all) ? e.keyCode : e.which; 
    if (tecla==8) return true; //Tecla de retroceso (para poder borrar) 
    if (tecla==0) return true; //Tecla de retroceso (para poder borrar) 

	//alert(tecla);

    patron = /\d/;// Solo acepta números y el punto
    
    te = String.fromCharCode(tecla); 
    return patron.test(te);  

}

    
    
    function miles(donde,caracter){
	pat = /[\*,\+,\(,\),\?,\,$,\[,\],\^]/
	valor = donde.value
	largo = valor.length
	crtr = true
	if(isNaN(caracter) || pat.test(caracter) == true){
//		if (pat.test(caracter)==true){ 
//			caracter = "\" + caracter
//		}
//		carcter = new RegExp(caracter,"g")
//		valor = valor.replace(carcter,"")
//		donde.value = valor
//		crtr = false
	}
	else{
		var nums = new Array()
		cont = 0
		for(m=0;m<largo;m++){
			if(valor.charAt(m) == "." || valor.charAt(m) == " " || valor.charAt(m) == ",")
				{continue;}
			else{
			    //alert(valor.charAt(m));
				nums[cont] = valor.charAt(m)
				cont++
			}
		}
	}
	var cad1="",cad2="",tres=0
	if(largo > 3 && crtr == true){
		for (k=nums.length-1;k>=0;k--){
			cad1 = nums[k]
			cad2 = cad1 + cad2
			tres++
			if((tres%3) == 0){
				if(k!=0){
					cad2 = "." + cad2
				}
			}
		}
		donde.value = cad2
	}
}	

function decimales(evt,control){
        //Limita un control a números con dos decimales y acepta negativos.
        //alert(evt.keyCode);
        var texto = control.value;
        var coma = texto.indexOf('.');
         
        if (evt.keyCode <= 13 || (evt.keyCode >= 48 && evt.keyCode <= 57)){
            if ((coma!=-1) && (texto.length - (coma + 1))>=1){
                return false;
            }
        }
        else if (evt.keyCode == 44 && texto.length>=1 ){
            if (coma!=-1 && texto.indexOf('.',coma)!=-1 ){
                return false;
            }
        }else if (evt.keyCode==45 && texto.indexOf('-')!=-1){
     		return false;   	
        }
        return true;
    }


//
//Validador de Rut
//Descargado desde http://www.juque.cl/
//modificaciones por @nelsonrojas

function validarRut( rut ) {	
	var esValido = true;
	var dv = "";
	rut = rut.trim();

	//console.log("Rut inicial:" + rut);

	if ( rut.length < 5 ) {		
		return false;
	}	

	dv = rut.charAt(rut.length-1).toUpperCase();	
	//console.log("DV:" + dv);
	rut = rut.substring(0, rut.length - 1);	
	//console.log("Rut trabajo:" + rut);

	
	var dvr = '0';
	var suma = 0;
	var mul  = 2;	

	for (i= rut.length -1 ; i >= 0; i--) {	
		suma = suma + rut.charAt(i) * mul;
		if (mul == 7) {
			mul = 2;
		} else {
			mul++;
		}			
	}	
	var res = suma % 11;
	if (res==1) {
		dvr = 'K';	
	} else if (res==0) {
		dvr = '0';
	} else	{		
		dvi = 11-res;		
		dvr = dvi + "";
	}

	//console.log("DV Calculado:" + dvr);

	if ( dvr != dv ){		
		esValido = false;
	} else {
		esValido = true;
	}

	return esValido;
}

	