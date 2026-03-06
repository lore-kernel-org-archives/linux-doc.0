Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4523839903D;
	Fri,  6 Mar 2026 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772810723; cv=none; b=e3Q3sV3G90AcSZZjPmDFA8njXDrXQs6Gt2Lyg5Fp2OYIdaFsyX67ensS6jJOdDf2Vz/Ki3jP+o1Wi5bG66PmP4XEVHchzrSg6ZaQlPNO7QpHEH+vU0GEgztfamEjZIHNsK/OyDJx3xaFG80b+pXq0LWQ5qdcFohbMseTtoH4eWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772810723; c=relaxed/simple;
	bh=93FI6HCbFuKLoTGysvIesP/671jVJYX05qdlxtKR9Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y/qPpe3uMr2iTqWrZToGV8T8LYAdcKdA9WuJ47LN7c0g+fCMptK3jI6aKfW7e9xjL+++ZLdAqwngujSkLbhW8BKhro2zGI24zhQwqNWt2VTimLRDD8iYWyuMYJc0TqT2uIHdPn2bWVAk8TfxdDf2x2TNgEdAZonYQD3TpAfZKi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnF7fVrs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnF7fVrs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5B9C2BCAF;
	Fri,  6 Mar 2026 15:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772810723;
	bh=93FI6HCbFuKLoTGysvIesP/671jVJYX05qdlxtKR9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TnF7fVrs6rjAh0k8Ev+yGx7tPUYQY4RPkgZ/Hk7zraLYyxHXThyJJHfSwwlfn5pQD
	 eHguFl++Dcyk1UQHjpNkLu1H6vXWQjtY72wRLu7uQIX45sOCN/boPOX3KZYj3GOM5x
	 pFcSiAKX+8GD2Sh2nw0st9/jJURUOsxGQ4HWIEm3IKBwaymqcaO2q+pYJb2Vcgcr/h
	 Xi96viVfYt8QlNfTe9XMLx/aUjp/+rUz0tqxwRCmKK1c4g59I/6avdRl+kUxLFhPn6
	 WxHHlI8cp1/MVN3pg0LJfM0oPOjYT9TJxG8fAPk0Zf/ipyVNn8B7jtSqOgXlU7rYmw
	 e5Pe5PccOJPNw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyX3I-000000074xU-3rdi;
	Fri, 06 Mar 2026 16:25:20 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 2/2] docs: kdoc_files: document KernelFiles() ABI
Date: Fri,  6 Mar 2026 16:25:15 +0100
Message-ID: <13eb44c341232564eaf2a9c9de4782369fef57e1.1772810574.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772810574.git.mchehab+huawei@kernel.org>
References: <cover.1772810574.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The KernelFiles is the main entry point to run kernel-doc,
being used by both tools/docs/kernel-doc and
Documentation/sphinx/kerneldoc.py.

It is also used on QEMU, which also uses the kernel-doc
libraries from tools/lib/python/kdoc.

Properly describe its ABI contract.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_files.py | 44 ++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_files.py b/tools/lib/python/kdoc/kdoc_files.py
index c35e033cf123..8c2059623949 100644
--- a/tools/lib/python/kdoc/kdoc_files.py
+++ b/tools/lib/python/kdoc/kdoc_files.py
@@ -91,7 +91,49 @@ class KernelFiles():
     """
     Parse kernel-doc tags on multiple kernel source files.
 
-    There are two type of parsers defined here:
+    This is the main entry point to run kernel-doc. This class is initialized
+    using a series of optional arguments:
+
+    ``verbose``
+        If True, enables kernel-doc verbosity. Default: False.
+
+    ``out_style``
+        Class to be used to format output. If None (default),
+        only report errors.
+
+    ``xforms``
+        Transforms to be applied to C prototypes and data structs.
+        If not specified, defaults to xforms = CFunction()
+
+    ``werror``
+        If True, treat warnings as errors, retuning an error code on warnings.
+
+        Default: False.
+
+    ``wreturn``
+        If True, warns about the lack of a return markup on functions.
+
+        Default: False.
+    ``wshort_desc``
+        If True, warns if initial short description is missing.
+
+        Default: False.
+
+    ``wcontents_before_sections``
+        If True, warn if there are contents before sections (deprecated).
+        This option is kept just for backward-compatibility, but it does
+        nothing, neither here nor at the original Perl script.
+
+        Default: False.
+
+    ``logger``
+        Optional logger class instance.
+
+        If not specified, defaults to use: ``logging.getLogger("kernel-doc")``
+
+    Note:
+        There are two type of parsers defined here:
+
         - self.parse_file(): parses both kernel-doc markups and
           ``EXPORT_SYMBOL*`` macros;
         - self.process_export_file(): parses only ``EXPORT_SYMBOL*`` macros.
-- 
2.52.0

