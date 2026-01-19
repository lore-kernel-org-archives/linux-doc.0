Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9362FFDD6;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=hQ9+dkMPxHSAlA3G5Cp4NsQJdKaHK2xWEvtK0JVGXuT8gai0XD2jkAhJcG/PbsJpNTiyNrSoQzkmxpMr9OoSohntgKtmEVVqzgzN9R5ct5M1XapkpPJcdUKuv9dna5iKrql+p5GQfwoZYQ7L9R0vK6w4euKJsLpigZpo8kFiFMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=vD2wOczQTMyK8eBInsPg/A/L1CMB+IhGbdrLcMRyq0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DsAhLYv2ThThOKWJEUUKfK5sBi6d95AJywFNR8121Z8kvOm+i8BvsN6pSJ44GYV7yUYaab6A//qD5FHJFsJf/HbTsiQzgmCTakvikNJ1WWe/M3UU3Fli9JWQLE10fM9C+bVRIehkJNp727qEJkJnkkoJOUICk1yssyVBgR6Z7ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRp1g37/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRp1g37/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4BEC2BCB6;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=vD2wOczQTMyK8eBInsPg/A/L1CMB+IhGbdrLcMRyq0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sRp1g37/1JO2xhTb25DKM8UcASOgLnA+U+o3wzGw0oLvlDJ5+p9SYowXD7+6CSGRP
	 HVVSBIUy5EbUtexKNaBQyZ/BWAJxe38rUZZdPZkrwcqEZTiQh7/8Y4l6bZfzDzeK22
	 IJ1brBdMAw/iuHL6l0VWzClzMzMBlUrI8Nmb2X7ES9dKl/URIlRO4SwU9RKnwDAiAJ
	 w9TuIuxFc/wGmy0rwTzwzfFwxjMh2fDLC/HPvnLzVeuH8V5DM35sKE/lHqwzJTQcDe
	 HQyL6zLoEXRwRBEPcAAVnM43nWQurOzZAoEAlNPITpoltANQ7FzNdLN3HexfGz9xBu
	 9/YRhlkqc/KSA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j2a-2SU2;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 19/25] docs: kabi: system_symbols: end docstring phrases with a dot
Date: Mon, 19 Jan 2026 17:23:22 +0100
Message-ID: <efd0e150d8e12d8ea2665f54a96b1997f32897b7.1768838938.git.mchehab+huawei@kernel.org>
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

Some docstring classes are not ending with a dot. Fix to make it
more uniform.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/abi/system_symbols.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/lib/python/abi/system_symbols.py b/tools/lib/python/abi/system_symbols.py
index 4a2554da217b..7bbefd274ea2 100644
--- a/tools/lib/python/abi/system_symbols.py
+++ b/tools/lib/python/abi/system_symbols.py
@@ -18,11 +18,11 @@ from random import shuffle
 from abi.helpers import AbiDebug
 
 class SystemSymbols:
-    """Stores arguments for the class and initialize class vars"""
+    """Stores arguments for the class and initialize class vars."""
 
     def graph_add_file(self, path, link=None):
         """
-        add a file path to the sysfs graph stored at self.root
+        add a file path to the sysfs graph stored at self.root.
         """
 
         if path in self.files:
@@ -43,7 +43,7 @@ class SystemSymbols:
         self.files.add(path)
 
     def print_graph(self, root_prefix="", root=None, level=0):
-        """Prints a reference tree graph using UTF-8 characters"""
+        """Prints a reference tree graph using UTF-8 characters."""
 
         if not root:
             root = self.root
@@ -173,7 +173,7 @@ class SystemSymbols:
         self._walk(sysfs)
 
     def check_file(self, refs, found):
-        """Check missing ABI symbols for a given sysfs file"""
+        """Check missing ABI symbols for a given sysfs file."""
 
         res_list = []
 
@@ -214,7 +214,7 @@ class SystemSymbols:
         return res_list
 
     def _ref_interactor(self, root):
-        """Recursive function to interact over the sysfs tree"""
+        """Recursive function to interact over the sysfs tree."""
 
         for k, v in root.items():
             if isinstance(v, dict):
@@ -232,7 +232,7 @@ class SystemSymbols:
 
 
     def get_fileref(self, all_refs, chunk_size):
-        """Interactor to group refs into chunks"""
+        """Interactor to group refs into chunks."""
 
         n = 0
         refs = []
@@ -250,7 +250,7 @@ class SystemSymbols:
 
     def check_undefined_symbols(self, max_workers=None, chunk_size=50,
                                 found=None, dry_run=None):
-        """Seach ABI for sysfs symbols missing documentation"""
+        """Seach ABI for sysfs symbols missing documentation."""
 
         self.abi.parse_abi()
 
-- 
2.52.0

