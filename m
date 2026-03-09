Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18F33DFC7F;
	Mon,  9 Mar 2026 16:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074886; cv=none; b=XY2NkyR8wLiUoQxmTqpAbxPpBtCT/XUTu73UOkFKVjBJab6MfvA4X4bgAFEJo7VNeM5AFt2QcG+LFR6SvD4RpW7n12mGtEuTY7M5fUzAmRTWUZGztcGDt7FMR5ijEd8rqmByO1CzQfzLmgCpmqYw1Jic7VdevWZZkvh2mQJeXpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074886; c=relaxed/simple;
	bh=w/naBW8NNuJGu7a0YYIA6roistwl+UTsYj4gxMVPhK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nypOhz4hr7ui2yYEmviiFWQ+Q0nrCSpI2Wx+pw5oF1M9bfwyi7qM0Zv7NAbSrijlpfYzG9cW3N1zcmzkmxDbSeqKiU1nwxJ5PrEuLdByb0n/G4XU+VLFuubfekmwCmR3ya0aCBW5jxRG+TfkyrQ29XVtMiOsggKHL2tPwgsDK6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTRVEpCI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTRVEpCI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E60C2BCAF;
	Mon,  9 Mar 2026 16:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773074886;
	bh=w/naBW8NNuJGu7a0YYIA6roistwl+UTsYj4gxMVPhK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CTRVEpCIFIhNse9dlicZMdqjU2Ucj1VHUfBa+dMGBjHk5xoxazvpc0ml9P/ArgpUp
	 9UGejAVvQluCtoUrWz6msSIkzvd828sCrpRProl3YRBZeZMdQHQhAphq7PT9JjCVQN
	 JOLIN5FYyAazCF9f9fpG49wLUDxHzsgVzS2sP8my+dWwRW3LLgyA/C9Ycum78RT1H/
	 h2wBzMrgfxjRCrWSfzo5vpTM2tC+7JvW//+MJrhJatMGEfMSOzbptcisEssC5P/9dm
	 pWLSUU1KUqjaSv/PnljTJhIIgu8LCrRRU9W4I1UiqMBQPLSGayl91cHlb4/ktGjnAC
	 3zOMzTpchTNUw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vzdm0-0000000BhfW-3ghd;
	Mon, 09 Mar 2026 17:48:04 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] unittests: test_private: modify it to use CTokenizer directly
Date: Mon,  9 Mar 2026 17:47:58 +0100
Message-ID: <2672257233ff73a9464c09b50924be51e25d4f59.1773074166.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773074166.git.mchehab+huawei@kernel.org>
References: <cover.1773074166.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Change the logic to use the tokenizer directly. This allows
adding more unit tests to check the validty of the tokenizer
itself.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../{test_private.py => test_tokenizer.py}    | 76 +++++++++++++------
 1 file changed, 52 insertions(+), 24 deletions(-)
 rename tools/unittests/{test_private.py => test_tokenizer.py} (85%)

diff --git a/tools/unittests/test_private.py b/tools/unittests/test_tokenizer.py
similarity index 85%
rename from tools/unittests/test_private.py
rename to tools/unittests/test_tokenizer.py
index eae245ae8a12..da0f2c4c9e21 100755
--- a/tools/unittests/test_private.py
+++ b/tools/unittests/test_tokenizer.py
@@ -15,20 +15,44 @@ from unittest.mock import MagicMock
 SRC_DIR = os.path.dirname(os.path.realpath(__file__))
 sys.path.insert(0, os.path.join(SRC_DIR, "../lib/python"))
 
-from kdoc.kdoc_parser import trim_private_members
+from kdoc.kdoc_re import CTokenizer
 from unittest_helper import run_unittest
 
+
+
 #
 # List of tests.
 #
 # The code will dynamically generate one test for each key on this dictionary.
 #
 
+def make_private_test(name, data):
+    """
+    Create a test named ``name`` using parameters given by ``data`` dict.
+    """
+
+    def test(self):
+        """In-lined lambda-like function to run the test"""
+        tokens = CTokenizer(data["source"])
+        result = str(tokens)
+
+        #
+        # Avoid whitespace false positives
+        #
+        result = re.sub(r"\s++", " ", result).strip()
+        expected = re.sub(r"\s++", " ", data["trimmed"]).strip()
+
+        msg = f"failed when parsing this source:\n{data['source']}"
+        self.assertEqual(result, expected, msg=msg)
+
+    return test
+
 #: Tests to check if CTokenizer is handling properly public/private comments.
 TESTS_PRIVATE = {
     #
     # Simplest case: no private. Ensure that trimming won't affect struct
     #
+    "__run__": make_private_test,
     "no private": {
         "source": """
             struct foo {
@@ -288,41 +312,45 @@ TESTS_PRIVATE = {
     },
 }
 
+#: Dict containing all test groups fror CTokenizer
+TESTS = {
+    "TestPublicPrivate": TESTS_PRIVATE,
+}
 
-class TestPublicPrivate(unittest.TestCase):
-    """
-    Main test class. Populated dynamically at runtime.
-    """
+def setUp(self):
+    self.maxDiff = None
 
-    def setUp(self):
-        self.maxDiff = None
+def build_test_class(group_name, table):
+    """
+    Dynamically creates a class instance using type() as a generator
+    for a new class derivated from unittest.TestCase.
 
-    def add_test(cls, name, source, trimmed):
-        """
-        Dynamically add a test to the class
-        """
-        def test(cls):
-            result = trim_private_members(source)
+    We're opting to do it inside a function to avoid the risk of
+    changing the globals() dictionary.
+    """
 
-            result = re.sub(r"\s++", " ", result).strip()
-            expected = re.sub(r"\s++", " ", trimmed).strip()
+    class_dict = {
+        "setUp": setUp
+    }
 
-            msg = f"failed when parsing this source:\n" + source
+    run = table["__run__"]
 
-            cls.assertEqual(result, expected, msg=msg)
+    for test_name, data in table.items():
+        if test_name == "__run__":
+            continue
 
-        test.__name__ = f'test {name}'
+        class_dict[f"test_{test_name}"] = run(test_name, data)
 
-        setattr(TestPublicPrivate, test.__name__, test)
+    cls = type(group_name, (unittest.TestCase,), class_dict)
 
+    return cls.__name__, cls
 
 #
-# Populate TestPublicPrivate class
+# Create classes and add them to the global dictionary
 #
-test_class = TestPublicPrivate()
-for name, test in TESTS_PRIVATE.items():
-    test_class.add_test(name, test["source"], test["trimmed"])
-
+for group, table in TESTS.items():
+    t = build_test_class(group, table)
+    globals()[t[0]] = t[1]
 
 #
 # main
-- 
2.52.0

