<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>RECEIPT</title>
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
            margin: 0.02cm;
            font-size: 11pt;
            line-height: 100%;
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
            border: 2px solid #8EA1B2;
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
    <table class="head container" border="0">
        <tr>
            <td class="header">
                <img src="{{asset('/documents/'.$company->Logo)}}" alt="{{$company->Name}}" />
            </td>
            <td class="shop-info">
                <div class="shop-name">
                    <div align="right">
                        <div style="font-size: 16pt;line-height: 40pt;text-decoration: underline;color: #275079;">
                            <strong>Receipt</strong>
                        </div>
                        <span style="color: #36709D;">
                            Date : {{ \Carbon\Carbon::parse($payment_master->PaymentDate)->format('d M,Y')}}<br>
                            Ref No. {{$payment_master->ReferenceNo}}
                        </span>
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

            <td align="right" style="vertical-align:bottom;width: 50%;">
                <table style="float:right;table-layout: fixed;word-wrap: break-word;width: 100%;" border="2" cellspacing="0" cellpadding="1">

                    <tbody>
                        <tr class="pcs-itemtable-header">
                            <th><strong>CLIENT</strong></th>
                        </tr>

                        <tr>
                            <td>
                                <div class="shop-name" style="height:120px;line-height: 15pt;">
                                    <div>
                                        <strong>Name: </strong>{{$payment_master->PartyName}}<br />
                                        <strong>Address: </strong>{{$payment_master->Address}}<br />
                                        <strong>Contact: </strong>{{$payment_master->Mobile}}<br />
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
    <table class="order-details">
        <thead>
            <tr class="pcs-itemtable-header">
                <th colspan="4" valign="bottom"><strong>Last Amount Paid : {{session::get('Currency')}} {{$payment_master->PaymentAmount }}</strong></th>
            </tr>
            <tr class="pcs-itemtable-breakword">
                <th   class="sno">SNO:</th>
                <th  class="product">Invoice No</th>
                <th   class="product">Date Paid</th>
                <th  class="product">Amount Paid</th>
            </tr>
        </thead>
        <tbody>
            @php
            $paidAmount = 0;
            @endphp
            @foreach ($v_payment_detail as $key =>$value)
            @php
            $paidAmount = $paidAmount+$value->Payment;
            @endphp
            <tr>
                <td height="13px" style="text-align:center!important;">{{$key+1}}</td>
                <td style="text-align:center!important;">{{$value->InvoiceNo}}</td>
                <td style="text-align:center!important;">{{$value->PaymentDate}}</td>
                <td style="text-align:center!important;">{{$value->Payment}}</td>
            </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr class="pcs-itemtable-header" style="font-weight: bold;">
                <th colspan="3" align="center">Total Paid So Far</th>
                <td style="text-align:center!important;"><!-- {{$payment_master->PaymentAmount }} --> {{$paidAmount}} {{session::get('Currency')}}</td>
            </tr>

            <tr class="pcs-itemtable-header" style="font-weight: bold;">
                <th colspan="3" align="center">Total Due </th>
                <td  style="text-align:center!important;">  {{$dueBalance->due}} {{session::get('Currency')}}</td>
            </tr>
            <tr class="pcs-itemtable-header" style="font-weight: bold;">
                <th colspan="3" align="center">Total</th>
                <td style="text-align:center!important;">  {{$dueBalance->INVOICE}} {{session::get('Currency')}}</td>
            </tr>

        </tfoot>
    </table>
 

</body>

</html>