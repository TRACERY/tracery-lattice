image:
	./download_consul.sh
	docker build -t tracery-lattice:0.1.0 .

clean:
	-rm consul
