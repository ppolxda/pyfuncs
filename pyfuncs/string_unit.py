# -*- coding: utf-8 -*-
u"""
Created on 2016年12月10日.

@author: string_unit
"""
from __future__ import absolute_import, division, print_function
import re
import sys
import string
import datetime
# import xmltodict


class FeildInVaild(Exception):
    pass


def decode_str(val):
    u"""解字符串转unicode."""
    try:
        return unicode(val)
    except:  # pylint: disable=W0702
        pass
    try:
        return val.decode('utf8')
    except:  # pylint: disable=W0702
        pass
    try:
        return val.decode('gbk')
    except:  # pylint: disable=W0702
        pass
    try:
        return val.decode('gb2312')
    except:
        raise


def encode_utf8(val):
    u"""转utf8."""
    try:
        return val.encode('utf8')
    except:  # pylint: disable=W0702
        pass
    try:
        return val.decode('gbk').encode('utf8')
    except:  # pylint: disable=W0702
        pass

    try:
        return val.decode('gb2312').encode('utf8')
    except:  # pylint: disable=W0702
        raise


def encode_gbk(val):
    u"""转gbk."""
    try:
        return val.encode('gbk')
    except:  # pylint: disable=W0702
        pass
    try:
        return val.decode('utf8').encode('gbk')
    except:  # pylint: disable=W0702
        pass

    try:
        return val.decode('gb2312').encode('gbk')
    except:
        raise


def string2datetime(val):
    u"""转换字符串时间至datetime对象."""
    try:
        return datetime.datetime.strptime(val, '%Y-%m-%d %H:%M:%S')
    except ValueError:
        pass
    try:
        return datetime.datetime.strptime(val, '%Y/%m/%d %H:%M:%S')
    except ValueError:
        pass
    try:
        return datetime.datetime.strptime(val, '%Y-%m-%dT%H:%M:%S')
    except ValueError:
        pass
    try:
        return datetime.datetime.strptime(val, '%Y/%m/%dT%H:%M:%S')
    except ValueError:
        pass
    try:
        return datetime.datetime.strptime(val, '%Y%m%d%H%M%S')
    except:
        raise

# ----------------------------------------------
#        xml 转字典
# ----------------------------------------------


# def dict2xml(message):
#     u"""字典转xml."""
#     xmldata = xmltodict.unparse(message, encoding='utf8')
#     return xmldata


# def xml2dict(xml_data):
#     u"""xml转字典."""
#     return xmltodict.parse(decode_str(xml_data))

# ----------------------------------------------
#        字段检查
# ----------------------------------------------


if sys.version_info[0] == 3:
    STRING_TYPES = str
else:
    STRING_TYPES = basestring  # pylint: disable=E0602


def is_string(val):
    u"""是否是字符串."""
    return isinstance(val, STRING_TYPES)


def is_float(val):
    u"""是否是浮点数."""
    try:
        float(val)
    except ValueError:
        return False
    return True


def is_int(val):
    u"""是否是整型数."""
    try:
        int(val)
    except ValueError:
        return False
    return True


def is_date(val):
    u"""是否是日期."""
    if not is_string(val):
        return False
    return re.match(r'[0-9]{4}-[0-9]{2}-[0-9]{2}', val) is not None


def is_datetime(val):
    u"""是否是整型数."""
    if is_string(val):
        return False
    return re.match(r'[0-9]{4}-[0-9]{2}-[0-9]{2}[ T][0-9]{2}:[0-9]{2}:[0-9]{2}', val) is not None


LOGINCODE_REGIX = re.compile(r'^([\w@\._-]{1,32})$')
PASSWORD_REGIX = re.compile(r'^([\w' + string.punctuation + ']{6,24})$')
NUMBER_REGIX = re.compile(r'^[0-9]{1,}$')
EMAIL_REGIS = re.compile(
    r'^([A-Za-z0-9\.\+_-]+)@([A-Za-z0-9\._-]+\.[a-zA-Z]*)$')


