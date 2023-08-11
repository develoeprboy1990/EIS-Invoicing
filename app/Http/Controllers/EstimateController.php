<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Session;
use Yajra\DataTables\DataTables;

use PDF;

class EstimateController extends Controller
{
  public function Estimate()
  {

    $pagetitle = 'All Quotations';
    return view('estimate.estimate', compact('pagetitle'));
  }


  public function ajax_estimate(Request $request)
  {
    session::put('menu', 'Vouchers');
    $pagetitle = 'Delivery Challan';
    if ($request->ajax()) {
      $data = DB::table('v_estimate_master')->orderBy('EstimateMasterID')->get();

      return Datatables::of($data)
        ->addIndexColumn()
        ->addColumn('action', function ($row) {
          // if you want to use direct link instead of dropdown use this line below
          // <a href="javascript:void(0)"  onclick="edit_data('.$row->customer_id.')" >Edit</a> | <a href="javascript:void(0)"  onclick="del_data('.$row->customer_id.')"  >Delete</a>
          $btn = ' 
 
                       <div class="d-flex align-items-center col-actions">
                     
 
                <a href="' . URL('/EstimateView/' . $row->EstimateMasterID) . '"><i class="font-size-18 mdi mdi-eye-outline align-middle me-1 text-secondary"></i></a> 
                <a href="' . URL('/EstimateEdit/' . $row->EstimateMasterID) . '"><i class="font-size-18 mdi mdi-pencil align-middle me-1 text-secondary"></i></a> 
                <a  target="_blank" href="' . URL('/EstimateViewPDF/' . $row->EstimateMasterID) . '"><i class="font-size-18 mdi mdi-file-pdf-outline align-middle me-1 text-secondary"></i></a> 
                 <a href="' . URL('/EstimateDelete/' . $row->EstimateMasterID) . '"><i class="font-size-18 mdi mdi-trash-can-outline align-middle me-1 text-secondary"></i></a> 
                        
                          
 
                      
                       </div>';

          //class="edit btn btn-primary btn-sm"
          // <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
          return $btn;
        })
        ->rawColumns(['action'])
        ->make(true);
    }

    return view('estimate.estimate', 'pagetitle');
  }


  public function EstimateCreate()
  {

    // dd('reached');
    $pagetitle = 'Create Quotation';
    $party = DB::table('party')->get();

    $items = DB::table('item')->get();
    $item = json_encode($items);
    // dd($item);
    $user = DB::table('user')->get();
    $chartofacc = DB::table('chartofaccount')->get();
    $estimate_master = DB::table('estimate_master')
      ->select(DB::raw('LPAD(IFNULL(MAX(right(EstimateNo,5)),0)+1,5,0) as EstimateNo'))
      ->first();

    $tax = DB::table('tax')->where('Section', 'Estimate')->get();

    $challan_type = DB::table('challan_type')->get();
    $estimate_type = DB::table('estimate_type')->get();
    $company = DB::table('company')->first();
    $item_categories = DB::table('item_category')->get();
    return view('estimate.estimate_create', compact('chartofacc', 'party', 'pagetitle', 'estimate_master', 'items', 'item', 'challan_type', 'user', 'estimate_type', 'tax', 'company', 'item_categories'));
  }

