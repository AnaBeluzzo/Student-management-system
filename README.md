# Student Management System

Um sistema bancário completo de gerenciamento desenvolvido em Java com interface gráfica Swing. Este projeto demonstra os sistemas bancários em escala básica, fornecendo uma interface GUI (Graphic User Interface) para gerenciar contadores e correntistas de uma agência bancária específica, com sistema de arquivos para persistência de dados.

## 📖 Sinopse

Este mini projeto é uma demonstração dos sistemas bancários mundiais em escala básica, desenvolvido usando a plataforma Eclipse em Java com sistema de gerenciamento de arquivos. O sistema fornece uma interface para adicionar, deletar e visualizar diferentes contadores de uma agência bancária específica, além de gerenciar correntistas com seus números de conta, contatos e salários armazenados em arquivos para uso quando necessário.

## 🎯 Introdução

A aplicação funciona definindo várias classes com subclasses para modularizar o código final. O código é escrito de forma organizada com documentação apropriada, proporcionando uma experiência de usuário suave e estável para facilitar o uso em todas as faixas etárias. 

**Características técnicas:**
- **Tratamento de Exceções:** Implementado para prevenir travamentos e facilitar o entendimento de erros
- **Multithreading:** Permite múltiplas tarefas simultâneas, essencial para sistemas bancários
- **Orientação a Objetos:** Uso de Encapsulamento, Polimorfismo, Herança e Abstração de Dados
- **Interfaces e Modificadores de Acesso:** Mantêm privacidade e definição de acesso

## 🎪 Problema Identificado

A motivação do projeto foi a falta de uma aplicação simples e bem escrita para acessar e modificar detalhes de contadores bancários e correntistas simultaneamente. Em um mundo moderno, por que a população deveria perder tempo procurando detalhes em registros físicos quando podem ser facilmente mantidos em uma aplicação simples?

## 🎯 Objetivos

- **Acesso Completo:** Permitir ao usuário acessar detalhes de todos os contadores e correntistas
- **Hierarquia Bancária:** Dar autoridade aos contadores para deletar/modificar detalhes dos correntistas
- **Otimização:** Minimizar complexidade de tempo e espaço através de boas práticas de programação
- **Experiência do Usuário:** Interface atrativa e funcional usando JFrames

## 📋 Funcionalidades

### 👨‍💼 Administrador
- Login seguro no sistema
- Gerenciamento completo de usuários
- Visualização de relatórios
- Controle de acesso
- Autoridade para modificar dados de contadores e correntistas

### 👩‍💼 Contador (Accountant)
- Cadastro e gerenciamento de estudantes/correntistas
- Visualização de dados dos correntistas
- Edição de informações de conta (números, contatos, salários)
- Autoridade para deletar e modificar detalhes dos correntistas
- Relatórios financeiros

### 👨‍🎓 Usuário/Correntista
- Visualização de dados pessoais
- Consulta de informações da conta
- Acesso limitado conforme hierarquia bancária

## 🔧 Metodologia

A aplicação funciona lendo todos os contadores e correntistas de arquivos diferentes, que podem ser atualizados pelo proprietário da aplicação e pelo administrador do banco. Os arquivos têm informações armazenadas em formato específico, decodificadas por funções de leitura de string no código.

**Funcionamento:**
- **Leitura de Arquivos:** Utiliza funções built-in do Java para ler dados dos arquivos
- **Gerenciamento de Objetos:** Se existe um objeto para o contador/correntista, ele é acessado; caso contrário, um novo é criado
- **Controle de Acesso:** Objetos não presentes no sistema de arquivos são negados
- **Interface Gráfica:** JFrames proporcionam interface atrativa e funcional

## 🚀 Como Executar

### Pré-requisitos
- Java JDK 8 ou superior
- Sistema operacional: Windows, macOS ou Linux

### Compilação e Execução

1. **Clone o repositório:**
```bash
git clone <url-do-repositorio>
cd Student-management-system
```

2. **Compile os arquivos Java:**
```bash
# Navegue até a pasta do projeto
cd "Student portal"

# Compile todos os arquivos Java
javac -d bin src/*.java
```

3. **Execute o sistema:**
```bash
# Navegue para a pasta bin
cd bin

# Execute a classe principal (escolha uma das opções abaixo)
java AdminLogin      # Para login de administrador
java AccountantLogin # Para login de contador
java Bank           # Para interface principal do sistema bancário
```

## 🔐 Credenciais de Acesso

