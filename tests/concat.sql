

-- -------------------------------------
--         ./tests/sql_upgrade\sql_comment.comm.sql
-- -------------------------------------

CREATE OR REPLACE FUNCTION "test"."Untitled"()
  RETURNS "pg_catalog"."void" AS $BODY$
	DECLARE sum_ratio numeric(36,18) = 0;
	DECLARE hitrec int = 0;
BEGIN
    
	
	SET DefaultFTCoin.MARKETID = 1;  

	SET DefaultFTCoin.CEHECK_PC_TIME = False;  


	
	SET EnumSideType.PST_IN = 0;  

	
	SET EnumIsSent.IS_TRADE_UNSENT = 0;  
	SET EnumIsSent.IS_TRADE_SENT = 1;  

	
  SET EnumIsEnableType.IST_DISABLE = 0;  
  SET EnumIsEnableType.IST_ENABLE = 1; 

	
	SET EnumIsSucess.IS_TRADE_UNKONW = 0; 
	SET EnumIsSucess.IS_TRADE_ERROR = 1; 
	SET EnumIsSucess.IS_TRADE_SUCESS = 2; 

	
	SET DefaultConfig.FLOAT_ALLOW_POINT_MAX = '0.00000000000001'; 
	SET DefaultConfig.FLOAT_ALLOW_POINT_MIN = '-0.00000000000001'; 

	
	
	
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

ALTER FUNCTION "test"."Untitled"() OWNER TO "postgres";


-- -------------------------------------
--         ./tests/sql_upgrade\sql_comment.sql
-- -------------------------------------

CREATE OR REPLACE FUNCTION "test"."Untitled"()
  RETURNS "pg_catalog"."void" AS $BODY$
	DECLARE sum_ratio numeric(36,18) = 0;
	DECLARE hitrec int = 0;
BEGIN
    /* asdasdasd
    aasdasdasdasd
    */
	-- 默认交易所托管账号
	SET DefaultFTCoin.MARKETID = 1;  -- 默认市场id

	SET DefaultFTCoin.CEHECK_PC_TIME = False;  -- 是否检查机器时间


	-- 支付方向
	SET EnumSideType.PST_IN = 0;  -- 收入

	-- 日志已发送
	SET EnumIsSent.IS_TRADE_UNSENT = 0;  -- 未发送
	SET EnumIsSent.IS_TRADE_SENT = 1;  -- 已发送

	-- 是否有效
  SET EnumIsEnableType.IST_DISABLE = 0;  -- 未生效
  SET EnumIsEnableType.IST_ENABLE = 1; -- 已生效

	-- 是否成功
	SET EnumIsSucess.IS_TRADE_UNKONW = 0; -- 未知
	SET EnumIsSucess.IS_TRADE_ERROR = 1; -- 执行出错
	SET EnumIsSucess.IS_TRADE_SUCESS = 2; -- 成功

	-- 精度配置
	SET DefaultConfig.FLOAT_ALLOW_POINT_MAX = '0.00000000000001'; -- 已生效
	SET DefaultConfig.FLOAT_ALLOW_POINT_MIN = '-0.00000000000001'; -- 已生效

	-- --------------------------------------------
	-- 结束
	-- --------------------------------------------
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

ALTER FUNCTION "test"."Untitled"() OWNER TO "postgres";


-- -------------------------------------
--         ./tests/sql_upgrade\sql_upgrade_src.add.sql
-- -------------------------------------

ALTER TABLE "history_trade"."debit_creditlog" ADD COLUMN "dctype" int2 NOT NULL DEFAULT '0';
ALTER TABLE "history_trade"."debit_creditlog" ADD COLUMN "jsonnote" jsonb NOT NULL DEFAULT '{}';
ALTER TABLE "history_trade"."um_changelog" ADD COLUMN "jsonnote" jsonb NOT NULL DEFAULT '{}';
ALTER TABLE "history_trade"."user_pair_statis" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL DEFAULT '0';
ALTER TABLE "history_trade"."user_pair_statis" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL DEFAULT '0';


-- -------------------------------------
--         ./tests/sql_upgrade\sql_upgrade_src.drop.sql
-- -------------------------------------

ALTER TABLE "history_trade"."debit_creditlog" ALTER COLUMN "dctype"  DROP DEFAULT;
ALTER TABLE "history_trade"."debit_creditlog" ALTER COLUMN "jsonnote"  DROP DEFAULT;
ALTER TABLE "history_trade"."um_changelog" ALTER COLUMN "jsonnote"  DROP DEFAULT;
ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "dayorderbuyqty"  DROP DEFAULT;
ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "dayordersellqty"  DROP DEFAULT;


