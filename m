Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B2E3A4F4B;
	Wed, 18 Mar 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825081; cv=none; b=bPqboPwdp9UQtcEdIpg7GV8NKkmbttgiy58EUImjxUgka8qEGKJ1mCS+yeF1ekDgySTcDKidtank2W2OfnuH/7sAedtbxqpYKZk04/2gp1JIZRdKX7KihBHUEAqP5IMXVFkKY1bG5VJ+CmPnARpM8lgmAaKPKBL2rXjMk0MkGeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825081; c=relaxed/simple;
	bh=+LuCPjCencCh9Cs3UwkM42H1Wvio+AUTLkCST6A38F8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cKEc3khjBqCl6ZVhPJRdABEpsTExm2+AyqjUnHFkHduQBIATI+wd8/yKSW5MS7Ask7u88G2FfGRWmSKwpkvjJ8sJYTv+s3R9sJyt6AVpZsQVOo/JHXWYrUREAbtfrh+OQhX+wwTOVgoJcUt1Jc0kl4Z3zX/rC3/7VGTrIb5mM0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5ymZDMY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5ymZDMY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 715C0C2BCB7;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825080;
	bh=+LuCPjCencCh9Cs3UwkM42H1Wvio+AUTLkCST6A38F8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G5ymZDMYCAWKEom3QCcGq90Fsrf4HcMpPzz9HvFW/UKSZ6MZ7azRx9KVL+YlIMhfs
	 jzsQr34W15Icm6P/B92rGLb9ZC5fXdDw5ijmApnUajbpD8kILKzO/kTOSye6z7GBNi
	 vn1WNsfomSFHcc9xANox5MIcEl0BlcPxgLVCShr1yX5Zt2jND286wPDujXlJIKFFDe
	 AfRm/VVwODns15LXUwL8zm2rsY9f32ZKMNIYRsTvNfQsAjRArxwe5rl/MyQ8nyJ2oZ
	 H1JnLpqPAMYOO3mbUddVScgHHZL50JPxrsGQVbEbISbiUzjUecDNTDwLFB3Vw+Epk2
	 QSO5aFtaP+5VA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2mvu-00000002fpq-2sJj;
	Wed, 18 Mar 2026 10:11:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 09/14] docs: unittests: add a parser to test kernel-doc parser logic
Date: Wed, 18 Mar 2026 10:11:09 +0100
Message-ID: <8d91bfabd69de7aa44a0f5080ccb01aa41957e6d.1773823995.git.mchehab+huawei@kernel.org>
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

Validating that kernel-doc is parsing data properly is tricky.

Add an unittest skeleton that alllows passing a source code
and check if the corresponding values of export_table and
entries returned by the parser are properly filled.

It works by mocking a file input with the contents of a source
string, an comparing if:

	- exports set matches;
	- expected KernelItem entries match.

Create a new TestSelfValidate meant to check if the logic
inside KdocParser.run_test() does its job of checking for
differences inside KdocItem.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/unittests/test_kdoc_parser.py | 202 ++++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)
 create mode 100755 tools/unittests/test_kdoc_parser.py

diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
new file mode 100755
index 000000000000..26f74666a000
--- /dev/null
+++ b/tools/unittests/test_kdoc_parser.py
@@ -0,0 +1,202 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+# Copyright(c) 2026: Mauro Carvalho Chehab <mchehab@kernel.org>.
+#
+# pylint: disable=C0200,C0413,W0102,R0914
+
+"""
+Unit tests for kernel-doc parser.
+"""
+
+import os
+import unittest
+import re
+import sys
+
+from textwrap import dedent
+from unittest.mock import patch, MagicMock, mock_open
+
+SRC_DIR = os.path.dirname(os.path.realpath(__file__))
+sys.path.insert(0, os.path.join(SRC_DIR, "../lib/python"))
+
+from kdoc.kdoc_parser import KernelDoc
+from kdoc.kdoc_item import KdocItem
+from kdoc.xforms_lists import CTransforms
+from unittest_helper import run_unittest
+
+#: Regex to help cleaning whitespaces
+RE_WHITESPC = re.compile(r"\s++")
+
+def clean_whitespc(val, relax_whitespace=False):
+    """
+    Cleanup whitespaces to avoid false positives.
+
+    By default, strip only bein/end whitespaces, but, when relax_whitespace
+    is true, also replace multiple whitespaces in the middle.
+    """
+
+    if isinstance(val, str):
+        val = val.strip()
+        if relax_whitespace:
+            val = RE_WHITESPC.sub("", val)
+    elif isinstance(val, list):
+        val = [clean_whitespc(item, relax_whitespace) for item in val]
+    elif isinstance(val, dict):
+        val = {k: clean_whitespc(v, relax_whitespace) for k, v in val.items()}
+    return val
+
+#
+# Helper class to help mocking with
+#
+class KdocParser(unittest.TestCase):
+    """
+    Base class to run KernelDoc parser class
+    """
+
+    DEFAULT = vars(KdocItem("", "", "", 0))
+
+    def setUp(self):
+        self.maxDiff = None
+        self.config = MagicMock()
+        self.config.log = MagicMock()
+        self.config.log.debug = MagicMock()
+        self.xforms = CTransforms()
+
+
+    def run_test(self, source, __expected_list, exports={}, fname="test.c",
+                 relax_whitespace=False):
+        """
+        Stores expected values and patch the test to use source as
+        a "file" input.
+        """
+        debug_level = int(os.getenv("VERBOSE", "0"))
+        source = dedent(source)
+
+        # Ensure that default values will be there
+        expected_list = []
+        for e in __expected_list:
+            new_e = self.DEFAULT.copy()
+            new_e["fname"] = fname
+            for key, value in e.items():
+                new_e[key] = value
+
+            expected_list.append(new_e)
+
+        patcher = patch('builtins.open',
+                        new_callable=mock_open, read_data=source)
+
+        kernel_doc = KernelDoc(self.config, fname, self.xforms)
+
+        with patcher:
+            export_table, entries = kernel_doc.parse_kdoc()
+
+            self.assertEqual(export_table, exports)
+            self.assertEqual(len(entries), len(expected_list))
+
+            for i in range(0, len(entries)):
+
+                entry = entries[i]
+                expected = expected_list[i]
+                self.assertNotEqual(expected, None)
+                self.assertNotEqual(expected, {})
+                self.assertIsInstance(entry, KdocItem)
+
+                d = vars(entry)
+                for key, value in expected.items():
+                    result = clean_whitespc(d[key], relax_whitespace)
+                    value = clean_whitespc(value, relax_whitespace)
+
+                    if debug_level > 1:
+                        sys.stderr.write(f"{key}: assert('{result}' == '{value}')\n")
+
+                    self.assertEqual(result, value, msg=f"at {key}")
+
+
+#
+# Selttest class
+#
+class TestSelfValidate(KdocParser):
+    """
+    Tests to check if logic inside KdocParser.run_test() is working.
+    """
+
+    SOURCE = """
+        /**
+         * function3: Exported function
+         * @arg1: @arg1 does nothing
+         *
+         * Does nothing
+         *
+         * return:
+         *    always return 0.
+         */
+        int function3(char *arg1) { return 0; };
+        EXPORT_SYMBOL(function3);
+    """
+
+    EXPECTED = [{
+        'name': 'function3',
+        'type': 'function',
+        'declaration_start_line': 2,
+
+        'sections_start_lines': {
+            'Description': 4,
+            'Return': 7,
+        },
+        'sections': {
+            'Description': 'Does nothing\n\n',
+            'Return': '\nalways return 0.\n'
+        },
+        'other_stuff': {
+            'func_macro': False,
+            'functiontype': 'int',
+            'purpose': 'Exported function',
+            'typedef': False
+        },
+        'parameterdescs': {'arg1': '@arg1 does nothing\n'},
+        'parameterlist': ['arg1'],
+        'parameterdesc_start_lines': {'arg1': 3},
+        'parametertypes': {'arg1': 'char *arg1'},
+    }]
+
+    EXPORTS = {"function3"}
+
+    def test_parse_pass(self):
+        """
+        Test if export_symbol is properly handled.
+        """
+        self.run_test(self.SOURCE, self.EXPECTED, self.EXPORTS)
+
+    @unittest.expectedFailure
+    def test_no_exports(self):
+        """
+        Test if export_symbol is properly handled.
+        """
+        self.run_test(self.SOURCE, [], {})
+
+    @unittest.expectedFailure
+    def test_with_empty_expected(self):
+        """
+        Test if export_symbol is properly handled.
+        """
+        self.run_test(self.SOURCE, [], self.EXPORTS)
+
+    @unittest.expectedFailure
+    def test_with_unfilled_expected(self):
+        """
+        Test if export_symbol is properly handled.
+        """
+        self.run_test(self.SOURCE, [{}], self.EXPORTS)
+
+    @unittest.expectedFailure
+    def test_with_default_expected(self):
+        """
+        Test if export_symbol is properly handled.
+        """
+        self.run_test(self.SOURCE, [self.DEFAULT.copy()], self.EXPORTS)
+
+#
+# Run all tests
+#
+if __name__ == "__main__":
+    run_unittest(__file__)
-- 
2.53.0

