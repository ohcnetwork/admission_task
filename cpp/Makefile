app: task.o
	g++ task.o -o task.out

task.o:
	g++ -c -std=c++11 -Wall task.cpp -o task.o

test: app
	npm run test

clean:
	rm -f task.o task.out

install:
	npm install
