# 🧪 Game Dev Lab – Prototipagem de Mecânicas (Solunos Guardians)

Este projeto serve como um laboratório prático para desenvolver, testar e refinar as principais mecânicas de *Solunos Guardians*. Todo o código será modular e reutilizável no projeto final.

---

## 🎯 Objetivo

Desenvolver um protótipo funcional com combate baseado em cartas vivas que possuem vida, dano, escudo e comportamento emocional. O jogo ocorre em um campo com 3 posições e turnos alternados entre jogador e inimigos.

---

## 🧱 Organização do Projeto

```
GameDevLab/
├── main/
│   └── MainMenu.tscn (placeholder)
├── combate/
│   ├── Combate.tscn
│   ├── Carta.tscn
│   ├── Carta.gd
│   ├── Slot.gd
│   └── Enemy.gd
├── scripts/
│   └── TurnoManager.gd
│   └── DeckManager.gd
├── ui/
│   └── CartaUI.gd
│   └── VidaBar.gd
├── assets/
│   └── sprites/, fonts/, efeitos/
```

---

## 📋 Etapas de Desenvolvimento

### ✅ Fase 1 — Estrutura e fundação

- [ ] Criar a cena `Combate.tscn` com 3 slots para jogador e 3 para inimigos
- [ ] Criar `Carta.tscn` e script base `Carta.gd` com atributos: vida, dano, escudo, reino, tipo, afinidade
- [ ] Implementar sistema de slots (`Slot.gd`) para reconhecer se estão ocupados

---

### ✅ Fase 2 — Turno e combate

- [ ] Criar `TurnoManager.gd` para alternar turno do jogador e inimigo
- [ ] Implementar ataque automático entre cartas (ataca quem estiver à frente)
- [ ] Adicionar lógica para destruir cartas com vida <= 0

---

### ✅ Fase 3 — Mecânicas principais

- [ ] Criar sistema de mana e oferta
- [ ] Ofertar cartas da mão para gerar mana extra
- [ ] Aplicar bônus ou punições dependendo do tipo da carta ofertada
- [ ] Implementar afinidade posicional e emocional (cartas felizes ou relutantes)
- [ ] Adicionar escudo como proteção temporária que expira no fim do turno

---

### ✅ Fase 4 — Interface e feedback

- [ ] Criar `CartaUI.gd` com nome, vida, dano, custo, escudo e estado emocional
- [ ] Exibir efeitos visuais simples (brilho, partículas, shake)
- [ ] Mostrar feedback da carta ao estar em afinidade ou relutância

---

### ✅ Fase 5 — Conteúdo mínimo

- [ ] Criar 6 cartas (ataque, defesa, suporte, com afinidades distintas)
- [ ] Criar 3 inimigos com padrões simples
- [ ] Testar e validar o loop completo de combate

---

## 🔁 Etapas futuras

- Evolução espiritual das cartas
- Sistema de afinidade com reinos
- Sistema de draft entre combates
- Cartas raras com efeitos únicos

---

## 🛠️ Ferramentas

- Godot 4.4
- Pixel art estilo GBA/SNES
- Documentação via Obsidian + GitHub

---

> Desenvolvido por Jonathan.
