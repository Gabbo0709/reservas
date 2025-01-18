const url = "http://localhost:8080/"

var sede = null 
var tipoUsuario = null
var selectArea = null
var txtRFC = null
var btnBuscar = null
var btnAgregar = null
var selectAreaEmp = null
var empleados = null
var formEmpleado = null

async function initialize () {
    crearCookie('tipoUsuario', 1, 1)
    crearCookie('sede', '1', 1)
    tipoUsuario = leerCookie('tipoUsuario')
    sede = leerCookie('sede')
    selectArea = $('select-area')
    txtRFC = $('txt-rfc')
    selectAreaEmp = $('select-area-emp')
    btnBuscar = $('btn-buscar')
    btnAgregar = $('btn-agregar')
    empleados = $('tb-empleado-body')
    formEmpleado = $('form-empleado')
    await obtenerAreas()
    await obtenerEmpleados()
    selectArea.addEventListener('change', obtenerEmpleadosArea)
    formEmpleado.addEventListener('submit', agregarEmpleado)
}

const obtenerAreas = async () =>{
    let query = 'empleado/obtenerAreas'
    let params = `sede=${sede}`
    let data = await fetchData(query, params)
    renderSelect(data, selectArea)
    renderSelect(data, selectAreaEmp)
}

const obtenerEmpleados = async () => {
    let query = 'empleado/obtenerEmpleados'
    let params = `sede=${sede}&area=0`
    let data = await fetchData(query, params)
    renderEmpleados(data)
}

const obtenerEmpleadosArea = async () => {
    let query = 'empleado/obtenerEmpleados'
    let params = `sede=${sede}&area=${selectArea.value}`
    let data = await fetchData(query, params)
    renderEmpleados(data)
}

const renderSelect = (data, select) => {
    data.forEach(element => {
        let option = document.createElement('option')
        option.value = element.id_area
        option.innerText = element.nom_area
        select.appendChild(option)
    });
}

const renderEmpleados = (data) => {
    empleados.innerHTML = ''
    let html = ''
    data.forEach(element => {
        html += `
            <tr>
                <td>${element.nombre}</td>
                <td>${element.nom_area}</td>
                <td>${element.correo}</td>
                <td>${element.telefono}</td>
                <td id='${element.rfc}'>
                    <button class='btn btn-outline-danger'>Cambiar estado</button>
                </td>
            </tr>
        `
    })
    empleados.innerHTML = html
}

function agregarEmpleado(e) {
    e.preventDefault()
    let data = new FormData(formEmpleado)
    fetch(`${url}empleado/agregarEmpleado`, {
        method: 'POST',
        body: data
    })
    .then(result => result.text())
    .then(response => console.log(response))
}

const fetchData = async (query, params) => {
    let result = await fetch(`${url}${query}?${params}`)
    let data = await result.json()
    return data
}

document.addEventListener('DOMContentLoaded', initialize)