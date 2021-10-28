task: task.o
	java Task

task.o:
	javac Task.java

test: task install
	npm run test

clean:
	rm -f Task.class package-lock.json
	rm -rf node_modules

install:
	npm install
