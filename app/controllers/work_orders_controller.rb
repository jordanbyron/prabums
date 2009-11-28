class WorkOrdersController < ApplicationController
  # GET /work_orders
  # GET /work_orders.xml
  def index
    @work_orders = WorkOrder.all
  end

  # GET /work_orders/1
  # GET /work_orders/1.xml
  def show
    @work_order = WorkOrder.find(params[:id])
  end

  # GET /work_orders/new
  # GET /work_orders/new.xml
  def new
    @work_order = WorkOrder.new
  end

  # GET /work_orders/1/edit
  def edit
    @work_order = WorkOrder.find(params[:id])
  end

  # POST /work_orders
  # POST /work_orders.xml
  def create
    @work_order = WorkOrder.new(params[:work_order])
    
   # @work_order.status = 

    respond_to do |format|
      if @work_order.save
        format.html { redirect_to thank_you_path }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /work_orders/1
  # PUT /work_orders/1.xml
  def update
    @work_order = WorkOrder.find(params[:id])

    respond_to do |format|
      if @work_order.update_attributes(params[:work_order])
        flash[:notice] = 'WorkOrder was successfully updated.'
        format.html { redirect_to(@work_order) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def thank_you
    render :layout => 'entry'
  end

  # DELETE /work_orders/1
  # DELETE /work_orders/1.xml
  def destroy
    @work_order = WorkOrder.find(params[:id])
    @work_order.destroy
    
    redirect_to work_orders_url
  end
end
