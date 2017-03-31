class UsuariosController < ApplicationController
  

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all #a sdasd
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    begin
      @usuario = Usuario.find(params[:id])
    rescue 
      render json: {error: "Usuario no encontrado"}, status: 404, content_type: "application/json"
    end
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    if params[:id].present?
      render json: {error: "No se puede crear usuario con id", mensaje_privado: "anda a laar"}, status: 400, content_type: "application/json"
    else
      @usuario = Usuario.new(usuario_params)
      if @usuario.save
        render json: @usuario, status: 201, content_type: "application/json"
      else
      
      end

    end

  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    begin
      @usuario = Usuario.find(params[:id])
      if @usuario.update(usuario_params)
        #json con el usuario nuevo
      else
        render json:{error: "hubo un error interno y no se pudo nomás, sorry, shao loh vimoh"}, status: 500, content_type: "application/json"
      end
    rescue
      render json: {error: "Usuario no encontrado"}, status: 404, content_type: "application/json"
    end      
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    begin
      @usuario = Usuario.find(params[:id])
      @usuario.destroy
      render json: {exito: "el usuario ha sido eliminado de la faz de la tierra"}, status: 204
    rescue 
      render json: {error: "Usuario no encontrado"}, status: 404, content_type: "application/json"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nombre, :apellido, :usuario, :twitter)
    end
end
