class MunicipeMailer < ApplicationMailer
  default from: 'lucasmalino@outlook.com'

  def municipe_created(municipe)
    @municipe = municipe
    mail(to: municipe.email, subject: 'Municipe Criado')
  end

  def municipe_updated(municipe)
    @municipe = municipe
    mail(to: municipe.email, subject: 'Cadastro Municipe Atualizado')
  end
end
