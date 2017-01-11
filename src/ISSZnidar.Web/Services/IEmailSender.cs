using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ISSZnidar.Web.Services
{
    public interface IEmailSender
    {
        Task SendEmailAsync(string email, string subject, string message);
    }
}
