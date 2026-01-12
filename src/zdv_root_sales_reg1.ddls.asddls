@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Register Root View 1'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZDV_ROOT_SALES_REG1
  as select distinct from ZDV_SALES_REG1
  //composition of target_data_source_name as _association_name
{

            //  _association_name // Make association public
  key       SalesDocument,
  key       SalesOrderItem,
  key       BillingDocument,
  key       BillingDocumentItem,
            @EndUserText.label: 'Discount Rate'
            @Semantics.amount.currencyCode: 'TransactionCurrency'
  key       discount_rate,
            BillingDocumentIsCancelled,
            @EndUserText.label: 'Cancelled Billing No.'
            CancelledBillingDocumnet,
            SDDocumentReason,
            @EndUserText.label: 'Order Reason Description'
            SDDocumentReasonText,
            CompanyCode,
            SalesOrganization,
            @EndUserText.label: 'ODN No'
            DocumentReferenceID,
            SoldToParty,
            CustomerName,
            //AccountGroupName,
            CreationDate,
            Plant,
            PurchaseOrderByCustomer,
            Product,
            ProductDescription,
            DistributionChannel,
            DistributionChannelName,
            @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
            OrderQuantity,
            @EndUserText.label: 'Order Qty Unit'
            OrderQuantityUnit,
            TransactionCurrency,
            @Semantics.amount.currencyCode: 'TransactionCurrency'
            @EndUserText.label: 'Net Price Amount'
            NetPriceAmount,
            @EndUserText.label: 'Delivery No.'
            ReferenceSDDocument,
            @EndUserText.label: 'Delivery Item'
            ReferenceSDDocumentItem,
            ActualGoodsMovementDate,
            BillingDocumentDate,
            BillingDocumentType,
            BillingDocumentTypeName,
            @EndUserText.label: 'Billing Qty Unit'
            BillingQuantityUnit,
            @Semantics.quantity.unitOfMeasure: 'BillingQuantityUnit'
            BillingQuantity,
            @EndUserText.label: 'Batch Quantity'
            @Semantics.quantity.unitOfMeasure: 'BillingQuantityUnit'
            ActualDeliveryQuantity,
            @EndUserText.label: 'Unit Price'
            unit_price,
            @EndUserText.label: 'Total Price'
            @Semantics.amount.currencyCode: 'TransactionCurrency'
            total_price,
            @EndUserText.label: 'VAT'
            @Semantics.amount.currencyCode: 'TransactionCurrency'
            vat_price,
            @Semantics.amount.currencyCode: 'TransactionCurrency'
            @EndUserText.label: 'TCS'
            tcs_price,
            @Semantics.amount.currencyCode: 'TransactionCurrency'
            @EndUserText.label: 'Freight'
            freight_price,
            @EndUserText.label: 'CGST'
            @Semantics.amount.currencyCode: 'TransactionCurrency'
            cgst_price,
            @EndUserText.label: 'SGST'
            @Semantics.amount.currencyCode: 'TransactionCurrency'
            sgst_price,
            @EndUserText.label: 'UTGST'
            @Semantics.amount.currencyCode: 'TransactionCurrency'
            ugst_price,
            @EndUserText.label: 'IGST'
            @Semantics.amount.currencyCode: 'TransactionCurrency'
            igst_price,
            @EndUserText.label: 'Round Off'
            @Semantics.amount.currencyCode: 'TransactionCurrency'
            round_off,
            @EndUserText.label: 'Discount'
            @Semantics.amount.currencyCode: 'TransactionCurrency'
            discount,
            @EndUserText.label: 'Total'
            @Semantics.amount.currencyCode: 'TransactionCurrency'
            total,
            @EndUserText.label: 'Party PAN'
            Party_PAN,
            @EndUserText.label: 'HSN/SAC'
            hsn,
            @EndUserText.label: 'Batch'
            Batch,
            @EndUserText.label: 'Division'
            Division,
            @EndUserText.label: 'City Name'
            CityName,
            @EndUserText.label: 'State'
            state,
            @EndUserText.label: 'Sales Person Name'
            salespersonname,
            @EndUserText.label: 'Freight Price'
            @Semantics.amount.currencyCode: 'TransactionCurrency'
            freightprice,
            @EndUserText.label: 'Transporter Name'
            transportername,
            @EndUserText.label: 'Dealer Name'
            dealername,
            @EndUserText.label: 'Dealer Price'
            @Semantics.amount.currencyCode: 'TransactionCurrency'
            dealerprice,
            @EndUserText.label: 'Supervisor Name'
            supervisorname,
            @EndUserText.label: 'Supervisor Price'
            @Semantics.amount.currencyCode: 'TransactionCurrency'
            supervisorprice,
            @EndUserText.label: 'Base Product'
            pricingreferencematerial,
            ItemWeightUnit,
            @Semantics.quantity.unitOfMeasure: 'ItemWeightUnit'
            @EndUserText.label: 'Weight Item Wise'
            itemgrossweight,
            @Semantics.quantity.unitOfMeasure: 'ItemWeightUnit'
            @EndUserText.label: 'Weight Item Batch Wise'
            itemgrossbatchweight,
            @EndUserText.label: 'Sales Group'
            salesgroup,
            @EndUserText.label: 'Sales Office'
            salesoffice,
            @EndUserText.label: 'Vehicle Number'
            vehicleno,
            @EndUserText.label: 'Accounting Document'
            AccountingDocument,
            @EndUserText.label: 'Business Area'
            businessplace

}
