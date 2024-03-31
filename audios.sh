#!/bin/bash
IFS=$'\n'

control_c () {

    for i in $inputfl; do
        for j in $outputfl; do
            pw-link -d "$j" "$i" 2>/dev/null
        done
    done
 
    for i in $inputfr; do
        for j in $outputfr; do
            pw-link -d "$j" "$i" 2>/dev/null
        done
    done    
    
    echo ""
   
    exit 1

}

main_loop () {
    while true; do
        inputs=$(pw-link -Ii | grep -i $2 | grep input_)
        inputfl=$(grep FL <<< $inputs)
        inputfr=$(grep FR <<< $inputs)
        
        outputs=$(pw-link -Io | grep -i $1 | grep output_)
        outputfl=$(grep FL <<< $outputs)
        outputfr=$(grep FR <<< $outputs)        
        
        trap control_c SIGINT
       
        for i in $inputfl; do
            for j in $outputfl; do
                #echo $i $j
                pw-link "$j" "$i" 2>/dev/null
            done
        done

        for i in $inputfr; do
            for j in $outputfr; do
                #echo $i $j
                pw-link "$j" "$i" 2>/dev/null
            done
        done
        sleep 1
    done
}
 
if [[ $# != 2 ]]
then    
    echo -e "Incorrect usage please try again with the format:\n\"audios <input program> <output program>\""
    exit 2
else
    main_loop $1 $2
fi    
