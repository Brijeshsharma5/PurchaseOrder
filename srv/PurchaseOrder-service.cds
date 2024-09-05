using home.po.sap as po from '../db/data-model';
using { SEPMRA_GR_POST as external } from './external/SEPMRA_GR_POST';

service PurchaseOrderService {
    entity PurchaseOrderT as select from po.PurchaseOrderT;
     entity PurchaseItemsT as select from po.PurchaseItemsT;
     entity SEPMRA_C_GR_PurchaseOrder as select from external.SEPMRA_C_GR_PurchaseOrder;
     action onSubmit(ID : String) returns String;
}