Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E2B356A22;
	Mon, 12 Jan 2026 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768217036; cv=none; b=SPsOzbWUZPoVEcgsqHnuBpCLPobocesvU2gxeVuqkfcnz9ZooGah1fjoCP+n1MwPJLhtZw02FXl3zld2KRTH0aew/thFtm22xXM5vlhiiDMO6JbY89DXH5gIgzXwrRSSr89f/AY2tX8ji34rHd/XRbBCBDdyhowZpkVV7aRag5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768217036; c=relaxed/simple;
	bh=b7TCaIVKIIOx690781eq+Ut++2/njLJoNV6BCi2juqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WSe2Fw4rmbORdq/MDsOt8EmogKgt6vbSBzn2Dh55HksiqiXtP+o/e0tYo1rj39b3nB415Oe/Rfv0kt/SGMMfYkGL0ebghvXTkL6v5y+3+T9OY1AYBkA6+adDfHJ4IpTH/Q/LuAefll+Q1J0oPw2GoG61y4oyml3ce9nrm0Y7h3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTrGV1f5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTrGV1f5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D752C19424;
	Mon, 12 Jan 2026 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768217036;
	bh=b7TCaIVKIIOx690781eq+Ut++2/njLJoNV6BCi2juqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mTrGV1f5ePDMoVaQ3k1cAOJl65R0X6JYtcGKNUKyK6gaX4WMdZK6ywbOHZI3Tfth+
	 y34Z7w/j8zq3Cnft/xGA3931BqG6huwynxlzq6qRJQd5oi+QFxnEiNi+9rt1L7vytZ
	 DWgyLwOawGV66B4BCltI9Otucn3mRef4p1D62u8UgD4KOAzhNu34yna/I/Oxv1Bo3/
	 nTOKv0bemH1W+d/1JQGlxckatqz6GPxTDGjsGx17F1pySQjMjmVL/7bqs/8DwH4VSZ
	 qsseGPrO2I/LMgUQrITqcIwoe5Vl2nPbJYTE7kbh51OFaB+W3Hxwm4O5nXnc3omnIt
	 NJaCEubGzIAvQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vfG1a-00000000DTu-16QV;
	Mon, 12 Jan 2026 12:23:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@intel.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 4/4] scripts/kernel-doc: some fixes to kernel-doc comments
Date: Mon, 12 Jan 2026 12:23:26 +0100
Message-ID: <de2a70da3c1e3df8ca74196bcc7e44c041ff205b.1768216455.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768216455.git.mchehab+huawei@kernel.org>
References: <cover.1768216455.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There are some typos and English errors at the kernel-doc.py comments.

Locate them with the help of LLM (gpt-oss 14B), locally excecuted
with this prompt:

    review English grammar andsyntax at the comments on the code
    below:
    <cat scripts/kernel-doc.py>

Not all results are flowers, although it caught several minor
issues there. Add the pertinent fixes, discarding the bad ones.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index bcb60136fc9c..5086248ee532 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -9,10 +9,10 @@
 #       The rationale is that it shall fail gracefully during Kernel
 #       compilation with older Kernel versions. Due to that:
 #       - encoding line is needed here;
-#       - no f-strings can be used on this file.
-#       - the libraries that require newer versions can only be included
-#         after Python version is checked.
-
+#       - f‑strings cannot be used in this file.
+#       - libraries that require newer versions can only be included
+#         after the Python version has been checked.
+#
 # Converted from the kernel-doc script originally written in Perl
 # under GPLv2, copyrighted since 1998 by the following authors:
 #
@@ -132,13 +132,13 @@ May be used multiple times.
 """
 
 EXPORT_DESC = """
-Only output documentation for the symbols that have been
+Only output documentation for symbols that have been
 exported using EXPORT_SYMBOL() and related macros in any input
 FILE or -export-file FILE.
 """
 
 INTERNAL_DESC = """
-Only output documentation for the symbols that have NOT been
+Only output documentation for symbols that have NOT been
 exported using EXPORT_SYMBOL() and related macros in any input
 FILE or -export-file FILE.
 """
@@ -161,7 +161,7 @@ Header and C source files to be parsed.
 """
 
 WARN_CONTENTS_BEFORE_SECTIONS_DESC = """
-Warns if there are contents before sections (deprecated).
+Warn if there are contents before sections (deprecated).
 
 This option is kept just for backward-compatibility, but it does nothing,
 neither here nor at the original Perl script.
@@ -169,7 +169,7 @@ neither here nor at the original Perl script.
 
 
 class MsgFormatter(logging.Formatter):
-    """Helper class to format warnings on a similar way to kernel-doc.pl"""
+    """Helper class to format warnings in a similar way to kernel-doc.pl."""
 
     def format(self, record):
         record.levelname = record.levelname.capitalize()
@@ -268,7 +268,7 @@ def main():
                         help=NOSYMBOL_DESC)
 
     parser.add_argument("-D", "-no-doc-sections", "--no-doc-sections",
-                        action='store_true', help="Don't outputt DOC sections")
+                        action='store_true', help="Don't output DOC sections")
 
     parser.add_argument("files", metavar="FILE",
                         nargs="+", help=FILES_DESC)
@@ -297,12 +297,12 @@ def main():
     python_ver = sys.version_info[:2]
     if python_ver < (3,6):
         #
-        # Depending on Kernel configuration, kernel-doc --none is called at
+        # Depending on the Kernel configuration, kernel-doc --none is called at
         # build time. As we don't want to break compilation due to the
         # usage of an old Python version, return 0 here.
         #
         if args.none:
-            logger.error("Python 3.6 or later is required by kernel-doc. skipping checks")
+            logger.error("Python 3.6 or later is required by kernel‑doc. Skipping checks")
             sys.exit(0)
 
         sys.exit("Python 3.6 or later is required by kernel-doc. Aborting.")
@@ -311,7 +311,7 @@ def main():
         logger.warning("Python 3.7 or later is required for correct results")
 
     #
-    # Import kernel-doc libraries only after checking Python version
+    # Import kernel-doc libraries only after checking the Python version
     #
     from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
     from kdoc.kdoc_output import RestFormat, ManFormat  # pylint: disable=C0415
-- 
2.52.0

