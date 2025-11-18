Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F992DEA9E;
	Tue, 18 Nov 2025 19:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763492982; cv=none; b=Sz7iUXgPdXmB63Wf/b6/SgyxKT597hMEx/a2TcmLinJrmuqe6IVHZwtmYhKzt9V48KUaWnYYawr5ih/qtkzuxtYYHFiQA8y2awxdViTYLr2bfguBHls6XuCrbPlg/2DzoKsF6KoFuVwMGUr9DL2o5tZvrZgCClW+O8yzRA2oGHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763492982; c=relaxed/simple;
	bh=H8QhqiTsXW2qUcK8V7pElgFkRTd/fIAGToq3PYuFKW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bpEyqN+R3UCI5bj12PIYtSQhSv63RJjUwRDJgdKG3sgx4GJMTiggRnMUs07Re9QAkvzjhaxbVmXkdIALF5GjvvUdZxAcs7qQoUbyzT3xg3g8PRMCRvw+wm0xZEByDQ1LZpHbuWfVZnGtm1E5u3LWNLBXqrLenZDf157fc9GL8EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKpyqsxl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKpyqsxl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C48C116B1;
	Tue, 18 Nov 2025 19:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763492981;
	bh=H8QhqiTsXW2qUcK8V7pElgFkRTd/fIAGToq3PYuFKW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aKpyqsxlpxAjBDftT6ImEiL+ruEohSRVBVM2kCtNYGxccH2xf+5T9kelaej6kA8yr
	 7GncnKlONWYlnLSNUpMrIqFSQ49CTp3EfoyjH/M3RLitm3XZipIL7Bz7Jr1PXGDHH6
	 msJEl9/am7qfMbovVfhSZI9PFtojt9tQ2BoGTzvHGEUcYS/rNPzKxgOP3XixrF9dM3
	 iVPI082NPLpJULfHM8pT6wOQ5QP7efa5Vb5VWsGRXe0jwpu6ScRWH1y9xtM0dRIMB6
	 aDdbmmIEFsXeIywPJRXRAuIbCvO/ZKEa1j+SPZJrgABvrd9JxY5s3P4FaYiQyrYxJC
	 o7h0HAQbgCC5g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vLR58-000000042hU-1FdV;
	Tue, 18 Nov 2025 20:09:38 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] Documentation/sphinx/kernel_feat.py: use class directly
Date: Tue, 18 Nov 2025 20:09:27 +0100
Message-ID: <c59d2542d7cc914fd5f8c84df966e63adc924cdc.1763492868.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763492868.git.mchehab+huawei@kernel.org>
References: <cover.1763492868.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Now that get_feat is in Python, we don't need to use subprocess
to fork an executable file: we can use the feature classes
directly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kernel_feat.py | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/Documentation/sphinx/kernel_feat.py b/Documentation/sphinx/kernel_feat.py
index 1dcbfe335a65..bdc0fef5c87f 100644
--- a/Documentation/sphinx/kernel_feat.py
+++ b/Documentation/sphinx/kernel_feat.py
@@ -34,7 +34,6 @@
 import codecs
 import os
 import re
-import subprocess
 import sys
 
 from docutils import nodes, statemachine
@@ -43,9 +42,9 @@ from docutils.parsers.rst import directives, Directive
 from sphinx.util.docutils import switch_source_input
 
 srctree = os.path.abspath(os.environ["srctree"])
-sys.path.insert(0, os.path.join(srctree, "tools/docs/lib"))
+sys.path.insert(0, os.path.join(srctree, "tools/lib/python"))
 
-from parse_features import ParseFeature                # pylint: disable=C0413
+from feat.parse_features import ParseFeature                # pylint: disable=C0413
 
 def ErrorString(exc):  # Shamelessly stolen from docutils
     return f'{exc.__class__.__name}: {exc}'
@@ -89,18 +88,16 @@ class KernelFeat(Directive):
 
         srctree = os.path.abspath(os.environ["srctree"])
 
-        args = [
-            os.path.join(srctree, 'tools/docs/get_feat.pl'),
-            'rest',
-            '--enable-fname',
-            '--dir',
-            os.path.join(srctree, 'Documentation', self.arguments[0]),
-        ]
+        feature_dir = os.path.join(srctree, 'Documentation', self.arguments[0])
+
+        feat = ParseFeature(feature_dir, False, True)
+        feat.parse()
 
         if len(self.arguments) > 1:
-            args.extend(['--arch', self.arguments[1]])
-
-        lines = subprocess.check_output(args, cwd=os.path.dirname(doc.current_source)).decode('utf-8')
+            arch = self.arguments[1]
+            lines = feat.output_arch_table(arch)
+        else:
+            lines = feat.output_matrix()
 
         line_regex = re.compile(r"^\.\. FILE (\S+)$")
 
-- 
2.51.1

