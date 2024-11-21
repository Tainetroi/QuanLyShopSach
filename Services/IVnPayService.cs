using Microsoft.AspNetCore.Http;
using websitehoa.Models;

namespace websitehoa.Services;
public interface IVnPayService
{
    string CreatePaymentUrl(PaymentInformationModel model, HttpContext context);
    PaymentResponseModel PaymentExecute(IQueryCollection collections);
}