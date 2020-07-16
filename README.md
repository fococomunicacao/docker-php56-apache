# PHP 7.3 + Apache

### Fazendo o rebuild
```sh
# fazendo o build da nova imagem
$ docker build --force-rm --no-cache -t php56-apache:latest .
# removendo a imagem local
$ docker rmi --force fococomunicacao/php56-apache:latest
# linkando a tag de nossa imagem local para a do repositório
$ docker tag php56-apache:latest fococomunicacao/php56-apache:latest
# subindo a imagem atualizada para o repositório
$ docker push fococomunicacao/php56-apache:latest
```

### Updates
- 2020-07-16 Adicionando comandos nano e vim
- 2020-07-16 Adicionado SOAP e suporte a MySQL via PDO
- 2020-07-16 Executando autoremove e autoclean

No dockerhub [fococomunicacao/php56-apache](https://hub.docker.com/r/fococomunicacao/php56-apache)