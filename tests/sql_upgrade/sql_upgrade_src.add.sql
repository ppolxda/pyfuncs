ALTER TABLE "history_trade"."debit_creditlog" ADD COLUMN "dctype" int2 NOT NULL DEFAULT '0';
ALTER TABLE "history_trade"."debit_creditlog" ADD COLUMN "jsonnote" jsonb NOT NULL DEFAULT '{}';
ALTER TABLE "history_trade"."um_changelog" ADD COLUMN "jsonnote" jsonb NOT NULL DEFAULT '{}';
ALTER TABLE "history_trade"."user_pair_statis" ADD COLUMN "dayorderbuyqty" numeric(38,12) NOT NULL DEFAULT '0';
ALTER TABLE "history_trade"."user_pair_statis" ADD COLUMN "dayordersellqty" numeric(38,12) NOT NULL DEFAULT '0';