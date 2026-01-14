Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2D739B4AA;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396652; cv=none; b=kct8F4FxJoMZup7Y4QNXKmPE6l8EJhvnshLBlCZfq5odFUJeYvCMvO82wUuw+0fB4oxcHemKJvZdhY8651n9m96YjdtD8FcfTjBsMVxhMVZtyjEdJVvLw9Ivzv48RsJTT6EQ02rboOHy4sxEDOLTrEhxPMINT3uoElrMLCd1F8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396652; c=relaxed/simple;
	bh=D20byBH6Dc3S8kqec0afWoBETHqoICKqefEL4fRTSCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=thJZwZelkMi0jtqk4n9afYIskom35UqMAqV/wYWrO4D/ROv9NAOGjhJ5mKfXEB+eDSVxC02XHDT9W0mvIq1VfyDQUzVKLQKzqYMyzhpqkOSnQ1iTcf9ArxfdKKuN+OJPIrl+GQSRRhzWlgVudRMml0Xm73veeUHS5lFOlu1W+rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QG8LpUQX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QG8LpUQX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826C3C19425;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768396652;
	bh=D20byBH6Dc3S8kqec0afWoBETHqoICKqefEL4fRTSCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QG8LpUQXloJmXI6yPwA76dzJm1UgLxlZ9fxT3JehKor7f/rbOOPjkh0ZxmGSFJMVH
	 eNZmHH4P5H21+1w1/7+omL4TtBYHmY7XuVjaHlEor1VYUlNF44wR7Jawd912m0BoGf
	 +ODnKzxyaxec2gme0N3vHn/zlPoP3uSyadSi8yGrSSNoSoJm0iGvgrjHcvzQAvyDc5
	 iPXmWKi3sOsytgCBQLNvYXWw8m1rcu5uvhTYek9TQw+gM0AaJ7q/Pb1Fsy8K13Jji6
	 20+6CbNubwB6CoQfZ4vGaXXeAfdI7dmOKV9pqzOD5KyCIY3pbXAqR06HnS0xcazmwA
	 odoaDQyBIoaGw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vg0kc-00000002mxo-3N5c;
	Wed, 14 Jan 2026 14:17:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 05/13] docs: kdoc_files: Improve docstrings and comments
Date: Wed, 14 Jan 2026 14:17:18 +0100
Message-ID: <5bb81566bdf632344c59e1ea4a9283d0aa5ef20f.1768396023.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768396023.git.mchehab+huawei@kernel.org>
References: <cover.1768396023.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

In preparation to document kernel-doc module, improve its
documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_files.py | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_files.py b/tools/lib/python/kdoc/kdoc_files.py
index bfe02baf1606..022487ea2cc6 100644
--- a/tools/lib/python/kdoc/kdoc_files.py
+++ b/tools/lib/python/kdoc/kdoc_files.py
@@ -5,7 +5,8 @@
 # pylint: disable=R0903,R0913,R0914,R0917
 
 """
-Parse lernel-doc tags on multiple kernel source files.
+Classes for navigating through the files that kernel-doc needs to handle
+to generate documentation.
 """
 
 import argparse
@@ -43,7 +44,7 @@ class GlobSourceFiles:
         self.srctree = srctree
 
     def _parse_dir(self, dirname):
-        """Internal function to parse files recursively"""
+        """Internal function to parse files recursively."""
 
         with os.scandir(dirname) as obj:
             for entry in obj:
@@ -65,7 +66,7 @@ class GlobSourceFiles:
     def parse_files(self, file_list, file_not_found_cb):
         """
         Define an iterator to parse all source files from file_list,
-        handling directories if any
+        handling directories if any.
         """
 
         if not file_list:
@@ -91,18 +92,18 @@ class KernelFiles():
 
     There are two type of parsers defined here:
         - self.parse_file(): parses both kernel-doc markups and
-          EXPORT_SYMBOL* macros;
-        - self.process_export_file(): parses only EXPORT_SYMBOL* macros.
+          ``EXPORT_SYMBOL*`` macros;
+        - self.process_export_file(): parses only ``EXPORT_SYMBOL*`` macros.
     """
 
     def warning(self, msg):
-        """Ancillary routine to output a warning and increment error count"""
+        """Ancillary routine to output a warning and increment error count."""
 
         self.config.log.warning(msg)
         self.errors += 1
 
     def error(self, msg):
-        """Ancillary routine to output an error and increment error count"""
+        """Ancillary routine to output an error and increment error count."""
 
         self.config.log.error(msg)
         self.errors += 1
@@ -128,7 +129,7 @@ class KernelFiles():
 
     def process_export_file(self, fname):
         """
-        Parses EXPORT_SYMBOL* macros from a single Kernel source file.
+        Parses ``EXPORT_SYMBOL*`` macros from a single Kernel source file.
         """
 
         # Prevent parsing the same file twice if results are cached
@@ -157,7 +158,7 @@ class KernelFiles():
                  wcontents_before_sections=False,
                  logger=None):
         """
-        Initialize startup variables and parse all files
+        Initialize startup variables and parse all files.
         """
 
         if not verbose:
@@ -213,7 +214,7 @@ class KernelFiles():
 
     def parse(self, file_list, export_file=None):
         """
-        Parse all files
+        Parse all files.
         """
 
         glob = GlobSourceFiles(srctree=self.config.src_tree)
@@ -242,7 +243,7 @@ class KernelFiles():
             filenames=None, export_file=None):
         """
         Interacts over the kernel-doc results and output messages,
-        returning kernel-doc markups on each interaction
+        returning kernel-doc markups on each interaction.
         """
 
         self.out_style.set_config(self.config)
-- 
2.52.0

