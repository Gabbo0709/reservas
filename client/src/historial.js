const url = 'http://localhost:8080/'

var tipoUsuario = null
var rfc = null
var sede = null
var estado = null
var fecha = null
var historial = null


const obtenerHistorial = async () => {
    let query = 'historial'
    let params = ''
    params += `tipo=${tipoUsuario}`
    params += rfc ? `&rfc=${rfc}` : ''
    params += `&sede=${sede}`
    let data = await fetchHistorial(query, params)
    renderHistorial(data)
}

const estadoHistorial = async () => {
    let query = 'historial/estado'
    let params = ''
    params = `tipo=${tipoUsuario}`
    params += `&estado=${estado.value.toUpperCase()}`
    params += `&rfc=${rfc}`
    params += `&sede=${sede}`
    let data = await fetchHistorial(query, params)
    renderHistorial(data)
}

const fechaHistorial = async () => {
    let query = 'historial/fecha'
    let params = ''
    params = `tipo=${tipoUsuario}`
    params += `&fecha=${fecha.value}`
    params += `&rfc=${rfc}`
    params += `&sede=${sede}`
    let data = await fetchHistorial(query, params)
    renderHistorial(data)
}

const fetchHistorial = async (query, params) => {
    let response = await fetch(`${url}${query}?${params}`)
    let data = await response.json()
    console.log(data)
    return data
}

const renderHistorial = (data) => {
    historial.innerHTML = ''
    let body = ''
    data.forEach((element) => {
        body += `
            <tr>
                <td>${element.nombre}</td>
                <td>${element.nom_area}</td>
                <td>${element.motivo}</td>
                <td>${element.fecha_solicitud}</td>
                <td>${element.f_inicio} - ${element.h_inicio}</td>
                <td>${element.estado}</td>
                <td><button class='button'>Detalles</button></td>
            </tr>
        `
    })
    historial.innerHTML = body
}

document.addEventListener('DOMContentLoaded', async () => {
    crearCookie('tipoUsuario', 1, 1)
    crearCookie('sede', '1', 1)
    tipoUsuario = leerCookie('tipoUsuario')
    rfc = leerCookie('rfc')
    sede = leerCookie('sede')
    estado = $('select-estado')
    fecha = $('txt-fecha')
    historial = $('tb-solicitudes-body')
    estado.addEventListener('change', estadoHistorial)
    fecha.addEventListener('change', fechaHistorial)
    await obtenerHistorial()
})
