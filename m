Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF5D32B98F;
	Tue, 13 Jan 2026 17:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768324802; cv=none; b=JnZ/XbNUc+5ppE4BHAsdftgV5/nImErfmn2ANz0xaperiklueOfjVSqTJawRbHiSlPv5bZ/7AkrUxMXUOig4D0oCiFXdY9AJH12SftzlC6m8FD2H240DG2KwTXBMpEUQ4vX1WAc/Jth4iWsKoR0WOynWc6rXnW6zGL9IOSUj3Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768324802; c=relaxed/simple;
	bh=2m6TV9TmCb8dmWC8RNmdbds1yQ7T9JqcpLqXcM2+DNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BikPkYyfKRC29yuO8395FNdp1ntZ/XwOlRhxXUP7fzbTMxCz101D396xH5i+S0XzXJ+10r+mKF+B09BdJvevuXy+cyZ9CMovVIBbXpjEwX6d5i+UjC8ofGyCrmquY4S+VGy457pqa3lilN/+zPwpLSoh9LNyMwAMUqkO4xINR4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YpUAVV07; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YpUAVV07"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8223C4AF0C;
	Tue, 13 Jan 2026 17:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768324801;
	bh=2m6TV9TmCb8dmWC8RNmdbds1yQ7T9JqcpLqXcM2+DNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YpUAVV078V6+5O6pPjAW4daEBUuna0/7o0qBfhQtnBwPEylvFjqT4S4rKg0L1zTPd
	 r5JGwGZ7Is3Is6umlwV6523mfqet8niK84IuPxeqLOAQikYAYBKpQ01q3+Dy9TpHHt
	 FC6fS7he8Oyqli2I1SJiv/Oh0RLCKlcqpDEfttQfepmBum3jEtj2bXs31rWyNYp6/v
	 UXEtn3uDOloI/qe/IXy5KWlppWWdMPdElaMfphkX1uxPz7Ar74dXiQG8qJ2UDDS1T/
	 h8Q6ZtHYUBlNI94vL2u5ZKApIw/vyAD8v6I2X/4HYs54cN4MHfW+RjYXe2hIHjmfb+
	 dxIs6ZfeS7G1A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vfi3j-00000000zeG-3WOy;
	Tue, 13 Jan 2026 18:19:59 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 3/4] scripts/kernel-doc: ensure that comments are using our coding style
Date: Tue, 13 Jan 2026 18:19:55 +0100
Message-ID: <55357e0465e1a73c64f875f4b45c6d443b33ab38.1768324572.git.mchehab+huawei@kernel.org>
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

Along kernel-doc libs, we opted to have all comments starting/ending
with a blank comment line. Use the same style here.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index 5d2f29e90ebe..da06184cbd8b 100755
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
@@ -197,8 +197,9 @@ def main():
     parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
                                      description=DESC)
 
+    #
     # Normal arguments
-
+    #
     parser.add_argument("-v", "-verbose", "--verbose", action="store_true",
                         help="Verbose output, more warnings and other information.")
 
@@ -213,8 +214,9 @@ def main():
                         action="store_true",
                         help="Enable line number output (only in ReST mode)")
 
+    #
     # Arguments to control the warning behavior
-
+    #
     parser.add_argument("-Wreturn", "--wreturn", action="store_true",
                         help="Warns about the lack of a return markup on functions.")
 
@@ -235,8 +237,9 @@ def main():
     parser.add_argument("-export-file", "--export-file", action='append',
                         help=EXPORT_FILE_DESC)
 
+    #
     # Output format mutually-exclusive group
-
+    #
     out_group = parser.add_argument_group("Output format selection (mutually exclusive)")
 
     out_fmt = out_group.add_mutually_exclusive_group()
@@ -248,8 +251,9 @@ def main():
     out_fmt.add_argument("-N", "-none", "--none", action="store_true",
                          help="Do not output documentation, only warnings.")
 
+    #
     # Output selection mutually-exclusive group
-
+    #
     sel_group = parser.add_argument_group("Output selection (mutually exclusive)")
     sel_mut = sel_group.add_mutually_exclusive_group()
 
@@ -262,7 +266,9 @@ def main():
     sel_mut.add_argument("-s", "-function", "--symbol", action='append',
                          help=FUNCTION_DESC)
 
+    #
     # Those are valid for all 3 types of filter
+    #
     parser.add_argument("-n", "-nosymbol", "--nosymbol", action='append',
                         help=NOSYMBOL_DESC)
 
@@ -295,9 +301,11 @@ def main():
 
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
@@ -307,7 +315,9 @@ def main():
     if python_ver < (3,7):
         logger.warning("Python 3.7 or later is required for correct results")
 
+    #
     # Import kernel-doc libraries only after checking Python version
+    #
     from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
     from kdoc.kdoc_output import RestFormat, ManFormat  # pylint: disable=C0415
 
@@ -346,6 +356,8 @@ def main():
 
     sys.exit(0)
 
+#
 # Call main method
+#
 if __name__ == "__main__":
     main()
-- 
2.52.0

