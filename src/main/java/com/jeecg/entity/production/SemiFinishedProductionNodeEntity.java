package com.jeecg.entity.production;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 半成品生产物料详情
 * @author zhangdaihao
 * @date 2019-10-11 05:26:30
 * @version V1.0   
 *
 */
@Entity
@Table(name = "t_semi_finished_production_node_list", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class SemiFinishedProductionNodeEntity implements java.io.Serializable {
	/**id*/
	private java.lang.String id;
	/**创建人*/
	private java.lang.String createBy;
	/**创建日期*/
	private java.util.Date createDate;
	/**原料编号*/
	private java.lang.String rawMaterialNumber;
	/**原料代码*/
	private java.lang.String rawMaterialCode;
	/**原料名称*/
	private java.lang.String rawMaterialName;
	/**原料批次*/
	private java.lang.String rawMaterialBatchNumber;
	/**规格型号*/
	private java.lang.String rawMaterialSize;
	/**数量*/
	private java.lang.String rawMaterialAmount;
	/**单位*/
	private java.lang.String unit;
	/**半成品编号主键*/
	private java.lang.String semiFinishedSerino;
	/**预留1*/
	private java.lang.String attr1;
	/**预留2*/
	private java.lang.String attr2;
	/**预留3*/
	private java.lang.String attr3;
	/**预留4*/
	private java.lang.String attr4;
	/**预留5*/
	private java.lang.String attr5;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  id
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=36)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  id
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  创建人
	 */
	@Column(name ="CREATE_BY",nullable=true,length=50)
	public java.lang.String getCreateBy(){
		return this.createBy;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  创建人
	 */
	public void setCreateBy(java.lang.String createBy){
		this.createBy = createBy;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  创建日期
	 */
	@Column(name ="CREATE_DATE",nullable=true)
	public java.util.Date getCreateDate(){
		return this.createDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  创建日期
	 */
	public void setCreateDate(java.util.Date createDate){
		this.createDate = createDate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  原料编号
	 */
	@Column(name ="RAW_MATERIAL_NUMBER",nullable=true,length=120)
	public java.lang.String getRawMaterialNumber(){
		return this.rawMaterialNumber;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  原料编号
	 */
	public void setRawMaterialNumber(java.lang.String rawMaterialNumber){
		this.rawMaterialNumber = rawMaterialNumber;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  原料代码
	 */
	@Column(name ="RAW_MATERIAL_CODE",nullable=true,length=120)
	public java.lang.String getRawMaterialCode(){
		return this.rawMaterialCode;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  原料代码
	 */
	public void setRawMaterialCode(java.lang.String rawMaterialCode){
		this.rawMaterialCode = rawMaterialCode;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  原料名称
	 */
	@Column(name ="RAW_MATERIAL_NAME",nullable=true,length=120)
	public java.lang.String getRawMaterialName(){
		return this.rawMaterialName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  原料名称
	 */
	public void setRawMaterialName(java.lang.String rawMaterialName){
		this.rawMaterialName = rawMaterialName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  原料批次
	 */
	@Column(name ="RAW_MATERIAL_BATCH_NUMBER",nullable=true,length=120)
	public java.lang.String getRawMaterialBatchNumber(){
		return this.rawMaterialBatchNumber;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  原料批次
	 */
	public void setRawMaterialBatchNumber(java.lang.String rawMaterialBatchNumber){
		this.rawMaterialBatchNumber = rawMaterialBatchNumber;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  规格型号
	 */
	@Column(name ="RAW_MATERIAL_SIZE",nullable=true,length=120)
	public java.lang.String getRawMaterialSize(){
		return this.rawMaterialSize;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  规格型号
	 */
	public void setRawMaterialSize(java.lang.String rawMaterialSize){
		this.rawMaterialSize = rawMaterialSize;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  数量
	 */
	@Column(name ="RAW_MATERIAL_AMOUNT",nullable=true,length=120)
	public java.lang.String getRawMaterialAmount(){
		return this.rawMaterialAmount;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  数量
	 */
	public void setRawMaterialAmount(java.lang.String rawMaterialAmount){
		this.rawMaterialAmount = rawMaterialAmount;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  单位
	 */
	@Column(name ="UNIT",nullable=true,length=120)
	public java.lang.String getUnit(){
		return this.unit;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  单位
	 */
	public void setUnit(java.lang.String unit){
		this.unit = unit;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  半成品编号主键
	 */
	@Column(name ="SEMI_FINISHED_SERINO",nullable=true,length=120)
	public java.lang.String getSemiFinishedSerino(){
		return this.semiFinishedSerino;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  半成品编号主键
	 */
	public void setSemiFinishedSerino(java.lang.String semiFinishedSerino){
		this.semiFinishedSerino = semiFinishedSerino;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  预留1
	 */
	@Column(name ="ATTR1",nullable=true,length=120)
	public java.lang.String getAttr1(){
		return this.attr1;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  预留1
	 */
	public void setAttr1(java.lang.String attr1){
		this.attr1 = attr1;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  预留2
	 */
	@Column(name ="ATTR2",nullable=true,length=120)
	public java.lang.String getAttr2(){
		return this.attr2;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  预留2
	 */
	public void setAttr2(java.lang.String attr2){
		this.attr2 = attr2;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  预留3
	 */
	@Column(name ="ATTR3",nullable=true,length=120)
	public java.lang.String getAttr3(){
		return this.attr3;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  预留3
	 */
	public void setAttr3(java.lang.String attr3){
		this.attr3 = attr3;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  预留4
	 */
	@Column(name ="ATTR4",nullable=true,length=120)
	public java.lang.String getAttr4(){
		return this.attr4;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  预留4
	 */
	public void setAttr4(java.lang.String attr4){
		this.attr4 = attr4;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  预留5
	 */
	@Column(name ="ATTR5",nullable=true,length=120)
	public java.lang.String getAttr5(){
		return this.attr5;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  预留5
	 */
	public void setAttr5(java.lang.String attr5){
		this.attr5 = attr5;
	}
}
