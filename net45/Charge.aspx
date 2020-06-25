<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Charge.aspx.cs" Inherits="RazorpaySampleApp.Charge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" action="https://www.example.com/payment/success/" method="POST">

    <div>
    

<button id="rzp-button1">Pay</button>
        
    </div>
    
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
    var options = {
        "key": "rzp_test_JYoDwiWwPPdWz5", // Enter the Key ID generated from the Dashboard    
        "amount": "100", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise or INR 500.   
        "currency": "INR",
        "name": "Acme Corp",
        "description": "A Wild Sheep Chase is the third novel by Japanese author  Haruki Murakami",
        "image": "https://example.com/your_logo",
        "order_id": "order_DRbGK3iW4wpbOK",//This is a sample Order ID. Create an Order using Orders API. (https://razorpay.com/docs/payment-gateway/orders/integration/#step-1-create-an-order). Refer the Checkout form table given below  
        "handler": function (response) { alert(response.razorpay_payment_id); },
        "prefill": {
             "name": "Gaurav Kumar",
             "email": "gaurav.kumar@example.com",
             "contact": "9999999999"
         },
        "notes": { "address": "note value" },
        "theme": { "color": "#F37254" }
    };
    var rzp1 = new Razorpay(options);
    document.getElementById('rzp-button1').onclick = function (e) {
        rzp1.open(); e.preventDefault();
    }

</script>
        </form>
    </body>
</html>