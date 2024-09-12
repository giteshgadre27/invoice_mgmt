<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Define the template for the root element -->
  <xsl:template match="/CustomerInvoiceDetails">
    <html>
      <body style="font-family: Arial, sans-serif; color: #333; margin: 0; padding: 0; background-color: #f4f4f4;">
        <div style="width: 100%; margin: 0 auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
          <h2 style="color: #0073e6;">Subject: Invoice #<xsl:value-of select="results[1]/invoice_id"/> for Your Recent Purchase</h2>

          <p>Dear <xsl:value-of select="results[1]/name"/>,</p>

          <p>Thank you for your recent purchase! Please find the details of your invoice below:</p>

          <h3 style="color: #444;">Invoice Details:</h3>
          <ul style="list-style-type: none; padding: 0;">
            <li style="margin-bottom: 10px;">Invoice ID: <xsl:value-of select="results[1]/invoice_id"/></li>
            <li style="margin-bottom: 10px;">Invoice Date: <xsl:value-of select="results[1]/invoice_date"/></li>
            <li style="margin-bottom: 10px;">Due Date: <xsl:value-of select="results[1]/due_date"/></li>
            <li style="margin-bottom: 10px;">Status: <xsl:value-of select="results[1]/status"/></li>
          </ul>

          <h3 style="color: #444;">Items Purchased:</h3>
          <table style="width: 100%; border-collapse: collapse; margin-bottom: 20px;">
            <tr style="background-color: #0073e6; color: #fff;">
              <th style="padding: 10px; border: 2px solid #0073e6;">Product</th>
              <th style="padding: 10px; border: 2px solid #0073e6;">Quantity</th>
              <th style="padding: 10px; border: 2px solid #0073e6;">Unit Price</th>
              <th style="padding: 10px; border: 2px solid #0073e6;">Total Price</th>
            </tr>
            <xsl:for-each select="results">
              <tr style="background-color: #f2f2f2;">
                <td style="padding: 10px; border: 1px solid #ddd;"><xsl:value-of select="product_name"/></td>
                <td style="padding: 10px; border: 1px solid #ddd;"><xsl:value-of select="quantity"/></td>
                <td style="padding: 10px; border: 1px solid #ddd;">$<xsl:value-of select="unit_price"/></td>
                <td style="padding: 10px; border: 1px solid #ddd;">$<xsl:value-of select="total_price"/></td>
              </tr>
            </xsl:for-each>
          </table>

          <p>Total Amount: $<xsl:value-of select="results[1]/total_amount"/></p>
          <p>Tax: $<xsl:value-of select="results[1]/tax_amount"/></p>
          <p>Total Due: $<xsl:value-of select="results[1]/total_amount"/> (Due by <xsl:value-of select="results[1]/due_date"/>)</p>

          <p>If you have any questions, please don't hesitate to contact us.</p>

          <div style="margin-top: 20px; padding-top: 10px; border-top: 1px solid #ddd; text-align: center; color: #555;">
            <p>Best Regards,<br/>Your Company Name<br/>Support: invoicemgmtorders@gmail.com</p>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
