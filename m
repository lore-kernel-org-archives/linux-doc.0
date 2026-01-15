Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CFD34575A;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491642; cv=none; b=slN8wIurFbDInND9ettdqZJTwLk0N/TDe7xJdi4TtXUYSU/C2tmcLQAQW8ulGzfR78lZ3GOOr1yXuw9iYZHW5EJStEPzbF/O16pqTr6HuqLKudN6AlSFTPLEYynZ1vyGh7CsBpkINc++c9Fzw9laYKjbQum2E1S9mxs1eQnu6Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491642; c=relaxed/simple;
	bh=D20byBH6Dc3S8kqec0afWoBETHqoICKqefEL4fRTSCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FICCqs8G633+Ez7XJpX5T9xGu3hmi//v2mn7tHSGBB1nmAmDFDb+NyovT9QWZFfrUFisRNAn4fGAqUPZJ1kHRYYqASvXfQkIPj/HsO/SY0FFmVQZRo7dqdgL4fwSftqWqwAM+Rz0ic5yUtimeKZrkQF14AieYYJct2eZ7jzNu/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chRPCMEA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chRPCMEA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1509BC2BC87;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491642;
	bh=D20byBH6Dc3S8kqec0afWoBETHqoICKqefEL4fRTSCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=chRPCMEA/qk4UuU036GaQNrBNwXGrhP0dcFpd9iZtppyTFdzbbEhlYvL219bqWVd3
	 q5ln/JkpORaXYLe1hiuV9PlArR0cxWHaxSzyqbGMiGUzyjlVM8x9Ja6amfSMdrIHIG
	 UY+gqnVCQ3gkv+8U5uQiZwyF0HQxZeXGMUnBGqhG6ZAHUsOYGOEfynV4Mxsdy0tdMk
	 USqE8KmM9ayEzShFYUh4O65y/zsNZUZadrHxj/HkvcqHvQ2fqVRXT4mWbHwxElfg6X
	 2HbTkOk8mBfZMzvCmdSc7CN5I/Vq2zHaCu5+ujnVWojgC5kRRqRproEML7LulvhGF1
	 vQI1AoOPaB5aQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vgPSi-000000043IZ-1B5k;
	Thu, 15 Jan 2026 16:40:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 07/15] docs: kdoc_files: Improve docstrings and comments
Date: Thu, 15 Jan 2026 16:40:28 +0100
Message-ID: <003d4df10446d545113c6361755da99915bcf321.1768488832.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768488832.git.mchehab+huawei@kernel.org>
References: <cover.1768488832.git.mchehab+huawei@kernel.org>
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

