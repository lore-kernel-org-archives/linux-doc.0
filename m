Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EDB356A23;
	Mon, 12 Jan 2026 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768217036; cv=none; b=XB+ltxQqqsj7pVjv8JGa+yJXL4yjXbpW81rYg5kjYTK2whcLtRTfGCgRisF9E2e4YClzrgOBwSFRLPjThz0YLwLMx+HQGoj3rynsOzvD8k3NgMLPx4LF5eWajRU0LvZLCvt/NzYVAUWNgBe50Su/R+qsvUBd3keb5HssGLFJidI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768217036; c=relaxed/simple;
	bh=lGP3YEIb7htsUIa6dUl9swOOUdUMERQ+4bISrWtBkd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=snKAEhDujQ8CSwuXQBcj2Wbg0iuANf0OTUKnA/fSYn8/rUBc7vthpiFs6fimBSzfMX1UauhXtth6KS61odBPUHWYjnVMr7WirJHVIsUn69PLRp+bXbBrehIVw5m7WWsptJwHt8ZAIdnTRGMl05KZgFNLODBQBXmIDJKzcJeKEpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NoLEE09u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NoLEE09u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08851C16AAE;
	Mon, 12 Jan 2026 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768217036;
	bh=lGP3YEIb7htsUIa6dUl9swOOUdUMERQ+4bISrWtBkd0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NoLEE09uLOySikVTg45OD9Um6kIeH++3YOMbBoFLiq71ctPhuDWBEFfjHBp6bKQLC
	 GrSMSCQvHv3q5vQuYWnnWQVO1RUx1iSW3+gg1flOa3LEszlgtHYOMwJPEvICE4YbXo
	 KSlTacvfzR1164ynSCT9NV/7D6XLeuDVwh6OjW5yC+NaBEyFTPDsIzYuUkr3g67Aue
	 nT+TjxomTSxndDzuIMylAXalyEUUy3UGd+tcc3Z41VTkVrBZ7igjHc/DEqX47pyGkO
	 tjNMKYZSdz29lUE0i/86z6rhGQNAaOR6IqjuGx7li8jNrQpZhSsCYjlM4DIyPZUaW8
	 exGXwDa8M+f0g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vfG1a-00000000DTq-0zhi;
	Mon, 12 Jan 2026 12:23:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@intel.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 3/4] scripts/kernel-doc: ensure that comments are using our coding style
Date: Mon, 12 Jan 2026 12:23:25 +0100
Message-ID: <8dab4a0fff5b7054f45965e6289a7541a2a72c10.1768216455.git.mchehab+huawei@kernel.org>
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

Along kernel-doc libs, we opted to have all comments starting/ending
with a blank comment line. Use the same style here.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index 600bdfea6a96..bcb60136fc9c 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -188,7 +188,9 @@ def main():
     parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
                                      description=DESC)
 
+    #
     # Normal arguments
+    #
 
     parser.add_argument("-v", "-verbose", "--verbose", action="store_true",
                         help="Verbose output, more warnings and other information.")
@@ -204,7 +206,9 @@ def main():
                         action="store_true",
                         help="Enable line number output (only in ReST mode)")
 
+    #
     # Arguments to control the warning behavior
+    #
 
     parser.add_argument("-Wreturn", "--wreturn", action="store_true",
                         help="Warns about the lack of a return markup on functions.")
@@ -226,7 +230,9 @@ def main():
     parser.add_argument("-export-file", "--export-file", action='append',
                         help=EXPORT_FILE_DESC)
 
+    #
     # Output format mutually-exclusive group
+    #
 
     out_group = parser.add_argument_group("Output format selection (mutually exclusive)")
 
@@ -239,7 +245,9 @@ def main():
     out_fmt.add_argument("-N", "-none", "--none", action="store_true",
                          help="Do not output documentation, only warnings.")
 
+    #
     # Output selection mutually-exclusive group
+    #
 
     sel_group = parser.add_argument_group("Output selection (mutually exclusive)")
     sel_mut = sel_group.add_mutually_exclusive_group()
@@ -253,7 +261,9 @@ def main():
     sel_mut.add_argument("-s", "-function", "--symbol", action='append',
                          help=FUNCTION_DESC)
 
+    #
     # Those are valid for all 3 types of filter
+    #
     parser.add_argument("-n", "-nosymbol", "--nosymbol", action='append',
                         help=NOSYMBOL_DESC)
 
@@ -286,9 +296,11 @@ def main():
 
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
@@ -298,7 +310,9 @@ def main():
     if python_ver < (3,7):
         logger.warning("Python 3.7 or later is required for correct results")
 
+    #
     # Import kernel-doc libraries only after checking Python version
+    #
     from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
     from kdoc.kdoc_output import RestFormat, ManFormat  # pylint: disable=C0415
 
@@ -346,6 +360,8 @@ def main():
         sys.exit(error_count)
     sys.exit(0)
 
+#
 # Call main method
+#
 if __name__ == "__main__":
     main()
-- 
2.52.0

