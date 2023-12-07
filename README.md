# ConsoleToUSB
Script de acesso de consoles de switches em ambientes GNU/Linux 

## Ambiente de Teste:

Sistema Operacional: GNU/Linux Ubuntu 20.04 e 22.04

Cabo utilizado: HL USB-RS232

## Utilização:

1. Clonar repositório:
```
git clone https://github.com/cairoapcampos/ConsoleToUSB.git
```
2. Entrar na pasta, definir o script como executável e executá-lo:
```
cd ConsoleToUSB
chmod +x ConsoleToUSB.sh
./ConsoleToUSB.sh
```

**Obs**: Se o dispositivo **/dev/ttyUSB0** não estiver aparecendo em sistemas Linux baseados em Ubuntu 22.04, leia o link abaixo:
```
https://askubuntu.com/questions/1403705/dev-ttyusb0-not-present-in-ubuntu-22-04
```

## Fontes:
```
https://samthngs.wordpress.com/2019/02/15/enviando-dados-para-ttyusb-rs232-via-terminal-linux/

https://elviro.blogspot.com/2015/09/configurando-rs232-no-linux.html

https://medium.com/@m0blabs/usando-o-minicom-5f3872da9531

https://lrodrigo.sgs.lncc.br/wp/dicas/dicas-linux/configurando-minicon-para-trabalhar-com-uma-conexao-usb/
```
