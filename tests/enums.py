
# -*- coding: utf-8 -*-
u"""
@create: 2017-03-30 04:06:01.

@author: gen

@desc: enums
"""

# //////////////////////////////////////////////////////////////////////


class EYesNoType(object):
    u"""EYesNoType枚举定义."""
    YN_NO = '0'  # YN_No
    YN_YES = '1'  # YN_Yes

    ENUM_LIST = [
        YN_NO,
        YN_YES,
    ]

    ENUM_COMMENTS = {
        YN_NO: u'YN_No',
        YN_YES: u'YN_Yes',
    }

    @classmethod
    def is_invaild(cls, val):
        u"""是否无效枚举."""
        return val not in cls.ENUM_LIST

    @classmethod
    def get_comments(cls, val):
        u"""是否无效枚举."""
        return cls.ENUM_COMMENTS.get(val, 'unknow')


class EBoolType(object):
    u"""EBoolType枚举定义."""
    BOOL_FALSE = '0'  # BOOL_False
    BOOL_TRUE = '1'  # BOOL_True

    ENUM_LIST = [
        BOOL_FALSE,
        BOOL_TRUE,
    ]

    ENUM_COMMENTS = {
        BOOL_FALSE: u'BOOL_False',
        BOOL_TRUE: u'BOOL_True',
    }

    @classmethod
    def is_invaild(cls, val):
        u"""是否无效枚举."""
        return val not in cls.ENUM_LIST

    @classmethod
    def get_comments(cls, val):
        u"""是否无效枚举."""
        return cls.ENUM_COMMENTS.get(val, 'unknow')


class ERiskType(object):
    u"""ERiskType枚举定义."""
    NONE = '0'  # None
    MN = '1'  # 占用/净值
    NM = '2'  # 净值/占用

    ENUM_LIST = [
        NONE,
        MN,
        NM,
    ]

    ENUM_COMMENTS = {
        NONE: u'None',
        MN: u'占用/净值',
        NM: u'净值/占用',
    }

    @classmethod
    def is_invaild(cls, val):
        u"""是否无效枚举."""
        return val not in cls.ENUM_LIST

    @classmethod
    def get_comments(cls, val):
        u"""是否无效枚举."""
        return cls.ENUM_COMMENTS.get(val, 'unknow')


class ESettlementType(object):
    u"""ESettlementType枚举定义."""
    NONE = '0'  # None
    NEVERINDEBTED = '1'  # 无负债结算
    INDEBTED = '2'  # 有负债结算

    ENUM_LIST = [
        NONE,
        NEVERINDEBTED,
        INDEBTED,
    ]

    ENUM_COMMENTS = {
        NONE: u'None',
        NEVERINDEBTED: u'无负债结算',
        INDEBTED: u'有负债结算',
    }

    @classmethod
    def is_invaild(cls, val):
        u"""是否无效枚举."""
        return val not in cls.ENUM_LIST

    @classmethod
    def get_comments(cls, val):
        u"""是否无效枚举."""
        return cls.ENUM_COMMENTS.get(val, 'unknow')


class ETradeStatusType(object):
    u"""ETradeStatusType枚举定义."""
    NONE = '0'  # None
    OPEN = '1'  # 开市
    CLOSE = '2'  # 休市
    STOP = '3'  # 收市
    SETTLE = '4'  # 结算
    SETTLEEND = '5'  # 结算结束
    WAITOPEN = '6'  # 等待开市

    ENUM_LIST = [
        NONE,
        OPEN,
        CLOSE,
        STOP,
        SETTLE,
        SETTLEEND,
        WAITOPEN,
    ]

    ENUM_COMMENTS = {
        NONE: u'None',
        OPEN: u'开市',
        CLOSE: u'休市',
        STOP: u'收市',
        SETTLE: u'结算',
        SETTLEEND: u'结算结束',
        WAITOPEN: u'等待开市',
    }

    @classmethod
    def is_invaild(cls, val):
        u"""是否无效枚举."""
        return val not in cls.ENUM_LIST

    @classmethod
    def get_comments(cls, val):
        u"""是否无效枚举."""
        return cls.ENUM_COMMENTS.get(val, 'unknow')


