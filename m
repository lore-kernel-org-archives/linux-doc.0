Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2B34400;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022796; cv=none; b=riQowU6hXMWRo9WY22p0VxRTQiEzLUMMfwcECAAkEfkERXwmmnHtPXIrV5aeW7Cnc4Rd3ugXO3RdK1IgKwVaXSSeeR7N9ucQ3QZNC20EJEw9alnKSAmAHkGRjfAJwE6ug/Z/Y7K8c0+S+6ZuiKifHJML4igsKIDlosSycpUm4ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022796; c=relaxed/simple;
	bh=us6t/BhA/yQmA2s3pD6tzKRkBi35R7LRCdwJPClSus0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k0XzD2k665D2XCrufzj4TRA4XFuv45c7JEtEu67vs1YH5/rvQsKppmpBTQBQFmQsrZiBMiRWB5wLciSx8+6TNGbOacgV422JALlcqtlOuQnVdXhoVSXDc1lvJxBT8oNOV5ektAjae2FMS8BKGMqc1KSxNqi83e+/R22Zy2b3Hfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoE+68VR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoE+68VR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59E1C4CEE5;
	Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022795;
	bh=us6t/BhA/yQmA2s3pD6tzKRkBi35R7LRCdwJPClSus0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZoE+68VR/fcQQ5BHqCi+RYJwydoRAWcii4EfeuqSfFr0whvaK9QjtLosES+PleInM
	 PnjQie3Esyxkn4I/YVncEuRaBV0W8gY79N/Ew9eBWpxtNK7eWMuEXw4QGDTEE8Z5u+
	 hB+KJhQROVosTs7RmAdPE0Qpsvd5yImaSCVALEJ5A5MAM1Ps7DKe0xrOlCUczbu+9V
	 ayprTmotQVgQCehCTHQ0KZ3MIqciDX/Z8WyLlc3kYsdWwDR5lxIkVK4dadl+As/854
	 dygV5fsa5dETKwpExg1YYdNj14Vr0j0/UR8Be11Tqm9Xuvi9A2jgTU7mawFyF37U70
	 LNyfeFYB5YHCg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7h-0000000DRKh-2w4P;
	Tue, 28 Jan 2025 01:06:33 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 05/38] docs: sphinx/kernel_abi: adjust coding style
Date: Tue, 28 Jan 2025 01:05:54 +0100
Message-ID: <259b07bffa7907ab8e73939dd5d9f025b2f694a8.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Make pylint and flake8 happier with this module's coding style

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kernel_abi.py | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 8401562cb5d9..a1887b50a900 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -32,32 +32,30 @@ u"""
 
 """
 
-import codecs
 import os
-import subprocess
-import sys
 import re
+import sys
 
-from docutils import nodes, statemachine
+from docutils import nodes
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
-from docutils.utils.error_reporting import ErrorString
 from sphinx.util.docutils import switch_source_input
 from sphinx.util import logging
 
-__version__  = '1.0'
+__version__ = "1.0"
+
 
 def setup(app):
 
     app.add_directive("kernel-abi", KernelCmd)
-    return dict(
-        version = __version__
-        , parallel_read_safe = True
-        , parallel_write_safe = True
-    )
+    return {
+        "version": __version__,
+        "parallel_read_safe": True,
+        "parallel_write_safe": True
+    }
+
 
 class KernelCmd(Directive):
-
     u"""KernelABI (``kernel-abi``) directive"""
 
     required_arguments = 1
@@ -92,15 +90,15 @@ class KernelCmd(Directive):
         nodeList = self.nestedParse(lines, self.arguments[0])
         return nodeList
 
-    def nestedParse(self, lines, fname):
+    def nested_parse(self, lines, fname):
         env = self.state.document.settings.env
         content = ViewList()
         node = nodes.section()
 
         if "debug" in self.options:
             code_block = "\n\n.. code-block:: rst\n    :linenos:\n"
-            for l in lines.split("\n"):
-                code_block += "\n    " + l
+            for line in lines.split("\n"):
+                code_block += "\n    " + line
             lines = code_block + "\n\n"
 
         line_regex = re.compile(r"^\.\. LINENO (\S+)\#([0-9]+)$")
-- 
2.48.1

