# PHP 5.6 + Apache

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
- 2020-07-16 Adicionado SOAP e suporte à MySQL via PDO
- 2020-07-16 Executando autoremove e autoclean
- 2020-07-16 Adicionando suport à MySQL via mysqli
- 2020-07-22 Adicionando composer
- 2020-08-06 Alterando Error Reporting do PHP para "E_ALL & ~E_NOTICE & ~E_WARNING & ~E_DEPRECATED"

No dockerhub [fococomunicacao/php56-apache](https://hub.docker.com/r/fococomunicacao/php56-apache)