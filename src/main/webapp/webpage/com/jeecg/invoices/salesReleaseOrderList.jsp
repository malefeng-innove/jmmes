<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/context/mytags.jsp" %>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
    <div region="center" style="padding:0px;border:0px">


        <script type="text/javascript">$(function () {
            storage = $.localStorage;
            if (!storage) storage = $.cookieStorage;
            $('#salesReleaseOrderList').datagrid({
                idField: 'id',
                title: '销售出库单',
                url: 'salesReleaseOrderController.do?datagrid&field=id,sysOrgCode,sysCompanyCode,bpmStatus,receiptCode,sendNoticeNumber,receiptDate,currency,customerCode,deliveryPoints,commonCarrierCode,waybillNumber,repositoryManager,receiptState,salesmanCode,readPersonCode,acquireTime,attr1,attr2,attr3,attr4,attr5,',
                fit: true,
                rownumbers: true,
                loadMsg: '数据加载中...',
                pageSize: 10,
                pagination: true,
                pageList: [10, 20, 30],
                sortOrder: 'desc',
                rownumbers: true,
                singleSelect: true,
                fitColumns: true,
                striped: true,
                showFooter: true,
                frozenColumns: [[]],
                columns: [[{field: 'id', title: '编号', hidden: true, sortable: true},
                    {field: 'receiptCode', title: '销售出库单号', sortable: true}, {
                    field: 'sendNoticeNumber',
                    title: '发货通知单号',
                    sortable: true
                }, {
                    field: 'receiptDate', title: '日期', sortable: true, formatter: function (value, rec, index) {
                        return new Date().format('yyyy-MM-dd hh:mm:ss', value);
                    }
                }, {field: 'currency', title: '结算币别', sortable: true,
                        formatter: function (value){
                            return ${currencyDic}[value];
                        }}, {
                    field: 'customerCode',
                    title: '客户',
                    sortable: true,
                        formatter: function (value){
                            return ${custDic}[value];
                        }
                }, {field: 'deliveryPoints', title: '交货地点', sortable: true}, {
                    field: 'commonCarrierCode',
                    title: '承运商',
                    sortable: true,
                        formatter: function (value){
                            return ${carrierDic}[value];
                        }
                }, {field: 'waybillNumber', title: '运输单号', sortable: true}, {
                    field: 'repositoryManager',
                    title: '仓管员',
                    sortable: true,
                        formatter: function (value){
                            return ${userDic}[value];
                        }
                }, {field: 'receiptState', title: '单据状态', sortable: true,
                        formatter: function (value){
                            return ${orderStateDic}[value];
                        }}, {
                    field: 'salesmanCode',
                    title: '销售员',
                    sortable: true,
                        formatter: function (value){
                            return ${userDic}[value];
                        }
                }, {field: 'readPersonCode', title: '读取人', sortable: true,
                        formatter: function (value){
                            return ${userDic}[value];
                        }}, {
                    field: 'acquireTime',
                    title: '获取时间',
                    sortable: true,
                    formatter: function (value, rec, index) {
                        return new Date().format('yyyy-MM-dd hh:mm:ss', value);
                    }
                }, {
                    field: 'opt',
                    title: '操作',
                    width: 100,
                    formatter: function (value, rec, index) {
                        if (!rec.id) {
                            return '';
                        }
                        var href = '';
                        href += "<a href='#'   class='ace_button'  onclick=delObj('salesReleaseOrderController.do?del&id=" + rec.id + "','salesReleaseOrderList')>  <i class=' fa fa-trash-o'></i> ";
                        href += "删除</a>&nbsp;";
                        return href;
                    }
                }]],
                onLoadSuccess: function (data) {
                    $("#salesReleaseOrderList").datagrid("clearChecked");
                    $("#salesReleaseOrderList").datagrid("clearSelections");
                    if (!false) {
                        if (data.total && data.rows.length == 0) {
                            var grid = $('#salesReleaseOrderList');
                            var curr = grid.datagrid('getPager').data("pagination").options.pageNumber;
                            grid.datagrid({pageNumber: (curr - 1)});
                        }
                    }
                    try {
                        loadAjaxDict(data);
                    } catch (e) {
                    }
                },
                onClickRow: function (rowIndex, rowData) {
                    rowid = rowData.id;
                    gridname = 'salesReleaseOrderList';
                }
            });
            $('#salesReleaseOrderList').datagrid('getPager').pagination({
                beforePageText: '',
                afterPageText: '/{pages}',
                displayMsg: '{from}-{to}共 {total}条',
                showPageList: true,
                showRefresh: true
            });
            $('#salesReleaseOrderList').datagrid('getPager').pagination({
                onBeforeRefresh: function (pageNumber, pageSize) {
                    $(this).pagination('loading');
                    $(this).pagination('loaded');
                }
            });
            try {
                restoreheader();
            } catch (ex) {
            }
        });

        function reloadTable() {
            try {
                $('#' + gridname).datagrid('reload');
                $('#' + gridname).treegrid('reload');
            } catch (ex) {
            }
        }

        function reloadsalesReleaseOrderList() {
            $('#salesReleaseOrderList').datagrid('reload');
        }

        function getsalesReleaseOrderListSelected(field) {
            return getSelected(field);
        }

        function getSelected(field) {
            var row = $('#' + gridname).datagrid('getSelected');
            if (row != null) {
                value = row[field];
            } else {
                value = '';
            }
            return value;
        }

        function getsalesReleaseOrderListSelections(field) {
            var ids = [];
            var rows = $('#salesReleaseOrderList').datagrid('getSelections');
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i][field]);
            }
            ids.join(',');
            return ids
        };

        function getSelectRows() {
            return $('#salesReleaseOrderList').datagrid('getChecked');
        }

        function saveHeader() {
            var columnsFields = null;
            var easyextends = false;
            try {
                columnsFields = $('#salesReleaseOrderList').datagrid('getColumns');
                easyextends = true;
            } catch (e) {
                columnsFields = $('#salesReleaseOrderList').datagrid('getColumnFields');
            }
            var cols = storage.get('salesReleaseOrderListhiddenColumns');
            var init = true;
            if (cols) {
                init = false;
            }
            var hiddencolumns = [];
            for (var i = 0; i < columnsFields.length; i++) {
                if (easyextends) {
                    hiddencolumns.push({field: columnsFields[i].field, hidden: columnsFields[i].hidden});
                } else {
                    var columsDetail = $('#salesReleaseOrderList').datagrid("getColumnOption", columnsFields[i]);
                    if (init) {
                        hiddencolumns.push({
                            field: columsDetail.field,
                            hidden: columsDetail.hidden,
                            visible: (columsDetail.hidden == true ? false : true)
                        });
                    } else {
                        for (var j = 0; j < cols.length; j++) {
                            if (cols[j].field == columsDetail.field) {
                                hiddencolumns.push({
                                    field: columsDetail.field,
                                    hidden: columsDetail.hidden,
                                    visible: cols[j].visible
                                });
                            }
                        }
                    }
                }
            }
            storage.set('salesReleaseOrderListhiddenColumns', JSON.stringify(hiddencolumns));
        }

        function isShowBut() {
            var isShowSearchId = $('#isShowSearchId').val();
            if (isShowSearchId == "true") {
                $("#searchColums").hide();
                $('#isShowSearchId').val("false");
                $('#columsShow').remove("src");
                $('#columsShow').attr("src", "plug-in/easyui/themes/default/images/accordion_expand.png");
            } else {
                $("#searchColums").show();
                $('#isShowSearchId').val("true");
                $('#columsShow').remove("src");
                $('#columsShow').attr("src", "plug-in/easyui/themes/default/images/accordion_collapse.png");
            }
        }

        function restoreheader() {
            var cols = storage.get('salesReleaseOrderListhiddenColumns');
            if (!cols) return;
            for (var i = 0; i < cols.length; i++) {
                try {
                    if (cols.visible != false) $('#salesReleaseOrderList').datagrid((cols[i].hidden == true ? 'hideColumn' : 'showColumn'), cols[i].field);
                } catch (e) {
                }
            }
        }

        function resetheader() {
            var cols = storage.get('salesReleaseOrderListhiddenColumns');
            if (!cols) return;
            for (var i = 0; i < cols.length; i++) {
                try {
                    $('#salesReleaseOrderList').datagrid((cols.visible == false ? 'hideColumn' : 'showColumn'), cols[i].field);
                } catch (e) {
                }
            }
        }

        function salesReleaseOrderListsearch() {
            try {
                if (!$("#salesReleaseOrderListForm").Validform({tiptype: 3}).check()) {
                    return false;
                }
            } catch (e) {
            }
            if (true) {
                var queryParams = $('#salesReleaseOrderList').datagrid('options').queryParams;
                $('#salesReleaseOrderListtb').find('*').each(function () {
                    queryParams[$(this).attr('name')] = $(this).val();
                });
                $('#salesReleaseOrderList').datagrid({
                    url: 'salesReleaseOrderController.do?datagrid&field=id,sysOrgCode,sysCompanyCode,bpmStatus,receiptCode,sendNoticeNumber,receiptDate,currency,customerCode,deliveryPoints,commonCarrierCode,waybillNumber,repositoryManager,receiptState,salesmanCode,readPersonCode,acquireTime,attr1,attr2,attr3,attr4,attr5,',
                    pageNumber: 1
                });
            }
        }

        function dosearch(params) {
            var jsonparams = $.parseJSON(params);
            $('#salesReleaseOrderList').datagrid({
                url: 'salesReleaseOrderController.do?datagrid&field=id,sysOrgCode,sysCompanyCode,bpmStatus,receiptCode,sendNoticeNumber,receiptDate,currency,customerCode,deliveryPoints,commonCarrierCode,waybillNumber,repositoryManager,receiptState,salesmanCode,readPersonCode,acquireTime,attr1,attr2,attr3,attr4,attr5,',
                queryParams: jsonparams
            });
        }

        function salesReleaseOrderListsearchbox(value, name) {
            var queryParams = $('#salesReleaseOrderList').datagrid('options').queryParams;
            queryParams[name] = value;
            queryParams.searchfield = name;
            $('#salesReleaseOrderList').datagrid('reload');
        }

        $('#salesReleaseOrderListsearchbox').searchbox({
            searcher: function (value, name) {
                salesReleaseOrderListsearchbox(value, name);
            }, menu: '#salesReleaseOrderListmm', prompt: '请输入查询关键字'
        });

        function EnterPress(e) {
            var e = e || window.event;
            if (e.keyCode == 13) {
                salesReleaseOrderListsearch();
            }
        }

        function searchReset(name) {
            $("#" + name + "tb").find(":input").val("");
            var queryParams = $('#salesReleaseOrderList').datagrid('options').queryParams;
            $('#salesReleaseOrderListtb').find('*').each(function () {
                queryParams[$(this).attr('name')] = $(this).val();
            });
            $('#salesReleaseOrderListtb').find("input[type='checkbox']").each(function () {
                $(this).attr('checked', false);
            });
            $('#salesReleaseOrderListtb').find("input[type='radio']").each(function () {
                $(this).attr('checked', false);
            });
            $('#salesReleaseOrderList').datagrid({
                url: 'salesReleaseOrderController.do?datagrid&field=id,sysOrgCode,sysCompanyCode,bpmStatus,receiptCode,sendNoticeNumber,receiptDate,currency,customerCode,deliveryPoints,commonCarrierCode,waybillNumber,repositoryManager,receiptState,salesmanCode,readPersonCode,acquireTime,attr1,attr2,attr3,attr4,attr5,',
                pageNumber: 1
            });
        }</script>
        <table width="100%" id="salesReleaseOrderList" toolbar="#salesReleaseOrderListtb"></table>
        <div id="salesReleaseOrderListtb" style="padding:3px; height: auto">
            <input id="_complexSqlbuilder" name="complexSqlbuilder" type="hidden"/>
            <div name="searchColums">
                <span>销售出库单号:<input type="text" name="receiptCode"></span>
                <span>出库日期:
                    <input type="text" name="receiptDate_begin"  style="width: 120px"  class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                    <span style="display:-moz-inline-box;display:inline-block;width: 8px;text-align:right;">~</span>
                    <input type="text" name="receiptDate_end"  style="width: 120px" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                </span>
                <span>客户:<t:dictSelect field="customerCode" dictTable="t_customer_list" dictField="customer_code" dictText="customer_name" defaultVal="${salesReleaseOrderPage.customerCode}" readonly="true"></t:dictSelect></span>
                <a href="#" class="easyui-linkbutton" style="float: right" onclick="salesReleaseOrderListsearch();" plain="true" icon="icon-search">查询</a>
            </div>
            <div style="border-bottom-width:0;" class="datagrid-toolbar">
                <span style="float:left;">
                    <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="add('录入','salesReleaseOrderController.do?addorupdate','salesReleaseOrderList','100%','100%')">录入</a>
                    <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="update('编辑','salesReleaseOrderController.do?addorupdate','salesReleaseOrderList','100%','100%')">编辑</a>
                    <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="detail('查看','salesReleaseOrderController.do?addorupdate','salesReleaseOrderList','100%','100%')">查看</a>
                </span>
                <div style="clear:both"></div>
            </div>
        </div>
    </div>
</div>