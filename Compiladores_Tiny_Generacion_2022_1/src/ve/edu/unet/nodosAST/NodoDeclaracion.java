package ve.edu.unet.nodosAST;

public class NodoDeclaracion extends NodoBase {
    private String tipo;
    private String var;
    private NodoBase nodoExp;

    public NodoDeclaracion(String tipo, String var) {
        super();
        this.tipo = tipo;
        this.var = var;
    }

    public NodoDeclaracion(String tipo, String var, NodoBase nodoExp) {
        super();
        this.tipo = tipo;
        this.var = var;
        this.nodoExp = nodoExp;
    }

    public void setVar(String var) {
        this.var = var;
    }

    public String getTipo() { return tipo; }
    public String getVar() {
        return var;
    }
    public NodoBase getExp() {
        return nodoExp;
    }
}