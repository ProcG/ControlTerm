using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Configuration;
using System.Net.Mail;

namespace Cali_Imperium
{
    public class Ultilitarios
    {
        public static bool EnviarEmail(string texto, string assunto, string email_destinatario)
        {

            string email = "botcalii@gmail.com";

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(email, "Caliimperium", System.Text.Encoding.UTF8);
            mail.To.Add(email_destinatario);
            mail.Subject = assunto;
            mail.Body = texto;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.Priority = MailPriority.High; //Prioridade do E-Mail

            SmtpClient client = new SmtpClient();  //Adicionando as credenciais do seu e-mail e senha:
            client.Credentials = new System.Net.NetworkCredential(email,"Imperium");

            client.Port = 587; // Esta porta é a utilizada pelo Gmail para envio
            client.Host = "smtp.gmail.com"; //Definindo o provedor que irá disparar o e-mail
            client.EnableSsl = true; //Gmail trabalha com Server Secured Layer
            try
            {
                client.Send(mail);
                return true;
                
            }
            catch { return false; }
        }
    }
}
