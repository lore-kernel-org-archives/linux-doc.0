Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E403A4F48;
	Wed, 18 Mar 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825081; cv=none; b=kBJkPJOo6i0+4RE78Vk22lKPJSg/VOkpsjArqIZkltqdl9SbkYgeMrJSOrWlQFz/etL03bXR+GaI12nL2WkS9jCMCwx/Qxf6VkxAFUHP2Ckk3ZkINR6peqqdXNRP9j4oWjgJGy2Jktes1FkNVYNFXu9sppiGeqwEuYoccwlr4r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825081; c=relaxed/simple;
	bh=esMsQCsF6E0nq9eHboKDDqDqJXUEx8Dj6TV/hbIfdWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lraD2T/HfWSsW33dfElf+Qv76RG/Tyl0ZgQCSgomM1jsOPHMVxGJhgstMkzW8UhHQTeOrigYcAiTP7yOTGHdhB5uTmiFZ07B3WQ4diAWjFjK1hdPiLeiYeBXpnUYswWZlrmo/n3gXlve4Qg4gfW9vCad3si0p9k77hJyf9mOS38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=es4ObGoO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="es4ObGoO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7983DC2BCB8;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825080;
	bh=esMsQCsF6E0nq9eHboKDDqDqJXUEx8Dj6TV/hbIfdWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=es4ObGoOsMPBY5FEo1TjRpkECqPYvwaGipLqNWk1BRtqu2RSQjZBrHVxFQ95pM6hG
	 VG3h4Xxpq4VWYqcVzioohy402X3e9Y1coyn8NGlYJfp8sBG6OaEZoeWbBkNyLHsifn
	 MZhHnqFoy45lWaTwQ7OiYCYMG0ShM4UcyeI4lcPNXS11gp9Ehb2KVvt3gan9eLVgm8
	 +oUcyj8UCJrufNMWz7cDBsptAHS9qg08efZPuOOwTtZCm7Gmuj4B2tdDeM1WWdy2oC
	 BbpNnczSMD/RceiFUsAyTz3bUyL7pQ/3Zg5pzA6A+SRlW3p99SYLLE5pq/H/Pi5RuT
	 pnELJxMbEpqqw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2mvu-00000002fq2-3ELH;
	Wed, 18 Mar 2026 10:11:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 12/14] docs: test_kdoc_parser: add support for dynamic test creation
Date: Wed, 18 Mar 2026 10:11:12 +0100
Message-ID: <7ec2593c5b19de3e3b1d8de92675f6b751d3fa21.1773823995.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773823995.git.mchehab+huawei@kernel.org>
References: <cover.1773823995.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Use the content of kdoc-test.yaml to generate unittests to
verify that kernel-doc internal methods are parsing C code
and generating output the expected way.

Depending on what is written at the parser file at
kdoc-test.yaml, up to 5 tests can be generated from a single
test entry inside the YAML file:

1. from source to kdoc_item: test KernelDoc class;
2. from kdoc_item to man: test ManOutput class;
3. from kdoc_item to rst: test RestOutput class;
4. from source to man without checking expected KdocItem;
5. from source to rst without checking expected KdocItem.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/unittests/test_kdoc_parser.py | 368 ++++++++++++++++++++++++++--
 1 file changed, 350 insertions(+), 18 deletions(-)

diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
index 26f74666a000..723dd8c7f4f3 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -8,24 +8,43 @@
 Unit tests for kernel-doc parser.
 """
 
+import logging
 import os
-import unittest
 import re
+import shlex
 import sys
+import unittest
 
 from textwrap import dedent
 from unittest.mock import patch, MagicMock, mock_open
 
+import yaml
+
 SRC_DIR = os.path.dirname(os.path.realpath(__file__))
 sys.path.insert(0, os.path.join(SRC_DIR, "../lib/python"))
 
-from kdoc.kdoc_parser import KernelDoc
+from kdoc.kdoc_files import KdocConfig
 from kdoc.kdoc_item import KdocItem
+from kdoc.kdoc_parser import KernelDoc
+from kdoc.kdoc_output import RestFormat, ManFormat
+
 from kdoc.xforms_lists import CTransforms
+
 from unittest_helper import run_unittest
 
+
+#
+# Test file
+#
+TEST_FILE = os.path.join(SRC_DIR, "kdoc-test.yaml")
+
+#
+# Ancillary logic to clean whitespaces
+#
 #: Regex to help cleaning whitespaces
-RE_WHITESPC = re.compile(r"\s++")
+RE_WHITESPC = re.compile(r"[ \t]++")
+RE_BEGINSPC = re.compile(r"^\s+", re.MULTILINE)
+RE_ENDSPC = re.compile(r"\s+$", re.MULTILINE)
 
 def clean_whitespc(val, relax_whitespace=False):
     """
