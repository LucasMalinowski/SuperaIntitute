class Admin::AttachmentsController < Admin::BaseController
  def destroy
    attachment = ActiveStorage::Attachment.find(params[:id])
    attachment.purge_later
    redirect_back fallback_location: admin_root_path, notice: "Arquivo removido com sucesso."
  end
end
