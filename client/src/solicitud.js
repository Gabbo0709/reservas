import * as tempo from 'https://esm.run/@formkit/tempo';

const language = "es"
const addDay = tempo.addDay
const addHour = tempo.addHour
const minDate = addDay(new Date(), 2)

var fechaInicio = null
var fechaFin = null

async function initialize () {
    const dateDefualt = format(minDate, language)
    const maxDate = format(tempo.addMonth(minDate, 1), language)
    fechaInicio = $('txt-fecha-inicio')
    fechaFin = $('txt-fecha-fin')
    setMinMax(fechaFin, format(addHour(minDate, 1)), maxDate)
    setMinMax(fechaInicio, dateDefualt, maxDate)
}

function setMinMax(input, value, max) {
    input.value = value
    input.min = value
    input.max = max
}

const format = (date, l) => tempo.format(date, "YYYY-MM-DDTHH:mm", l) 

document.addEventListener("DOMContentLoaded", initialize)