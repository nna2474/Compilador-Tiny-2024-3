package ve.edu.unet.nodosAST;

public class NodoFor extends NodoBase {
    private NodoBase asignacion;
    private NodoBase fin;
    private NodoBase cuerpo;

    public NodoFor(NodoBase asignacion, NodoBase fin, NodoBase cuerpo) {
        this.asignacion = asignacion;
        this.fin = fin;
        this.cuerpo = cuerpo;
    }

    public NodoBase getAsignacion() {
        return asignacion;
    }

    public NodoBase getFin() {
        return fin;
    }

    public NodoBase getCuerpo() {
        return cuerpo;
    }
}