@@ -38,7 +57,9 @@ def clean_whitespc(val, relax_whitespace=False):
     if isinstance(val, str):
         val = val.strip()
         if relax_whitespace:
-            val = RE_WHITESPC.sub("", val)
+            val = RE_WHITESPC.sub(" ", val)
+            val = RE_BEGINSPC.sub("", val)
+            val = RE_ENDSPC.sub("", val)
     elif isinstance(val, list):
         val = [clean_whitespc(item, relax_whitespace) for item in val]
     elif isinstance(val, dict):
@@ -46,22 +67,59 @@ def clean_whitespc(val, relax_whitespace=False):
     return val
 
 #
-# Helper class to help mocking with
+# Helper classes to help mocking with logger and config
 #
-class KdocParser(unittest.TestCase):
+class MockLogging(logging.Handler):
+    """
+    Simple class to store everything on a list
+    """
+
+    def __init__(self, level=logging.NOTSET):
+        super().__init__(level)
+        self.messages = []
+        self.formatter = logging.Formatter()
+
+    def emit(self, record: logging.LogRecord) -> None:
+        """
+        Append a formatted record to self.messages.
+        """
+        try:
+            # The `format` method uses the handler's formatter.
+            message = self.format(record)
+            self.messages.append(message)
+        except Exception:
+            self.handleError(record)
+
+class MockKdocConfig(KdocConfig):
+    def __init__(self, *args, **kwargs):
+        super().__init__(*args, **kwargs)
+
+        self.log = logging.getLogger(__file__)
+        self.handler = MockLogging()
+        self.log.addHandler(self.handler)
+
+    def warning(self, msg):
+        """Ancillary routine to output a warning and increment error count."""
+
+        self.log.warning(msg)
+
+#
+# Helper class to generate KdocItem and validate its contents
+#
+# TODO: check self.config.handler.messages content
+#
+class GenerateKdocItem(unittest.TestCase):
     """
     Base class to run KernelDoc parser class
     """
 
     DEFAULT = vars(KdocItem("", "", "", 0))
 
+    config = MockKdocConfig()
+    xforms = CTransforms()
+
     def setUp(self):
         self.maxDiff = None
-        self.config = MagicMock()
-        self.config.log = MagicMock()
-        self.config.log.debug = MagicMock()
-        self.xforms = CTransforms()
-
 
     def run_test(self, source, __expected_list, exports={}, fname="test.c",
                  relax_whitespace=False):
@@ -75,6 +133,9 @@ class KdocParser(unittest.TestCase):
         # Ensure that default values will be there
         expected_list = []
         for e in __expected_list:
+            if not isinstance(e, dict):
+                e = vars(e)
+
             new_e = self.DEFAULT.copy()
             new_e["fname"] = fname
             for key, value in e.items():
@@ -111,13 +172,155 @@ class KdocParser(unittest.TestCase):
 
                     self.assertEqual(result, value, msg=f"at {key}")
 
