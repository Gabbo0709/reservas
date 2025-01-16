const crearCookie = (nombre, valor, dias) => {
    let fecha = new Date()
    fecha.setTime(fecha.getTime() + (dias * 24 * 60 * 60 * 1000))
    let expira = "expires=" + fecha.toUTCString()
    document.cookie = nombre + "=" + valor + ";" + expira + ";path=/"
}

const leerCookie = (nombre) => {
    let nombreCookie = nombre + "="
    let arrayCookies = document.cookie.split(';')
    for (let i = 0; i < arrayCookies.length; i++) {
        let cookie = arrayCookies[i]
        while (cookie.charAt(0) == ' ') {
            cookie = cookie.substring(1)
        }
        if (cookie.indexOf(nombreCookie) == 0) {
            return cookie.substring(nombreCookie.length, cookie.length)
        }
    }
}

const $ = (selector) => { return document.getElementById(selector) }