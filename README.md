# ByteBank

App desenvolvido durante a [Formação de Flutter](https://cursos.alura.com.br/formacao-flutter) do Alura.

## Tecnologias Utilizadas
Durante esse projeto foram utilizada as seguintes tecnologias e suas versões:
- [Flutter](https://docs.flutter.dev/get-started/install): 2.8.1
- [Android SDK](https://developer.android.com/studio): 31.0.0
- [IntelliJ](https://www.jetbrains.com/idea/download/): IDEA Community Edition 2021.2

## Web API Utilizada
Durante a formação, o professor disponibiliza um pequeno servidor para ser rodado na máquina, caso o aluno possua pouco acesso a internet, essas coisas.
O servidor está disponibilizado aqui: [ByteBank Web API](https://github.com/alura-cursos/bytebank-api/tree/runnable) e lá possui algumas instruções sobre como rodar e acessar os endpoints disponíveis. Mas, para me guiar, eu vou deixar algumas instruções já aqui.

<span style="color: #FF0000;">Essas instruções eu utilizei no Windows, eu não sei se funciona para todos os sistemas operacionais</span>

**Comando de rodar no terminal**

```
java -jar server.jar
```

**Comando de excluir os dados inseridos**

```
rmdir /S database
```