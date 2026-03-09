Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E0F3E7162;
	Mon,  9 Mar 2026 16:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074887; cv=none; b=pSoS+5GO993ALZjABCMcs+W6PYVQpZGrSdfPxRRboOJXXOQN1MQq7RpDnXoXxuFoD/OTcseaFbrbuEQPgb8xy4IhvDoVUohUX60394wAFInKU2mBR2m2y3Crn8+Cc2Y+4rGKCUX2rw/tQvDOQKvzgryewlFBxOaU7hvkOMAYTXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074887; c=relaxed/simple;
	bh=tRQ5UQGeY6yZl7zSl8udBzbIceMvjBuqhB3obUBrnHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R9xe/Ib4vYWMf9V9WKKmCUFtMKtR7UrBtwP+sSUDCb23cCon7VhIII0H8YZwNn8acynpnnpARNrf+2aK7PofDqwB6Nri8XF52RjSzmdIPYwJX/JLuLQaGu0xroYxGkWeMEIIyV7yKhflDT4OaX0XEi7SIkHxlSsLV/hyqWae70M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vdml6zpI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vdml6zpI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AE8C2BC9E;
	Mon,  9 Mar 2026 16:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773074886;
	bh=tRQ5UQGeY6yZl7zSl8udBzbIceMvjBuqhB3obUBrnHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vdml6zpIS+fXR4Y0izsY0Fr4ffRrjA1ohyPRxsR8UxljTvLA2pHeAiy7YoFgXzR1u
	 JYK0DLCZ9UDSuC99aM6HOxgBLNoZYr4XIvss5R9/6PtFKy70F+quBo5o0orwx77ikA
	 S6SpFpXmVgpHndDdjuJqTRO05QytPjNBOFJJUiZVrt0HyoMM109ACKmnpX1RSQn3t2
	 r5Ui9/iDkWVOyRGd0vBj9IkdjSXibIifijy0tytKqMK4B46cSMjWp6VhVwHRb/v5qe
	 tdlYrmQF60XKcQaN1K6R7zMZv+sAEzXzCBFz4Q+hprhYTpX/9CI8D4n7ekv2cbME1E
	 h0ZPsqtbbTRCQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vzdm1-0000000Bhgm-0I3m;
	Mon, 09 Mar 2026 17:48:05 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 8/8] unittests: test_tokenizer: check if the tokenizer works
Date: Mon,  9 Mar 2026 17:47:59 +0100
Message-ID: <50a4be47b52450aed9f9228e06fef39df52a3dbf.1773074166.git.mchehab+huawei@kernel.org>
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

Add extra tests to check if the tokenizer is working properly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_re.py  |   4 +-
 tools/unittests/test_tokenizer.py | 109 +++++++++++++++++++++++++++++-
 2 files changed, 108 insertions(+), 5 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_re.py b/tools/lib/python/kdoc/kdoc_re.py
index 7bed4e9a8810..b4e1a2dbdcc2 100644
--- a/tools/lib/python/kdoc/kdoc_re.py
+++ b/tools/lib/python/kdoc/kdoc_re.py
@@ -194,8 +194,8 @@ class CToken():
 
         return CToken.MISMATCH
 
-    def __init__(self, kind, value, pos,
-                 brace_level, paren_level, bracket_level):
+    def __init__(self, kind, value=None, pos=0,
+                 brace_level=0, paren_level=0, bracket_level=0):
         self.kind = kind
         self.value = value
         self.pos = pos
diff --git a/tools/unittests/test_tokenizer.py b/tools/unittests/test_tokenizer.py
index da0f2c4c9e21..0955facad736 100755
--- a/tools/unittests/test_tokenizer.py
+++ b/tools/unittests/test_tokenizer.py
@@ -15,16 +15,118 @@ from unittest.mock import MagicMock
 SRC_DIR = os.path.dirname(os.path.realpath(__file__))
 sys.path.insert(0, os.path.join(SRC_DIR, "../lib/python"))
 
-from kdoc.kdoc_re import CTokenizer
+from kdoc.kdoc_re import CToken, CTokenizer
 from unittest_helper import run_unittest
 
-
-
 #
 # List of tests.
 #
 # The code will dynamically generate one test for each key on this dictionary.
 #
