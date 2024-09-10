#!/bin/bash

# Obtener detalles de la tarea activa
task_info=$(task +ACTIVE export | jq -r '.[] | select(.status == "pending") | {id, description, start}')

# Verificar si hay una tarea activa
if [ -z "$task_info" ]; then
    echo "No active task"
    exit 0
fi

# Extraer ID, descripción y tiempo de inicio
task_id=$(echo "$task_info" | jq -r '.id')
task_description=$(echo "$task_info" | jq -r '.description')
start_time=$(echo "$task_info" | jq -r '.start')

# Verificar si el tiempo de inicio es válido
if [ -z "$start_time" ] || [ "$start_time" == "null" ]; then
    elapsed_time="0s"
else
    # Convertir el tiempo de inicio de ISO 8601 a un formato que date pueda procesar
    start_time=$(echo "$start_time" | sed -E 's/([0-9]{4})([0-9]{2})([0-9]{2})T([0-9]{2})([0-9]{2})([0-9]{2})Z/\1-\2-\3T\4:\5:\6Z/')

    # Convertir el tiempo de inicio a un timestamp Unix
    start_timestamp=$(date -d "$start_time" +%s 2>/dev/null)

    if [ -z "$start_timestamp" ]; then
        echo "Error: Fecha de inicio no válida"
        exit 1
    fi

    # Obtener el tiempo actual en timestamp Unix
    current_timestamp=$(date +%s)

    # Calcular el tiempo transcurrido en segundos
    elapsed_seconds=$((current_timestamp - start_timestamp))

    # Convertir el tiempo transcurrido en formato HH:MM
    elapsed_time=$(date -u -d @"$elapsed_seconds" +'%H:%M')
fi

# Imprimir la tarea activa en el formato solicitado
echo "$task_id - $task_description: $elapsed_time"

