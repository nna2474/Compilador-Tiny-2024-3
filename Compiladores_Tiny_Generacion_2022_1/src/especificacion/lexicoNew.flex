package ve.edu.unet;

import java_cup.runtime.*;
import java.io.Reader;

%%
/* Habilitar la compatibilidad con el interfaz CUP para el generador sintáctico*/
%cup
/* Llamar Scanner a la clase que contiene el analizador Léxico */
%class Lexico

/*-- DECLARACIONES --*/
%{
	public Lexico(Reader r, SymbolFactory sf){
        this(r);
		this.sf=sf;
		lineanum=0;
		debug=true;
	}
	private SymbolFactory sf;
	private int lineanum;
	private boolean debug;
%}

%eofval{
    return sf.newSymbol("EOF",sym.EOF);
%eofval}

/* Acceso a la columna y fila actual de análisis CUP */
%line
%column

/* Expresiones regulares */
digito      = [0-9]
numero      = {digito}+
letra       = [a-zA-Z]
identificador = {letra}({letra}|{digito})*

/* Comentarios (soporte para múltiples líneas) */
comentario  = \{([^}]|\n)*\}

%%
/* Palabras reservadas */
"if"        { return sf.newSymbol("IF", sym.IF); }
"then"      { return sf.newSymbol("THEN", sym.THEN); }
"else"      { return sf.newSymbol("ELSE", sym.ELSE); }
"end"       { return sf.newSymbol("END", sym.END); }
"repeat"    { return sf.newSymbol("REPEAT", sym.REPEAT); }
"until"     { return sf.newSymbol("UNTIL", sym.UNTIL); }
"read"      { return sf.newSymbol("READ", sym.READ); }
"write"     { return sf.newSymbol("WRITE", sym.WRITE); }
"boolean"   { return sf.newSymbol("BOOLEAN", sym.BOOLEAN); }
"int"       { return sf.newSymbol("INT", sym.INT); }

/* Operadores matemáticos */
"+"         { return sf.newSymbol("PLUS", sym.PLUS); }
"-"         { return sf.newSymbol("MINUS", sym.MINUS); }
"*"         { return sf.newSymbol("TIMES", sym.TIMES); }
"/"         { return sf.newSymbol("OVER", sym.OVER); }
"mod"       { return sf.newSymbol("MOD", sym.MOD); }

/* Operadores relacionales */
"="         { return sf.newSymbol("EQ", sym.EQ); }
"<>"        { return sf.newSymbol("NE", sym.NE); }
"<"         { return sf.newSymbol("LT", sym.LT); }
"<="        { return sf.newSymbol("LE", sym.LE); }
">"         { return sf.newSymbol("GT", sym.GT); }
">="        { return sf.newSymbol("GE", sym.GE); }

/* Operadores lógicos */
"AND"       { return sf.newSymbol("AND", sym.AND); }
"OR"        { return sf.newSymbol("OR", sym.OR); }
"NOT"       { return sf.newSymbol("NOT", sym.NOT); }

/* Caracteres especiales */
"("         { return sf.newSymbol("LPAREN", sym.LPAREN); }
")"         { return sf.newSymbol("RPAREN", sym.RPAREN); }
"["         { return sf.newSymbol("LBRACKET", sym.LBRACKET); }
"]"         { return sf.newSymbol("RBRACKET", sym.RBRACKET); }
";"         { return sf.newSymbol("SEMI", sym.SEMI); }
":="       { return sf.newSymbol("ASSIGN", sym.ASSIGN); }

/* Comentarios */
{comentario} { /* Ignorar comentarios */ }

/* Identificadores y números */
{numero}      { return sf.newSymbol("NUM", sym.NUM, new Integer(yytext())); }
{identificador} { return sf.newSymbol("ID", sym.ID, yytext()); }

/* Manejo de errores */
. { System.err.println("Caracter ilegal: " + yytext()); }