-- -------------------------------------
--         ./tests/sql_upgrade\sql_upgrade_src.mod.sql
-- -------------------------------------

ALTER TABLE "history_trade"."broker_profit" ALTER COLUMN "profit" TYPE numeric(38,12);
ALTER TABLE "history_trade"."broker_profitlog" ALTER COLUMN "fee" TYPE numeric(38,12);
ALTER TABLE "history_trade"."coin_info" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."coin_info" ALTER COLUMN "minwdamount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."coin_info" ALTER COLUMN "netfee1" TYPE numeric(38,12);
ALTER TABLE "history_trade"."coin_info" ALTER COLUMN "netfee2" TYPE numeric(38,12);
ALTER TABLE "history_trade"."coin_info" ALTER COLUMN "netfee3" TYPE numeric(38,12);
ALTER TABLE "history_trade"."coin_info" ALTER COLUMN "netfee4" TYPE numeric(38,12);
ALTER TABLE "history_trade"."coin_info" ALTER COLUMN "netfee5" TYPE numeric(38,12);
ALTER TABLE "history_trade"."coin_pair" ALTER COLUMN "issprice" TYPE numeric(38,12);
ALTER TABLE "history_trade"."ctoc_deallog" ALTER COLUMN "dealquantity" TYPE numeric(38,12);
ALTER TABLE "history_trade"."ctoc_order" ALTER COLUMN "quantity" TYPE numeric(38,12);
ALTER TABLE "history_trade"."ctoc_order" ALTER COLUMN "completequantity" TYPE numeric(38,12);
ALTER TABLE "history_trade"."debit_creditlog" ALTER COLUMN "umchange" TYPE numeric(38,12);
ALTER TABLE "history_trade"."pair_property" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);
ALTER TABLE "history_trade"."pair_property" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);
ALTER TABLE "history_trade"."pair_property" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_depth_buy" ALTER COLUMN "price" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_depth_buy" ALTER COLUMN "quantity" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_depth_sell" ALTER COLUMN "price" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_depth_sell" ALTER COLUMN "quantity" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_last" ALTER COLUMN "last" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_last" ALTER COLUMN "vol" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_last" ALTER COLUMN "amount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "dvol" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "damount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "dhigh" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "dopen" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "dlow" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "high" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "open" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "low" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "last" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "vol" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "amount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_trade" ALTER COLUMN "last" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_trade" ALTER COLUMN "vol" TYPE numeric(38,12);
ALTER TABLE "history_trade"."quote_trade" ALTER COLUMN "amount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "balance" TYPE numeric(38,12);
ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "totalfee" TYPE numeric(38,12);
ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "dayfee" TYPE numeric(38,12);
ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "totalrefill" TYPE numeric(38,12);
ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "dayrefill" TYPE numeric(38,12);
ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);
ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);
ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);
ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);
ALTER TABLE "history_trade"."sys_exchmoneylog" ALTER COLUMN "umchange" TYPE numeric(38,12);
ALTER TABLE "history_trade"."sys_exchmoneylog" ALTER COLUMN "umbefore" TYPE numeric(38,12);
ALTER TABLE "history_trade"."sys_exchmoneylog" ALTER COLUMN "umafter" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_deallog" ALTER COLUMN "orderprice" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_deallog" ALTER COLUMN "orderquantity" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_deallog" ALTER COLUMN "dealprice" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_deallog" ALTER COLUMN "dealquantity" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_deallog" ALTER COLUMN "dealamount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_deallog" ALTER COLUMN "fee" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_order" ALTER COLUMN "orderprice" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_order" ALTER COLUMN "orderquantity" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_order" ALTER COLUMN "completequantity" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_order" ALTER COLUMN "completeamount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_order" ALTER COLUMN "fee" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_order" ALTER COLUMN "usedamount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_orderlog" ALTER COLUMN "orderprice" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_orderlog" ALTER COLUMN "orderquantity" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_orderlog" ALTER COLUMN "completequantity" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_orderlog" ALTER COLUMN "completeamount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_orderlog" ALTER COLUMN "fee" TYPE numeric(38,12);
ALTER TABLE "history_trade"."trade_orderlog" ALTER COLUMN "usedamount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."um_changelog" ALTER COLUMN "umchange" TYPE numeric(38,12);
ALTER TABLE "history_trade"."um_changelog" ALTER COLUMN "umbefore" TYPE numeric(38,12);
ALTER TABLE "history_trade"."um_changelog" ALTER COLUMN "umafter" TYPE numeric(38,12);
ALTER TABLE "history_trade"."um_iorec" ALTER COLUMN "amount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."um_iorec" ALTER COLUMN "actualamount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."um_iorec" ALTER COLUMN "tradefee" TYPE numeric(38,12);
ALTER TABLE "history_trade"."um_iorec" ALTER COLUMN "netfee" TYPE numeric(38,12);
ALTER TABLE "history_trade"."user_coin_statis" ALTER COLUMN "daywdamount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."user_coin_statis" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."user_coin_statis" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."user_coin_statis" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."user_money" ALTER COLUMN "balance" TYPE numeric(38,12);
ALTER TABLE "history_trade"."user_money" ALTER COLUMN "frozen" TYPE numeric(38,12);
ALTER TABLE "history_trade"."user_money" ALTER COLUMN "available" TYPE numeric(38,12);
ALTER TABLE "history_trade"."user_money" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);
ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);
ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);
ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "daysellqty" TYPE numeric(38,12);
ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "daysellamount" TYPE numeric(38,12);
ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);
ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);


