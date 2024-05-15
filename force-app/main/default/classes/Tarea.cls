public with sharing class Tarea {
    
    private Integer id = null;
    private String titulo;
    private String descripcion;
    private Boolean completo;
    
    public Tarea() {
        this.titulo = titulo;
        this.descripcion descripcion;
        this.completo = false;
    }

    public Integer getId(){ return id; }

    public Void setId(Integer newId){ id = newId; }

    public String getTitulo(){ return titulo; }

    public Void setTitulo(String newTitulo){ titulo = newTitulo; }

    public String getDescripcion(){ return descripcion; }

    public Void setDescripcion(String newDescripcion){ descripcion = newDescripcion; }

    public Boolean state(){ return completo; }

    public Void changeState(){ completo = !this.state(); }
}