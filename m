Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CEB37F741;
	Wed, 14 Jan 2026 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768395456; cv=none; b=tEEfPD/3tbpG6h3MuV5Z9EbwGTOiCqaRSjOZ3s90YuG5yQmQqDJc4i38pRF2lw1qRWAm5k0iyGTKK4wLd+qH4C27opET4ExkvWY9ZnqZrGqB7wMOykbAva6VSs4NvOB08R4S309GVzIJtn+EQtkC84Xc66Ge7i+zxPgMjoyaLOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768395456; c=relaxed/simple;
	bh=Lo3HX4nCVX419+QwqDyEYwQliU9+sgWYRhJZWDw7IOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eD74B0PrBsKCDX/dmbEB3pIFcvChWJxrYuUt2sBpYM6M8w/RpHNc6HAnDP8tDQ5RTcj6xM62N9hJb76Ef8sH+7uVEWPO/CTHxMguQKJMWCiCIjH3RyTWZljCJDP7FeYO0YCFPp49veJYALwB2h6tnQnwCx+iZsG6UHAr1bgdD48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxHoptnn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxHoptnn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285DBC19423;
	Wed, 14 Jan 2026 12:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768395456;
	bh=Lo3HX4nCVX419+QwqDyEYwQliU9+sgWYRhJZWDw7IOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VxHoptnnu0Y6c+rwsphyLekMOoy42oFy7TFCrs62Vb9JWrRaq7FaGO7Sh5Ap1UP2T
	 uKjWsFbvT9RWe954wbTJi+oy5klsU2Y2aD5sE8l/w5vgqCfnqMUCPhvrsPcE96ZCR5
	 qfHMI403ZoKdSuiyusjXngSkSNF9/4yqICh/RwB5BXHAsZe+gRleudK1Iu5u+CGNfp
	 y8afQCtC7MkLzImedCIDbU6ZTduafetfrJ6tUg8v4UdznpsZCygjnXY6m6IqBPnz9l
	 nBjNHlgWmyvkcQ34v88x4RVNMw7dqMh7jZi9Oaorpo8xgk7lVYHnnOOm151YIRtxTK
	 TrBOyfHZvvoeA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vg0RK-00000002ly8-1Krs;
	Wed, 14 Jan 2026 13:57:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v4 3/4] scripts/kernel-doc: ensure that comments are using our coding style
Date: Wed, 14 Jan 2026 13:57:24 +0100
Message-ID: <f99083d75e9002e8d8967ceb4bb34405e4d2f2a3.1768395332.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768395332.git.mchehab+huawei@kernel.org>
References: <cover.1768395332.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Along kernel-doc libs, we opted to have all comments starting/ending
with a blank comment line. Use the same style here.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index 3992ca49d593..1d6036265c0d 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -3,7 +3,7 @@
 # Copyright(c) 2025: Mauro Carvalho Chehab <mchehab@kernel.org>.
 #
 # pylint: disable=C0103,R0912,R0914,R0915
-
+#
 # NOTE: While kernel-doc requires at least version 3.6 to run, the
 #       command line should work with Python 3.2+ (tested with 3.4).
 #       The rationale is that it shall fail gracefully during Kernel
@@ -12,7 +12,7 @@
 #       - no f-strings can be used on this file.
 #       - the libraries that require newer versions can only be included
 #         after Python version is checked.
-
+#
 # Converted from the kernel-doc script originally written in Perl
 # under GPLv2, copyrighted since 1998 by the following authors:
 #
@@ -196,8 +196,9 @@ def main():
     parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
                                      description=DESC)
 
+    #
     # Normal arguments
-
+    #
     parser.add_argument("-v", "-verbose", "--verbose", action="store_true",
                         help="Verbose output, more warnings and other information.")
 
@@ -212,8 +213,9 @@ def main():
                         action="store_true",
                         help="Enable line number output (only in ReST mode)")
 
+    #
     # Arguments to control the warning behavior
-
+    #
     parser.add_argument("-Wreturn", "--wreturn", action="store_true",
                         help="Warns about the lack of a return markup on functions.")
 
@@ -234,8 +236,9 @@ def main():
     parser.add_argument("-export-file", "--export-file", action='append',
                         help=EXPORT_FILE_DESC)
 
+    #
     # Output format mutually-exclusive group
-
+    #
     out_group = parser.add_argument_group("Output format selection (mutually exclusive)")
 
     out_fmt = out_group.add_mutually_exclusive_group()
@@ -247,8 +250,9 @@ def main():
     out_fmt.add_argument("-N", "-none", "--none", action="store_true",
                          help="Do not output documentation, only warnings.")
 
+    #
     # Output selection mutually-exclusive group
-
+    #
     sel_group = parser.add_argument_group("Output selection (mutually exclusive)")
     sel_mut = sel_group.add_mutually_exclusive_group()
 
@@ -261,7 +265,9 @@ def main():
     sel_mut.add_argument("-s", "-function", "--symbol", action='append',
                          help=FUNCTION_DESC)
 
+    #
     # Those are valid for all 3 types of filter
+    #
     parser.add_argument("-n", "-nosymbol", "--nosymbol", action='append',
                         help=NOSYMBOL_DESC)
 
@@ -294,9 +300,11 @@ def main():
 
     python_ver = sys.version_info[:2]
     if python_ver < (3,6):
+        #
         # Depending on Kernel configuration, kernel-doc --none is called at
         # build time. As we don't want to break compilation due to the
         # usage of an old Python version, return 0 here.
+        #
         if args.none:
             logger.error("Python 3.6 or later is required by kernel-doc. skipping checks")
             sys.exit(0)
@@ -306,7 +314,9 @@ def main():
     if python_ver < (3,7):
         logger.warning("Python 3.7 or later is required for correct results")
 
+    #
     # Import kernel-doc libraries only after checking Python version
+    #
     from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
     from kdoc.kdoc_output import RestFormat, ManFormat  # pylint: disable=C0415
 
@@ -345,6 +355,8 @@ def main():
 
     sys.exit(0)
 
+#
 # Call main method
+#
 if __name__ == "__main__":
     main()
-- 
2.52.0

