package com.jeecg.constant;

import java.util.HashMap;
import java.util.Map;

public class ERSalTranslateMap {
    public static Map TRANSLATE_HEAD;
    public static String[] TRANSLATE_HEAD_PROPERTY;
    public static String[] TRANSLATE_HEAD_PARAM;
    public static Class[] TRANSLATE_HEAD_TYPE;
    public static Map TRANSLATE_DETAIL;
    public static String[] TRANSLATE_DETAIL_PROPERTY;
    public static String[] TRANSLATE_DETAIL_PARAM;
    public static Class[] TRANSLATE_DETAIL_TYPE;

    static {
        TRANSLATE_HEAD = new HashMap(){{
            put("receiptCode","FBillNo");//销售出库单号
            put("sendNoticeNumber","FBillNo ");//根据运输单号，查发货通知单-》发货通知单号
            put("receiptDate","FDate");//日期
            put("currency","FSettleCurrID");//结算币别
            put("customerCode","FCustomerID");//客户
            put("deliveryPoints","FHeadLocationId");//交货地点
            put("commonCarrierCode","FCarrierID");//承运商
            put("waybillNumber","FCarriageNO");//运输单号
            put("repositoryManager","FStockerID");//仓管员
            put("receiptState","FDocumentStatus");//单据状态
            put("salesmanCode","FSalesManID");//销售员
            put("readPersonCode","");//读取人
            put("acquireTime","");//获取时间
        }};

        TRANSLATE_HEAD_PROPERTY = new String[]{"receiptCode","sendNoticeNumber","receiptDate","currency","customerCode",
                "deliveryPoints","commonCarrierCode","waybillNumber","repositoryManager","receiptState","salesmanCode","readPersonCode","acquireTime"};
        TRANSLATE_DETAIL = new HashMap(){{
           put("finishedCode",""); //成品代码
           put("finishedName","F_BGL_BaseProperty3"); //成品名称
           put("finishedSize","FMateriaModel"); //规格型号
           put("supplierAttr",""); //供应商属性
           put("wideInWidth","F_BGL_BaseProperty2"); //宽幅
           put("inventoryUnit","FUnitID"); //库存单位
           put("shouldSendNumber","FMustQty"); //应发数量
           put("actualSendNumber","FRealQty"); //实发数量
           put("valuationUnit","FPriceUnitId"); //计价单位
           put("valuationNumber","FPriceUnitQty"); //计价数量
           put("unitPrice","FPrice"); //单价
           put("unitPriceWithTax","FTaxPrice"); //含税单价
           put("isFree","FIsFree"); //是否赠品
           put("batchNumber","FLot"); //批号
           put("repositoryCode","FStockID"); //仓库
           put("productionOrderNumber",""); //生产订单号
           put("repositoryStatus","FStockStatusID"); //库存状态
           put("remark",""); //备注
        }};
    }
}
