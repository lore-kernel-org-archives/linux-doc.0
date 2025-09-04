Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE2E2BE048;
	Thu,  4 Sep 2025 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756971207; cv=none; b=f76vm8BQpe+N42NtS5IL5AGo9/hMXRNUnrNoMljaJT/awwskxMr1dymx8Vv8v6ECtkOTsEQgGGik7xmNjn9dY7tiogGBAizqQ37sywxh3uUcQnadJBg3r4J2rlvATmWVmJHjJsFcHKvQC/ho4vv2sLqV5C37Dw0ozQFVZj78+Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756971207; c=relaxed/simple;
	bh=Mnafdtexwy9cPkXTjcz1GKQ9wicPavf82/kQmCha3rM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SdVkq/3vFkpaxbecnDqi07k76NMWIaJqALqJ8fQ1oXx7JCjCGEoq+amTQHkKUvBcAyivM+wLNzW2PB0QqOMrUfug+9dUHE9f8wvMYc5lQBgvPH8NU1qkyR+NZb0ZhtWle2WOeW5tTjGrutaQLKitkKCBziK7hIV4ixb2PseKwCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ee1GiGmI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ee1GiGmI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1673C116D0;
	Thu,  4 Sep 2025 07:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756971206;
	bh=Mnafdtexwy9cPkXTjcz1GKQ9wicPavf82/kQmCha3rM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ee1GiGmItOqoJ/yLJlGRsN3Vt0XIzTxCMyvNfaycAMAWhPa2ZW6FQTDx2Nsqiuk0W
	 OA0DBmOMDn3kVO9z35d3DEo1fJ519ioKyo9d1O+xi2YWSVLM5grj4jXiqgGW026AC1
	 WaOwbGkWIUfbCc9FXCQX+l0WiY3+INKY7CV+mBrFBrM/NVaF2cg6AIvPmS1AohkmIY
	 tRexIswos7ws/EDKmb+MEheDpfkSbOYbb1ipsdXXbPxw5vJEg0Y4AxFVNADTMA2WNe
	 RxUdPPwktZjiRzBfiwFtB3UAk8HYQUyo53h0C8UUszDtT1OHd+gTl9n2i1vOOJLHD3
	 9jI4En7N/9YHQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uu4TF-00000009jQ3-08uZ;
	Thu, 04 Sep 2025 09:33:25 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/19] tools/docs,scripts: sphinx-*: prevent sphinx-build crashes
Date: Thu,  4 Sep 2025 09:33:14 +0200
Message-ID: <98f1c5983da817e4f0142ac3ec17cfa6ff7ee28c.1756969623.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756969623.git.mchehab+huawei@kernel.org>
References: <cover.1756969623.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On a properly set system, LANG and LC_ALL is always defined.
However, some distros like Debian, Gentoo and their variants
start with those undefioned.

When Sphinx tries to set a locale with:

	locale.setlocale(locale.LC_ALL, '')

It raises an exception, making Sphinx fail. This is more likely
to happen with test containers.

Add a logic to detect and workaround such issue by setting
locale to C.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/sphinx-build-wrapper | 11 +++++++++++
 tools/docs/sphinx-pre-install   | 14 +++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 8ce57a25696f..c318af5f2af1 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -45,6 +45,7 @@ the newer version.
 """
 
 import argparse
+import locale
 import os
 import shlex
 import shutil
@@ -443,6 +444,16 @@ class SphinxBuilder:
         if not sphinxdirs:
             sphinxdirs = os.environ.get("SPHINXDIRS", ".")
 
+        #
+        # The sphinx-build tool has a bug: internally, it tries to set
+        # locale with locale.setlocale(locale.LC_ALL, ''). This causes a
+        # crash if language is not set. Detect and fix it.
+        #
+        try:
+            locale.setlocale(locale.LC_ALL, '')
+        except locale.Error:
+            self.env["LC_ALL"] = "C"
+
         #
         # sphinxdirs can be a list or a whitespace-separated string
         #
diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
index d6d673b7945c..663d4e2a3f57 100755
--- a/tools/docs/sphinx-pre-install
+++ b/tools/docs/sphinx-pre-install
@@ -26,6 +26,7 @@ system pacage install is recommended.
 """
 
 import argparse
+import locale
 import os
 import re
 import subprocess
@@ -422,8 +423,19 @@ class MissingCheckers(AncillaryMethods):
         """
         Gets sphinx-build version.
         """
+        env = os.environ.copy()
+
+        # The sphinx-build tool has a bug: internally, it tries to set
+        # locale with locale.setlocale(locale.LC_ALL, ''). This causes a
+        # crash if language is not set. Detect and fix it.
         try:
-            result = self.run([cmd, "--version"],
+            locale.setlocale(locale.LC_ALL, '')
+        except Exception:
+            env["LC_ALL"] = "C"
+            env["LANG"] = "C"
+
+        try:
+            result = self.run([cmd, "--version"], env=env,
                               stdout=subprocess.PIPE,
                               stderr=subprocess.STDOUT,
                               text=True, check=True)
-- 
2.51.0

