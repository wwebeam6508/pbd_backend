<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Http\Controllers;

use App\Status;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

/**
 * Description of LbsBaseController
 *
 * @author wim
 */
class LbsBaseController extends Controller{
    //put your code here
    protected $model;

    public function __construct($model=null) {
        $this->model = $model;
    }   
    
    public function index(){
        $data = $this->model::where('status_id', Status::$ACTIVE)->get();
        return $this->responseRequestSuccess($data);
    }  
    
    public function addData(Request $request){
        $setArray = $request->request ;
        $this->model->setData($setArray);
        if($this->model->save()){
            return $this->responseRequestSuccess($this->model);
        }else{
            return $this->responseRequestError("Cannot create ".$this->model->getTable());
        }
    }

    public function updateData(Request $request, $id){
        $getData = $this->model::where('id',$id)->where('status_id', Status::$ACTIVE)->first();
        if(!empty($getData)){
            $setArray = $request->request ;
            $getData->setData($setArray);
            if($getData->save()){
                return $this->responseRequestSuccess($getData);
            }else{
                return $this->responseRequestError("Cannot update ".$this->model->getTable());
            }
        }else{
            return $this->responseRequestError("Cannot find ".$this->model->getTable());
        }
    } 
    
    public function getData($id){
        $data = $this->model::where('id', $id)->where('status_id', Status::$ACTIVE)->get();
        return $this->responseRequestSuccess($data);
    }

    public function deleteData($id){
        $data = $this->model::findOrFail($id);
        $data->status_id = Status::$DELETED;
        $data->save();
        return $this->responseRequestSuccess($data);
    }
    
    public function setDataBulkByUserId($dataList, $user_id){
        $this->model::where('user_id', $user_id)->delete();
        // Insert bulk
        $ret = $this->model::insert($dataList);
        return $ret ;      
    }    

    protected function responseRequestSuccess($ret){
        $new_token = (!empty(app('request')->new_token)) ? app('request')->new_token : null;

        return response()->json(['status' => 'success', 'data' => $ret, 'new_token' => $new_token], 200)
                         ->header('Access-Control-Allow-Origin', '*')
                         ->header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
    }

    protected function responseRequestError($message='Bad request', $statusCode=200){
        $new_token = (!empty(app('request')->new_token)) ? app('request')->new_token : null;

        return response()->json(['status' => 'error', 'error' => $message, 'new_token' => $new_token], $statusCode)
                         ->header('Access-Control-Allow-Origin', '*')
                         ->header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
    }
    
    protected function removeOldUploadImage($destination_path, $file_path){
        $old_image_arr = explode('/', $file_path);
        $old_image = end($old_image_arr);
        if ($old_image && file_exists($destination_path.$old_image)) {
            unlink($destination_path.$old_image);
        }        
    }
}
