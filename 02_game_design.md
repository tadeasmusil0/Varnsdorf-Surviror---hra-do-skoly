# 02 – Game Design

## Obsah
- [Herní mechaniky](#-herní-mechaniky)
- [Postava hráče](#-postava-hráče)
- [Nepřátelé](#-nepřátelé)
- [Zbraně a schopnosti](#-zbraně-a-schopnosti)
- [Prostředí](#-prostředí)
- [UI a HUD](#-ui-a-hud)
- [Progres a obtížnost](#-progres-a-obtížnost)

---

## Herní mechaniky
- Hráč přežívá co nejdéle v aréně s nekonečnými vlnami nepřátel.  
- Získává XP body a po dosažení úrovně volí nové schopnosti.  
- Postupně roste obtížnost – více nepřátel, větší rychlost a poškození.

## Postava hráče
| Atribut | Popis |
|----------|-------|
| Životy | 100 HP |
| Pohybová rychlost | střední |
| Útok | automatický projektil každých X sekund |
| Zkušenosti | získává zabíjením nepřátel |

## Nepřátelé
| Typ | Popis | Chování |
|-----|--------|---------|
| Slabý důchodce | základní nepřítel | jde přímo na hráče |
| Rychlý obcan | rychlý, málo HP | útočí ve skupinách |
| Silný securitak kaufu| pomalý, hodně HP | boss jednotka |

## Zbraně a schopnosti
- **Základní koule** – letí směrem k nejbližšímu nepříteli.  
- **Meč energie** – kolem hráče rotují energetické čepele.  
- **Vylepšení** – zvýšení rychlosti útoku, poškození, regenerace zdraví.

## Prostředí
- Jednoduchá 2D mapa s tmavším tónem, vhodná pro "noční" atmosféru.  
- Náhodně se generují překážky (kameny, hroby, stromy).

## UI a HUD
- Horní lišta: HP, XP, level.  
- Dolní lišta: vybrané schopnosti.  
- Pauza: Esc → menu s možností pokračovat / restartovat / ukončit.

## Progres a obtížnost
- Každou minutu se zvyšuje rychlost spawnování nepřátel.  
- Po dosažení 5 minut se objeví boss vlna.  
- Hra končí po smrti hráče.