-- -------------------------------------
--         ./tests/sql_upgrade\sql_upgrade_src.sql
-- -------------------------------------

ALTER TABLE "history_trade"."broker_profit" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201801" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201802" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201803" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201804" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201805" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201806" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201807" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201808" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201809" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201810" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201811" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201812" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201901" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201902" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201903" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201904" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201905" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201906" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201907" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201908" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201909" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201910" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201911" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profit_201912" ALTER COLUMN "profit" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201801" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201802" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201803" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201804" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201805" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201806" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201807" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201808" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201809" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201810" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201811" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201812" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201901" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201902" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201903" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201904" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201905" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201906" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201907" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201908" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201909" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201910" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201911" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."broker_profitlog_201912" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201801" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201801" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201801" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201801" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201801" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201801" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201801" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201802" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201802" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201802" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201802" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201802" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201802" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201802" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201803" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201803" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201803" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201803" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201803" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201803" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201803" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201804" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201804" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201804" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201804" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201804" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201804" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201804" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201805" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201805" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201805" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201805" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201805" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201805" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201805" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201806" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201806" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201806" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201806" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201806" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201806" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201806" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201807" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201807" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201807" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201807" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201807" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201807" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201807" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201808" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201808" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201808" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201808" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201808" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201808" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201808" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201809" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201809" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201809" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201809" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201809" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201809" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201809" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201810" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201810" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201810" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201810" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201810" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201810" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201810" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201811" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201811" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201811" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201811" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201811" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201811" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201811" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201812" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201812" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201812" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201812" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201812" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201812" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201812" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201901" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201901" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201901" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201901" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201901" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201901" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201901" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201902" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201902" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201902" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201902" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201902" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201902" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201902" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201903" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201903" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201903" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201903" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201903" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201903" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201903" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201904" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201904" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201904" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201904" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201904" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201904" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201904" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201905" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201905" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201905" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201905" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201905" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201905" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201905" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201906" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201906" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201906" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201906" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201906" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201906" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201906" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201907" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201907" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201907" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201907" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201907" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201907" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201907" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201908" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201908" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201908" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201908" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201908" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201908" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201908" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201909" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201909" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201909" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201909" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201909" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201909" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201909" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201910" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201910" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201910" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201910" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201910" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201910" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201910" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201911" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201911" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201911" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201911" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201911" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201911" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201911" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201912" ALTER COLUMN "avoidauditamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201912" ALTER COLUMN "minwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201912" ALTER COLUMN "netfee1" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201912" ALTER COLUMN "netfee2" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201912" ALTER COLUMN "netfee3" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201912" ALTER COLUMN "netfee4" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_info_201912" ALTER COLUMN "netfee5" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201801" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201802" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201803" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201804" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201805" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201806" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201807" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201808" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201809" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201810" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201811" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201812" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201901" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201902" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201903" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201904" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201905" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201906" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201907" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201908" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201909" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201910" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201911" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."coin_pair_201912" ALTER COLUMN "issprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201801" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201802" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201803" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201804" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201805" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201806" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201807" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201808" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201809" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201810" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201811" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201812" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201901" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201902" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201903" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201904" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201905" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201906" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201907" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201908" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201909" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201910" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201911" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_deallog_201912" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201801" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201801" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201802" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201802" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201803" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201803" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201804" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201804" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201805" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201805" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201806" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201806" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201807" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201807" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201808" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201808" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201809" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201809" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201810" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201810" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201811" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201811" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201812" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201812" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201901" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201901" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201902" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201902" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201903" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201903" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201904" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201904" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201905" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201905" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201906" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201906" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201907" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201907" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201908" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201908" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201909" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201909" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201910" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201910" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201911" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201911" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201912" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."ctoc_order_201912" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201801" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201801" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201801" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201802" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201802" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201802" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201803" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201803" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201803" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201804" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201804" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201804" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201805" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201805" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201805" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201806" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201806" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201806" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201807" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201807" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201807" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201808" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201808" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201808" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201809" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201809" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201809" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201810" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201810" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201810" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201811" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201811" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201811" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201812" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201812" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201812" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201901" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201901" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201901" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201902" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201902" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201902" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201903" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201903" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201903" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201904" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201904" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201904" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201905" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201905" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201905" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201906" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201906" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201906" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201907" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201907" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201907" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201908" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201908" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201908" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201909" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201909" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201909" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201910" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201910" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201910" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201911" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201911" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201911" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201912" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."debit_creditlog_201912" ADD COLUMN "dctype" int2 NOT NULL;