+def tokens_to_list(tokens):
+    tuples = []
+
+    for tok in tokens:
+        if tok.kind == CToken.SPACE:
+            continue
+
+        tuples += [(tok.kind, tok.value,
+                    tok.brace_level, tok.paren_level, tok.bracket_level)]
+
+    return tuples
+
+
+def make_tokenizer_test(name, data):
+    """
+    Create a test named ``name`` using parameters given by ``data`` dict.
+    """
+
+    def test(self):
+        """In-lined lambda-like function to run the test"""
+
+        #
+        # Check if exceptions are properly handled
+        #
+        if "raises" in data:
+            with self.assertRaises(data["raises"]):
+                CTokenizer(data["source"])
+            return
+
+        #
+        # Check if tokenizer is producing expected results
+        #
+        tokens = CTokenizer(data["source"]).tokens
+
+        result = tokens_to_list(tokens)
+        expected = tokens_to_list(data["expected"])
+
+        self.assertEqual(result, expected, msg=f"{name}")
+
+    return test
+
+#: Tokenizer tests.
+TESTS_TOKENIZER = {
+    "__run__": make_tokenizer_test,
+
+    "basic_tokens": {
+        "source": """
+            int a; // comment
+            float b = 1.23;
+        """,
+        "expected": [
+            CToken(CToken.NAME, "int"),
+            CToken(CToken.NAME, "a"),
+            CToken(CToken.PUNC, ";"),
+            CToken(CToken.COMMENT, "// comment"),
+            CToken(CToken.NAME, "float"),
+            CToken(CToken.NAME, "b"),
+            CToken(CToken.OP, "="),
+            CToken(CToken.NUMBER, "1.23"),
+            CToken(CToken.PUNC, ";"),
+        ],
+    },
+
+    "depth_counters": {
+        "source": """
+            struct X {
+                int arr[10];
+                func(a[0], (b + c));
+            }
+        """,
+        "expected": [
+            CToken(CToken.STRUCT, "struct"),
+            CToken(CToken.NAME, "X"),
+            CToken(CToken.BEGIN, "{", brace_level=1),
+
+            CToken(CToken.NAME, "int", brace_level=1),
+            CToken(CToken.NAME, "arr", brace_level=1),
+            CToken(CToken.BEGIN, "[", brace_level=1, bracket_level=1),
+            CToken(CToken.NUMBER, "10", brace_level=1, bracket_level=1),
+            CToken(CToken.END, "]", brace_level=1),
+            CToken(CToken.PUNC, ";", brace_level=1),
+            CToken(CToken.NAME, "func", brace_level=1),
+            CToken(CToken.BEGIN, "(", brace_level=1, paren_level=1),
+            CToken(CToken.NAME, "a", brace_level=1, paren_level=1),
+            CToken(CToken.BEGIN, "[", brace_level=1, paren_level=1, bracket_level=1),
+            CToken(CToken.NUMBER, "0", brace_level=1, paren_level=1, bracket_level=1),
+            CToken(CToken.END, "]", brace_level=1, paren_level=1),
+            CToken(CToken.PUNC, ",", brace_level=1, paren_level=1),
+            CToken(CToken.BEGIN, "(", brace_level=1, paren_level=2),
+            CToken(CToken.NAME, "b", brace_level=1, paren_level=2),
+            CToken(CToken.OP, "+", brace_level=1, paren_level=2),
+            CToken(CToken.NAME, "c", brace_level=1, paren_level=2),
+            CToken(CToken.END, ")", brace_level=1, paren_level=1),
+            CToken(CToken.END, ")", brace_level=1),
+            CToken(CToken.PUNC, ";", brace_level=1),
+            CToken(CToken.END, "}"),
+        ],
+    },
+
+    "mismatch_error": {
+        "source": "int a$ = 5;",          # $ is illegal
+        "raises": RuntimeError,
+    },
+}
 
 def make_private_test(name, data):
     """
@@ -315,6 +417,7 @@ TESTS_PRIVATE = {
 #: Dict containing all test groups fror CTokenizer
 TESTS = {
     "TestPublicPrivate": TESTS_PRIVATE,
+    "TestTokenizer": TESTS_TOKENIZER,
 }
 
 def setUp(self):
-- 
2.52.0

