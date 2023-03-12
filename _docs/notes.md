# Note #1
- Bash | example of a regular 'for loop' VS 'one liner'

    - For Loop | Version
        ```
        for item in $input_subdirectory/*; do
            echo "loops"
            if [[ $item =~ $output_format ]]; then
                echo -e "item has the format: $output_format"
                mv $item $final_subdirectory
            else
                echo 'not there'
            fi
        done
        ```
    - One line Version
    `find $input_subdirectory -iname \*.$output_format -type f -exec mv {} $final_subdirectory \;`
        - This can be run within a command line, but it seems less flexible if needing to add additional commands.
