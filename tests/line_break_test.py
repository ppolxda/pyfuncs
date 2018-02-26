# -*- coding: utf-8 -*-

import os
import codecs
import unittest

try:
    from pyfuncs.scripts import line_break as lb
    # from pyfuncs.scripts import line_break_conv
except ImportError:
    import sys
    sys.path.insert(0, os.getcwd())
    from pyfuncs.scripts import line_break as lb
    # from pyfuncs.scripts import line_break_conv

FILE_PATH = os.path.abspath(os.path.dirname(__file__))
TEST_FILE_WIN_1 = FILE_PATH + '/test_win_1.txt'
TEST_FILE_MAC_1 = FILE_PATH + '/test_mac_1.txt'
TEST_FILE_UNIX_1 = FILE_PATH + '/test_unix_1.txt'


def out_filepath(path, path_sub=''):
    assert isinstance(path, str)
    return path[:path.rfind('.')] + path_sub + '_out' + path[path.rfind('.'):]


TEST_FILE_WIN_1_CONV_WIN_OUT = out_filepath(TEST_FILE_WIN_1, '_win')
TEST_FILE_MAC_1_CONV_WIN_OUT = out_filepath(TEST_FILE_MAC_1, '_win')
TEST_FILE_UNIX_1_CONV_WIN_OUT = out_filepath(TEST_FILE_UNIX_1, '_win')


class TestLineBreak(unittest.TestCase):
    """Test mathfuc.py"""

    def file_win_tt(self, inpath, outpath):
        lb.conv_file(inpath, lb.MODE_WINDOWS,
                     out_filepath=outpath)
        fdata = codecs.open(outpath, 'rb').read()
        self.assertEqual(fdata, lb.WINDOWS_LINE.encode())

    def test_linebreak(self):
        '''test_linebreak'''
        self.assertEqual(lb.to_windows(lb.UNIX_LINE), lb.WINDOWS_LINE)
        self.assertEqual(lb.to_windows(lb.WINDOWS_LINE), lb.WINDOWS_LINE)
        self.assertEqual(lb.to_windows(lb.MAC_LINE), lb.WINDOWS_LINE)

        self.assertEqual(lb.to_unix(lb.UNIX_LINE), lb.UNIX_LINE)
        self.assertEqual(lb.to_unix(lb.WINDOWS_LINE), lb.UNIX_LINE)
        self.assertEqual(lb.to_unix(lb.MAC_LINE), lb.UNIX_LINE)

        self.assertEqual(lb.to_mac(lb.UNIX_LINE), lb.MAC_LINE)
        self.assertEqual(lb.to_mac(lb.WINDOWS_LINE), lb.MAC_LINE)
        self.assertEqual(lb.to_mac(lb.MAC_LINE), lb.MAC_LINE)

        test_1 = lb.UNIX_LINE + lb.WINDOWS_LINE + lb.MAC_LINE
        self.assertEqual(lb.to_windows(test_1), lb.WINDOWS_LINE +
                         lb.WINDOWS_LINE + lb.WINDOWS_LINE)

        self.file_win_tt(TEST_FILE_WIN_1, TEST_FILE_WIN_1_CONV_WIN_OUT)
        self.file_win_tt(TEST_FILE_MAC_1, TEST_FILE_MAC_1_CONV_WIN_OUT)
        self.file_win_tt(TEST_FILE_UNIX_1, TEST_FILE_UNIX_1_CONV_WIN_OUT)

        print('test_linebreak sucess')


if __name__ == '__main__':
    unittest.main()
