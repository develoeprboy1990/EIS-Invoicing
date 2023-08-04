<style type="text/css">
  /* .style1 {font-weight: bold} */

  /*  .style1 {
              font-size: 25px
            } */

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
    border: 1px solid #ccc;
  }
</style>
@extends('template.tmp')
@section('title', $pagetitle)
@section('content')
<div class="main-content">
  <div class="page-content">
    <div class="container-fluid">
      <!-- start page title -->
      <div class="row">
        <div class="col-12">
          <div class="page-title-box d-print-block d-sm-flex align-items-center justify-content-between">
            <h4 class="mb-sm-0 font-size-18">Quotation</h4>
          </div>
        </div>
      </div> 
    
      <div class="card ">
        <div class="card-body border-3 border-top border-danger">
          <div class="pcs-template-body">
            <table style="width:100%;table-layout: fixed;">
              <tbody>
                <tr>
                  <td style="vertical-align: top; width:50%;"> <img src="{{asset('assets/images/logo/EIS-LOGO.png')}}" alt="" class="img-fluid" width="120px"></td>
                  <td style="vertical-align: top; text-align:right;width:50%;">
                    <span class="pcs-entity-title style1">{{$company[0]->EstimateInvoiceTitle}} </span><span class="style1"><br>
                      Date : {{date("d/M/yy")}} <br>
                      <b>RefNo # {{$estimate[0]->EstimateNo}}</b></span>
                  </td>
                </tr>
              </tbody>
            </table>
            <table style="width:100%;margin-top:30px;table-layout:fixed;">
              <tbody>
                <tr>
                  <td style="width:60%;vertical-align:bottom;word-wrap: break-word;">


                    <table style="table-layout: fixed;word-wrap: break-word;width: 60%;" border="2" cellspacing="0" cellpadding="1"> 


                      <tbody>
                        <tr class="pcs-itemtable-header">
                        <td><strong>SERVICE PROVIDER</strong></td>
                        </tr>

                        <tr>
                          <td>
                            <div class="shop-name">
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
                        <tr>
                          <td> </td>
                        </tr>
                        <tr>
                          <td>
                          </td>
                        </tr>
                        <tr>
                          <td> </td>
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
                            <div class="shop-name">
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
                        <tr>
                          <td> </td>
                        </tr>
                        <tr>
                          <td>
                          </td>
                        </tr>
                        <tr>
                          <td> </td>
                        </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
              </tbody>
            </table>
            <table style="width:100%;margin-top:20px;table-layout:fixed;" class="pcs-itemtable" border="0" cellspacing="0" cellpadding="0">
              <thead>
                <tr style="height:32px;" class="pcs-itemtable-header">
                  <td colspan="6" style="padding: 5px 0px 5px 5px;width: 5%;text-align: center; "><strong>
                      {{$estimate[0]->Subject}}</strong></td>
                </tr>
                <tr style="height:32px;">
                  <td colspan="6"><strong> </strong></td>
                </tr>
                <tr style="height:32px;" class="pcs-itemtable-breakword">
                  <td width="10%" class="pcs-itemtable-breakword" style="padding: 5px 0px 5px 5px;width: 5%;text-align: center;"><strong>
                      # </strong></td>
                  <td width="33%" style="padding: 5px 10px 5px 20px;width: ;text-align: left;"><span style="padding: 5px 10px 5px 20px;width: ;text-align: left;"><strong>Item Name </strong></span></td>
                  <td id="" style="padding: 5px 10px 5px 20px;width: ;text-align: left;"><span style="padding: 5px 10px 5px 5px;width: 11%;text-align: right;"><strong>Description</strong></span></td>
                  <td width="10%" style="padding: 5px 10px 5px 5px;width: 11%;text-align: right;"><strong>
                      Qty </strong></td>
                  <td width="14%" style="padding: 5px 10px 5px 5px;width: 11%;text-align: right;"><strong>
                      Rate </strong></td>

                  <td width="13%" style="padding: 5px 10px 5px 5px;width: 10%;text-align: right;"><strong>
                      Amount </strong></td>
                </tr>
              </thead>
              <tbody class="itemBody">
                @foreach($estimate_detail as $key => $value)
                <tr class="breakrow-inside breakrow-after">
                  <td valign="top" style="padding: 10px 0 10px 5px;text-align: center;word-wrap: break-word;" class="pcs-item-row">
                    {{++$key}}
                  </td>
                  <td valign="top" style="padding: 10px 0px 10px 20px;" class="pcs-item-row"><span class="pcs-item-row" style="padding: 10px 0px 10px 20px;"> {{$value->ItemName}} </span></td>
                  <td valign="top" class="pcs-item-row" style="padding: 10px 0px 10px 20px;">
                    <div>
                      <div> <span style="white-space: pre-wrap;word-wrap: break-word;" class="pcs-item-desc" id="tmp_item_description">{{$value->Description}} </span> </div>
                    </div>
                  </td>

                  <td valign="top" style="padding: 10px 10px 5px 10px;text-align:right;word-wrap: break-word;" class="pcs-item-row">
                    <span id="tmp_item_qty">{{$value->Qty}}</span>
                  </td>

                  <td valign="top" style="padding: 10px 10px 5px 10px;text-align:right;word-wrap: break-word;" class="pcs-item-row">
                    <span id="tmp_item_rate">{{$value->Rate}}</span>
                  </td>
                  <td valign="top" style="text-align:right;padding: 10px 10px 10px 5px;word-wrap: break-word;" class="pcs-item-row">
                    <span id="tmp_item_amount">{{$value->Total}}</span>
                  </td>
                </tr>
                @endforeach
              </tbody>
            </table>
            <div style="width: 100%;margin-top: 1px;">
              <div style="width: 45%;padding: 3px 10px 3px 3px;font-size: 9pt;float: left;">
                <div style="white-space: pre-wrap;">
                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="50%"><strong>Description :</strong> {{$estimate[0]->DescriptionNotes}}</td>
                    </tr>
                    <tr>
                      <td width="50%"><strong>Customer Notes : </strong>{{$estimate[0]->CustomerNotes}}</td>
                    </tr>
                  </table>
                </div>
              </div>
              <div style="width: 50%;float:right;">
                <table class="pcs-totals" cellspacing="0" border="0" width="100%">
                  <tbody>
                    <tr class="pcs-balance">
                      <td width="474" height="25" align="right" valign="middle">[Exclusive Tax] <b>SubTotal</b></td>
                      <td width="289" height="25" align="right" valign="middle" id="tmp_total" style="width:120px;;padding: 10px 10px 10px 5px;">
                        <div align="right"><b>{{$estimate[0]->SubTotal}}</b></div>
                      </td>
                    </tr>
                    <tr class="pcs-balance">
                      <td height="25" align="right" valign="middle"><b>Tax %</b></td>
                      <td height="25" align="right" valign="middle" id="tmp_total" style="width:120px;;padding: 10px 10px 10px 5px;">
                        <div align="right"><b>{{$estimate[0]->TaxPer}}</b></div>
                      </td>
                    </tr>
                    <tr class="pcs-balance">
                      <td height="25" align="right" valign="middle"><b>Tax </b></td>
                      <td height="25" align="right" valign="middle" id="tmp_total" style="width:120px;;padding: 10px 10px 10px 5px;">
                        <div align="right"><b>{{$estimate[0]->Tax}}</b></div>
                      </td>
                    </tr>
                    <tr class="pcs-balance">
                      <td height="25" align="right" valign="middle">[Inclusive Tax]<b>Total </b></td>
                      <td height="25" align="right" valign="middle" id="tmp_total" style="width:120px;;padding: 10px 10px 10px 5px;">
                        <div align="right"><b>{{$estimate[0]->Total}}</b></div>
                      </td>
                    </tr>
                    <tr class="pcs-balance">
                      <td height="25" align="right" valign="middle"><b>Discount %</b></td>
                      <td height="25" align="right" valign="middle" id="tmp_total" style="width:120px;;padding: 10px 10px 10px 5px;">
                        <div align="right"><b>{{$estimate[0]->DiscountPer}}</b></div>
                      </td>
                    </tr>
                    <tr class="pcs-balance">
                      <td height="25" align="right" valign="middle"><b>Discount</b></td>
                      <td height="25" align="right" valign="middle" id="tmp_total" style="width:120px;;padding: 10px 10px 10px 5px;">
                        <div align="right"><b>{{$estimate[0]->Discount}}</b></div>
                      </td>
                    </tr>
                    <tr class="pcs-balance">
                      <td height="25" align="right" valign="middle"><b>Grand Total</b></td>
                      <td height="25" align="right" valign="middle" id="tmp_total" style="width:120px;;padding: 10px 10px 10px 5px;">
                        <div align="right"><b>{{$estimate[0]->GrandTotal}}</b></div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div style="clear: both;"></div>
            </div>
            <div style="width: 100%;margin-top: 10px;">
              <table cellspacing="0" border="0" width="100%">
                <tbody>
                  <tr class="bg-light" style="height: 30px;">
                    <td width="10%" class="total-in-words-label text-align-right  ">Total In Words:</td>
                    <td width="90%" class="total-in-words-value text-align-left "><i><b> {{convert_number_to_words($estimate[0]->Total)}} only </b></i></td>
                  </tr>
                </tbody>
              </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="50%">&nbsp;</td>
                  <td width="50%" rowspan="2" valign="top">@include('signature.signature') </td>
                </tr>
                <tr>
                  <td width="50%">&nbsp;</td>
                </tr>
              </table>
              <div style="clear: both;"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="card">
        <div class="card-body">
          @include('attachment_view')
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<!-- END: Content-->

@endsection