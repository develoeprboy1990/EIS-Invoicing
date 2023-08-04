<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Invoice</title>
    <style type="text/css">
            @font-face {
                font-family: 'Open Sans';
                font-style: normal;
                font-weight: normal;
             }
            @font-face {
                font-family: 'Open Sans';
                font-style: normal;
                font-weight: bold;
             }
            @font-face {
                font-family: 'Open Sans';
                font-style: italic;
                font-weight: normal;
             }
            @font-face {
                font-family: 'Open Sans';
                font-style: italic;
                font-weight: bold;
             }
            @page {
                margin-top: 0.5cm;
                margin-bottom: 0.5cm;
                margin-left: 0.5cm;
                margin-right: 0.5cm;
            }
            body { 
                    color: #000;
                    margin: 0.02cm;
                    font-family: 'Open Sans', sans-serif;
                    font-size: 11pt;
                    line-height: 100%;
                }
            h1, h2, h3, h4 {
                font-weight: bold;
                margin: 0;
            }
            h1 {
                font-size: 16pt;
                margin: 5mm 0;
            }
            h2 {
                font-size: 14pt;
            }
            h3, h4 {
                font-size: 9pt;
            }
            ol,
            ul {
                list-style: none;
                margin-left: 30;
                padding: 0;
                text-decoration: none;
                color:#000;
            }
            li{
                text-decoration: none;
                color:#000;
            }
            li,
            ul {
                margin-bottom: 0.75em;
            }
            p {
                margin: 0;
                padding: 0;
            }
            p + p {
                margin-top: 1.25em;
            }
            a {
                border-bottom: 1px solid;
                text-decoration: none;
            }
            /* Basic Table Styling */
            table {
                border-collapse: collapse;
                border-spacing: 0;
                page-break-inside: always;
                border: 0;
                margin: 0;
                padding: 0;
            }
            th, td {
                vertical-align: top;
                text-align: left;
            }
            table.container {
                width:100%;
                border: 0;
            }
            tr.no-borders,
            td.no-borders {
                border: 0 !important;
                border-top: 0 !important;
                border-bottom: 0 !important;
                padding: 0 !important;
                width: auto;
            }
            /* Header */
            table.head {
                margin-bottom: 2mm;
            }
            td.header img {
                max-height: 3cm;
                width: auto;
            }
            td.header {
                font-size: 16pt;
                font-weight: 700;
            }
            td.shop-info {
                width: 40%;
            }
            .document-type-label {
                text-transform: uppercase;
            }
            table.order-data-addresses {
                width: 100%;
                margin-bottom: 0.5mm;
            }
            td.order-data {
                width: 30%;
            }
            .invoice .shipping-address {
                width: 30%;
            }
            .packing-slip .billing-address {
                width: 30%;
            }
            td.order-data table th {
                font-weight: normal;
                padding-right: 2mm;
            }

            table.order-details {
                width:100%;
                margin-bottom: 8mm;
            }
            .quantity,
            .price {
                width: 8%;
            }
            .product {
                width: 33%;
            }
            .sno {
                width: 3%;
            }
            .order-details tr {
                page-break-inside: always;
                page-break-after: auto;
            }
            .order-details td,
            .order-details th {
                border-bottom: 1px #ccc solid;
                border-top: 1px #ccc solid;
                padding: 0.375em;
            }
            .order-details th {
                font-weight: bold;
                text-align: left;
            }
            .order-details thead th {
                color: black; 

            }

            .order-details tr.bundled-item td.product {
                padding-left: 5mm;
            }
            .order-details tr.product-bundle td,
            .order-details tr.bundled-item td {
                border: 0;
            }
            dl {
                margin: 4px 0;
            }
            dt, dd, dd p {
                display: inline;
                font-size: 7pt;
                line-height: 7pt;
            }
            dd {
                margin-left: 5px;
            }
            dd:after {
                content: "\A";
                white-space: pre;
            }

            .customer-notes {
                margin-top: 5mm;
            }
            table.totals {
                width: 100%;
                margin-top: 5mm;
            }
            table.totals th,
            table.totals td {
                border: 0;
                border-top: 1px solid #ccc;
                border-bottom: 1px solid #ccc;
            }
            table.totals th.description,
            table.totals td.price {
                width: 50%;
            }
            table.totals tr:last-child td,
            table.totals tr:last-child th {
                border-top: 2px solid #000;
                border-bottom: 2px solid #000;
                font-weight: bold;
            }
            table.totals tr.payment_method {
                display: none;
            }

            #footer {
                position: absolute;
                bottom: -2cm;
                left: 0;
                right: 0;
                height: 2cm;
                text-align: center;
                border-top: 0.1mm solid gray;
                margin-bottom: 0;
                padding-top: 2mm;
            }
 
            .pagenum:before {
                content: counter(page);
            }
            .pagenum,.pagecount {
                font-family: sans-serif;
            }

            #xyz_main {
                width: 1000px;
                border: 0px solid #666666;
                text-align: center;
                position: absolute;
                top: 50%;
                left: 50%;
                margin-left: -500px;
                z-index:1000;
            }

            #bg_logo {
                        width: 1000px;
                        height: 500px;
                        border: 0px solid #666666;
                        text-align: center;
                        position: absolute;
                        top: 33%;
                        left: 25%;
                        opacity: 0.3;
                        z-index:-1000;
                        background-repeat: no-repeat;

                        background-image: url("{{asset('assets/images/logo/EIS-LOGO.png')}}");
    
     
                    }


  .pcs-itemtable-header {
    background-color: #87B7F7;
    color: #fff;
    text-transform: uppercase;
    text-align: center;
  }

  .pcs-itemtable-breakword {
    background-color: #CBE1FF;
  }


  th,
  td {
    padding: 10px; 
  }





  .table-of-contents {
  padding: 10px; 
  float: left;
}

