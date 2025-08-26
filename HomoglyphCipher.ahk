^!c:: ; Ctrl + Alt + C triggers the script
homoglyphs := Object()
homoglyphs["—"] := ", "    ; ← map em-dash to comma+space
homoglyphs["A"] := "А"
homoglyphs["B"] := "Β"
homoglyphs["C"] := "С"
homoglyphs["D"] := "Ꭰ"
homoglyphs["E"] := "Е"
homoglyphs["F"] := "F"
homoglyphs["G"] := "G"
homoglyphs["H"] := "Н"
homoglyphs["I"] := "І"
homoglyphs["J"] := "Ј"
homoglyphs["K"] := "Κ"
homoglyphs["L"] := "Ꮮ"
homoglyphs["M"] := "М"
homoglyphs["N"] := "N"
homoglyphs["O"] := "О"
homoglyphs["P"] := "Р"
homoglyphs["Q"] := "Ԛ"
homoglyphs["R"] := "R"
homoglyphs["S"] := "Ѕ"
homoglyphs["T"] := "Т"
homoglyphs["U"] := "Ս"
homoglyphs["V"] := "V"
homoglyphs["W"] := "W"
homoglyphs["X"] := "Х"
homoglyphs["Y"] := "Υ"
homoglyphs["Z"] := "Ζ"
homoglyphs["a"] := "а"
homoglyphs["b"] := "b"
homoglyphs["c"] := "с"
homoglyphs["d"] := "ԁ"
homoglyphs["e"] := "е"
homoglyphs["f"] := "f"
homoglyphs["g"] := "ɡ"
homoglyphs["h"] := "һ"
homoglyphs["i"] := "і"
homoglyphs["j"] := "ј"
homoglyphs["k"] := "k"
homoglyphs["l"] := "ӏ"
homoglyphs["m"] := "m"
homoglyphs["n"] := "ո"
homoglyphs["o"] := "о"
homoglyphs["p"] := "р"
homoglyphs["q"] := "q"
homoglyphs["r"] := "r"
homoglyphs["s"] := "ѕ"
homoglyphs["t"] := "t"
homoglyphs["u"] := "ս"
homoglyphs["v"] := "v"
homoglyphs["w"] := "ԝ"
homoglyphs["x"] := "х"
homoglyphs["y"] := "у"
homoglyphs["z"] := "ᴢ"


; Actual invisible characters — copy-pasted directly
invisibleChars := ["​", "‍", "᠎"] ; U+200B (ZWSP), U+200D (ZWJ), U+180E (MVS)

original := clipboard
ciphered := ""

Loop, Parse, original
{
    char := A_LoopField

    ; Step 1: Replace with homoglyph if available
    if (homoglyphs.HasKey(char))
        ciphered .= homoglyphs[char]
    else
        ciphered .= char

    ; Step 2: Insert invisible character randomly (30% chance)
    Random, chance, 1, 100
    if (chance <= 30) {
        Random, idx, 1, % invisibleChars.Length()
        ciphered .= invisibleChars[idx]
    }
}

clipboard := ciphered
TrayTip, ✅ Cipher Applied, Clipboard obfuscated with invisible characters., 2
return