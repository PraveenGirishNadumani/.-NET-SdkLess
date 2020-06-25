using Razorpay.Api;
using System;
using System.Collections.Generic;

namespace RazorpaySampleApp
{
    public partial class Charge : System.Web.UI.Page
    {
        protected  string paymentId;
        protected List<Razorpay.Api.Payment> pay;
        protected string code;
        protected string description;
        protected string orderid;
        protected void Page_Load(object sender, EventArgs e)
        {
            paymentId = Request.Form["razorpay_payment_id"];
            orderid = Request.Form["razorpay_order_id"];

            if (paymentId == null)
            {
                // string[] errors = Request.Form.GetValues("error");

                orderid = Request.Form["error[metadata]"]; 
                //{ "payment_id":"pay_F6kyKGORSGoiID","order_id":"order_F6ky1dShP0OgqA"}
                code = Request.Form["error[code]"];
                 description = Request.Form["error[description]"];


            }
            else
            {
                Dictionary<string, object> input = new Dictionary<string, object>();
                input.Add("amount", 100); // this amount should be same as transaction amount

                var key = "rzp_test_2pjQoIV7c1RY6C";
                var secret = "nWwe91xQO3NIDzJUp1mUmr9O";


                RazorpayClient client = new RazorpayClient(key, secret);

                Dictionary<string, string> attributes = new Dictionary<string, string>();

                attributes.Add("razorpay_payment_id", paymentId);
                attributes.Add("razorpay_order_id", Request.Form["razorpay_order_id"]);
                attributes.Add("razorpay_signature", Request.Form["razorpay_signature"]);

                Utils.verifyPaymentSignature(attributes);

                //Refund refund = new Razorpay.Api.Payment((string) paymentId).Refund();

                //Console.WriteLine(refund["id"]);
                pay = client.Order.Fetch(Request.Form["razorpay_order_id"]).Payments();
            }
           
        }
    }
}