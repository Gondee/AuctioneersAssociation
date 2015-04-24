{"changed":true,"filter":false,"title":"continueedus_controller.rb","tooltip":"/app/controllers/continueedus_controller.rb","value":"class ContinueedusController < ApplicationController\n  before_action :set_continueedu, only: [:show, :edit, :update, :destroy]\n\n  # GET /continueedus\n  # GET /continueedus.json\n  def index\n    if params[:format] == nil\n      @continueedus = Continueedu.all\n    else\n      @continueedus = Continueedu.where(\"member_id = #{params[:format]}\")\n    end\n  end\n  \n  # GET /continueedus/1\n  # GET /continueedus/1.json\n  def show\n  end\n\n  # GET /continueedus/new\n  def new\n    @continueedu = Continueedu.new\n  end\n\n  # GET /continueedus/1/edit\n  def edit\n  end\n\n  # POST /continueedus\n  # POST /continueedus.json\n  def create\n    @continueedu = Continueedu.new(continueedu_params)\n\n    respond_to do |format|\n      if @continueedu.save\n        format.html { redirect_to @continueedu, notice: 'Continueedu was successfully created.' }\n        format.json { render :show, status: :created, location: @continueedu }\n      else\n        format.html { render :new }\n        format.json { render json: @continueedu.errors, status: :unprocessable_entity }\n      end\n    end\n  end\n\n  # PATCH/PUT /continueedus/1\n  # PATCH/PUT /continueedus/1.json\n  def update\n    respond_to do |format|\n      if @continueedu.update(continueedu_params)\n        format.html { redirect_to @continueedu, notice: 'Continueedu was successfully updated.' }\n        format.json { render :show, status: :ok, location: @continueedu }\n      else\n        format.html { render :edit }\n        format.json { render json: @continueedu.errors, status: :unprocessable_entity }\n      end\n    end\n  end\n\n  # DELETE /continueedus/1\n  # DELETE /continueedus/1.json\n  def destroy\n    @continueedu.destroy\n    respond_to do |format|\n      format.html { redirect_to continueedus_url, notice: 'Continueedu was successfully destroyed.' }\n      format.json { head :no_content }\n    end\n  end\n\n  # Import CSV table\n  def import\n    Continueedu.import(params[:file])\n    redirect_to continueedus_url, notice: \"Products imported.\"\n  end\n  \n  private\n    # Use callbacks to share common setup or constraints between actions.\n    def set_continueedu\n      @continueedu = Continueedu.find(params[:id])\n    end\n\n    # Never trust parameters from the scary internet, only allow the white list through.\n    def continueedu_params\n      params.require(:continueedu).permit(:Annual_Convention_CE_Hours, :Online_CE_Hours, :member_id)\n    end\nend\n","undoManager":{"mark":30,"position":31,"stack":[[{"group":"doc","deltas":[{"start":{"row":8,"column":0},"end":{"row":14,"column":5},"action":"insert","lines":["def index","    if params[:format] == 'AllPayments'","      @payments = Payment.all","    else","      @payments = Payment.where(\"member_id = #{params[:format]}\")","    end","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":0},"end":{"row":8,"column":1},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":8,"column":1},"end":{"row":8,"column":2},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":37},"end":{"row":9,"column":38},"action":"remove","lines":["s"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":36},"end":{"row":9,"column":37},"action":"remove","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":35},"end":{"row":9,"column":36},"action":"remove","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":34},"end":{"row":9,"column":35},"action":"remove","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":33},"end":{"row":9,"column":34},"action":"remove","lines":["m"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":32},"end":{"row":9,"column":33},"action":"remove","lines":["y"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":31},"end":{"row":9,"column":32},"action":"remove","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":30},"end":{"row":9,"column":31},"action":"remove","lines":["P"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":30},"end":{"row":9,"column":31},"action":"insert","lines":["C"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":31},"end":{"row":9,"column":32},"action":"insert","lines":["o"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":32},"end":{"row":9,"column":33},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":33},"end":{"row":9,"column":34},"action":"insert","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":34},"end":{"row":9,"column":35},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":35},"end":{"row":9,"column":36},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":36},"end":{"row":9,"column":37},"action":"insert","lines":["u"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":37},"end":{"row":9,"column":38},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":38},"end":{"row":9,"column":39},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":39},"end":{"row":9,"column":40},"action":"insert","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":40},"end":{"row":9,"column":41},"action":"insert","lines":["u"]}]}],[{"group":"doc","deltas":[{"start":{"row":9,"column":41},"end":{"row":9,"column":42},"action":"insert","lines":["s"]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":6},"end":{"row":10,"column":29},"action":"remove","lines":["@payments = Payment.all"]},{"start":{"row":10,"column":6},"end":{"row":10,"column":37},"action":"insert","lines":["@continueedus = Continueedu.all"]}]}],[{"group":"doc","deltas":[{"start":{"row":12,"column":7},"end":{"row":12,"column":25},"action":"remove","lines":["payments = Payment"]},{"start":{"row":12,"column":7},"end":{"row":12,"column":33},"action":"insert","lines":["continueedus = Continueedu"]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":2},"end":{"row":7,"column":5},"action":"remove","lines":["def index","    @continueedus = Continueedu.all","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":0},"end":{"row":5,"column":2},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":4,"column":26},"end":{"row":5,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":12,"column":2},"end":{"row":13,"column":0},"action":"insert","lines":["",""]},{"start":{"row":13,"column":0},"end":{"row":13,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":43},"end":{"row":6,"column":44},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":44},"end":{"row":6,"column":69},"action":"insert","lines":["|| params[:format] == nil"]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":7},"end":{"row":6,"column":47},"action":"remove","lines":["params[:format] == 'AllContinueedus' || "]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":6,"column":7},"end":{"row":6,"column":7},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1429900333851}