ALTER TABLE "history_trade"."debit_creditlog_201912" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."pair_property" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201801" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201801" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201801" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201802" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201802" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201802" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201803" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201803" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201803" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201804" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201804" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201804" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201805" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201805" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201805" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201806" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201806" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201806" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201807" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201807" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201807" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201808" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201808" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201808" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201809" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201809" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201809" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201810" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201810" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201810" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201811" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201811" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201811" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201812" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201812" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201812" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201901" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201901" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201901" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201902" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201902" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201902" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201903" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201903" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201903" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201904" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201904" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201904" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201905" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201905" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201905" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201906" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201906" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201906" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201907" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201907" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201907" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201908" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201908" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201908" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201909" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201909" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201909" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201910" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201910" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201910" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201911" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201911" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201911" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201912" ALTER COLUMN "quantitylimitonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201912" ALTER COLUMN "quantitylimitday" TYPE numeric(38,12);

ALTER TABLE "history_trade"."pair_property_201912" ALTER COLUMN "quantityminonce" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201801" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201801" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201802" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201802" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201803" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201803" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201804" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201804" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201805" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201805" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201806" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201806" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201807" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201807" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201808" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201808" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201809" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201809" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201810" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201810" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201811" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201811" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201812" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201812" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201901" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201901" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201902" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201902" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201903" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201903" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201904" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201904" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201905" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201905" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201906" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201906" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201907" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201907" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201908" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201908" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201909" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201909" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201910" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201910" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201911" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201911" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201912" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_buy_201912" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201801" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201801" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201802" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201802" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201803" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201803" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201804" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201804" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201805" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201805" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201806" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201806" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201807" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201807" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201808" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201808" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201809" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201809" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201810" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201810" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201811" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201811" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201812" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201812" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201901" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201901" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201902" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201902" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201903" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201903" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201904" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201904" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201905" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201905" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201906" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201906" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201907" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201907" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201908" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201908" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201909" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201909" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201910" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201910" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201911" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201911" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201912" ALTER COLUMN "price" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_depth_sell_201912" ALTER COLUMN "quantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201801" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201801" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201801" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201802" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201802" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201802" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201803" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201803" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201803" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201804" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201804" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201804" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201805" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201805" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201805" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201806" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201806" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201806" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201807" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201807" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201807" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201808" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201808" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201808" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201809" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201809" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201809" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201810" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201810" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201810" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201811" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201811" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201811" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201812" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201812" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201812" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201901" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201901" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201901" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201902" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201902" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201902" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201903" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201903" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201903" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201904" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201904" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201904" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201905" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201905" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201905" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201906" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201906" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201906" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201907" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201907" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201907" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201908" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201908" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201908" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201909" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201909" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201909" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201910" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201910" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201910" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201911" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201911" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201911" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201912" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201912" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_last_201912" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201801" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201801" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201801" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201801" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201801" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201801" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201801" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201801" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201801" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201801" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201801" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201802" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201802" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201802" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201802" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201802" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201802" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201802" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201802" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201802" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201802" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201802" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201803" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201803" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201803" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201803" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201803" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201803" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201803" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201803" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201803" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201803" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201803" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201804" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201804" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201804" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201804" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201804" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201804" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201804" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201804" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201804" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201804" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201804" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201805" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201805" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201805" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201805" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201805" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201805" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201805" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201805" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201805" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201805" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201805" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201806" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201806" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201806" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201806" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201806" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201806" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201806" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201806" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201806" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201806" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201806" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201807" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201807" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201807" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201807" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201807" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201807" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201807" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201807" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201807" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201807" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201807" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201808" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201808" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201808" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201808" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201808" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201808" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201808" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201808" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201808" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201808" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201808" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201809" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201809" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201809" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201809" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201809" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201809" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201809" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201809" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201809" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201809" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201809" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201810" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201810" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201810" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201810" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201810" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201810" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201810" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201810" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201810" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201810" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201810" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201811" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201811" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201811" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201811" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201811" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201811" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201811" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201811" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201811" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201811" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201811" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201812" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201812" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201812" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201812" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201812" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201812" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201812" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201812" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201812" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201812" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201812" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201901" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201901" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201901" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201901" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201901" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201901" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201901" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201901" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201901" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201901" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201901" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201902" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201902" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201902" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201902" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201902" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201902" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201902" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201902" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201902" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201902" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201902" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201903" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201903" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201903" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201903" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201903" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201903" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201903" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201903" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201903" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201903" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201903" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201904" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201904" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201904" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201904" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201904" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201904" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201904" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201904" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201904" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201904" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201904" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201905" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201905" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201905" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201905" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201905" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201905" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201905" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201905" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201905" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201905" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201905" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201906" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201906" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201906" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201906" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201906" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201906" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201906" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201906" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201906" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201906" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201906" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201907" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201907" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201907" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201907" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201907" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201907" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201907" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201907" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201907" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201907" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201907" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201908" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201908" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201908" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201908" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201908" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201908" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201908" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201908" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201908" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201908" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201908" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201909" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201909" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201909" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201909" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201909" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201909" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201909" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201909" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201909" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201909" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201909" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201910" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201910" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201910" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201910" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201910" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201910" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201910" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201910" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201910" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201910" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201910" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201911" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201911" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201911" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201911" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201911" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201911" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201911" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201911" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201911" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201911" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201911" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201912" ALTER COLUMN "dvol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201912" ALTER COLUMN "damount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201912" ALTER COLUMN "dhigh" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201912" ALTER COLUMN "dopen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201912" ALTER COLUMN "dlow" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201912" ALTER COLUMN "high" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201912" ALTER COLUMN "open" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201912" ALTER COLUMN "low" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201912" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201912" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_ticker_201912" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201801" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201801" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201801" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201802" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201802" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201802" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201803" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201803" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201803" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201804" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201804" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201804" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201805" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201805" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201805" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201806" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201806" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201806" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201807" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201807" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201807" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201808" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201808" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201808" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201809" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201809" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201809" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201810" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201810" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201810" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201811" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201811" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201811" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201812" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201812" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201812" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201901" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201901" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201901" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201902" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201902" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201902" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201903" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201903" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201903" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201904" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201904" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201904" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201905" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201905" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201905" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201906" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201906" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201906" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201907" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201907" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201907" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201908" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201908" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201908" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201909" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201909" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201909" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201910" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201910" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201910" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201911" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201911" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201911" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201912" ALTER COLUMN "last" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201912" ALTER COLUMN "vol" TYPE numeric(38,12);

