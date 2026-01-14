Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D5B38E5E8;
	Wed, 14 Jan 2026 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768395456; cv=none; b=CsiAFpYN7kc1wf7tUTFAgjyTPpc9fTLXX0Ohua16dVSAh23ilgDEAbzceaLgRBwqCzBqtQ28FLD1h8vB/eZpBduSUaO2GhqABpAgo/3c2KF2M28kMl5VEeY8pj2iaT74yvlen6HJ+xw79T61MyfrwU7TLOlBgQrlYJsjdN6Hk58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768395456; c=relaxed/simple;
	bh=+3WLqX8wN2UJRYCPHVZkeF+boAr9D0fvRfjS6fsF+Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Type; b=nD8mR+fDiNN3EFseykB8278XYJpCgbBkKWb7HEybBOvKIX6thVvAkmnK3BqVkyU3TXl6hOOeKooSwGqucThMpAVKpXKcdKzPVaiI5nAgWZ3f5yY9I0scjjjWyDLXcyxQ+Ls0TybAX4hGEV8pjKVpY8PU5RzvZhfwngUZQNdrfsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEhYT70J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEhYT70J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF91C2BC86;
	Wed, 14 Jan 2026 12:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768395456;
	bh=+3WLqX8wN2UJRYCPHVZkeF+boAr9D0fvRfjS6fsF+Kg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KEhYT70JAjTSnreUh2wmhzzS2RrMKAzzCXtGFDtq+6nCKYKm0Xarsud18PPm4rgVp
	 oKrSqpG3yPGqVi9hethkY62w68rA24aKsu7lU9LLc2HI+tOJhgPoXEot4AnmBJipJc
	 qi4SAZH3RUdPFZPJcig7i1CWPLpB7Ml3VWVuLoS0W+rUfKdtUb7W1jD9yEvG6Ttdl3
	 3tWdinrJp3p7u9eVbbmSysdMW1TJliRW+RWu0YJm5H4IJ/DHASKgdMaVqnZq9RBRJO
	 Hmw/N7wA4TKNXtcinTbj3otdyRbOluhLFBvk1Ch86I2cHSmlcEAF33dg+nyHf+7NRO
	 nWsCC9+XSuP1A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vg0RK-00000002lyC-1S2l;
	Wed, 14 Jan 2026 13:57:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v4 4/4] scripts/kernel-doc: some fixes to kernel-doc comments
Date: Wed, 14 Jan 2026 13:57:25 +0100
Message-ID: <a6248f9347f5d69063d7cdd78f27996271c2e5b9.1768395332.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768395332.git.mchehab+huawei@kernel.org>
References: <cover.1768395332.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There are some typos and English errors in the comments of kernel‑doc.py.

Locate them with the help of an LLM (gpt‑oss 14B), executed locally
with this prompt:

        review English grammar and syntax at the comments on the code below:
        <cat scripts/kernel-doc.py>

While LLM worked fine for the task of doing an English grammar review
for strings, being able to distinguish them from the actual code, it
was not is perfect: some things required manual work to fix.

-

While here, replace:

    "/**" with: ``/**``

As, if we ever rename this script to kernel_doc.py and add it to
Sphinx ext autodoc, we want to avoid this warning:

    scripts/kernel_doc.py:docstring of kernel_doc:10: WARNING: Inline strong start-string without end-string. [docutils]

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index 1d6036265c0d..7f84c58f7dc4 100755
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
@@ -97,7 +97,7 @@ Read C language source or header FILEs, extract embedded
 documentation comments, and print formatted documentation
 to standard output.
 
-The documentation comments are identified by the "/**"
+The documentation comments are identified by the ``/**``
 opening comment mark.
 
 See Documentation/doc-guide/kernel-doc.rst for the
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
@@ -272,7 +272,7 @@ def main():
                         help=NOSYMBOL_DESC)
 
     parser.add_argument("-D", "-no-doc-sections", "--no-doc-sections",
-                        action='store_true', help="Don't outputt DOC sections")
+                        action='store_true', help="Don't output DOC sections")
 
     parser.add_argument("files", metavar="FILE",
                         nargs="+", help=FILES_DESC)
@@ -301,12 +301,12 @@ def main():
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
@@ -315,7 +315,7 @@ def main():
         logger.warning("Python 3.7 or later is required for correct results")
 
     #
-    # Import kernel-doc libraries only after checking Python version
+    # Import kernel-doc libraries only after checking the Python version
     #
     from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
     from kdoc.kdoc_output import RestFormat, ManFormat  # pylint: disable=C0415
-- 
2.52.0

