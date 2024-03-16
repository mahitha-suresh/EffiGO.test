
$CONTAINER_NAME = "exciting_swanson"

function Start-Container {

    $running = $(docker inspect -f '{{.State.Running}}' $CONTAINER_NAME 2>$null)
    if ($running -eq "true") {
        Write-Output "Container $CONTAINER_NAME is already running."
    }
    else {
  
        docker start $CONTAINER_NAME
        Write-Output "Container $CONTAINER_NAME started."
    }
}

function Stop-Container {

    $running = $(docker inspect -f '{{.State.Running}}' $CONTAINER_NAME 2>$null)
    if ($running -eq "true") {

        docker stop $CONTAINER_NAME
        Write-Output "Container $CONTAINER_NAME stopped."
    }
    else {
        Write-Output "Container $CONTAINER_NAME is not running."
    }
}


if ($args.Count -eq 0) {
    Write-Output "Usage: .\Conatainercontrol.ps1 {start|stop}"
    exit 1
}

switch ($args[0]) {
    "start" {
        Start-Container
    }
    "stop" {
        Stop-Container
    }
    default {
        Write-Output "Usage: .\Conatainercontrol.ps1 {start|stop}"
        exit 1
    }
}