ALTER TABLE "history_trade"."quote_trade_201912" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201801" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201801" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201801" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201801" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201801" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201801" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201801" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201801" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201801" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201802" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201802" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201802" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201802" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201802" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201802" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201802" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201802" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201802" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201803" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201803" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201803" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201803" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201803" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201803" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201803" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201803" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201803" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201804" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201804" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201804" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201804" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201804" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201804" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201804" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201804" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201804" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201805" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201805" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201805" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201805" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201805" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201805" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201805" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201805" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201805" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201806" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201806" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201806" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201806" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201806" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201806" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201806" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201806" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201806" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201807" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201807" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201807" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201807" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201807" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201807" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201807" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201807" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201807" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201808" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201808" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201808" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201808" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201808" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201808" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201808" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201808" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201808" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201809" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201809" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201809" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201809" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201809" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201809" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201809" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201809" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201809" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201810" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201810" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201810" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201810" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201810" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201810" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201810" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201810" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201810" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201811" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201811" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201811" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201811" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201811" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201811" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201811" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201811" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201811" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201812" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201812" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201812" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201812" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201812" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201812" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201812" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201812" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201812" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201901" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201901" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201901" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201901" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201901" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201901" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201901" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201901" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201901" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201902" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201902" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201902" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201902" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201902" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201902" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201902" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201902" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201902" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201903" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201903" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201903" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201903" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201903" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201903" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201903" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201903" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201903" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201904" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201904" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201904" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201904" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201904" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201904" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201904" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201904" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201904" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201905" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201905" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201905" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201905" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201905" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201905" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201905" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201905" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201905" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201906" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201906" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201906" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201906" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201906" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201906" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201906" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201906" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201906" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201907" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201907" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201907" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201907" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201907" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201907" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201907" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201907" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201907" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201908" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201908" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201908" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201908" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201908" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201908" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201908" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201908" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201908" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201909" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201909" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201909" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201909" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201909" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201909" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201909" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201909" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201909" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201910" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201910" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201910" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201910" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201910" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201910" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201910" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201910" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201910" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201911" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201911" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201911" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201911" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201911" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201911" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201911" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201911" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201911" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201912" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201912" ALTER COLUMN "totalfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201912" ALTER COLUMN "dayfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201912" ALTER COLUMN "totalrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201912" ALTER COLUMN "dayrefill" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201912" ALTER COLUMN "totalwithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201912" ALTER COLUMN "daywithdraw" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201912" ALTER COLUMN "totalbrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoney_201912" ALTER COLUMN "daybrokerpay" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201801" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201801" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201801" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201802" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201802" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201802" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201803" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201803" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201803" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201804" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201804" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201804" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201805" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201805" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201805" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201806" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201806" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201806" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201807" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201807" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201807" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201808" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201808" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201808" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201809" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201809" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201809" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201810" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201810" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201810" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201811" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201811" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201811" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201812" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201812" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201812" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201901" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201901" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201901" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201902" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201902" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201902" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201903" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201903" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201903" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201904" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201904" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201904" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201905" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201905" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201905" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201906" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201906" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201906" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201907" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201907" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201907" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201908" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201908" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201908" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201909" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201909" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201909" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201910" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201910" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201910" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201911" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201911" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201911" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201912" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201912" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."sys_exchmoneylog_201912" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201801" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201801" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201801" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201801" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201801" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201801" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201802" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201802" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201802" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201802" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201802" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201802" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201803" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201803" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201803" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201803" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201803" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201803" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201804" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201804" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201804" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201804" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201804" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201804" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201805" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201805" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201805" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201805" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201805" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201805" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201806" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201806" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201806" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201806" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201806" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201806" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201807" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201807" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201807" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201807" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201807" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201807" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201808" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201808" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201808" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201808" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201808" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201808" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201809" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201809" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201809" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201809" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201809" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201809" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201810" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201810" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201810" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201810" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201810" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201810" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201811" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201811" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201811" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201811" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201811" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201811" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201812" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201812" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201812" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201812" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201812" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201812" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201901" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201901" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201901" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201901" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201901" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201901" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201902" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201902" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201902" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201902" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201902" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201902" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201903" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201903" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201903" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201903" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201903" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201903" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201904" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201904" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201904" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201904" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201904" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201904" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201905" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201905" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201905" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201905" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201905" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201905" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201906" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201906" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201906" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201906" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201906" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201906" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201907" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201907" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201907" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201907" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201907" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201907" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201908" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201908" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201908" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201908" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201908" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201908" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201909" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201909" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201909" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201909" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201909" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201909" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201910" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201910" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201910" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201910" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201910" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201910" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201911" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201911" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201911" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201911" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201911" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201911" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201912" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201912" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201912" ALTER COLUMN "dealprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201912" ALTER COLUMN "dealquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201912" ALTER COLUMN "dealamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_deallog_201912" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201801" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201801" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201801" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201801" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201801" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201801" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201802" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201802" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201802" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201802" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201802" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201802" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201803" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201803" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201803" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201803" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201803" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201803" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201804" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201804" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201804" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201804" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201804" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201804" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201805" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201805" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201805" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201805" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201805" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201805" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201806" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201806" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201806" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201806" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201806" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201806" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201807" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201807" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201807" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201807" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201807" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201807" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201808" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201808" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201808" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201808" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201808" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201808" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201809" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201809" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201809" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201809" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201809" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201809" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201810" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201810" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201810" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201810" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201810" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201810" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201811" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201811" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201811" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201811" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201811" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201811" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201812" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201812" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201812" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201812" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201812" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201812" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201901" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201901" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201901" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201901" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201901" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201901" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201902" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201902" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201902" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201902" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201902" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201902" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201903" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201903" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201903" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201903" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201903" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201903" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201904" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201904" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201904" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201904" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201904" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201904" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201905" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201905" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201905" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201905" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201905" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201905" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201906" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201906" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201906" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201906" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201906" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201906" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201907" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201907" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201907" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201907" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201907" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201907" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201908" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201908" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201908" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201908" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201908" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201908" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201909" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201909" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201909" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201909" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201909" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201909" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201910" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201910" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201910" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201910" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201910" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201910" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201911" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201911" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201911" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201911" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201911" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201911" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201912" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201912" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201912" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201912" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201912" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_order_201912" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201801" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201801" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201801" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201801" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201801" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201801" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201802" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201802" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201802" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201802" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201802" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201802" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201803" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201803" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201803" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201803" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201803" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201803" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201804" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201804" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201804" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201804" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201804" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201804" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201805" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201805" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201805" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201805" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201805" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201805" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201806" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201806" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201806" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201806" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201806" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201806" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201807" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201807" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201807" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201807" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201807" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201807" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201808" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201808" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201808" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201808" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201808" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201808" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201809" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201809" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201809" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201809" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201809" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201809" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201810" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201810" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201810" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201810" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201810" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201810" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201811" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201811" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201811" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201811" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201811" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201811" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201812" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201812" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201812" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201812" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201812" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201812" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201901" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201901" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201901" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201901" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201901" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201901" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201902" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201902" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201902" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201902" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201902" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201902" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201903" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201903" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201903" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201903" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201903" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201903" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201904" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201904" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201904" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201904" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201904" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201904" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201905" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201905" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201905" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201905" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201905" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201905" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201906" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201906" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201906" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201906" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201906" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201906" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201907" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201907" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201907" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201907" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201907" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201907" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201908" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201908" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201908" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201908" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201908" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201908" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201909" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201909" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201909" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201909" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201909" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201909" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201910" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201910" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201910" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201910" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201910" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201910" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201911" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201911" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201911" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201911" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201911" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201911" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201912" ALTER COLUMN "orderprice" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201912" ALTER COLUMN "orderquantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201912" ALTER COLUMN "completequantity" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201912" ALTER COLUMN "completeamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201912" ALTER COLUMN "fee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."trade_orderlog_201912" ALTER COLUMN "usedamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201801" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201801" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201801" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201801" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201802" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201802" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201802" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201802" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201803" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201803" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201803" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201803" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201804" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201804" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201804" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201804" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201805" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201805" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201805" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201805" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201806" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201806" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201806" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201806" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201807" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201807" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201807" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201807" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201808" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201808" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201808" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201808" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201809" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201809" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201809" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201809" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201810" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201810" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201810" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201810" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201811" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201811" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201811" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201811" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201812" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201812" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201812" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201812" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201901" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201901" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201901" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201901" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201902" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201902" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201902" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201902" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201903" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201903" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201903" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201903" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201904" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201904" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201904" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201904" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201905" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201905" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201905" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201905" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201906" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201906" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201906" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201906" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201907" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201907" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201907" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201907" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201908" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201908" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201908" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201908" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201909" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201909" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201909" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201909" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201910" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201910" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201910" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201910" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201911" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201911" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201911" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201911" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_changelog_201912" ALTER COLUMN "umchange" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201912" ALTER COLUMN "umbefore" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201912" ALTER COLUMN "umafter" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_changelog_201912" ADD COLUMN "jsonnote" jsonb NOT NULL;

