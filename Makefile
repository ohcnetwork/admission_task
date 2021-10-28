#
# Add a new langauge by creating a build rule like either cpp or javascript
#
# Checklist:
# - [ ] Add a task.[java|rb|py] file depending on the language
# - [ ] Copy shared files
# 	1. `README.md`: for the task-txt-cli problem
# 	2. `task.test.js`: end-to-end testing using Jest JavaScript framework
# 	3. `package.json`: for installing jest
# 	4. `task.sh`: template for adding language specific binary
# - [ ] Append language specific executable command to `task.sh`
#

TARGETS = c cpp javascript ruby java python


all: clean $(TARGETS)
	echo "Packaging completed."

c: _build
	cp -rf c _build
	cp -arf shared/. _build/c
	# Append C compiled binary to `task.sh`
	# The $@ will pass through CLI args to the binary
	echo \\n./task.out \"$$\@\" >> _build/c/task.sh
	echo '\n.\\task.out %1 %2' >> _build/c/task.bat
	cat _build/c/Intro.md _build/c/getting_started.md _build/c/Test.md > _build/c/README.md
	rm _build/c/Intro.md _build/c/getting_started.md _build/c/Test.md
	cd _build && zip -r --quiet fellowship-c.zip c -x "node_modules" -x "package-lock.json"
	rm -rf _build/c
	echo "Created C package: fellowship-c.zip"

cpp: _build
	cp -rf cpp _build
	cp -arf shared/. _build/cpp
	# Append C++ compiled binary to `task.sh`
	# The $@ will pass through CLI args to the binary
	echo \\n./task.out \"$$\@\" >> _build/cpp/task.sh
	echo '\n.\\task.out %1 %2' >> _build/cpp/task.bat
	cat _build/cpp/Intro.md _build/cpp/getting_started.md _build/cpp/Test.md > _build/cpp/README.md
	rm _build/cpp/Intro.md _build/cpp/getting_started.md _build/cpp/Test.md
	cd _build && zip -r --quiet fellowship-cpp.zip cpp -x "node_modules" -x "package-lock.json"
	rm -rf _build/cpp
	echo "Created C++ package: fellowship-cpp.zip"

javascript: _build
	cp -rf javascript _build
	cp -arf shared/. _build/javascript
	# Append node command to `task.sh`
	# The $@ will pass through CLI args to the node executable
	echo \\nnode task.js \"$$\@\" >> _build/javascript/task.sh
	echo \\nnode task.js %1 %2 >> _build/javascript/task.bat
	cat _build/javascript/Intro.md _build/javascript/getting_started.md _build/javascript/Test.md > _build/javascript/README.md
	rm _build/javascript/Intro.md _build/javascript/getting_started.md _build/javascript/Test.md
	cd _build && zip -r --quiet fellowship-javascript.zip javascript -x "node_modules" -x "package-lock.json"
	rm -rf _build/javascript
	echo "Created JavaScript package: fellowship-javascript.zip"

ruby: _build
	cp -rf ruby _build
	cp -arf shared/. _build/ruby
	# Append ruby command to `task.sh`
	# The $@ will pass through CLI args to the node executable
	echo \\nruby task.rb \"$$\@\" >> _build/ruby/task.sh
	echo \\nruby task.rb %1 %2 >> _build/ruby/task.bat
	cat _build/ruby/Intro.md _build/ruby/getting_started.md _build/ruby/Test.md > _build/ruby/README.md
	rm _build/ruby/Intro.md _build/ruby/getting_started.md _build/ruby/Test.md
	cd _build && zip -r --quiet fellowship-ruby.zip ruby -x "node_modules" -x "package-lock.json"
	rm -rf _build/ruby
	echo "Created ruby package: fellowship-ruby.zip"

python: _build
	cp -rf python _build
	cp -arf shared/. _build/python
	# Append python command to `task.sh`
	# The $@ will pass through CLI args to the node executable
	echo \\npython3 task.py \"$$\@\" >> _build/python/task.sh
	echo \\npython3 task.py %1 %2 >> _build/python/task.bat
	cat _build/python/Intro.md _build/python/getting_started.md _build/python/Test.md > _build/python/README.md
	rm _build/python/Intro.md _build/python/getting_started.md _build/python/Test.md
	cd _build && zip -r --quiet fellowship-python.zip python -x "node_modules" -x "package-lock.json"
	rm -rf _build/python
	echo "Created python package: fellowship-python.zip"

java: _build
	cp -rf java _build
	cp -arf shared/. _build/java
	# Append C++ compiled binary to `task.sh`
	# The $@ will pass through CLI args to the binary
	echo \\njava Task \"$$\@\" >> _build/java/task.sh
	echo \\njava Task %1 %2 >> _build/java/task.bat
	cat _build/java/Intro.md _build/java/getting_started.md _build/java/Test.md > _build/java/README.md
	rm _build/java/Intro.md _build/java/getting_started.md _build/java/Test.md
	cd _build && zip -r --quiet fellowship-java.zip java -x "node_modules" -x "package-lock.json"
	rm -rf _build/java
	echo "Created Java package: fellowship-java.zip"

_build:
	mkdir -p _build

clean:
	rm -rf _build
	echo "Removed previous artefacts from _build/ directory."
