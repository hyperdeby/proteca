# PROTECA

Este repositório contém o código-fonte do jogo **Proteca**, um projeto educativo voltado para crianças, com o objetivo de **conscientizar sobre estratégias de aliciamento online** e **promover comportamentos seguros** contra a violência sexual infantil.

> 💡 Para desenvolvedores: confira o documento [`docs/git_recomendacoes.md`](docs/git_recomendacoes.md) com orientações detalhadas sobre o fluxo Git adotado neste projeto (Git Flow) e o uso de commits semânticos.


## 🎮 Objetivo

Criar um jogo acessível, sensível e informativo, que utilize mecânicas simples para orientar e empoderar o público infantil, com foco em prevenção e segurança digital.

## 🌿 Estrutura das Branches (GitFlow)

Atualmente, o projeto segue o modelo **GitFlow**, que organiza melhor o desenvolvimento em equipe:

* `main`: branch de produção — contém sempre a versão estável do jogo.
* `develop`: branch de integração — onde funcionalidades são reunidas e testadas antes de uma nova versão.
* `feature/*`: usada para desenvolver **novas funcionalidades** de forma isolada.
* `release/*`: preparação para lançar uma nova versão (ajustes finais, testes, empacotamento).
* `hotfix/*`: correções urgentes aplicadas diretamente sobre a `main`.

### 🕘️ Histórico de Branches Anteriores

Antes da adoção do GitFlow, algumas branches foram usadas para estudo e testes:

* `Prototipo`: consolidava o que havia sido produzido até então (menu, customização, vídeo introdutório).
* `DialogSystem`: estudo sobre sistemas de diálogo — servirá de referência, mas não faz parte do jogo final.
* `deogenes_teste`, `prototipo-tiago`, `test-branch`: utilizadas para testes experimentais.

## 📁 Estrutura de Pastas

- `sprites/`: imagens do jogo.
- `rooms/`: cenários/janelas do jogo.
- `objects/`: onde sprites ganham comportamento e interatividade.
- `scripts/`: scripts de lógica do jogo.
- `options/`: configurações do projeto.
- `fonts/`: fontes utilizadas no jogo.
- `datafiles/`: arquivos auxiliares do GameMaker.
- `docs/`: **artefatos de documentação**, como:
  - [`requisitos_proteca.md`](docs/requisitos_proteca.md): requisitos funcionais, não funcionais e de processo.
  - [`processo_desenvolvimento.md`](docs/processo_desenvolvimento.md): etapas e fluxo do desenvolvimento do jogo.
  - Diagramas de processo
  - Relatórios e planejamentos

## 📝 Documentação

A pasta [`docs/`](./docs) centraliza todos os documentos técnicos e organizacionais do projeto. Destaques:

- O arquivo [`processo_desenvolvimento.md`](docs/processo_desenvolvimento.md) detalha cada fase (requisitos, codificação, playtest, etc.).
- O arquivo [`requisitos_proteca.md`](docs/requisitos_proteca.md) lista todos os requisitos mapeados a partir do GDD.

