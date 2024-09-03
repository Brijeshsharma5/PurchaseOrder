using home.po.sap as po from '../db/data-model';

service PurchaseOrderService {
    entity PurchaseOrderT as select from po.PurchaseOrderT;
     entity PurchaseItemsT as select from po.PurchaseItemsT;
}