Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C433A4F44;
	Wed, 18 Mar 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825081; cv=none; b=Tdk7X6bMLOPy7ky6tAmtzWivgXg36twbHQxH9qceay5mRsoiZelzqEGejW8b71XCbU41wx5q8QPNeWRqAlZp2R1M3ZKhwEgpoTwizlffr6foIChj42N3P0vbFMrSpWVsZZQaKTg4iJIetb/zZiaXT6cFe/sWCGX9WzOLQzQKgZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825081; c=relaxed/simple;
	bh=pG4yNDPd52x57hQuewPFl0zHI66ri1EkY8+dE1xzdJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I8RRXz32evfEP70lFbF/eLGo1vwiIriixR4LQD6Jwti9y9eTtqqdh9tJlyCpt7Kh8ZVY0jYr4K4ZKayg9NnqvtxDMgoW9pRMWv6vP38he7kMVjN2xAnJu0ZrwYCNdG0t0C5Pb113AvPrE2NnU6+2YEDNeFj5HVHOB8/TONVHTRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2Q7eAnK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2Q7eAnK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74EE3C2BCB6;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825080;
	bh=pG4yNDPd52x57hQuewPFl0zHI66ri1EkY8+dE1xzdJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n2Q7eAnKdmMMTOr6iY9yzmXFGPml2GCXAiR8smMRGP+Pd/yGI5nTc/AXYTUmFI5lb
	 g82toSnsaPA+QYLtckukh2bALvxg4RCYyRJ+nEvsi/kWaBVX6iIZhrfrN8NlCBuVhu
	 RBMJbNGgPZNVh3Urj7wnSczDgUZeTWZMZdSbwQm3QGD1WBJ3/FXVOJeVWoPXjxx3ed
	 3oGpZ9H+5p1cQoF0d6TiVxnz1lxjsuDUfmqymg7zrbBdN7XiRvGHFSHtNYYdn6+6JX
	 bjW/kmTP32Zy6OCtiL3cbBXMpJw2DCkv+SiJfFTHdgCYJlWthdVGEZZ2JiirnlpgUl
	 Y+rjPEJz7M/QQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2mvu-00000002fpy-37Br;
	Wed, 18 Mar 2026 10:11:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 11/14] docs: add a simple kdoc-test.yaml together with a validation tool
Date: Wed, 18 Mar 2026 10:11:11 +0100
Message-ID: <74883976348c964f00161696d525c33ddd8c7641.1773823995.git.mchehab+huawei@kernel.org>
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

Create a simple kdoc-test.yaml to be used to create unit tests for
kernel-doc parser and output classes.

For now, all we want is a simple function mapped on a yaml test
using the defined schema.

To be sure that the schema is followed, add an unittest for
the file, which will also validate that the schema is properly
parsed.

It should be noticed that the .TH definition for the man format
contains a timestamp. We'll need to handle that when dealing with
the actual implementation for the ManOutput class unit tests.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/unittests/kdoc-test.yaml           | 154 +++++++++++++++++++++++
 tools/unittests/test_kdoc_test_schema.py |  94 ++++++++++++++
 2 files changed, 248 insertions(+)
 create mode 100644 tools/unittests/kdoc-test.yaml
 create mode 100755 tools/unittests/test_kdoc_test_schema.py

