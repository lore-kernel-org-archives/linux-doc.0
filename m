Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFCE34E74F;
	Tue, 13 Jan 2026 17:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768324802; cv=none; b=Oz27J7TPlCirAwXk3gGA5bSm+/UrlF8/O7guF5yG36Rt0HlALv+wUw6twiN1h7Bv6z9Z9lK6Q8MZ957S/fRGusmZwm81ZRxMRmdMa0Y64L8jv3qAqmZrUQhtGyuCJrwSOYzrSRcYQl1HwLz4VfEnKebHcxgt5fbfSsh8bgVdv2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768324802; c=relaxed/simple;
	bh=foDF5kyQKVn5m0aZgBgzovxLoUT+5gGYYs+E7zG6moo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FZexYwE5CeChLg15DH7V4TCclYkdv7tjWgWZzIPPFUJrb09Cdh/pMuioNk/xf3uSNlP7KEZFKmCN71wds12F6WlovcuWuEu6KQCdkoOTcaTzE5bs8JhqgpGgYfHvm/+dzQRfaeBBHn8MRBvfy8lwfapY27Ztf20mJFXko/ZNROk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvic6u1O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvic6u1O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA44C19424;
	Tue, 13 Jan 2026 17:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768324801;
	bh=foDF5kyQKVn5m0aZgBgzovxLoUT+5gGYYs+E7zG6moo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fvic6u1OgU037oeHc/12bn7Y9ejQv7En2yCgdE74A+Q8bexSBY3ZwkPhsmGwDikcA
	 liLnVZIbi8pMRE9azYO6Ext8Qus0tLzBMHsjV4ZwbNiMJcG6YJnQkbU23i6gx70xH+
	 8/UCN3HH/DLyICbgu4OOLhijUWRjuCq/UUeCZ9ou6wBIL9KHUghrIV2bho09UO6Vk2
	 sGWK9SKP6TR49j9hjyKkR2gRScAXgEVtDJkzG726WnZAWgtR7+Jcwjm5GQZNexuz64
	 XJeYPkx8dznCp6QAPl/Q+qoSKCkOe8bgTVKWYt30yrPeyfX3d+2qm2CRD/7yRpHCHb
	 958qk0tkXVWLQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vfi3j-00000000zeK-3dJ5;
	Tue, 13 Jan 2026 18:19:59 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 4/4] scripts/kernel-doc: some fixes to kernel-doc comments
Date: Tue, 13 Jan 2026 18:19:56 +0100
Message-ID: <434e60e7868ef4e001e81e8cfa872dec711ddd34.1768324572.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768324572.git.mchehab+huawei@kernel.org>
References: <cover.1768324572.git.mchehab+huawei@kernel.org>
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
 scripts/kernel-doc.py | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index da06184cbd8b..4998a79ea6d1 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -9,9 +9,9 @@
 #       The rationale is that it shall fail gracefully during Kernel
 #       compilation with older Kernel versions. Due to that:
 #       - encoding line is needed here;
-#       - no f-strings can be used on this file.
-#       - the libraries that require newer versions can only be included
-#         after Python version is checked.
+#       - f-strings cannot be used in this file.
+#       - libraries that require newer versions can only be included
+#         after the Python version has been checked.
 #
 # Converted from the kernel-doc script originally written in Perl
 # under GPLv2, copyrighted since 1998 by the following authors:
@@ -134,13 +134,13 @@ May be used multiple times.
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
@@ -163,7 +163,7 @@ Header and C source files to be parsed.
 """
 
 WARN_CONTENTS_BEFORE_SECTIONS_DESC = """
-Warns if there are contents before sections (deprecated).
+Warn if there are contents before sections (deprecated).
 
 This option is kept just for backward-compatibility, but it does nothing,
 neither here nor at the original Perl script.
@@ -171,7 +171,7 @@ neither here nor at the original Perl script.
 
 
 class MsgFormatter(logging.Formatter):
-    """Helper class to format warnings on a similar way to kernel-doc.pl"""
+    """Helper class to format warnings in a similar way to kernel-doc.pl."""
 
     def format(self, record):
         record.levelname = record.levelname.capitalize()
@@ -273,7 +273,7 @@ def main():
                         help=NOSYMBOL_DESC)
 
     parser.add_argument("-D", "-no-doc-sections", "--no-doc-sections",
-                        action='store_true', help="Don't outputt DOC sections")
+                        action='store_true', help="Don't output DOC sections")
 
     parser.add_argument("files", metavar="FILE",
                         nargs="+", help=FILES_DESC)
@@ -302,12 +302,12 @@ def main():
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
+            logger.error("Python 3.6 or later is required by kernel-doc. Skipping checks")
             sys.exit(0)
 
         sys.exit("Python 3.6 or later is required by kernel-doc. Aborting.")
@@ -316,7 +316,7 @@ def main():
         logger.warning("Python 3.7 or later is required for correct results")
 
     #
-    # Import kernel-doc libraries only after checking Python version
+    # Import kernel-doc libraries only after checking the Python version
     #
     from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
     from kdoc.kdoc_output import RestFormat, ManFormat  # pylint: disable=C0415
-- 
2.52.0

