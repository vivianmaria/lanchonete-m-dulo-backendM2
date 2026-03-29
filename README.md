# 🍔 Sistema de Lanchonete (Backend - PostgreSQL)

Projeto desenvolvido como desafio técnico com o objetivo de organizar e gerenciar pedidos de uma lanchonete em crescimento.

---

## 📖 Sobre o Projeto

A aplicação simula o funcionamento de uma lanchonete que anteriormente registrava pedidos manualmente em um caderno.  

Com o aumento da demanda, surgiu a necessidade de um sistema para:

- Centralizar informações
- Organizar pedidos
- Melhorar o controle do negócio

---

## 🧠 Modelagem do Sistema

O banco de dados foi estruturado com as seguintes entidades:

- **Clientes**
- **Produtos**
- **Pedidos**
- **Itens do Pedido**

### 🔗 Relacionamentos:
- Um cliente pode fazer vários pedidos
- Um pedido pode conter vários produtos
- Um produto pode estar em vários pedidos

---

## ⚙️ Funcionalidades

- Cadastro de clientes
- Cadastro de produtos
- Registro de pedidos
- Controle de itens por pedido
- Controle de status do pedido:
  - Em preparo
  - Pronto
  - Entregue
  - Cancelado
- Forma de pagamento (Pix, cartão, dinheiro, etc.)
- Endereço de entrega (delivery)

---

## 🛠️ Tecnologias Utilizadas

- PostgreSQL
- SQL (DDL e DML)

---

## 🗄️ Estrutura do Banco

### Tabelas principais:

- `clientes`
- `produtos`
- `pedidos`
- `itens_pedido`

---

## 🎨 Modelagem Visual

Acesse o diagrama:

👉 https://dbdiagram.io/e/69c87652fb2db18e3b29d9cc/69c876aefb2db18e3b29daf3

---

## ▶️ Como Executar o Projeto

1. Instale o PostgreSQL
2. Crie um banco de dados:
   ```sql
   CREATE DATABASE lanchonete;