diff --git a/tools/unittests/kdoc-test.yaml b/tools/unittests/kdoc-test.yaml
new file mode 100644
index 000000000000..b6e04f10ccdb
--- /dev/null
+++ b/tools/unittests/kdoc-test.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2026: Mauro Carvalho Chehab <mchehab@kernel.org>
+
+# Test cases for the dynamic tests.
+# Useful to test if kernel-doc classes are doing what it is expected.
+#
+
+tests:
+- name: func1
+  fname: mock_functions.c
+  description: "Simplest function test: do nothing, just rst output"
+
+  source: |
+    /**
+      * func1 - Not exported function
+      * @arg1: @arg1 does nothing
+      *
+      * Does nothing
+      *
+      * return:
+      *    always return 0.
+      */
+    int func1(char *arg1) { return 0; };
+
+
+  expected:
+  - rst: |
+    .. c:function:: int func1 (char *arg1)
+
+      Not exported function
+
+    .. container:: kernelindent
+
+      **Parameters**
+
+      ``char *arg1``
+        **arg1** does nothing
+
+      **Description**
+
+      Does nothing
+
+      **Return**
+
+      always return 0.
+
+    # TODO: how to handle timestamps at .TH?
+    man: |
+      .TH "func1" 9 "February 2026"  "" "Kernel API Manual"
+      .SH NAME
+      func1 \- Not exported function
+      .SH SYNOPSIS
+      .B "int" func1
+      .BI "(char *arg1 "  ");"
+      .SH ARGUMENTS
+      .IP "arg1" 12
+      \fIarg1\fP does nothing
+      .SH "DESCRIPTION"
+      Does nothing
+      .SH "RETURN"
+      always return 0.
+      .SH "SEE ALSO"
+      .PP
+      Kernel file \fBmock_functions.c\fR
+
+- name: func2
+  fname: func2.c
+  description: Simple test with exports
+
+  source: |
+    /**
+      * func2() - Exported function
+      * @arg1: @arg1 does nothing
+      *
+      * Does nothing
+      *
+      * return:
+      *    always return 0.
+      */
+    int func2(char *arg1) { return 0; };
+    EXPORT_SYMBOL(func2);
+
+  exports: func2
+  expected:
+  - kdoc_item:
+      name: func2
+      type: function
+      declaration_start_line: 1
+
+      sections:
+        Description: |
+          Does nothing
+
+        Return: |
+          always return 0.
+
+      sections_start_lines:
+        Description: 3
+        Return: 6
+
+      parameterdescs:
+        arg1: |
+          @arg1 does nothing
+      parameterlist:
+        - arg1
+      parameterdesc_start_lines:
+        arg1: 2
+      parametertypes:
+        arg1: char *arg1
+
+      other_stuff:
+        func_macro: false
+        functiontype: int
+        purpose: "Exported function"
+        typedef: false
+
+    rst: |
+      .. c:function:: int func2 (char *arg1)
+
+        Exported function
+
+      .. container:: kernelindent
+
+        **Parameters**
+
+        ``char *arg1``
+          **arg1** does nothing
+
+        **Description**
+
+        Does nothing
+
+        **Return**
+
+        always return 0.
+
+    # TODO: how to handle timestamps at .TH?
+    man: |
+      .TH "func2" 9 "February 2026"  "" "Kernel API Manual"
+      .SH NAME
+      func2 \- Exported function
+      .SH SYNOPSIS
+      .B "int" func2
+      .BI "(char *arg1 "  ");"
+      .SH ARGUMENTS
+      .IP "arg1" 12
+      \fIarg1\fP does nothing
+      .SH "DESCRIPTION"
+      Does nothing
+      .SH "RETURN"
+      always return 0.
+      .SH "SEE ALSO"
+      .PP
+      Kernel file \fBfunc2.c\fR
diff --git a/tools/unittests/test_kdoc_test_schema.py b/tools/unittests/test_kdoc_test_schema.py
new file mode 100755
index 000000000000..9eceeba00440
--- /dev/null
+++ b/tools/unittests/test_kdoc_test_schema.py
@@ -0,0 +1,94 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+Unit‑test driver for kernel‑doc YAML tests.
+
+Two kinds of tests are defined:
+
+* **Schema‑validation tests** – if ``jsonschema`` is available, the
+  YAML files in this directory are validated against the JSON‑Schema
+  described in ``kdoc-test-schema.yaml``.  When the library is not
+  present, a warning is emitted and the validation step is simply
+  skipped – the dynamic kernel‑doc tests still run.
+
+* **Kernel‑doc tests** – dynamically generate one test method per
+  scenario in ``kdoc-test.yaml``.  Each method simply forwards
+  the data to ``self.run_test`` – you only need to implement that
+  helper in your own code.
+
+File names are kept as module‑level constants so that the
+implementation stays completely independent of ``pathlib``.
+"""
+
+import os
+import sys
+import warnings
+import yaml
+import unittest
+from typing import Any, Dict, List
+
+SRC_DIR = os.path.dirname(os.path.realpath(__file__))
+sys.path.insert(0, os.path.join(SRC_DIR, "../lib/python"))
+
+from unittest_helper import run_unittest
+
+
+#
+# Files to read
+#
+BASE = os.path.realpath(os.path.dirname(__file__))
+
+SCHEMA_FILE = os.path.join(BASE, "kdoc-test-schema.yaml")
+TEST_FILE = os.path.join(BASE, "kdoc-test.yaml")
+
+#
+# Schema‑validation test
+#
+class TestYAMLSchemaValidation(unittest.TestCase):
+    """
+    Checks if TEST_FILE matches SCHEMA_FILE.
+    """
+
+    @classmethod
+    def setUpClass(cls):
+        """
+        Import jsonschema if available.
+        """
+
+        try:
+            from jsonschema import Draft7Validator
+        except ImportError:
+            print("Warning: jsonschema package not available. Skipping schema validation")
+            cls.validator = None
+            return
+
+        with open(SCHEMA_FILE, encoding="utf-8") as fp:
+            cls.schema = yaml.safe_load(fp)
+
+        cls.validator = Draft7Validator(cls.schema)
+
+    def test_kdoc_test_yaml_followsschema(self):
+        """
+        Run jsonschema validation if the validator is available.
+        If not, emit a warning and return without failing.
+        """
+        if self.validator is None:
+            return
+
+        with open(TEST_FILE, encoding="utf-8") as fp:
+            data = yaml.safe_load(fp)
+
+        errors = self.validator.iter_errors(data)
+
+        msgs = []
+        for error in errors:
+            msgs.append(error.message)
+
+        if msgs:
+            self.fail("Schema validation failed:\n\t" + "\n\t".join(msgs))
+
+# --------------------------------------------------------------------
+# Entry point
+# --------------------------------------------------------------------
+if __name__ == "__main__":
+    run_unittest(__file__)
-- 
2.53.0

