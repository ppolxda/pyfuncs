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
