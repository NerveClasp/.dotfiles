function indexify --description 'create an index.js in a folder'
  switch $argv[1]
    case ''
      ls -m *.js | sed 's/, /\n/g' | sed 's/.js,\?//g' > index.js
    case '-a'
      ls -m | sed 's/, /\n/g' | sed 's/.js,\?//g' | sed 's/,//g' > index.js
    case '-e'
      set ext $argv[2]
      # echo $ext
      ls -m *.$ext | sed 's/, /\n/g' | sed "s/.$ext,\?//g" | sed "s/.$ext//g" > index.js
    case '-t'
      set ext $argv[2]
      for i in *$ext ;
        set filename (echo $i | sed "s/$ext//g")
        echo "export { default as $filename } from './$filename';" >> index.js;
      end;
      #  | set filename | echo "export { default as $filename } from './$filename';" ; end
  end
  # set --local options 'h/help' 'n/count=!_validate_int --min 1'

  # argparse -i $options -- $argv

  # if set --query _flag_help
  #   printf "Usage: foo [OPTIONS]\n\n"
  #   printf "Options:\n"
  #   printf "  -h/--help       Prints help and exits\n"
  #   printf "  -n/--count=NUM  Count (minimum 1, default 10)"
  #   return 0
  # end

  # set --query _flag_count; or set --local _flag_count 10

  # for i in (seq $_flag_count); echo foo; end
end