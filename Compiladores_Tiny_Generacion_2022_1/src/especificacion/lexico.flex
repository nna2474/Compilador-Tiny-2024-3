package ve.edu.unet;

import java_cup.runtime.*;
import java.io.Reader;
//import otros.*;

%%
/* Habilitar la compatibilidad con el interfaz CUP para el generador sintactico*/
%cup
/* Llamar Scanner a la clase que contiene el analizador Lexico */
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


/******************************************************************
BORRAR SI NO SE NECESITA
	//TODO: Cambiar la SF por esto o ver que se hace
	//Crear un nuevo objeto java_cup.runtime.Symbol con informaci�n sobre el token actual sin valor
 	  private Symbol symbol(int type){
    		return new Symbol(type,yyline,yycolumn);
	  }
	//Crear un nuevo objeto java_cup.runtime.Symbol con informaci�n sobre el token actual con valor
	  private Symbol symbol(int type,Object value){
    		return new Symbol(type,yyline,yycolumn,value);
	  }
******************************************************************/
%}
%eofval{
    return sf.newSymbol("EOF",sym.EOF);
%eofval}

/* Acceso a la columna y fila actual de analisis CUP */
%line
%column



digito		= [0-9]
numero		= {digito}+
letra			= [a-zA-Z]
identificador	= {letra}({letra}|{digito})* /* {letra}+ */
nuevalinea		= \n | \n\r | \r\n
espacio		= [ \t]+
%%
"if"            {	if(debug) System.out.println("token IF");
			return sf.newSymbol("IF",sym.IF);
			}
"then"          { if(debug) System.out.println("token THEN");
			return sf.newSymbol("THEN",sym.THEN);
			}
"else"          {	if(debug) System.out.println("token ELSE");
			return sf.newSymbol("ELSE",sym.ELSE);
			}
"end"           {	if(debug) System.out.println("token END");
			return sf.newSymbol("END",sym.END);
			}
"for"           {       /***** Palabra Nueva *****/
                    if(debug) System.out.println("token FOR");
			        return sf.newSymbol("FOR",sym.FOR);
                }
"to"            {       /***** Palabra Nueva *****/
                    if(debug) System.out.println("token TO");
			        return sf.newSymbol("TO",sym.TO);
                }
"do"            {       /***** Palabra Nueva *****/
                    if(debug) System.out.println("token DO");
			        return sf.newSymbol("DO",sym.DO);
                }
"repeat"        {	if(debug) System.out.println("token REPEAT");
			return sf.newSymbol("REPEAT",sym.REPEAT);
			}
"until"         {	if(debug) System.out.println("token UNTIL");
			return sf.newSymbol("UNTIL",sym.UNTIL);
			}
"read"          {	if(debug) System.out.println("token READ");
			return sf.newSymbol("READ",sym.READ);
			}
"write"         {	if(debug) System.out.println("token WRITE");
			return sf.newSymbol("WRITE",sym.WRITE);
			}

"bool"         {       /***** Variable Nueva *****/
                    if(debug) System.out.println("token BOOL");
                    return sf.newSymbol("BOOL",sym.BOOL);
                }
"true"         {       /***** Variable Nueva *****/
                    if(debug) System.out.println("token TRUE");
                    return sf.newSymbol("BOOL",sym.BOOL,true);
                }
"false"         {       /***** Variable Nueva *****/
                    if(debug) System.out.println("token FALSE");
                    return sf.newSymbol("BOOL",sym.BOOL,false);
                }
"int"         {       /***** Variable Nueva *****/
                    if(debug) System.out.println("token INT");
                    return sf.newSymbol("INT",sym.INT);
                }

":="            {	if(debug) System.out.println("token ASSIGN");
			return sf.newSymbol("ASSIGN",sym.ASSIGN);
			}
"="             {	if(debug) System.out.println("token EQ");
			return sf.newSymbol("EQ",sym.EQ);
			}
"<>"             {       /***** Operador nuevo *****/
                    if(debug) System.out.println("token NEQ");
			        return sf.newSymbol("NEQ",sym.NEQ);
			    }
"<"             {	if(debug) System.out.println("token LT");
			return sf.newSymbol("LT",sym.LT);
			}
"<="             {	if(debug) System.out.println("token LEQ");
			return sf.newSymbol("LEQ",sym.LEQ);
			}
">"             {       /***** Operador nuevo *****/
                    if(debug) System.out.println("token GT");
			        return sf.newSymbol("GT",sym.GT);
			    }
">="             {       /***** Operador nuevo *****/
                    if(debug) System.out.println("token GEQ");
			        return sf.newSymbol("GEQ",sym.GEQ);
			    }
"+"             {	if(debug) System.out.println("token PLUS");
			return sf.newSymbol("PLUS",sym.PLUS);
			}
"-"             {	if(debug) System.out.println("token MINUS");
			return sf.newSymbol("MINUS",sym.MINUS);
			}
"*"             {	if(debug) System.out.println("token TIMES");
			return sf.newSymbol("TIMES",sym.TIMES);
			}
"/"             {	if(debug) System.out.println("token OVER");
			return sf.newSymbol("OVER",sym.OVER);
			}
"mod"          {       /***** Operador nuevo *****/
                    if(debug) System.out.println("token MOD");
			        return sf.newSymbol("MOD",sym.MOD);
                }
"AND"          {       /***** Operador nuevo *****/
                    if(debug) System.out.println("token AND");
			        return sf.newSymbol("AND",sym.AND);
                }
"OR"            {       /***** Operador nuevo *****/
                    if(debug) System.out.println("token OR");
			        return sf.newSymbol("OR",sym.OR);
                }
"NOT"          {       /***** Operador nuevo *****/
                    if(debug) System.out.println("token NOT");
			        return sf.newSymbol("NOT",sym.NOT);
                }
"("             {	if(debug) System.out.println("token LPAREN");
			return sf.newSymbol("LPAREN",sym.LPAREN);
			}
")"             {	if(debug) System.out.println("token RPAREN");
			return sf.newSymbol("RPAREN",sym.RPAREN);
			}
"["             {       /***** Caracter Nuevo *****/
                    if(debug) System.out.println("token LCORCHE");
			        return sf.newSymbol("LCORCHE",sym.LCORCHE);
			    }
"]"             {       /***** Caracter Nuevo *****/
                    if(debug) System.out.println("token RCORCHE");
			        return sf.newSymbol("RCORCHE",sym.RCORCHE);
			    }
";"             {	if(debug) System.out.println("token SEMI");
			return sf.newSymbol("SEMI",sym.SEMI);
			}
{numero}        {	if(debug) System.out.println("token NUM");
			return sf.newSymbol("NUM",sym.NUM,new String(yytext()));
			}
{identificador}	{	if(debug) System.out.println("token ID");
				return sf.newSymbol("ID",sym.ID,new String(yytext()));
			}
{nuevalinea}       {lineanum++;}
{espacio}    { /* saltos espacios en blanco*/}
"{"[^}]+"}"  { /* salto comentarios */ if(debug) System.out.println("token COMENTARIO"); }
.               {System.err.println("Caracter Ilegal encontrado en analisis lexico: " + yytext() + "\n");}