  public  function EstimateSave(request $request)
  {

    $challan_mst = array(
      'EstimateNo' => $request->input('EstimateNo'),
      'EstimateType' => $request->input('EstimateType'),
      'PartyID' => $request->input('PartyID'),
      'WalkinCustomerName' => $request->input('WalkinCustomerName'),
      'PlaceOfSupply' => $request->input('PlaceOfSupply'),
      'ReferenceNo' => $request->input('ReferenceNo'),
      'Date' => $request->input('Date'),
      'EstimateDate' => $request->input('Date'),
      'ExpiryDate' => $request->input('DueDate'),
      'Subject' => $request->input('Subject'),
      'SubTotal' => $request->input('SubTotal'),
      'Discount' => $request->input('DiscountAmount'),
      'DiscountPer' => $request->input('DiscountPer'),
      'TaxType' => $request->input('TaxType'),
      'TaxPer' => $request->input('Taxpercentage'),
      'Tax' => $request->input('grandtotaltax'),
      'Shipping' => $request->input('Shipping'),
      'Total' => $request->input('Total'),
      'GrandTotal' => $request->input('Grandtotal'),
      'CustomerNotes' => $request->input('CustomerNotes'),
      'DescriptionNotes' => $request->input('DescriptionNotes'),
      'TermAndCondition' => $request->input('TermAndCondition'),
      'UserID' => session::get('UserID'),
    );
    // dd($challan_mst);
    // $id= DB::table('')->insertGetId($data);

    $EstimateMasterID = DB::table('estimate_master')->insertGetId($challan_mst);


    //  start for item array from invoice
    for ($i = 0; $i < count($request->ItemID); $i++) {

      if ($request->ItemID[$i] != '') {
        $ItemID =  $request->ItemID[$i];
      } else {
        $service_item = DB::table('item')->where('ItemType', 'Service')->orderBy('ItemID', 'ASC')->first();
        $ItemID =  $service_item->ItemID;
      }
      $challan_det = array(
        'EstimateMasterID' =>  $EstimateMasterID,
        'EstimateNo' => $request->input('EstimateNo'),
        'EstimateDate' => $request->input('Date'),
        'ItemID' => $ItemID,
        'ItemCategoryID' => $request->CatID[$i],
        'Description' => $request->Description[$i],
        'TaxPer' => $request->Tax[$i],
        'Tax' => $request->TaxVal[$i],
        'Qty' => $request->Qty[$i],
        'Rate' => $request->Price[$i],
        'Total' => $request->ItemTotal[$i],
        'Discount' => $request->Discount[$i],
        'DiscountType' => $request->DiscountType[$i],
        'Gross' => $request->Gross[$i],
        'DiscountAmountItem' => $request->DiscountAmountItem[$i],
      );

      $id = DB::table('estimate_detail')->insertGetId($challan_det);
    }


    // end foreach

    // dd('hello');
    return redirect('Estimate')->with('error', 'Challan Saved')->with('class', 'success');
  }






  public function EstimateDelete($id)
  {

    $pagetitle = 'Estimate';
    $id = DB::table('estimate_master')->where('EstimateMasterID', $id)->delete();
    $id = DB::table('estimate_detail')->where('EstimateMasterID', $id)->delete();




    return redirect('Estimate')->with('error', 'Deleted Successfully')->with('class', 'success');
  }



  public function EstimateView($id)
  {
    $pagetitle = 'Estimate';
    $estimate = DB::table('v_estimate_master')->where('EstimateMasterID', $id)->first();
    //$estimate_detail = DB::table('v_estimate_detail')->where('EstimateMasterID', $id)->get();
    $estimate_detail = DB::table('v_estimate_detail')->where('EstimateMasterID', $id)->get();
    $company = DB::table('company')->first();
    $company = DB::table('company')->first();
    $categoryBasedInvoice = [];
    foreach ($estimate_detail as $key => $value) {
      if (!empty($value->ItemCategoryID)) { 
        $categoryBasedInvoice[$value->title][] = array('Description' => $value->Description, 'Qty' => $value->Qty, 'Rate' => $value->Rate, 'Total' => $value->Total);
      }
    }  
    
    session()->forget('VHNO');
    session::put('VHNO', $estimate->EstimateNo);
   
    
    return view('estimate.estimate_view', compact('estimate', 'pagetitle', 'company', 'estimate_detail', 'categoryBasedInvoice'));
  }

  public function EstimateViewPDF($id)
  {
    // dd('hello');
    $pagetitle = 'Estimate';
    $estimate = DB::table('v_estimate_master')->where('EstimateMasterID', $id)->first();
    $estimate_detail = DB::table('v_estimate_detail')->where('EstimateMasterID', $id)->get();
    $company = DB::table('company')->first();
    $categoryBasedInvoice = [];
    foreach ($estimate_detail as $key => $value) {
      if (!empty($value->ItemCategoryID)) { 
        $categoryBasedInvoice[$value->title][] = array('Description' => $value->Description, 'Qty' => $value->Qty, 'Rate' => $value->Rate, 'Total' => $value->Total);
      }
    }  

    $pdf = PDF::loadView('estimate.estimate_view_pdf', compact('estimate', 'pagetitle', 'company', 'estimate_detail','categoryBasedInvoice'));
    //return $pdf->download('pdfview.pdf');
    // $pdf->setpaper('A4', 'portiate');
    return $pdf->stream();
  }


