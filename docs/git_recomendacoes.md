# Git Flow: Padrão de Ramificação para Projetos da Equipe

Este documento define o fluxo de versionamento **Git Flow** adotado nos projetos da equipe, com orientações práticas para manter a organização, rastreabilidade e previsibilidade no ciclo de desenvolvimento.

## 1. Estrutura de Branches

- `main`: código de produção. Cada commit aqui corresponde a uma versão estável.
- `develop`: branch de integração de desenvolvimento. Sempre representa o estado atual do trabalho.
- `feature/*`: para funcionalidades novas.
- `release/*`: preparação para entrega de versão.
- `hotfix/*`: correções urgentes direto na produção.

> **Exemplo de nomenclatura**:  
> `feature/menu-pause` • `release/v1.2.0` • `hotfix/crash-no-inicio`

## 2. Fluxo de Funcionalidade (feature)

```bash
git checkout develop
git pull
git checkout -b feature/nome-funcionalidade

# Desenvolvimento...
git add .
git commit -m "feat: descrição clara da funcionalidade"
git push origin feature/nome-funcionalidade
```

Ao concluir:

```bash
git checkout develop
git pull
git merge feature/nome-funcionalidade
git push origin develop
git branch -d feature/nome-funcionalidade
```

## 3. Fluxo de Release

```bash
git checkout develop
git pull
git checkout -b release/vX.Y.Z

# Ajustes finais: versão, changelog, testes finais...

git checkout main
git merge release/vX.Y.Z
git tag -a vX.Y.Z -m "Versão vX.Y.Z"
git push origin main --tags

git checkout develop
git merge release/vX.Y.Z
git branch -d release/vX.Y.Z
```

## 4. Fluxo de Hotfix

```bash
git checkout main
git pull
git checkout -b hotfix/nome-correção

# Corrige bug, commita, testa

git checkout main
git merge hotfix/nome-correção
git tag -a vX.Y.Z+1 -m "Hotfix vX.Y.Z+1"
git push origin main --tags

git checkout develop
git merge hotfix/nome-correção
git branch -d hotfix/nome-correção
```

## 5. Commits Semânticos (recomendado)

Utilize a seguinte convenção para mensagens de commit:

- `feat:` nova funcionalidade
- `fix:` correção de bug
- `refactor:` refatoração sem mudança de comportamento
- `docs:` alterações na documentação
- `style:` ajustes de formatação
- `test:` adição ou ajuste de testes

> Exemplo:  
> `feat: adiciona sistema de inventário`

## 6. Recomendações Gerais

- Atualize sua branch antes de criar uma nova.
- Faça *merge requests* com revisão, sempre que possível.
- Sincronize regularmente com `develop` para evitar conflitos grandes.
- Não use `main` para desenvolvimento direto.

