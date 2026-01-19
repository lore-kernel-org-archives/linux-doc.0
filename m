Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B012EC57F;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=jiBAc/3uzihMVPlSogn0JwE758hgmh+YcdtVNipCmdxOZCb5e2zPrt39ZJ2i3yxYPX0mvSb/xj+dKgHRmbQovAshbVENW87QQJykFJz1qj7ucpcfVHyS5OIyCyZ4XjNbsHu+NxdDcyp36j19NJoW7Q78nEHGtZ+pqA35+ud/lOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=D20byBH6Dc3S8kqec0afWoBETHqoICKqefEL4fRTSCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Th03JsIIg+IAaShS8/lsklbQeW/50pA1uegXzl9AKLN0SGxiGv7sdRWCaRV57YKUAXxA3siYfx51UrD7wAH23JZ2z3voMQad85Uv7ULiAc2sMnD74vhQXgkY8wtmSLK7h2X+dzqfl90vy73BEdh7IcoKh0UeRWIummZcpf14xc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jl9xTGhZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jl9xTGhZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33919C2BCB1;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=D20byBH6Dc3S8kqec0afWoBETHqoICKqefEL4fRTSCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jl9xTGhZP81pMASVBixB9YAMFXfrS9/5eWyOyCuUnC8FLyrjeye65il4eYvkPBWC5
	 kNl3Y1X6t7EhxRJ7ReeuETRq5NLQYZkINiMTvzo2fFK8uIMeCX+6I7j2spzPRW2sKO
	 +gjiZVMupze9b3FtxtOJyFnYZ5z0bN/801Q+1N1ZIMdkH5jVKmFrTzAalCv1ecpppU
	 /Qg6e1Z2F+9W9vRXhpC1oFQOWkEi1XHcFlZwmxYhm6DW2CaBgIEyn8iKJI9cWyQRSh
	 Otkf9Mb3E9BGFEFjv+PniDanHlgCvD+vIdcSzwimgI8H63QV/hDcIwwGlgsFtSE2s1
	 iRaCPEXPGhPiw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j1o-18QL;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 07/25] docs: kdoc_files: Improve docstrings and comments
Date: Mon, 19 Jan 2026 17:23:10 +0100
Message-ID: <75d58878ad6f83f24f1c0ce9e04301a000ecbaa3.1768838938.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768838938.git.mchehab+huawei@kernel.org>
References: <cover.1768838938.git.mchehab+huawei@kernel.org>
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

