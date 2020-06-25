<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Charge.aspx.cs" Inherits="RazorpaySampleApp.Charge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     
        
         <% if (paymentId == null)
        {%>
         
            </p>
            <p>Error Code: <%= code %>
            </p>
            <p>Error Description: <%= description %>
            </p>
            <p>Metadata: <%= orderid %>
         <%} 

        else 

        {%>
            <p>Payment Successfull...!</p>
          <p>PaymentId: <%= pay[0].Attributes["id"] %>
            </p>
         <p>order_id: <%= pay[0].Attributes["order_id"] %></p>
         <p>entity: <%= pay[0].Attributes["entity"] %></p>
         <p>status: <%= pay[0].Attributes["status"] %></p>
         <p>amount: <%= pay[0].Attributes["amount"] %></p>
         <p>currency: <%= pay[0].Attributes["currency"] %></p>
         <p>method: <%= pay[0].Attributes["method"] %></p>
         <p>bank: <%= pay[0].Attributes["bank"] %></p>
         <p>description: <%= pay[0].Attributes["description"] %></p>
        <%} %>

      
       
       

    </div>
    </form>
</body>
</html>
