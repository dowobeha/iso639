#!/usr/bin/ruby -w

index=0

STDIN.each_line {|line|

line=line.strip

if index > 0

  parts = line.split("\t")
  
  code=parts[0].upcase

  0.upto(3) {|i|
    if parts[i]==""
      parts[i]="null"
    else
      parts[i]="\"#{parts[i]}\""
    end
  }

  if parts[4]=="I"
    parts[4]="Scope.Individual"
  elsif parts[4]=="M"
    parts[4]="Scope.Macrolanguage"
  elsif parts[4]=="S"
    parts[4]="Scope.Special"
  else
    parts[4]="null"
  end

  if parts[5]=="A"
    parts[5]="Type.Ancient"
  elsif parts[5]=="C"
    parts[5]="Type.Constructed"
  elsif parts[5]=="E"
    parts[5]="Type.Extinct"
  elsif parts[5]=="H"
    parts[5]="Type.Historical"
  elsif parts[5]=="L"
    parts[5]="Type.Living"
  elsif parts[5]=="S"
    parts[5]="Type.Special"
  else
    parts[5]="null"
  end

  6.upto(7) {|i|
    if parts[i]==nil || parts[i].strip==""
      parts[i]="\"\""
    else
      parts[i]="\"#{parts[i]}\""
    end
  }
  
  string ="\n"
  string+="/**\n"
  string+=" * Representation for language #{parts[6]}, derived directly from the ISO 639-3 code table at <a href=\"http://www.sil.org/iso639-3/iso-639-3_20120206.tab\">http://www.sil.org/iso639-3/iso-639-3_20120206.tab</a>.\n"
  string+=" */\n"
  string+="class #{code} extends Language {\n"
  string+="\t@SuppressWarnings(\"unused\")\n"
  string+="\tpublic #{code}() {\n"
  string+="\t\t//This space intentionally left blank\n"
  string+="\t}\n"
  string+="\tpublic String identifier(ISO639_Part part) {\n"
  string+="\t\tswitch(part) {\n"
  string+="\t\t\tcase Part1: return #{parts[3]};\n"
  string+="\t\t\tcase Part2_Bibliographic: return #{parts[1]};\n"
  string+="\t\t\tcase Part2_Terminology: return #{parts[2]};\n"
  string+="\t\t\tcase Part3: return #{parts[0]};\n"
  string+="\t\t\tdefault: return null;\n"
  string+="\t\t}\n"
  string+="\t}\n"
  string+="\tpublic Scope scope() { return #{parts[4]}; }\n"
  string+="\tpublic Type type() { return #{parts[5]}; }\n"
  string+="\tpublic String referenceName() { return #{parts[6]}; }\n"
  string+="\tpublic String comment() { return #{parts[7]}; }\n"
  string+="\tpublic String toString() { return #{parts[6]}; }\n"
  string+="}\n"

  puts string

end

index+=1

}