+#
+# Ancillary function that replicates kdoc_files way to generate output
+#
+def cleanup_timestamp(text):
+    lines = text.split("\n")
+
+    for i, line in enumerate(lines):
+        if not line.startswith('.TH'):
+            continue
+
+        parts = shlex.split(line)
+        if len(parts) > 3:
+            parts[3] = ""
+
+        lines[i] = " ".join(parts)
+
+
+    return "\n".join(lines)
+
+def gen_output(fname, out_style, symbols, expected,
+               config=None, relax_whitespace=False):
+    """
+    Use the output class to return an output content from KdocItem symbols.
+    """
+
+    if not config:
+        config = MockKdocConfig()
+
+    out_style.set_config(config)
+
+    msg = out_style.output_symbols(fname, symbols)
+
+    result = clean_whitespc(msg, relax_whitespace)
+    result = cleanup_timestamp(result)
+
+    expected = clean_whitespc(expected, relax_whitespace)
+    expected = cleanup_timestamp(expected)
+
+    return result, expected
+
+#
+# Classes to be used by dynamic test generation from YAML
+#
+class CToKdocItem(GenerateKdocItem):
+    def setUp(self):
+        self.maxDiff = None
+
+    def run_parser_test(self, source, symbols, exports, fname):
+        if isinstance(symbols, dict):
+            symbols = [symbols]
+
+        if isinstance(exports, str):
+            exports=set([exports])
+        elif isinstance(exports, list):
+            exports=set(exports)
+
+        self.run_test(source, symbols, exports=exports,
+                      fname=fname, relax_whitespace=True)
+
+class KdocItemToMan(unittest.TestCase):
+    out_style = ManFormat()
+
+    def setUp(self):
+        self.maxDiff = None
+
+    def run_out_test(self, fname, symbols, expected):
+        """
+        Generate output using out_style,
+        """
+        result, expected = gen_output(fname, self.out_style,
+                                      symbols, expected)
+
+        self.assertEqual(result, expected)
+
+class KdocItemToRest(unittest.TestCase):
+    out_style = RestFormat()
+
+    def setUp(self):
+        self.maxDiff = None
+
+    def run_out_test(self, fname, symbols, expected):
+        """
+        Generate output using out_style,
+        """
+        result, expected = gen_output(fname, self.out_style, symbols,
+                                      expected, relax_whitespace=True)
+
+        self.assertEqual(result, expected)
+
+
+class CToMan(unittest.TestCase):
+    out_style = ManFormat()
+    config = MockKdocConfig()
+    xforms = CTransforms()
+
+    def setUp(self):
+        self.maxDiff = None
+
+    def run_out_test(self, fname, source, expected):
+        """
+        Generate output using out_style,
+        """
+        patcher = patch('builtins.open',
+                        new_callable=mock_open, read_data=source)
+
+        kernel_doc = KernelDoc(self.config, fname, self.xforms)
+
+        with patcher:
+            export_table, entries = kernel_doc.parse_kdoc()
+
+        result, expected = gen_output(fname, self.out_style,
+                                      entries, expected, config=self.config)
+
+        self.assertEqual(result, expected)
+
+
+class CToRest(unittest.TestCase):
+    out_style = RestFormat()
+    config = MockKdocConfig()
+    xforms = CTransforms()
+
+    def setUp(self):
+        self.maxDiff = None
+
+    def run_out_test(self, fname, source, expected):
+        """
+        Generate output using out_style,
+        """
+        patcher = patch('builtins.open',
+                        new_callable=mock_open, read_data=source)
+
+        kernel_doc = KernelDoc(self.config, fname, self.xforms)
+
+        with patcher:
+            export_table, entries = kernel_doc.parse_kdoc()
+
+        result, expected = gen_output(fname, self.out_style, entries,
+                                      expected, relax_whitespace=True,
+                                      config=self.config)
+
+        self.assertEqual(result, expected)
+
 
 #
-# Selttest class
+# Selftest class
 #
-class TestSelfValidate(KdocParser):
+class TestSelfValidate(GenerateKdocItem):
     """
-    Tests to check if logic inside KdocParser.run_test() is working.
+    Tests to check if logic inside GenerateKdocItem.run_test() is working.
     """
 
     SOURCE = """
@@ -147,16 +350,23 @@ class TestSelfValidate(KdocParser):
             'Description': 'Does nothing\n\n',
             'Return': '\nalways return 0.\n'
         },
+
+        'sections_start_lines': {
+            'Description': 4,
+            'Return': 7,
+        },
+
+        'parameterdescs': {'arg1': '@arg1 does nothing\n'},
+        'parameterlist': ['arg1'],
+        'parameterdesc_start_lines': {'arg1': 3},
+        'parametertypes': {'arg1': 'char *arg1'},
+
         'other_stuff': {
             'func_macro': False,
             'functiontype': 'int',
             'purpose': 'Exported function',
             'typedef': False
         },
-        'parameterdescs': {'arg1': '@arg1 does nothing\n'},
-        'parameterlist': ['arg1'],
-        'parameterdesc_start_lines': {'arg1': 3},
-        'parametertypes': {'arg1': 'char *arg1'},
     }]
 
     EXPORTS = {"function3"}
@@ -195,6 +405,128 @@ class TestSelfValidate(KdocParser):
         """
         self.run_test(self.SOURCE, [self.DEFAULT.copy()], self.EXPORTS)
 