  public function EstimateEdit($id)
  {
    // dd($id);
    $pagetitle = 'Qoutation';
    $party = DB::table('party')->get();

    $tax = DB::table('tax')->where('Section', 'Estimate')->get();

    $items = DB::table('item')->get();
    $item = json_encode($items);
    // dd($item);
    $user = DB::table('user')->get();
    $chartofacc = DB::table('chartofaccount')->get();
    $challan_master = DB::table('challan_master')
      ->select(DB::raw('LPAD(IFNULL(MAX(ChallanMasterID),0)+1,4,0) as ChallanMasterID'))
      ->get();
    $challan_type = DB::table('challan_type')->get();
    $estimate_master = DB::table('estimate_master')->where('EstimateMasterID', $id)->first();
    $estimate_detail = DB::table('estimate_detail')->where('EstimateMasterID', $id)->get();
    // dd($estimate_detail);


    $item_categories = DB::table('item_category')->get();
    return view('estimate.estimate_edit', compact('chartofacc', 'party', 'pagetitle', 'estimate_master', 'items', 'item',  'user',  'estimate_detail', 'tax', 'item_categories'));
  }


  public  function EstimateUpdate(request $request)
  {

    $estimate_mst = array(
      'EstimateNo' => $request->input('EstimateNo'),
      'EstimateType' => $request->input('EstimateType'),
      'PartyID' => $request->input('PartyID'),
      'WalkinCustomerName' => $request->input('WalkinCustomerName'),
      'PlaceOfSupply' => $request->input('PlaceOfSupply'),
      'ReferenceNo' => $request->input('ReferenceNo'),
      'Date' => $request->input('EstimateDate'),
      'EstimateDate' => $request->input('EstimateDate'),
      'ExpiryDate' => $request->input('DueDate'),
      'Subject' => $request->input('Subject'),
      'SubTotal' => $request->input('SubTotal'),
      'Discount' => $request->input('DiscountAmount'),
      'DiscountPer' => $request->input('DiscountPer'),
      'TaxType' => $request->input('TaxType'),
      'TaxPer' => $request->input('Taxpercentage'),
      'Tax' => $request->input('grandtotaltax'),
      'Shipping' => $request->input('Shipping'),
      'Total' => $request->input('Total'),
      'Grandtotal' => $request->input('Grandtotal'),
      'CustomerNotes' => $request->input('CustomerNotes'),
      'DescriptionNotes' => $request->input('DescriptionNotes'),
      'TermAndCondition' => $request->input('TermAndCondition'),
      'UserID' => session::get('UserID'),
    );


    // dd($challan_mst);
    // $id= DB::table('')->insertGetId($data);
    // dd($request->EstimateMasterID);
    $challanmaster = DB::table('estimate_master')->where('EstimateMasterID', $request->EstimateMasterID)->update($estimate_mst);

    $challanmasterdelete = DB::table('estimate_detail')->where('EstimateMasterID', $request->EstimateMasterID)->delete();

    $EstimateMasterID = $request->EstimateMasterID;

    //  start for item array from invoice
    for ($i = 0; $i < count($request->ItemID); $i++) {
      $estimate_detail = array(
        'EstimateMasterID' =>  $EstimateMasterID,
        'EstimateNo' => $request->input('EstimateNo'),
        'EstimateDate' => $request->input('Date'),
        'ItemID' => $request->ItemID[$i],
        'ItemCategoryID' => $request->CatID[$i],
        'Description' => $request->Description[$i],
        'TaxPer' => $request->Tax[$i],
        'Tax' => $request->TaxVal[$i],
        'Qty' => $request->Qty[$i],
        'Rate' => $request->Price[$i],
        'Total' => $request->ItemTotal[$i],
        'Discount' => $request->Discount[$i],
        'DiscountType' => $request->DiscountType[$i],
        'Gross' => $request->Gross[$i],
        'DiscountAmountItem' => $request->DiscountAmountItem[$i],

      );

      $id = DB::table('estimate_detail')->insertGetId($estimate_detail);
    }


    // end foreach


    return redirect('Estimate')->with('error', 'Challan Saved')->with('class', 'success');
  }

