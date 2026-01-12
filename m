Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C785E2DCBE6;
	Mon, 12 Jan 2026 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230487; cv=none; b=tDTC+fORw9W8JYL5Ib3o2YT/hcyAFLH6yFe9JCyRjmUwbMkppABtXAAX0sRAP2977vlOTwf4GBkQvxC2/ezf6gren3OwCA4eb+neCSQvHQRE8TTO6x+KlwQwRCzaQtLJxSD5Ak8WfCNvsPWy2fcvYOMDgvAB0frCYnyg9hHpwo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230487; c=relaxed/simple;
	bh=XChoitCpPvUu9DSulv7Knff2zjJ8XDFrF6Ndhe2QeNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SoF30QNr3zHNg4LqlLrgQPVzGxh83nDU4u4iKvZioXgQNPXG2r0iLlmKd0WhNwFEdaab6qSSJ8eVdLBHQo+xvwyb6pgpuWp5E0Dp1he+/Ajfb2EVB26jMcs4gezAy29VycQq5kzwNZp+2WdO2Z5ogTe8DtmHVY4M/HOoUUn3zJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3BL1tfo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3BL1tfo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6B4C19422;
	Mon, 12 Jan 2026 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768230487;
	bh=XChoitCpPvUu9DSulv7Knff2zjJ8XDFrF6Ndhe2QeNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O3BL1tfosJBTJkj45T+uShqe850nExpFMwx55OTNtl7GRdFzFwvoX7WU8XjH63qHN
	 aW/FF5ijAyeqvI30kegPbFsxmlzoaG+jg6z7JhN1wZq0vJpDkTjzPmwPvp9MfRSrEH
	 6n4myo5l+LxUbc0oU6fe46N3jwkV7FREQQeDo4JpMCquUrQ0j89sBE1bzsv+PU86gA
	 dTXVK9sH0BfXlUR1iPujT9LtQZEunj/tlRqVNqYeyl/u5yeWxX2dBezqG9wMbHNH3z
	 FiOEqOuIWvEg1YFZu38GsiG6Eu5AxZsl8YC2Of1I/P6Zai5VMLPq9xhtmSUPOJHGzq
	 0K5IGt9nQp6gw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vfJWX-00000000JWu-32zi;
	Mon, 12 Jan 2026 16:08:05 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@intel.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 3/4] scripts/kernel-doc: ensure that comments are using our coding style
Date: Mon, 12 Jan 2026 16:06:52 +0100
Message-ID: <7604a45e8ade06994afeb68616cf1838dd1101ec.1768229902.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768229902.git.mchehab+huawei@kernel.org>
References: <cover.1768229902.git.mchehab+huawei@kernel.org>
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
index 5d2f29e90ebe..7ccee4626478 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -197,7 +197,9 @@ def main():
     parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
                                      description=DESC)
 
+    #
     # Normal arguments
+    #
 
     parser.add_argument("-v", "-verbose", "--verbose", action="store_true",
                         help="Verbose output, more warnings and other information.")
@@ -213,7 +215,9 @@ def main():
                         action="store_true",
                         help="Enable line number output (only in ReST mode)")
 
+    #
     # Arguments to control the warning behavior
+    #
 
     parser.add_argument("-Wreturn", "--wreturn", action="store_true",
                         help="Warns about the lack of a return markup on functions.")
@@ -235,7 +239,9 @@ def main():
     parser.add_argument("-export-file", "--export-file", action='append',
                         help=EXPORT_FILE_DESC)
 
+    #
     # Output format mutually-exclusive group
+    #
 
     out_group = parser.add_argument_group("Output format selection (mutually exclusive)")
 
@@ -248,7 +254,9 @@ def main():
     out_fmt.add_argument("-N", "-none", "--none", action="store_true",
                          help="Do not output documentation, only warnings.")
 
+    #
     # Output selection mutually-exclusive group
+    #
 
     sel_group = parser.add_argument_group("Output selection (mutually exclusive)")
     sel_mut = sel_group.add_mutually_exclusive_group()
@@ -262,7 +270,9 @@ def main():
     sel_mut.add_argument("-s", "-function", "--symbol", action='append',
                          help=FUNCTION_DESC)
 
+    #
     # Those are valid for all 3 types of filter
+    #
     parser.add_argument("-n", "-nosymbol", "--nosymbol", action='append',
                         help=NOSYMBOL_DESC)
 
@@ -295,9 +305,11 @@ def main():
 
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
@@ -307,7 +319,9 @@ def main():
     if python_ver < (3,7):
         logger.warning("Python 3.7 or later is required for correct results")
 
+    #
     # Import kernel-doc libraries only after checking Python version
+    #
     from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
     from kdoc.kdoc_output import RestFormat, ManFormat  # pylint: disable=C0415
 
@@ -346,6 +360,8 @@ def main():
 
     sys.exit(0)
 
+#
 # Call main method
+#
 if __name__ == "__main__":
     main()
-- 
2.52.0