+#
+# Class and logic to create dynamic tests from YAML
+#
+
+class KernelDocDynamicTests():
+    """
+    Dynamically create a set of tests from a YAML file.
+    """
+
+    @classmethod
+    def create_parser_test(cls, name, fname, source, symbols, exports):
+        """
+        Return a function that will be attached to the test class.
+        """
+        def test_method(self):
+            """Lambda-like function to run tests with provided vars"""
+            self.run_parser_test(source, symbols, exports, fname)
+
+        test_method.__name__ = f"test_gen_{name}"
+
+        setattr(CToKdocItem, test_method.__name__, test_method)
+
+    @classmethod
+    def create_out_test(cls, name, fname, symbols, out_type, data):
+        """
+        Return a function that will be attached to the test class.
+        """
+        def test_method(self):
+            """Lambda-like function to run tests with provided vars"""
+            self.run_out_test(fname, symbols, data)
+
+        test_method.__name__ = f"test_{out_type}_{name}"
+
+        if out_type == "man":
+            setattr(KdocItemToMan, test_method.__name__, test_method)
+        else:
+            setattr(KdocItemToRest, test_method.__name__, test_method)
+
+    @classmethod
+    def create_src2out_test(cls, name, fname, source, out_type, data):
+        """
+        Return a function that will be attached to the test class.
+        """
+        def test_method(self):
+            """Lambda-like function to run tests with provided vars"""
+            self.run_out_test(fname, source,  data)
+
+        test_method.__name__ = f"test_{out_type}_{name}"
+
+        if out_type == "man":
+            setattr(CToMan, test_method.__name__, test_method)
+        else:
+            setattr(CToRest, test_method.__name__, test_method)
+
+    @classmethod
+    def create_tests(cls):
+        """
+        Iterate over all scenarios and add a method to the class for each.
+
+        The logic in this function assumes a valid test that are compliant
+        with kdoc-test-schema.yaml. There is an unit test to check that.
+        As such, it picks mandatory values directly, and uses get() for the
+        optional ones.
+        """
+
+        with open(TEST_FILE, encoding="utf-8") as fp:
+            testset = yaml.safe_load(fp)
+
+        tests = testset["tests"]
+
+        for idx, test in enumerate(tests):
+            name = test["name"]
+            fname = test["fname"]
+            source = test["source"]
+            expected_list = test["expected"]
+
+            exports = test.get("exports", [])
+
+            #
+            # The logic below allows setting up to 5 types of test:
+            # 1. from source to kdoc_item: test KernelDoc class;
+            # 2. from kdoc_item to man: test ManOutput class;
+            # 3. from kdoc_item to rst: test RestOutput class;
+            # 4. from source to man without checking expected KdocItem;
+            # 5. from source to rst without checking expected KdocItem.
+            #
+            for expected in expected_list:
+                kdoc_item = expected.get("kdoc_item")
+                man = expected.get("man", [])
+                rst = expected.get("rst", [])
+
+                if kdoc_item:
+                    if isinstance(kdoc_item, dict):
+                        kdoc_item = [kdoc_item]
+
+                    symbols = []
+
+                    for arg in kdoc_item:
+                        arg["fname"] = fname
+                        arg["start_line"] = 1
+
+                        symbols.append(KdocItem.from_dict(arg))
+
+                    if source:
+                        cls.create_parser_test(name, fname, source,
+                                               symbols, exports)
+
+                    if man:
+                        cls.create_out_test(name, fname, symbols, "man", man)
+
+                    if rst:
+                        cls.create_out_test(name, fname, symbols, "rst", rst)
+
+                elif source:
+                    if man:
+                        cls.create_src2out_test(name, fname, source, "man", man)
+
+                    if rst:
+                        cls.create_src2out_test(name, fname, source, "rst", rst)
+
+KernelDocDynamicTests.create_tests()
+
 #
 # Run all tests
 #
-- 
2.53.0

