ALTER TABLE "history_trade"."debit_creditlog" ALTER COLUMN "dctype"  DROP DEFAULT;
ALTER TABLE "history_trade"."debit_creditlog" ALTER COLUMN "jsonnote"  DROP DEFAULT;
ALTER TABLE "history_trade"."um_changelog" ALTER COLUMN "jsonnote"  DROP DEFAULT;
ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "dayorderbuyqty"  DROP DEFAULT;
ALTER TABLE "history_trade"."user_pair_statis" ALTER COLUMN "dayordersellqty"  DROP DEFAULT;