ALTER TABLE "history_trade"."um_iorec" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201801" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201801" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201801" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201801" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201802" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201802" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201802" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201802" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201803" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201803" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201803" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201803" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201804" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201804" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201804" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201804" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201805" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201805" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201805" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201805" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201806" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201806" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201806" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201806" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201807" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201807" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201807" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201807" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201808" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201808" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201808" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201808" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201809" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201809" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201809" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201809" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201810" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201810" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201810" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201810" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201811" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201811" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201811" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201811" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201812" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201812" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201812" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201812" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201901" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201901" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201901" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201901" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201902" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201902" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201902" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201902" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201903" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201903" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201903" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201903" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201904" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201904" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201904" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201904" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201905" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201905" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201905" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201905" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201906" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201906" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201906" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201906" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201907" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201907" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201907" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201907" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201908" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201908" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201908" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201908" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201909" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201909" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201909" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201909" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201910" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201910" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201910" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201910" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201911" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201911" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201911" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201911" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201912" ALTER COLUMN "amount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201912" ALTER COLUMN "actualamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201912" ALTER COLUMN "tradefee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."um_iorec_201912" ALTER COLUMN "netfee" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201801" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201801" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201801" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201801" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201802" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201802" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201802" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201802" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201803" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201803" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201803" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201803" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201804" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201804" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201804" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201804" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201805" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201805" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201805" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201805" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201806" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201806" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201806" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201806" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201807" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201807" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201807" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201807" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201808" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201808" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201808" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201808" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201809" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201809" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201809" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201809" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201810" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201810" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201810" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201810" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201811" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201811" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201811" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201811" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201812" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201812" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201812" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201812" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201901" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201901" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201901" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201901" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201902" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201902" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201902" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201902" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201903" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201903" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201903" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201903" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201904" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201904" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201904" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201904" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201905" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201905" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201905" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201905" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201906" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201906" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201906" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201906" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201907" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201907" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201907" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201907" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201908" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201908" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201908" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201908" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201909" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201909" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201909" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201909" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201910" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201910" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201910" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201910" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201911" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201911" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201911" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201911" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201912" ALTER COLUMN "daywdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201912" ALTER COLUMN "totalwdamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201912" ALTER COLUMN "dayrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_coin_statis_201912" ALTER COLUMN "totalrefillamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201801" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201801" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201801" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201801" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201802" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201802" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201802" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201802" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201803" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201803" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201803" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201803" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201804" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201804" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201804" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201804" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201805" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201805" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201805" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201805" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201806" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201806" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201806" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201806" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201807" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201807" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201807" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201807" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201808" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201808" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201808" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201808" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201809" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201809" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201809" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201809" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201810" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201810" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201810" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201810" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201811" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201811" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201811" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201811" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201812" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201812" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201812" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201812" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201901" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201901" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201901" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201901" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201902" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201902" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201902" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201902" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201903" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201903" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201903" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201903" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201904" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201904" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201904" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201904" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201905" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201905" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201905" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201905" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201906" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201906" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201906" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201906" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201907" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201907" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201907" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201907" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201908" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201908" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201908" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201908" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201909" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201909" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201909" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201909" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201910" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201910" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201910" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201910" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201911" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201911" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201911" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201911" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201912" ALTER COLUMN "balance" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201912" ALTER COLUMN "frozen" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201912" ALTER COLUMN "available" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_money_201912" ALTER COLUMN "daybrokergain" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201801" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201801" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201801" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201801" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201801" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201801" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201801" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201801" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201801" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201801" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201802" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201802" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201802" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201802" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201802" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201802" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201802" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201802" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201802" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201802" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201803" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201803" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201803" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201803" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201803" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201803" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201803" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201803" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201803" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201803" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201804" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201804" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201804" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201804" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201804" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201804" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201804" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201804" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201804" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201804" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201805" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201805" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201805" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201805" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201805" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201805" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201805" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201805" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201805" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201805" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201806" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201806" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201806" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201806" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201806" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201806" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201806" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201806" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201806" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201806" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201807" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201807" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201807" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201807" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201807" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201807" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201807" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201807" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201807" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201807" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201808" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201808" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201808" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201808" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201808" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201808" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201808" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201808" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201808" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201808" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201809" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201809" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201809" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201809" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201809" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201809" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201809" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201809" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201809" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201809" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201810" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201810" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201810" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201810" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201810" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201810" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201810" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201810" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201810" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201810" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201811" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201811" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201811" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201811" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201811" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201811" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201811" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201811" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201811" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201811" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201812" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201812" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201812" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201812" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201812" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201812" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201812" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201812" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201812" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201812" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201901" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201901" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201901" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201901" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201901" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201901" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201901" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201901" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201901" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201901" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201902" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201902" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201902" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201902" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201902" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201902" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201902" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201902" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201902" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201902" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201903" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201903" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201903" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201903" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201903" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201903" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201903" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201903" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201903" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201903" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201904" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201904" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201904" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201904" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201904" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201904" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201904" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201904" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201904" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201904" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201905" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201905" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201905" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201905" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201905" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201905" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201905" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201905" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201905" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201905" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201906" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201906" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201906" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201906" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201906" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201906" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201906" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201906" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201906" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201906" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201907" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201907" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201907" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201907" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201907" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201907" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201907" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201907" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201907" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201907" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201908" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201908" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201908" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201908" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201908" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201908" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201908" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201908" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201908" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201908" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201909" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201909" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201909" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201909" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201909" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201909" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201909" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201909" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201909" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201909" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201910" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201910" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201910" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201910" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201910" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201910" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201910" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201910" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201910" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201910" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201911" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201911" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201911" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201911" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201911" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201911" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201911" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201911" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201911" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201911" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201912" ALTER COLUMN "daybuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201912" ALTER COLUMN "daybuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201912" ALTER COLUMN "totalbuyqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201912" ALTER COLUMN "totalbuyamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201912" ALTER COLUMN "daysellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201912" ALTER COLUMN "daysellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201912" ALTER COLUMN "totalsellqty" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201912" ALTER COLUMN "totalsellamount" TYPE numeric(38,12);

ALTER TABLE "history_trade"."user_pair_statis_201912" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL;

ALTER TABLE "history_trade"."user_pair_statis_201912" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL;