
run:
	docker run -it -p 80:80 -v $(PWD):/usr/share/nginx/html --rm nginx
