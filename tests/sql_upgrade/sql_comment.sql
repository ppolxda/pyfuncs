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
