<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Session;
use Yajra\DataTables\DataTables;
use Illuminate\Validation\Rule;

use PDF;
class ItemController extends Controller
{
    public function itemCategoryList(Request $request)
    {
        $item_categories = DB::table('item_category')->get();
        if ($request->ajax()) {
            return Datatables::of($item_categories)
                ->addIndexColumn()
                /*->addColumn('image', function ($row) {
                    if ($row->image)
                        $image = '<img src="' . url('thumbnail', $row->image) . '">';
                    else
                        $image = '<img src="' . url('assets/images/product/zummXD2dvAtI.png') . '" height="100" width="100">';

                    return $image;
                })
                ->addColumn('parent_cat', function ($row) {
                    if ($row->ParentID)
                        $parent = DB::table('item_category')->where('ItemCategoryID', $row->ParentID)->pluck('title')->first();
                    else
                        $parent = "N/A";

                    return $parent;
                })
                ->addColumn('number_of_product', function ($row) {
                    $number_of_product = DB::table('item')->where('ItemCategoryID', $row->ItemCategoryID)->where('IsActive', true)->count();
                    return @$number_of_product;
                })*/
                ->addColumn('action', function ($row) {
                    $btn = '<a href="javascript:void(0)" class="edit_category" data-id="' . $row->ItemCategoryID . '"><i class="bx bx-pencil align-middle me-1"></i></a> <a href="#" onclick="delete_confirm2(`itemCategoryDelete`,' . $row->ItemCategoryID . ')"><i class="bx bx-trash  align-middle me-1"></i></a>';

                    return $btn;
                })
                ->rawColumns(['image', 'parent_cat', 'number_of_product', 'stock_qty', 'stock_worth', 'action'])
                ->make(true);
        }

        return view('item_category_list', compact('item_categories'));
    }

    public function getItemCategoryDetail(Request $request)
    {
        $lims_category_data = DB::table('item_category')->where('ItemCategoryID', $request->cat_id)->first();
        $parent_id = DB::table('item_category')->where('ItemCategoryID', $lims_category_data->ParentID)->pluck('ItemCategoryID')->first();

        return response()->json([
            'lims_category_data' => $lims_category_data,
            'parent_id' => $parent_id,
        ]);
    }

    public function storeItemCategory(Request $request)
    {
        $category_name = preg_replace('/\s+/', ' ', $request->itemCategoryName);
        $this->validate($request, [
            'title' => [
                'max:255',
                Rule::unique('item_category')->where(function ($query) {
                    return $query->where('IsActive', 1);
                }),
            ],
            // 'categoryImage' => 'image|mimes:jpg,jpeg,png,gif',
        ]);

        $image = $request->file('categoryImage');
        if ($image) {

            $imageName = time() . '.' . $image->extension();
            $destinationPath = public_path('/thumbnail');
            $img = Image::make($image->path());
            $img->resize(100, 100, function ($constraint) {
                $constraint->aspectRatio();
            })->save($destinationPath . '/' . $imageName);

            $destinationPath = public_path('assets/images/category');
            $image->move($destinationPath, $imageName);
        } else {
            $imageName = null;
        }

        $data = array(
            "ParentID" => $request->parent_id,
            "title" => $category_name,
            "image" => $imageName,
            "type" => $request->type,
            "IsActive" => true,
        );

        $category = DB::table('item_category')->insert($data);
        return redirect('item-category-list')->with('error', 'Saved Successfully')->with('class', 'success');
    }

    public function updateItemCategory(Request $request)
    {
        $category_name = preg_replace('/\s+/', ' ', $request->editItemCategoryName);
        $this->validate($request, [
            'title' => [
                'max:255',
                Rule::unique('item_category')->ignore($request->itemCategoryId)->where(function ($query) {
                    return $query->where('IsActive', 1);
                }),
            ],
            'image' => 'image|mimes:jpg,jpeg,png,gif',
        ]);

        $input = $request->except('editCategoryImage');
        $image = $request->file('editCategoryImage');
        if ($image) {
            $imageName = time() . '.' . $image->extension();
            $destinationPath = public_path('/thumbnail');
            $img = Image::make($image->path());
            $img->resize(100, 100, function ($constraint) {
                $constraint->aspectRatio();
            })->save($destinationPath . '/' . $imageName);

            $destinationPath = public_path('assets/images/category');
            $image->move($destinationPath, $imageName);

            $data = array(
                "ParentID" => $request->edit_parent_id,
                "title" => $category_name,
                "image" => $imageName,
                "type" => $request->edit_type,
            );
        } else {
            $data = array(
                "ParentID" => $request->edit_parent_id,
                "title" => $category_name,
                "type" => $request->edit_type,
            );
        }





        $category = DB::table('item_category')->where('ItemCategoryID', $request->itemCategoryId)->update($data);
        return redirect('item-category-list')->with('error', 'Updated Successfully')->with('class', 'success');
    }

    public function deleteItemCategory($id)
    {
        $category = DB::table('item_category')->where('ItemCategoryID', $id)->delete();
        return redirect('item-category-list')->with('error', 'Deleted Successfully')->with('class', 'success');
    }
}