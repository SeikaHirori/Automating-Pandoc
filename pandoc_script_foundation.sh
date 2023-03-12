# Export the function to be flexible.
hello_world="Hello, fellow lovely people :3"
current_date=$(date +%b-%d-%y_%H_%M)
# input_format="docx"
# output_format="md"

input_subdirectory="_input"
original_subdirectory="_original"
converted_subdirectory="1_converted"

name_log="log_$current_date\.txt"

finished_conversion="\nFinished converting. Enjoy your day :3 \n"

run_conversion() {
    # is_arg_1_not_valid= [ -z "$1" ]
    # is_arg_2_not_valid= [ -z "$2" ]

    # echo $is_arg_1_not_valid
    # echo $is_arg_2_not_valid

    # if $is_arg_2_not_valid; then
    #     echo "Second argument is missing"

    #     if $is_arg_1_not_valid; then
    #         echo "First argrument is also missing"
    #     fi
    #     echo ""
    #     echo "Ending program"
    #     exit 1
    # fi


    input_format=$1
    output_format=$2
    # output_name=$3
    # input_name=$4

    echo "Input format: $input_format"
    echo "Output format: $output_format"
    echo ""

    final_subdirectory=$converted_subdirectory\_$output_format\_$current_date
    final_subdirectory=$converted_subdirectory\_$output_format


    mkdir_input() {
        echo -e "If folder 'input' doesn't exist, it'll be made.\n"
        mkdir -p $input_subdirectory
    }

    is_dir_input_empty(){
        echo -e "checking if dir 'input' is empty... \n"

        if [ -d "$input_subdirectory/" ]; then
            echo -e 'Folder exists! \n'

            if [ "$(ls -A $input_subdirectory/)" ]; then
                echo "There are files in here :3"
            else
                echo "Folder is empty; ending program."
                echo -e "Please add files into folder '_input' \n"
                exit 1
            fi
        else
            echo "Folder not found"
            exit 1
        fi
    }

    mkdir_conversion() {
        echo -e "Converted files will be store in the folder: $final_subdirectory \n"
        mkdir -p $final_subdirectory
    }

    mkdir_original_files() {
        echo -e "Original files will be moved to folder '$original_subdirectory' after conversion IF the file was converted."
        mkdir -p $original_subdirectory
    }

    convert_command() {
        echo -e "Running conversion \n"

        ### V1
        # find $input_subdirectory -name \*.$input_format -type f -exec pandoc -o $final_subdirectory/{}.$output_format {} \;

        ### V2
        # find $input_subdirectory -name \*.$input_format -type f -exec pandoc -f docx -t markdown $output_name {} > $final_subdirectory/{}.$output_format \;
        
        ### V3
        find $input_subdirectory -iname \*.$input_format -type f -exec pandoc "{}" -o "{}.$output_format" {} \;


    }

    # create_log(){
    #     touch -p $final_subdirectory
    # }

    move_new_files_to_subdirectory(){
        find $input_subdirectory -iname \*.$output_format -type f -exec mv {} $final_subdirectory \;
    }


    # Run commands here:
    mkdir_input
    is_dir_input_empty
    mkdir_conversion
    mkdir_original_files
    convert_command
    move_new_files_to_subdirectory

    echo -e $finished_conversion
}