def is_vaild_logincode(data):
    u"""检查登陆账号格式."""
    return re.match(LOGINCODE_REGIX, data) is not None


def is_vaild_password(data):
    u"""检查登陆密码格式."""
    return re.match(PASSWORD_REGIX, data) is not None


def is_vaild_number(data):
    u"""检查数字格式."""
    return re.match(NUMBER_REGIX, data) is not None


def is_vaild_email(data):
    u"""检查邮件格式."""
    return re.match(EMAIL_REGIS, data) is not None


is_number = is_vaild_number  # pylint: disable=C0103
is_email = is_vaild_email  # pylint: disable=C0103


def encode_email(email):
    u"""加密邮件地址."""
    email_groups = re.match(EMAIL_REGIS, email)
    if email_groups is None:
        return None

    mail = email_groups.group(1)
    size = len(mail)
    if size <= 2:
        return email
    elif size == 3:
        return mail[0] + '*' + mail[2] + '@' + email_groups.group(2)
    elif size == 4:
        return mail[0:1] + '*' + mail[2:4] + '@' + email_groups.group(2)
    elif size == 5:
        return mail[0:2] + '*' + mail[3:6] + '@' + email_groups.group(2)
    elif size == 6:
        return mail[0:2] + '**' + mail[4:7] + '@' + email_groups.group(2)
    elif size == 7:
        return mail[0:2] + '**' + mail[4:8] + '@' + email_groups.group(2)
    elif size == 8:
        return mail[0:2] + '***' + mail[5:10] + '@' + email_groups.group(2)
    elif size == 9:
        return mail[0:3] + '***' + mail[6:9] + '@' + email_groups.group(2)
    elif size == 10:
        return mail[0:3] + '****' + mail[7:10] + '@' + email_groups.group(2)
    elif size == 11:
        return mail[0:3] + '****' + mail[7:11] + '@' + email_groups.group(2)
    else:
        temp = mail[0:4]
        temp = '*' * (len(mail) - 8)
        return temp + mail[-4:] + '@' + email_groups.group(2)
    return email


def encode_string(val):
    u"""加密字符串."""
    if val:
        size = len(val)
        if size <= 2:
            return val
        elif size == 3:
            return val[0] + '***' + val[2]
        elif size == 4:
            return val[0:1] + '***' + val[2:4]
        elif size == 5:
            return val[0:2] + '***' + val[3:6]
        elif size == 6:
            return val[0:2] + '***' + val[4:7]
        elif size == 7:
            return val[0:2] + '***' + val[4:8]
        elif size == 8:
            return val[0:2] + '***' + val[5:10]
        elif size == 9:
            return val[0:3] + '***' + val[6:9]
        elif size == 10:
            return val[0:3] + '***' + val[7:10]
        elif size == 11:
            return val[0:3] + '***' + val[7:11]
        else:
            temp = val[0:4]
            temp = '*' * (len(val) - 8)
            return temp + val[-4:]
        return string
    return None


def encode_xingming(val):
    u"""加密姓名."""
    return encode_string(val)


if sys.version_info > (3,):
    long = int
    unicode = str
    boolean = bool
    # str = bytes


def convert(value, data_type):
    """ Convert / Cast function """
    if value is None:
        return value
    elif issubclass(data_type, str) and not (value.upper() in ['FALSE', 'TRUE']):
        return value.decode('utf-8')
    elif issubclass(data_type, unicode):
        return unicode(value)
    elif issubclass(data_type, int):
        return int(value)
    elif issubclass(data_type, long):
        return long(value)
    elif issubclass(data_type, float):
        return float(value)
    elif issubclass(data_type, boolean) and (value.upper() in ['FALSE', 'TRUE']):
        if str(value).upper() == 'TRUE':
            return True
        elif str(value).upper() == 'FALSE':
            return False
    else:
        return value
