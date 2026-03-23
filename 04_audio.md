#  Varnsdorf Survivor - Audio Dokumentace

Tento soubor obsahuje přehled zvukových aktiv a hudebního designu pro projekt **Varnsdorf Survivor**. Cílem audia je podtrhnout tísnivou atmosféru post-apokalyptického severočeského města.

---

##  Zvuková Mapa (SFX Asset List)

| ID Zvuku | Popis | Kategorie | Stav |
| :--- | :--- | :--- | :--- |
| `sfx_amb_wind_panelak` | Vítr pískající mezi panelovými domy | Ambient | 🟢 Hotovo |
| `sfx_ui_click_rust` | Rezavé kliknutí v menu | UI | 🟡 V přípravě |
| `sfx_player_step_glass` | Krok na rozbité sklo | Gameplay | 🟢 Hotovo |
| `sfx_enemy_zombie_lung` | Chrčení "místních" mutantů | NPC | 🔴 Chybí |

---

##  Technická specifikace pro implementaci

Pro zajištění nejlepšího výkonu v herním enginu Godot dodržujeme tyto standardy:

1. **Hudba (BGM):** Formát `.ogg`, Stereo, 44.1kHz (pro plynulé smyčkování).
2. **Efekty (SFX):** Formát `.wav`, Mono, 48kHz (pro minimální latenci při akci).
3. **Mastering:** Všechny tracky jsou normalizovány na -3dB, aby nedocházelo k ořezu (clippingu).
