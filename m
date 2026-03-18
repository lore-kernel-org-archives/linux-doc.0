Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5C83A5E8F;
	Wed, 18 Mar 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825081; cv=none; b=MDSc/Yatm6a86LfQmYiEoIrmWBK9v9bEhuYHX3rZPVGvfOP5ImAYZf6rimOzvSL5ub+lhrWO9JMwQMuGg1ljA5MdbVBCmRBqndbKGX1DbTiS8lDcsyOFONnYramVWHlbht7wmDFFUowRXCnxbjwi3JPqhJTQnYG1yb4xFmOaj6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825081; c=relaxed/simple;
	bh=x+z0BOd8CUTKW/M8RsgH8506TTiWFSWuiqgXODs0fGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n3H6H9YC7yBZ/BDZ4ERrygdjoyuYlOBRAIdGoYWeLncFQ9gxd/lp0XPpPaAfCZzSCRWulLieuegaXqkC4819A6p7nK7rhpXAtYmQyHCKj4Ira+5iY/JMlmtg8zz6fFjTDHONQGQF19GVx81bqISgHld3NBR401MhUwKFkpHf5Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMA3nYgB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMA3nYgB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C10C2BCF7;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825080;
	bh=x+z0BOd8CUTKW/M8RsgH8506TTiWFSWuiqgXODs0fGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QMA3nYgBKJOTGvhxKjIExIXFbLCffxkYWyKPm8RVzJV+en4VbXAzioz2F7lZ0WCHS
	 ftEsT3K+CVvZtx48yOGD7zIo6BhR2o4iS17aJ2IA+Aj5s/ilTCklugoI40yr9kWJMc
	 2nU4mV7NtV8FRVFEGaJ9m61RqXRi6alrgYCD+LvNJAqJPbUUwnUt0Zemtmk1wDoGrJ
	 5IrOIkVmSHDXUEikq0ixFrtScY3QSBGP0SvljeVlCQr0tMp9wfYlWuqTRF7ciVmkox
	 7fhMk9VMCwu7FLECSnmBuzqTsQYBxnmxPBUDyKZdkcR3i4EZ0s7Q7eYOTjYkZPUops
	 mqPCrhgKYTKmg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2mvu-00000002fq6-3LVu;
	Wed, 18 Mar 2026 10:11:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 13/14] docs: add a new file to write kernel-doc output to a YAML file
Date: Wed, 18 Mar 2026 10:11:13 +0100
Message-ID: <5d084ca1a91f6a620534a1135d1b8183d934319a.1773823995.git.mchehab+huawei@kernel.org>
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

Storing kernel-doc output is helpful to allow debugging problems
on it and to preparate unit tests.

Add a class to store such contents at the same format as defined
at kdoc-test-schema.yaml.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_yaml_file.py | 155 ++++++++++++++++++++++++
 1 file changed, 155 insertions(+)
 create mode 100644 tools/lib/python/kdoc/kdoc_yaml_file.py

diff --git a/tools/lib/python/kdoc/kdoc_yaml_file.py b/tools/lib/python/kdoc/kdoc_yaml_file.py
new file mode 100644
index 000000000000..db131503c3f6
--- /dev/null
+++ b/tools/lib/python/kdoc/kdoc_yaml_file.py
@@ -0,0 +1,155 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+# Copyright(c) 2026: Mauro Carvalho Chehab <mchehab@kernel.org>.
+
+import os
+
+from kdoc.kdoc_output import ManFormat, RestFormat
+
+
+class KDocTestFile():
+    """
+    Handles the logic needed to store kernel‑doc output inside a YAML file.
+     Useful for unit tests and regression tests.
+    """
+
+    def __init__(self, config, yaml_file, yaml_content):
+        #
+        # Bail out early if yaml is not available
+        #
+        try:
+            import yaml
+        except ImportError:
+            sys.exit("Warning: yaml package not available. Aborting it.")
+
+        self.config = config
+        self.test_file = os.path.expanduser(yaml_file)
+        self.yaml_content = yaml_content
+
+        self.tests = []
+
+        out_dir = os.path.dirname(self.test_file)
+        if out_dir and not os.path.isdir(out_dir):
+            sys.exit(f"Directory {out_dir} doesn't exist.")
+
+        self.out_style = []
+
+        if "man" in self.yaml_content:
+            out_style = ManFormat()
+            out_style.set_config(self.config)
+
+            self.out_style.append(out_style)
+
+        if "rst" in self.yaml_content:
+            out_style = RestFormat()
+            out_style.set_config(self.config)
+
+            self.out_style.append(out_style)
+
+    def set_filter(self, export, internal, symbol, nosymbol,
+                   function_table, enable_lineno, no_doc_sections):
+        """
+        Set filters at the output classes.
+        """
+        for out_style in self.out_style:
+            out_style.set_filter(export, internal, symbol,
+                                 nosymbol, function_table,
+                                 enable_lineno, no_doc_sections)
+
+    @staticmethod
+    def get_kdoc_item(arg, start_line=1):
+
+        d = vars(arg)
+
+        declaration_start_line = d.get("declaration_start_line")
+        if not declaration_start_line:
+            return d
+
+        d["declaration_start_line"] = start_line
+
+        parameterdesc_start_lines = d.get("parameterdesc_start_lines")
+        if parameterdesc_start_lines:
+            for key in parameterdesc_start_lines:
+                ln = parameterdesc_start_lines[key]
+                ln += start_line - declaration_start_line
+
+                parameterdesc_start_lines[key] = ln
+
+        sections_start_lines = d.get("sections_start_lines")
+        if sections_start_lines:
+            for key in sections_start_lines:
+                ln = sections_start_lines[key]
+                ln += start_line - declaration_start_line
+
+                sections_start_lines[key] = ln
+
+        return d
+
+    def output_symbols(self, fname, symbols, source):
+        """
+        Store source, symbols and output strings at self.tests.
+        """
+
+        #
+        # KdocItem needs to be converted into dicts
+        #
+        kdoc_item = []
+        expected = []
+
+        if not symbols and not source:
+            return
+
+        if not source or len(symbols) != len(source):
+            print(f"Warning: lengths are different. Ignoring {fname}")
+
+            # Folding without line numbers is too hard.
+            # The right thing to do here to proceed would be to delete
+            # not-handled source blocks, as len(source) should be bigger
+            # than len(symbols)
+            return
+
+        base_name = "test_" + fname.replace(".", "_").replace("/", "_")
+        expected_dict = {}
+        start_line=1
+
+        for i in range(0, len(symbols)):
+            arg = symbols[i]
+
+            if "KdocItem" in self.yaml_content:
+                msg = self.get_kdoc_item(arg)
+
+                expected_dict["kdoc_item"] = msg
+
+            for out_style in self.out_style:
+                if isinstance(out_style, ManFormat):
+                    key = "man"
+                else:
+                    key = "rst"
+
+                expected_dict[key]= out_style.output_symbols(fname, [arg])
+
+            name = f"{base_name}_{i:03d}"
+
+            test = {
+                "name": name,
+                "description": f"{fname} line {source[i]["ln"]}",
+                "fname": fname,
+                "source": source[i]["data"],
+                "expected": [expected_dict]
+            }
+
+            self.tests.append(test)
+
+            expected_dict = {}
+
+    def write(self):
+        """
+        Output the content of self.tests to self.test_file.
+        """
+        import yaml
+
+        data = {"tests": self.tests}
+
+        with open(self.test_file, "w", encoding="utf-8") as fp:
+            yaml.safe_dump(data, fp, sort_keys=False, default_style="|",
+                           default_flow_style=False, allow_unicode=True)
-- 
2.53.0