### Administrador
- **Usuário:** `popmam`
- **Senha:** `popproject`

### Contador
- Deve ser criado.

### Usuários
Os usuários são cadastrados pelos contadores e administradores através da interface do sistema.

## 🏗️ Arquitetura do Sistema

### Classes Principais
- **AdminLogin/AdminSuccess:** Gerenciamento de login e interface do administrador
- **AccountantLogin/AccountantSuccess:** Sistema de login e operações dos contadores
- **AccountantDao/UserDao:** Classes de acesso a dados para persistência
- **Bank:** Interface principal do sistema bancário
- **ViewUser/ViewAccountant:** Classes para visualização de dados
- **Userform/AccountantForm:** Formulários de cadastro e edição

### Sistema de Arquivos
- **user.txt:** Armazena dados dos correntistas (ID, nome, endereço, salário)
- **accountant.txt:** Armazena dados dos contadores (nome, senha, email, contato)

## 📁 Estrutura do Projeto

```
Student-management-system/
├── Student portal/
│   ├── src/                 # Código fonte Java
│   │   ├── AdminLogin.java
│   │   ├── AdminSuccess.java
│   │   ├── AccountantLogin.java
│   │   ├── AccountantDao.java
│   │   ├── UserLogin.java
│   │   ├── ViewUser.java
│   │   ├── ViewAccountant.java
│   │   └── ...
│   ├── bin/                 # Arquivos compilados (.class)
│   ├── user.txt            # Dados dos usuários
│   └── accountant.txt      # Dados dos contadores
├── metricas_reports/       # Relatórios de métricas de código
└── README.md
```

## 📊 Métricas do Código

O projeto inclui análises de qualidade de código com as seguintes métricas:

- **LOC (Linhas de Código):** 1,339 linhas
- **Complexidade Ciclomática:** 84 total
- **Número de Classes:** 12 classes
- **Número de Métodos:** 50 métodos

Para gerar relatórios de métricas atualizados:
```bash
./generate_all_reports.sh
```

## 🛠️ Tecnologias Utilizadas

- **Java SE:** Linguagem principal de desenvolvimento
- **Swing:** Framework para interface gráfica (GUI)
- **File I/O:** Sistema de gerenciamento de arquivos para persistência
- **Eclipse Platform:** Ambiente de desenvolvimento integrado
- **OOP Concepts:** Encapsulamento, Polimorfismo, Herança e Abstração

### Técnicas Avançadas Implementadas
- **Exception Handling:** Tratamento robusto de erros e exceções
- **Multithreading:** Suporte a múltiplas operações simultâneas
- **Access Modifiers:** Controle de privacidade e acesso
- **String Processing:** Leitura e decodificação de arquivos de dados

## 🎯 Funcionalidades Principais

### Sistema de Login Hierárquico
- Interface separada para Admin, Contador e Sistema Bancário
- Autenticação baseada em arquivos de texto
- Controle de sessão e permissões por nível de usuário

### Gerenciamento Bancário Completo
- **CRUD de Contadores:** Adicionar, visualizar, editar e deletar contadores
- **CRUD de Correntistas:** Gerenciamento completo de conta-correntes
- **Hierarquia de Permissões:** Contadores podem modificar dados de correntistas
- **Persistência em Arquivos:** Dados armazenados em formato texto estruturado

### Interface Gráfica Intuitiva
- **JFrames Personalizados:** Interface atrativa e responsiva
- **Navegação Simples:** Fluxo intuitivo entre diferentes telas
- **Feedback Visual:** Mensagens de confirmação e erro claras
- **Experiência Multi-Idade:** Interface adequada para todos os usuários

## 🔧 Resolução de Problemas

### Erro de Compilação
```bash
# Certifique-se de estar na pasta correta
cd "Student portal"
javac -cp . -d bin src/*.java
```

### Erro de Execução
```bash
# Verifique se está na pasta bin
cd bin
java -cp . AdminLogin
```

### Problemas de Login
- Verifique se está usando as credenciais corretas
- Confirme se os arquivos `user.txt` e `accountant.txt` existem
- Use as credenciais fornecidas neste README

## 👥 Contribuições

Este é um projeto acadêmico. Para contribuições:

1. Fork o projeto
2. Crie uma branch para sua feature
3. Commit suas mudanças
4. Push para a branch
5. Abra um Pull Request

## 📄 Licença

Este projeto é desenvolvido para fins educacionais.

---

**Desenvolvido como parte do TDE