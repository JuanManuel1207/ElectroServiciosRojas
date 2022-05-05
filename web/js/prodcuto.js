
function agregar_producto()
{
    const idProduct = document.getElementById("idProduct").value;
    const name = document.getElementById("name").value;
    const cost = document.getElementById("cost").value;
    const txtDesc = document.getElementById("txtDesc").value;

    if(idProduct == "" || name== "" || cost== "" || txtDesc == ""){
        alert("No se puede guardar campos vacíos")
    }else{
        const varSend = `codigo=${idProduct}&nombre=${name}&fecha=${txtDesc}&valor=${cost}`;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "control_producto", true);
        xhr.onreadystatechange = () => {
            if (xhr.readyState == 4 && xhr.status == 200) {
                if (!JSON.parse(xhr.responseText)) {
                    alert("Error La id del Producto ya ha sido Registrada");
                } else {
                    alert("Producto Registrado con éxito");
                    cancelProduct();
                }
            }
        };
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send(varSend);
    }

}

function addProduct(){
    const idProduct = document.getElementById("idProduct").value;
    if(idProduct ==""){
        alert("No se puede usar esa ID")
    }else{
        document.getElementById("name").removeAttribute("disabled");
        document.getElementById("cost").removeAttribute("disabled");
        document.getElementById("txtDesc").removeAttribute("disabled");
        document.getElementById("btnSave").removeAttribute("disabled");
        document.getElementById("btnCancel").removeAttribute("disabled");

        document.getElementById("btnAdd").setAttribute("disabled","btnAdd");
        document.getElementById("btnDelete").setAttribute("disabled","btnDelete");
        document.getElementById("btnSearch").setAttribute("disabled","btnSearch");
        document.getElementById("idProduct").setAttribute("disabled","idProduct");

    }
}

function onlyNums(e){
    const code = window.event ? e.which : e.keyCode;
    return !( code < 48 || code > 57 );
}

function onlyAlpha(e){
    const code = window.event ? e.which : e.keyCode;
    return !(code != 32 && (code < 65 || code > 90) && (code < 97 || code > 122));
}

function borrar_producto()
{
    
    const idProduct = document.getElementById("idProduct").value;
    if (idProduct==""){
        alert("No se puede eliminar un campo vacío")
    }else{
        alert(idProduct);
        var xhr = new XMLHttpRequest();
        xhr.open('GET',"control_producto?option=1&id="+idProduct,true);
        xhr.onreadystatechange = () => {
            if (xhr.readyState == 4 && xhr.status == 200) {
                alert(xhr.responseText);
               // leer_productos();
            }
        }   
        xhr.send(null);
    }
      
}

function cancelProduct() {
    document.getElementById("idProduct").value = "";
    document.getElementById("name").value = "";
    document.getElementById("txtDesc").value = "";
    document.getElementById("cost").value = "";

    document.getElementById("idProduct").removeAttribute("disabled");
    document.getElementById("btnAdd").removeAttribute("disabled");
    document.getElementById("btnSearch").removeAttribute("disabled");
    document.getElementById("btnDelete").removeAttribute("disabled");

    document.getElementById("name").setAttribute("disabled","name");
    document.getElementById("cost").setAttribute("disabled","cost");
    document.getElementById("txtDesc").setAttribute("disabled","txtDesc");
    document.getElementById("btnSave").setAttribute("disabled","btnSave");
    document.getElementById("btnCancel").setAttribute("disabled","btnCancel");
}


function consultar_producto()
{
    const idProduct = document.getElementById("idProduct").value;
    if (idProduct==""){
        alert("No se puede buscar un campo vacío")
    }else{
        alert(idProduct)
        var xhr = new XMLHttpRequest();
        xhr.open('GET',"control_producto?option=2&id="+idProduct,true);
        xhr.onreadystatechange = () => {
            if (xhr.readyState == 4 && xhr.status == 200) {
                alert(xhr.responseText);
                
            }
        }   
    xhr.send(null);
    }
}
