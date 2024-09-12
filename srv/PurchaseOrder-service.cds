using home.po.sap as po from '../db/data-model';
using { SEPMRA_GR_POST as external } from './external/SEPMRA_GR_POST';
using { ZPDCDS_SRV as external2 } from './external/ZPDCDS_SRV';

service PurchaseOrderService {
    entity PurchaseOrderT as select from po.PurchaseOrderT;
     entity PurchaseItemsT as select from po.PurchaseItemsT;
     entity SEPMRA_C_GR_PurchaseOrder as select from external.SEPMRA_C_GR_PurchaseOrder;
      entity SEPMRA_I_Product_E as select from external2.SEPMRA_I_Product_E;
     action onSubmit(ID : String,PurchaseOrder: String, SupplierName: String,Supplier:String,GrossAmountInTransacCurrency:String,DeliveryDate:String) returns String;
}

annotate PurchaseOrderService.PurchaseOrderT with @(UI : {

SelectionFields : [PurchaseOrder],


}) {

    PurchaseOrder           @(Common : {
      
        ValueList : {
            SearchSupported : true,
            Label           : 'PurchaseOrder',
            CollectionPath  : 'SEPMRA_C_GR_PurchaseOrder',
            Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : PurchaseOrder,
                ValueListProperty : 'PurchaseOrder'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Supplier'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'SupplierName'
            }
            ]
        }
    });
}