  public  function ajax_estimate_vhno(request $request)
  {

    $d = array(
      'EstimateType' => $request->EstimateType,
    );

    if ($request->EstimateType == 'IT') {
      $d = 'QOU';
      $data = DB::table('estimate_master')
        ->select(DB::raw('LPAD(IFNULL(MAX(right(EstimateNo,5)),0)+1,5,0) as VHNO '))->whereIn(DB::raw('left(EstimateNo,3)'), ['QOU'])->get();
    } elseif ($request->EstimateType == 'Software') {
      $d = 'SO';
      $data = DB::table('estimate_master')
        ->select(DB::raw('LPAD(IFNULL(MAX(right(EstimateNo,5)),0)+1,5,0) as VHNO '))->whereIn(DB::raw('left(EstimateNo,2)'), ['SO'])->get();
    }
    return view('ajax_estimate_vhno', compact('data', 'd'));
  }

  public  function ajax_estimate_ref(request $request)
  {

    $d = array(
      'EstimateType' => $request->EstimateType,
    );

    if ($request->EstimateType == 'IT') {
      $d = 'QOU';
      $data = DB::table('estimate_master')
        ->select(DB::raw('LPAD(IFNULL(MAX(right(EstimateNo,5)),0)+1,5,0) as VHNO '))->whereIn(DB::raw('left(EstimateNo,3)'), ['QOU'])->get();
    } elseif ($request->EstimateType == 'Software') {
      $d = 'SO';
      $data = DB::table('estimate_master')
        ->select(DB::raw('LPAD(IFNULL(MAX(right(EstimateNo,5)),0)+1,5,0) as VHNO '))->whereIn(DB::raw('left(EstimateNo,2)'), ['SO'])->get();
    }
    return view('ajax_estimate_ref', compact('data', 'd'));
  }

  public  function EstimateRevised(request $request)
  {

    $ref = explode('-', $request->input('ReferenceNo'));
    $current_version = $ref[1];

    $current_version_number =  preg_replace("/[^0-9]/", '', $current_version);

    $new_version_number = $current_version_number + 1;

    $ReferenceNo =  $ref[0] . '-R' . $new_version_number . '-' . date('y') . '-' . $ref[3];


    $estimate_mst = array(
      'EstimateNo' => $request->input('EstimateNo'),
      'EstimateType' => $request->input('EstimateType'),
      'PartyID' => $request->input('PartyID'),
      'WalkinCustomerName' => $request->input('WalkinCustomerName'),
      'PlaceOfSupply' => $request->input('PlaceOfSupply'),
      'ReferenceNo' => $ReferenceNo,
      'Date' => $request->input('EstimateDate'),
      'EstimateDate' => $request->input('EstimateDate'),
      'ExpiryDate' => $request->input('DueDate'),
      'Subject' => $request->input('Subject'),
      'SubTotal' => $request->input('SubTotal'),
      'Discount' => $request->input('DiscountAmount'),
      'DiscountPer' => $request->input('DiscountPer'),
      'TaxType' => $request->input('TaxType'),
      'TaxPer' => $request->input('Taxpercentage'),
      'Tax' => $request->input('grandtotaltax'),
      'Shipping' => $request->input('Shipping'),
      'Total' => $request->input('Total'),
      'Grandtotal' => $request->input('Grandtotal'),
      'CustomerNotes' => $request->input('CustomerNotes'),
      'DescriptionNotes' => $request->input('DescriptionNotes'),
      'TermAndCondition' => $request->input('TermAndCondition'),
      'UserID' => session::get('UserID'),
    );


    // dd($challan_mst);
    // $id= DB::table('')->insertGetId($data);
    // dd($request->EstimateMasterID);

    $EstimateMasterID = DB::table('estimate_master')->insertGetId($estimate_mst);



    // dd($ChallanMasterID);
    // when full payment is made


    // END OF SALE RETURN

    //  start for item array fromi Invoice
    for ($i = 0; $i < count($request->ItemID); $i++) {
      $estimate_detail = array(
        'EstimateMasterID' =>  $EstimateMasterID,
        'EstimateNo' => $request->input('EstimateNo'),
        'EstimateDate' => $request->input('Date'),
        'ItemID' => $request->ItemID[$i],
        'ItemCategoryID' => $request->CatID[$i],
        'Description' => $request->Description[$i],
        'TaxPer' => $request->Tax[$i],
        'Tax' => $request->TaxVal[$i],
        'Qty' => $request->Qty[$i],
        'Rate' => $request->Price[$i],
        'Total' => $request->ItemTotal[$i],
        'Discount' => $request->Discount[$i],
        'DiscountType' => $request->DiscountType[$i],
        'Gross' => $request->Gross[$i],
        'DiscountAmountItem' => $request->DiscountAmountItem[$i],

      );

      $id = DB::table('estimate_detail')->insertGetId($estimate_detail);
    }


    // end foreach


    return redirect('Estimate')->with('error', 'Qoutation Revised Saved')->with('class', 'success');
  }