class ETradeModelType(object):
    u"""ETradeModelType枚举定义."""
    NONE = '0'  # None
    OTC = '1'  # 做市模式
    AGGREGATESINALEAP = '2'  # 竞价模式
    HANG = '3'  # 挂牌模式
    MINIOPTION = '4'  # 微交易模式
    TINYOTC = '5'  # 微盘模式

    ENUM_LIST = [
        NONE,
        OTC,
        AGGREGATESINALEAP,
        HANG,
        MINIOPTION,
        TINYOTC,
    ]

    ENUM_COMMENTS = {
        NONE: u'None',
        OTC: u'做市模式',
        AGGREGATESINALEAP: u'竞价模式',
        HANG: u'挂牌模式',
        MINIOPTION: u'微交易模式',
        TINYOTC: u'微盘模式',
    }

    @classmethod
    def is_invaild(cls, val):
        u"""是否无效枚举."""
        return val not in cls.ENUM_LIST

    @classmethod
    def get_comments(cls, val):
        u"""是否无效枚举."""
        return cls.ENUM_COMMENTS.get(val, 'unknow')


class EOperatorType(object):
    u"""EOperatorType枚举定义."""
    NONE = '0'  # None
    AUTO = '1'  # 自动
    MANUAL = '2'  # 手工

    ENUM_LIST = [
        NONE,
        AUTO,
        MANUAL,
    ]

    ENUM_COMMENTS = {
        NONE: u'None',
        AUTO: u'自动',
        MANUAL: u'手工',
    }

    @classmethod
    def is_invaild(cls, val):
        u"""是否无效枚举."""
        return val not in cls.ENUM_LIST

    @classmethod
    def get_comments(cls, val):
        u"""是否无效枚举."""
        return cls.ENUM_COMMENTS.get(val, 'unknow')


class EWeekType(object):
    u"""EWeekType枚举定义."""
    NONE = '0'  # None
    MONDAY = '1'  # 周一
    TUESDAY = '2'  # 周二
    WEDNESDAY = '3'  # 周三
    THURSDAY = '4'  # 周四
    FIRDAY = '5'  # 周五
    SATURDAY = '6'  # 周六
    SUNDAY = '7'  # 周日

    ENUM_LIST = [
        NONE,
        MONDAY,
        TUESDAY,
        WEDNESDAY,
        THURSDAY,
        FIRDAY,
        SATURDAY,
        SUNDAY,
    ]

    ENUM_COMMENTS = {
        NONE: u'None',
        MONDAY: u'周一',
        TUESDAY: u'周二',
        WEDNESDAY: u'周三',
        THURSDAY: u'周四',
        FIRDAY: u'周五',
        SATURDAY: u'周六',
        SUNDAY: u'周日',
    }

    @classmethod
    def is_invaild(cls, val):
        u"""是否无效枚举."""
        return val not in cls.ENUM_LIST

    @classmethod
    def get_comments(cls, val):
        u"""是否无效枚举."""
        return cls.ENUM_COMMENTS.get(val, 'unknow')


class ETradeAccessType(object):
    u"""ETradeAccessType枚举定义."""
    NONE = '0'  # None
    TRADEABLE = '1'  # 非交易
    UNTRADEABLE = '2'  # 可交易

    ENUM_LIST = [
        NONE,
        TRADEABLE,
        UNTRADEABLE,
    ]

    ENUM_COMMENTS = {
        NONE: u'None',
        TRADEABLE: u'非交易',
        UNTRADEABLE: u'可交易',
    }

    @classmethod
    def is_invaild(cls, val):
        u"""是否无效枚举."""
        return val not in cls.ENUM_LIST

    @classmethod
    def get_comments(cls, val):
        u"""是否无效枚举."""
        return cls.ENUM_COMMENTS.get(val, 'unknow')


class ECalculType(object):
    u"""ECalculType枚举定义."""
    NONE = '0'  # None
    FIX = '1'  # 固定
    PERCENT = '2'  # 比例

    ENUM_LIST = [
        NONE,
        FIX,
        PERCENT,
    ]

    ENUM_COMMENTS = {
        NONE: u'None',
        FIX: u'固定',
        PERCENT: u'比例',
    }

    @classmethod
    def is_invaild(cls, val):
        u"""是否无效枚举."""
        return val not in cls.ENUM_LIST

    @classmethod
    def get_comments(cls, val):
        u"""是否无效枚举."""
        return cls.ENUM_COMMENTS.get(val, 'unknow')