.table-of-contents h2 {
  font-size: 18px;
  margin-bottom: 10px;
}

.table-of-contents ol {
  list-style-type: decimal;
  padding-left: 20px;
}

.table-of-contents li {
  margin-bottom: 5px;
}
 

 </style>
</head>

<body class="invoice">
    <div id="bg_logo"> </div>
    <table class="head container" border="0">
        <tr>
            <td class="header">
                <img src="{{URL('/documents/'.$company[0]->Logo)}}" width="188" height="104" />
            </td>
            <td class="shop-info">
                <div class="shop-name">
                    <div align="right">
                        <div style="font-size: 16pt;line-height: 20pt;"><strong> Quotation</strong></div>
                        Date: <br />
                        Contact:{{$company[0]->Contact}}<br /> 
                        RefNo : {{$estimate[0]->EstimateNo}}
                    </div>
                </div>
                <div class="shop-address"></div>
            </td>
        </tr> 
        
    </table>
    <table class="order-data-addresses">
    <tr>  
        <td style="width:50%;vertical-align:bottom;word-wrap: break-word; ">
  <table style="table-layout: fixed;word-wrap: break-word;width: 100%;" border="2" cellspacing="0" cellpadding="1">  
                      <tbody>
                        <tr class="pcs-itemtable-header">
                        <td><strong>SERVICE PROVIDER</strong></td>
                        </tr>

                        <tr>
                          <td>
                            <div class="shop-name" style="height:150px">
                              <div>
                                <div style="font-size: 16pt;line-height: 20pt;"><strong> EXTENSIVE IT SERVICES</strong></div>
                                {{$estimate[0]->Address}}<br />
                                Contact:{{$estimate[0]->Phone}}<br />
                                TRN: {{$estimate[0]->TRN}}<br />
                                Email:{{$estimate[0]->Email}}<br />
                                Website:{{$company[0]->Website}}<br />
                              </div>
                            </div>
                          </td>
                        </tr> 
                      </tbody>

                    </table>

                  </td>

                  <td align="right" style="vertical-align:bottom;width: 40%;">
                    <table style="float:right;table-layout: fixed;word-wrap: break-word;width: 100%;" border="2" cellspacing="0" cellpadding="1">

                      <tbody>
                        <tr class="pcs-itemtable-header">
                          <td><strong>CLIENT</strong></td>
                        </tr>

                        <tr>
                          <td>
                            <div class="shop-name" style="height:150px">
                              <div>
                                <div style="font-size: 16pt;line-height: 20pt;"><strong> {{$company[0]->Name}}<br>{{$company[0]->Name2}}</strong></div>
                                {{$company[0]->Address}}<br />
                                Contact:{{$company[0]->Contact}}<br />
                                TRN:{{$company[0]->TRN}}<br />
                                Email:{{$company[0]->Email}}<br />
                                Website:{{$company[0]->Website}}<br />
                              </div>
                            </div>
                          </td>
                        </tr> 
                      </tbody>
                    </table>
                  </td>            
                </tr> 
        <tr class="pcs-itemtable-header">
            <td colspan="2" valign="bottom"><strong> {{$estimate[0]->Subject}}</strong></td>
        </tr>
    </table>
    <table class="order-details">
        <thead>
            <tr class="pcs-itemtable-breakword">
                <th width="5%" class="sno">S#</th>
                <th width="20%" class="product">Description</th>
                <th width="10%" class="quantity">Qty</th>
                <th width="10%" class="price">Rate</th>
                <th width="10%" class="price">Tax</th>
                <th width="10%" class="price">Amount</th>
            </tr>
        </thead>
        <tbody>
            @foreach($estimate_detail as $key => $value)

            <tr>
                <td height="13px">{{$key+1}}</td>
                <td>{{$value->ItemName}}</td>
                <td>{{$value->Qty}}</td>
                <td>{{number_format($value->Rate,2)}}</td>
                <td>{{number_format($value->Tax,2)}}</td>
                <td>{{number_format($value->Total,2)}}</td>
            </tr>
            @endforeach
            <?php for ($i = 10; $i >= count($estimate_detail); $i--) { ?> 

            <?php } ?>
        </tbody>
        <tfoot> 
        <tr class="pcs-itemtable-header" style="font-weight: bold;">
                <td colspan="5">Subtotal</td> 
                <td>{{number_format($estimate[0]->SubTotal-$estimate[0]->Tax,2)}}</td>
            </tr>

            <tr class="pcs-itemtable-header" style="font-weight: bold;">
                <td colspan="5">Tax @ {{$estimate[0]->TaxPer}} %</td> 
                <td>{{number_format($estimate[0]->Tax,2)}}</td>
            </tr>

            <tr class="pcs-itemtable-header" style="font-weight: bold;">
                <td colspan="5">Total</td> 
                <td>{{number_format($estimate[0]->SubTotal,2)}}</td>
            </tr>

            <tr class="pcs-itemtable-header" style="font-weight: bold;">
                <td colspan="5">Grand Total</td>  
                <td>{{number_format($estimate[0]->GrandTotal,2)}}</td>
            </tr>

        </tfoot>
    </table>

 
  <div class="table-of-contents">
    <h2>Scope of work</h2>
    <ol>
      <li>Cable Pulling,Termination and Configuration</li>
      <li>Supply Installation and Configuration of Time Attendance System</li> 
    </ol>

    <h2>Exclusive</h2>
    <ol>
      <li>Any Approval or NOC from any Local Authorites or Government</li>
      <li>Any Extra items not premetted in contract</li>
   
    </ol>

    <h2>Terms And Condtions</h2>
    <ol>
      <li> 
Amount in AED
      <ul>
        <li>50% Advance (Non Refundable)</li>
      </ul>
      </li> 
    </ol>
 

 

</body>

</html>