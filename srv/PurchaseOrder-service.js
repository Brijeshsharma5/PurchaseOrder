const cds = require('@sap/cds');
module.exports = cds.service.impl(async function() {
    this.on('onSubmit', async (req) => {
        const { ID } = req.data;
        let response = await runQuery(UPDATE`HOME_PO_SAP_PURCHASEORDERT`.set({ Status: 'Completed' }).where`ID=${ID}`);
   
        return `Purchase Order with ID ${ID} has been successfully processed`;
    });


    const runQuery = async function (query) {
        return await cds.run(query).then((res, rej) => {
            if (typeof (res) !== undefined && res !== 0) {

                return res;
            } else {
                return "Error getting the data from HANA ";
            }
        }).catch((err) => {
            return "Error getting the data from HANA"
        });

    }

});