  public  function ajax_quotoinv(request $request)
  {

    $QoutationNo = $request->input('QoutationNo');

    $estimate_mst = DB::table('estimate_master')->where('EstimateNo', $QoutationNo)->orderBy('EstimateMasterID', 'DESC')->first();

    $vhno = DB::table('invoice_master')
      ->select(DB::raw('LPAD(IFNULL(MAX(right(InvoiceNo,5)),0)+1,5,0) as VHNO '))->whereIn(DB::raw('left(InvoiceNo,3)'), ['INV'])->get();


    $InvoiceNo = 'INV-' . $vhno[0]->VHNO;
    $ReferenceNo = 'INV-' . date('y') . '-' . $vhno[0]->VHNO;

    $invoice_mst = array(
      'InvoiceNo' => $InvoiceNo,
      'InvoiceType' => 'Invoice',
      'Date' => date('Y-m-d'),
      'PartyID' => $estimate_mst->PartyID,
      'WalkinCustomerName' => $estimate_mst->WalkinCustomerName,
      'ReferenceNo' => $ReferenceNo,
      'PaymentMode' => 'Cash',
      'Subject' => $estimate_mst->Subject,
      'SubTotal' => $estimate_mst->SubTotal,
      'DiscountPer' => $estimate_mst->DiscountPer,
      'DiscountAmount' => $estimate_mst->Discount,
      'Total' => $estimate_mst->Total,
      'TaxType' => $estimate_mst->TaxType,
      'TaxPer' => $estimate_mst->TaxPer,
      'Tax' => $estimate_mst->Tax,
      'Shipping' => $estimate_mst->Shipping,
      'GrandTotal' => $estimate_mst->GrandTotal,
      'CustomerNotes' => $estimate_mst->CustomerNotes,
      'DescriptionNotes' => $estimate_mst->DescriptionNotes,
      'Paid' => 0,
      'Balance' => $request->GrandTotal,
      'UserID' => session::get('UserID'),
    );

    $InvoiceMasterID = DB::table('invoice_master')->insertGetId($invoice_mst);
    $invoice_details = DB::table('estimate_detail')->where('EstimateMasterID', $estimate_mst->EstimateMasterID)->get();

    foreach ($invoice_details as $invoice_detail) { 

          $invoice_det_data = array (
            'InvoiceMasterID' =>  $InvoiceMasterID, 
            'InvoiceNo' => $InvoiceNo, 
            'ItemID' => $invoice_detail->ItemID,
            'ItemCategoryID' => $invoice_detail->ItemCategoryID,
            'PartyID' => $estimate_mst->PartyID, 
            'Qty' => $invoice_detail->Qty,
            'Description' => $invoice_detail->Description,
            'TaxPer' => $invoice_detail->TaxPer,
            'Tax' => $invoice_detail->Tax,
            'Rate' => $invoice_detail->Rate,
            'Total' => $invoice_detail->Total,
            'Discount' => $invoice_detail->Discount,
            'DiscountType' => $invoice_detail->Discount,
            'Gross' => $invoice_detail->Gross,
            'DiscountAmountItem' => $invoice_detail->DiscountAmountItem, 
        );

        $id= DB::table('invoice_detail')->insertGetId($invoice_det_data);
      }


// end foreach
  

// Journal Entries 

// 1. A/R

 // A/R -> Debit
$data_ar = array(
'VHNO' => $InvoiceNo,
'ChartOfAccountID' => '110400',   //A/R
'PartyID' => $estimate_mst->PartyID,
'InvoiceMasterID' =>$InvoiceMasterID, #7A7A7A
'Narration' => $estimate_mst->Subject, 
'Date' => date('Y-m-d'),
'Dr' => $estimate_mst->GrandTotal,
'Trace' => 123, // for debugging for reverse engineering
 
);

$journal_entry= DB::table('journal')->insertGetId($data_ar);

// 2. Sale discount

 // Sales-Discount -> Debit

if($estimate_mst->Discount > 0) { // if dis is given


$data_saledis = array(
'VHNO' => $InvoiceNo,
'ChartOfAccountID' => '410155',   //Sales-Discount
'PartyID' => $estimate_mst->PartyID,
'InvoiceMasterID' =>$InvoiceMasterID, #7A7A7A
'Narration' => $estimate_mst->Subject, 
'Date' => date('Y-m-d'),
'Dr' => $estimate_mst->Discount,
'Trace' => 1234, // for debugging for reverse engineering
 
);


$journal_entry= DB::table('journal')->insertGetId($data_saledis);
}
// 3. sales

 // Sales -> Credit
$data_sale = array(
'VHNO' => $InvoiceNo,
'ChartOfAccountID' => '410100',   //Sales
'PartyID' => $estimate_mst->PartyID,
'InvoiceMasterID' =>$InvoiceMasterID, #7A7A7A
'Narration' => $estimate_mst->Subject, 
'Date' => date('Y-m-d'),
'Cr' => $estimate_mst->SubTotal,
'Trace' => 12345, // for debugging for reverse engineering
 
);

$journal_entry= DB::table('journal')->insertGetId($data_sale);

// 4. Tax -> VAT-OUTPUT TAX -> tax payable

 // VAT-OUTPUT TAX -> Credit

if($estimate_mst->GrandTotal>0) { // if tax item is present in invoice


$data_vat_out = array(
'VHNO' => $InvoiceNo,
'ChartOfAccountID' => '210300',   //VAT-OUTPUT TAX ->tax payable
'PartyID' => $estimate_mst->PartyID,
'InvoiceMasterID' =>$InvoiceMasterID, #7A7A7A
'Narration' => $estimate_mst->Subject, 
'Date' => date('Y-m-d'),
'Cr' => $estimate_mst->Tax,
'Trace' => 12346, // for debugging for reverse engineering

 
);

$journal_entry= DB::table('journal')->insertGetId($data_vat_out); 
}



// 5. shipping charges

 // SHIPPING -> Credit

if($estimate_mst->Shipping>0) { // if tax item is present in invoice


$data_shipping = array(
'VHNO' => $InvoiceNo,
'ChartOfAccountID' => '500100',   //shipping
'PartyID' => $estimate_mst->PartyID,
'InvoiceMasterID' =>$InvoiceMasterID, #7A7A7A
'Narration' => $estimate_mst->Subject, 
'Date' => date('Y-m-d'),
'Cr' => $estimate_mst->Shipping,
'Trace' => 123467, // for debugging for reverse engineering

 
);

$journal_entry= DB::table('journal')->insertGetId($data_shipping); 
}


return response()->json(['success' => 'success', 'message' => $InvoiceMasterID]);

}
}