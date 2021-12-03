function is_dock_project() {
    if [ -e docker-compose.yml ] || [ -e "Dockerfile" ] || [ -e "*Dockerfile" ]; then
        echo 1
    fi
}

function dock_status() {
    if [ $(is_dock_project) ]; then
        if [[ $DOCKER_MACHINE_NAME != "" && $DOCKER_MACHINE_NAME != "default" ]]; then
          DOCKER_MACHINE_NAME_LOCAL="%{$fg_bold[red]%}"$DOCKER_MACHINE_NAME"%{$fg_bold[blue]%}:"
        fi
        echo -n " "$DOCKER_MACHINE_NAME_LOCAL
        local compose_= $(docker-compose ps 2>/dev/null);
        local cmd
        local tail_n
        if [ -n compose_ ]; then
            tail_n=3
            cmd=docker-compose ps 2>/dev/null
        else tail_n=2
        fi
        ${cmd} | tail -n+${tail_n} | while read line
        do
            CONTAINER_LETTER_POSITION=$(echo $line | awk 'match($0,"_"){print RSTART}')
            CONTAINER_LETTER=$(echo ${line:$CONTAINER_LETTER_POSITION:1} | tr '[:lower:]' '[:upper:]')
            if [[ $line == *"Up"* ]]; then
                echo -n "%{$fg_bold[green]%}"$CONTAINER_LETTER"%{$fg_bold[blue]%}"
            else
                echo -n "%{$fg_bold[red]%}"$CONTAINER_LETTER"%{$fg_bold[blue]%}"
            fi
        done
        echo -n ")"
    fi
}