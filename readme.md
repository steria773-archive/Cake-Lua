# Cake-Lua
This Is The Lua Binding Of [Cake](https://github.com/Cake-Engine/Cake),A HTML5 Game Engine,The Binding Created By The Same Creator Of [Cake](https://github.com/Cake-Engine/Cake) Itself,Rabia Alhaffar

## How To Use?
1. Create Game HTML Page File
2. Add `cake.lua` And `lightgl.js` And `fengari-web.js` With The HTML File (Beside It)
3. Add Following:
```html
<script src="fengari-web.js"></script>
<script src="lightgl.js"></script>
<script src="cake.lua" type="application/lua" async></script>
```
4. Let's Create A Game File Named `game.lua` With Following:
```lua
CreateCanvas(600,600,"black")
Initialize(0)
SetDrawingMode("fill")
DrawRect(200,200,200,150,"dodgerblue")
```
5. Get Back To The HTML File,Add:
```html
<script src="game.lua"></script> <!-- Add It Below cake.lua -->
```
## NOTES
If Game And Cake Lua Binding Won't Work Due To CORS Error,Use Cake Lua Binding From Source,Import Functions You Need And Don't Need,With Importing `Unknown()` Function From `src/script/compiler.lua`

## Special Thanks
1. B. Giannangeli And Daurnimator For [Fengari](https://fengari.io)
2. PUC-Rio For [Lua](https://lua.org)
