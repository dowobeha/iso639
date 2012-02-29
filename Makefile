
all: iso639.jar

iso639.jar: javadoc compile
	jar cf $@ -C release .

javadoc: release/iso639/Part3.java release/iso639/Language.java | release
	javadoc -encoding UTF-8 -d release -sourcepath release iso639

compile: release/iso639/Part3.java release/iso639/Language.java | release/iso639
	javac -encoding UTF-8 -sourcepath release $<

release/iso639/Part3.java: release/iso639/Language.java template/Part3.header | release/iso639
	cp template/Part3.header $@ && cat iso-639-3_20120206.tab | ruby ruby/create_java.rb >> $@

release/iso639/Language.java: template/Language.java | release/iso639
	cp $< $@

release/iso639:
	mkdir -p $@

release:
	mkdir -p $@

clean:
	rm -rf release iso639.jar *~

.PHONY: clean compile javadoc all
