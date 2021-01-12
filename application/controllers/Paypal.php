<?php defined('BASEPATH') OR exit('No direct script access allowed'); 
 
class Paypal extends EA_Controller{ 
     
     function  __construct(){ 
        parent::__construct(); 
         
        // Load paypal library 
        $this->load->library('paypal_lib');  
         
        // Load payment model 
        $this->load->model('payment'); 
     } 
      
    function success(){ 
        // Get the transaction data 
        $paypalInfo = $this->input->get(); 
         
        $productData = $paymentData = array(); 
        if(!empty($paypalInfo['item_number']) && !empty($paypalInfo['tx']) && !empty($paypalInfo['amt']) && !empty($paypalInfo['cc']) && !empty($paypalInfo['st'])){ 
            $item_name = $paypalInfo['item_name']; 
            $item_number = $paypalInfo['item_number']; 
            $txn_id = $paypalInfo["tx"]; 
            $payment_amt = $paypalInfo["amt"]; 
            $currency_code = $paypalInfo["cc"]; 
            $status = $paypalInfo["st"];  
             
            // Check if transaction data exists with the same TXN ID 
            $paymentData = $this->payment->getPayment(array('transaction_id' => $txn_id)); 
        } 
         
        // Pass the transaction data to view 
        $data['product'] = $productData; 
        $data['payment'] = $paymentData; 
        $this->load->view('paypal/success', $data); 
    } 
      
     function cancel(){ 
        // Load payment failed view 
        $this->load->view('paypal/cancel'); 
     } 
      
     function ipn(){ 
        // Retrieve transaction data from PayPal IPN POST 
        $paypalInfo = $this->input->post(); 
         
        if(!empty($paypalInfo)){ 
            // Validate and get the ipn response 
            $ipnCheck = $this->paypal_lib->validate_ipn($paypalInfo); 
 
            // Check whether the transaction is valid 
            if($ipnCheck){ 
                // Check whether the transaction data is exists 
                $prevPayment = $this->payment->getPayment(array('transaction_id' => $paypalInfo["txn_id"])); 
                if(!$prevPayment){ 
                    // Insert the transaction data in the database 
                    $data['provider_id']    = $paypalInfo["provider_id"]; 
                    $data['service_id']    = $paypalInfo["service_id"]; 
                    $data['time_slot']    = $paypalInfo["time_slot"]; 
                    $data['currency_code']    = $paypalInfo["currency_code"]; 
                    $data['payment_status']    = $paypalInfo["payment_status"]; 
                    $data['total_amount']    = $paypalInfo["total_amount"];
                    $data['customer_id	']    = $paypalInfo["customer_id"]; 
                    $data['transaction_id'] = $paypalInfo["transaction_id"]; 
     
                    $this->payment->insertTransaction($data); 
                } 
            } 
        } 
    } 
}