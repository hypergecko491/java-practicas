package TDA;
public class Mascota {
private short ID;
private String NMascota;
private String EMascota;
private short FNMascota;
private String GMascota;
private float PMascota;
private String CPMascota;
private boolean Vacunado;
private boolean Desparasitado;
private boolean Esterilizado;
private String SaludMascota;
private float PCompraMascota;
private float PVentaMascota;
public Mascota() {
    }
public Mascota(short ID, String NMascota, String EMascota, short FNMascota, String GMascota, float PMascota, String CPMascota, boolean Vacunado, boolean Desparasitado, boolean Esterilizado, String SaludMascota, float PCompraMascota, float PVentaMascota) {
        this.ID = ID;
        this.NMascota = NMascota;
        this.EMascota = EMascota;
        this.FNMascota = FNMascota;
        this.GMascota = GMascota;
        this.PMascota = PMascota;
        this.CPMascota = CPMascota;
        this.Vacunado = Vacunado;
        this.Desparasitado = Desparasitado;
        this.Esterilizado = Esterilizado;
        this.SaludMascota = SaludMascota;
        this.PCompraMascota = PCompraMascota;
        this.PVentaMascota = PVentaMascota;
    }
public void setID(short ID) {
        this.ID = ID;
    }
public void setNMascota(String NMascota) {
        this.NMascota = NMascota;
    }
public void setEMascota(String EMascota) {
        this.EMascota = EMascota;
    }
public void setFNMascota(short FNMascota) {
        this.FNMascota = FNMascota;
    }
public void setGMascota(String GMascota) {
        this.GMascota = GMascota;
    }
public void setPMascota(float PMascota) {
        this.PMascota = PMascota;
    }
public void setCPMascota(String CPMascota) {
        this.CPMascota = CPMascota;
    }
public void setVacunado(boolean Vacunado) {
        this.Vacunado = Vacunado;
    }
public void setDesparasitado(boolean Desparasitado) {
this.Desparasitado = Desparasitado;
    }
public void setEsterilizado(boolean Esterilizado) {
        this.Esterilizado = Esterilizado;
    }
public void setSaludMascota(String SaludMascota) {
        this.SaludMascota = SaludMascota;
    }
public void setPCompraMascota(float PCompraMascota) {
        this.PCompraMascota = PCompraMascota;
    }
public void setPVentaMascota(float PVentaMascota) {
        this.PVentaMascota = PVentaMascota;
    }
public Mascota(short ID, String NMascota, String EMascota, String GMascota, float PMascota, boolean Vacunado, boolean Desparasitado, boolean Esterilizado, String SaludMascota) {
        this.ID = ID;
        this.NMascota = NMascota;
        this.EMascota = EMascota;
        this.GMascota = GMascota;
        this.PMascota = PMascota;
        this.Vacunado = Vacunado;
        this.Desparasitado = Desparasitado;
        this.Esterilizado = Esterilizado;
        this.SaludMascota = SaludMascota;
    }
public Mascota(short ID, String NMascota, String EMascota, short FNMascota, String GMascota, float PMascota, String CPMascota, boolean Vacunado) {
        this.ID = ID;
        this.NMascota = NMascota;
        this.EMascota = EMascota;
        this.FNMascota = FNMascota;
        this.GMascota = GMascota;
        this.PMascota = PMascota;
        this.CPMascota = CPMascota;
        this.Vacunado = Vacunado;
    }

}
