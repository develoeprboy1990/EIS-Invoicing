<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>INVOICE</title>
    <style type="text/css">
        @page {
            margin-top: 0.5cm;
            margin-bottom: 0.5cm;
            margin-left: 0.5cm;
            margin-right: 0.5cm;
        }

        body {
            font-family: 'Bookman Old Style', serif !important;
            color: #000;
            font-size: 11pt;
            line-height: 100%;
            margin-top: 4cm;
            margin-left: 1cm;
            margin-right: 1cm;
            margin-bottom: 1cm;
        }

        h1,
        h2,
        h3,
        h4 {
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

        h3,
        h4 {
            font-size: 9pt;
        }

        ol,
        ul {
            list-style: none;
            margin-left: 30;
            padding: 0;
            text-decoration: none;
            color: #000;
        }

        li {
            text-decoration: none;
            color: #000;
        }

        li,
        ul {
            margin-bottom: 0.75em;
        }

        p {
            margin: 0;
            padding: 0;
        }

        p+p {
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

        th {
            vertical-align: top;
            text-align: center;
        }

        td {
            vertical-align: top;
            text-align: left;
        }

        table.container {
            width: 100%;
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
            width: 100%;
            margin-bottom: 8mm;
            border: 1px solid black;
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
            border: 1px solid #080704;
        }

        .order-details td,
        .order-details th {
            padding: 0.375em;
            border: 1px solid #080704;
        }

        .order-details th {
            font-weight: bold;
            text-align: center;
            border: 1px solid #080704;
        }

        .order-details thead th {
            color: black;
            border: 1px solid #080704;

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

        dt,
        dd,
        dd p {
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

        #xyz_main {
            width: 1000px;
            border: 0px solid #666666;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-left: -500px;
            z-index: 1000;
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
            z-index: -1000;
            background-repeat: no-repeat;

            background-image: url("{{asset('assets/images/logo/EIS-LOGO.png')}}");


        }


        .pcs-itemtable-header {
            background-color: #9CC2E5;
            color: #080704;
            text-transform: uppercase;
            text-align: center !important;
        }

        .pcs-itemtable-breakword {
            background-color: #CBE1FF;
        }


        th,
        td {
            padding: 10px;
        }





        .table-of-contents {
            padding: 20px;
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


        /** Define the header rules **/
        header {
            position: fixed;
            top: 0cm;
            left: 0cm;
            right: 0cm;
            height: 4cm;
            /** Extra personal styles **/
            color: black;
            margin-bottom: 2cm;
        }



        footer {
            position: fixed;
            bottom: 0px;
            left: 0px;
            right: 0px;
            height: 2cm;
            color: white;
            text-align: center;
            margin-top: 2cm;
        }

        ol+ul {
            margin-left: 30px;
            /* Adjust this value as needed */
        }
    </style>
</head>

<body class="invoice">
    <header> 
        <table class="head container" border="0">
            <tr>
                <td class="header">
                    <img src="{{URL('/documents/'.$company->Logo)}}" width="188" height="104" />
                </td>
                <td class="shop-info">
                    <div class="shop-name">
                        <div align="right">
                            <div style="font-size: 20pt;line-height: 40pt;text-decoration: underline;color: #275079;">
                                <strong> {{$company->SaleInvoiceTitle}}</strong>
                            </div>
                            <span style="color: #36709D;font-size: 14pt;line-height: 10pt;">
                                Date : {{ \Carbon\Carbon::parse($invoice_master->Date)->format('d M,Y')}}<br>
                                Ref No. {{$invoice_master->ReferenceNo}}
                            </span>
                        </div>
                    </div>
                    <div class="shop-address"></div>
                </td>
            </tr>
        </table>
    </header>
    <table class="order-data-addresses">
        <tr>
            <td align="left" style="vertical-align:bottom;word-wrap: break-word;width:50%;padding: 0px 0px 10px 0px;">
                <table style="table-layout: fixed;word-wrap: break-word;width: 98%;border: 2px solid black;" cellspacing="0" cellpadding="1">
                    <tbody>
                        <tr class="pcs-itemtable-header" style="border-bottom: 2px solid black;">
                            <th><strong>SERVICE PROVIDER</strong></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="shop-name" style="height:120px;line-height: 15pt;">
                                    <div>
                                        {{$company->Name}}<br />
                                        {{$company->Address}}<br />
                                        {{$company->Contact}}<br />
                                        <a href="mailto: {{$company->Email}}">{{$company->Email}}</a><br />
                                        TRN: {{$company->TRN}}<br />
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
            <td align="right" style="vertical-align:bottom;word-wrap: break-word;width: 50%;padding: 0px 0px 10px 0px;">
                <table style="table-layout: fixed;word-wrap: break-word;width: 98%;float:right;border: 2px solid black;" cellspacing="0" cellpadding="1">

                    <tbody>
                        <tr class="pcs-itemtable-header" style="border-bottom: 2px solid black;">
                            <th><strong>CLIENT</strong></th>
                        </tr>
                        <tr>
                            <td>
                                <div class="shop-name" style="height:120px;line-height: 15pt;">
                                    <div>
                                        <strong>Name: </strong>{{$invoice_master->PartyName}}<br />
                                        <strong>Address: </strong>{{$invoice_master->Address}}<br />
                                        <strong>Contact: </strong>{{$invoice_master->Mobile}}<br />
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>

    @php
    $cartTotal = 0;
    @endphp
    @foreach($categoryBasedInvoice as $keys => $invoice_detail)
    <table class="order-details">
        <thead>
            <tr class="pcs-itemtable-header">
                <th colspan="5" valign="bottom"><strong> {{++$keys}}</strong></th>
            </tr>
            <tr class="pcs-itemtable-breakword">
                <th width="5%" class="sno">SNO:</th>
                <th width="20%" class="product">DESCRIPTION</th>
                <th width="10%" class="quantity">QTY</th>
                <th width="10%" class="price">PRICE</th>
                <th width="10%" class="price">TOTAL</th>
            </tr>
        </thead>
        <tbody>
            @php
            $catTotal = 0;
            @endphp
            @foreach($invoice_detail as $key => $value)
            @php
            $catTotal = $catTotal+$value['Total'];
            @endphp

            <tr>
                <td height="13px" style="text-align:center!important;">{{$key+1}}</td>
                <td>{{$value['Description']}}</td>
                <td style="text-align:center!important;">{{$value['Qty']}}</td>
                <td style="text-align:center!important;">{{number_format($value['Rate'],2)}}</td>
                <td style="text-align:center!important;">{{number_format($value['Total'],2)}}</td>
            </tr>
            @endforeach
        </tbody>
        <tfoot>

            <tr class="pcs-itemtable-header" style="font-weight: bold;" colspan="2">
                <th colspan="4" align="center">Total </th>
                <td style="text-align:center!important;">{{number_format($catTotal,2)}}</td>
            </tr>
        </tfoot>
    </table>
    @endforeach
    <table class="order-details">
        <tfoot>
            <tr class="pcs-itemtable-header" style="font-weight: bold;">
                <th colspan="4" align="center">Total AED</th>
                <td style="text-align:center!important;">{{number_format($invoice_master->SubTotal,2)}}</td>
            </tr>

            <tr class="pcs-itemtable-header" style="font-weight: bold;">
                <th colspan="4" align="center">VAT {{$invoice_master->TaxPer}} %</th>
                <td style="text-align:center!important;">{{number_format($invoice_master->Tax,2)}}</td>
            </tr>
            <tr class="pcs-itemtable-header" style="font-weight: bold;">
                <th colspan="4" align="center">Grand Total AED</th>
                <td style="text-align:center!important;">{{number_format($invoice_master->GrandTotal,2)}}</td>
            </tr>
        </tfoot>
    </table>
    <div class="table-of-contents">
        <h2>BANK DETAILS:</h2>
        {!!@$company->BankDetails1!!}
        <br>
        <h2>BANK DETAILS:</h2>
        {!!@$company->BankDetails2!!}
    </div>

</body>

</html>