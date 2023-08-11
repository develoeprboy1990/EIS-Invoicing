<style type="text/css">
  /* .style1 {font-weight: bold} */

  /*  .style1 {
              font-size: 25px
            } */

  .pcs-itemtable-header {
    background-color: #9CC2E5;
    color: #080704;
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
            <div class="text-sm-end">
              <input type="hidden" name="_token" id="csrf" value="{{Session::token()}}">
              <button type="button" id="QuotationToInvoice" data-id="{{$estimate->EstimateNo}}" class="btn btn-success btn-rounded waves-effect waves-light mb-2 me-2">Convert To Invoice</button>
            </div>
          </div>
        </div>
      </div>

      <div class="card ">
        <div class="card-body border-3 border-top border-danger">
          <div class="pcs-template-body">
            <table style="width:100%;table-layout: fixed;">
              <tbody>
                <tr>
                  <td style="vertical-align: top; width:50%;"> <img src="{{URL('/documents/'.$company->Logo)}}" alt="" class="img-fluid" width="120px"></td>
                  <td style="vertical-align: top; text-align:right;width:50%;">
                    <span class="pcs-entity-title style1" style="text-decoration: underline;color: #275079;"><b>{{$company->EstimateInvoiceTitle}}</b></span><br>
                    <span class="style1" style="color: #36709D;">
                      Date : {{ \Carbon\Carbon::parse($estimate->Date)->format('d M,Y')}}<br>
                      Ref No. {{$estimate->ReferenceNo}}
                    </span>
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
                                {{$company->Name}}<br />
                                {{$company->Address}}<br />
                                {{$company->Contact}}<br />
                                {{$company->Email}}<br />
                                TRN: {{$company->TRN}}<br />
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
                                <strong>Name: </strong>{{$estimate->PartyName}}<br />
                                <strong>Address: </strong>{{$estimate->Address}}<br />
                                <strong>Contact: </strong>{{$estimate->Mobile}}<br />
                                <div>
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
            @php
            $cartTotal = 0;
            @endphp

            @foreach($categoryBasedInvoice as $keys => $values)
            <table style="width:100%;margin-top:20px;table-layout:fixed;" class="pcs-itemtable" border="0" cellspacing="0" cellpadding="0">
              <thead>
                <tr style="height:32px;" class="pcs-itemtable-header">
                  <td colspan="5" style="padding: 5px 0px 5px 5px;width: 5%;text-align: center; "><strong> {{++$keys}}</strong></td>
                </tr>
                <tr style="height:32px;" class="pcs-itemtable-breakword">
                  <td class="pcs-itemtable-breakword" style="padding: 5px 0px 5px 5px;text-align: center;">
                    <strong>SNO:</strong>
                  </td>
                  <td style="padding: 5px 10px 5px 20px;text-align: center;">
                    <span style="padding: 5px 10px 5px 5px;">
                      <strong>DESCRIPTION</strong>
                    </span>
                  </td>
                  <td style="padding: 5px 10px 5px 5px;text-align: center;">
                    <strong>QTY</strong>
                  </td>
                  <td style="padding: 5px 10px 5px 5px;text-align: center;">
                    <strong>PRICE </strong>
                  </td>
                  <td style="padding: 5px 10px 5px 5px;text-align: center;">
                    <strong>TOTAL</strong>
                  </td>
                </tr>
              </thead>
              <tbody class="itemBody">
                @php
                $catTotal = 0;
                @endphp
                @foreach($values as $key => $value)
                @php
                $catTotal = $catTotal+$value['Total'];
                @endphp
                <tr>
                  <td valign="top" style="padding: 10px 0 10px 5px;text-align: center;word-wrap: break-word;" class="pcs-item-row">
                    {{++$key}}
                  </td>

                  <td valign="top" class="pcs-item-row" style="padding: 10px 0px 10px 20px;text-align: left;" align="left;">
                    {{@$value['Description']}}
                  </td>

                  <td valign="top" style="padding: 10px 10px 5px 10px;text-align:center;word-wrap: break-word;" class="pcs-item-row">
                    <span id="tmp_item_qty">{{$value['Qty']}}</span>
                  </td>

                  <td valign="top" style="padding: 10px 10px 5px 10px;text-align:center;word-wrap: break-word;" class="pcs-item-row">
                    <span id="tmp_item_rate">{{$value['Rate']}}</span>
                  </td>

                  <td valign="top" style="text-align:center;padding: 10px 10px 10px 5px;word-wrap: break-word;" class="pcs-item-row">
                    <span id="tmp_item_amount">{{$value['Total']}}</span>
                  </td>
                </tr>
                @endforeach
                <tr style="height:32px;" class="pcs-itemtable-breakword">
                  <td class="pcs-itemtable-breakword" style="padding: 5px 0px 5px 5px;text-align: center;" colspan="4">
                    <strong>TOTAL</strong>
                  </td>
                  <td style="padding: 5px 10px 5px 5px;text-align: center;">
                    <strong>{{$catTotal}}</strong>
                  </td>
                </tr>
                @endforeach
                <tr >
                  <td  colspan="5">&nbsp
                  </td>
                </tr>
              </tbody>

              <tfoot>
                <tr class="pcs-itemtable-header" style="font-weight: bold;">
                  <th colspan="4" align="center">Total AED</th>
                  <td style="text-align:center!important;">{{number_format($estimate->SubTotal,2)}}</td>
                </tr>

                <tr class="pcs-itemtable-header" style="font-weight: bold;">
                  <th colspan="4" align="center">VAT {{$estimate->TaxPer}} %</th>
                  <td style="text-align:center!important;">{{number_format($estimate->Tax,2)}}</td>
                </tr>



                <tr class="pcs-itemtable-header" style="font-weight: bold;">
                  <th colspan="4" align="center">Grand Total AED</th>
                  <td style="text-align:center!important;">{{number_format($estimate->GrandTotal,2)}}</td>
                </tr>

              </tfoot>
            </table>



 
            <div style="width: 100%;margin-top: 1px;">
              <div style="width: 45%;padding: 3px 10px 3px 3px;font-size: 9pt;float: left;">
                <div style="white-space: pre-wrap;">
                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="50%"><strong>Description :</strong> {!!$estimate->DescriptionNotes!!}</td>
                    </tr>
                    <tr>
                      <td width="50%"><strong>Customer Notes : </strong>{!!$estimate->CustomerNotes!!}</td>
                    </tr>
                    <tr>
                      <td width="50%"><strong>Terms And Condition : </strong>{!!$estimate->TermAndCondition!!}</td>
                    </tr>
                  </table>
                </div>
              </div>
              <div style="width: 50%;float:right;">
               
              </div>
              <div style="clear: both;"></div>
            </div>
            <div style="width: 100%;margin-top: 10px;">
              <table cellspacing="0" border="0" width="100%">
                <tbody>
                  <tr class="bg-light" style="height: 30px;">
                    <td width="10%" class="total-in-words-label text-align-right  ">Total In Words:</td>
                    <td width="90%" class="total-in-words-value text-align-left "><i><b> {{convert_number_to_words($estimate->Total)}} only </b></i></td>
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
<script>
  $("#QuotationToInvoice").click(function() {
    var QoutationNo = $(this).attr("data-id");
    console.log(QoutationNo);

    if (QoutationNo != "") {
      /*  $("#butsave").attr("disabled", "disabled"); */
      // alert('next stage if else');
      // console.log(EstimateType);
      $.ajax({
        url: "{{URL('/ajax_quotoinv')}}",
        type: "POST",
        data: {
          "_token": $("#csrf").val(),
          QoutationNo: QoutationNo,

        },
        cache: false,

        success: function(data) {
          console.log(data);
          Swal.fire({
            icon: 'success',
            title: 'Qoutation Converted to Invoice Successfully',
            showConfirmButton: true,
            confirmButtonText: 'OK',
            allowOutsideClick: false
          }).then((result) => {
            if (result.isConfirmed) {
              window.location.href = "{{ url('Invoice')}}";
            }
          });
        }
      });

      $.ajax({});


    }

  });
</script>
@endsection