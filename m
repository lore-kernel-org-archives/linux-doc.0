Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F993BFE47;
	Thu,  5 Mar 2026 15:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723787; cv=none; b=D7+Q3WdPC7OcRNkFgk8czvLa/iX4692NFWAHKNhcdrrlc03vrR28iMpnHtJCtaf9k2mPLonFRbSeHIiGygWJNMGjmC/0MOlVTyf05Bw1MGr48VFbmdzKJJ3ExeP12ozMzCxvcM5Gk6NGRn6HKUlv5JEOecN6Co9/PnLzNe/TZ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723787; c=relaxed/simple;
	bh=93FI6HCbFuKLoTGysvIesP/671jVJYX05qdlxtKR9Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=acFBYPhx9xyYTvSOr4Ap5fDCyiDEBERqkG6+ItfpKgIqIo2mZXVmxfnf6HuJAK5WuwDXgFUgjKaAfCqFSOfKXqFLP/AjfJRWjP7IbQrUMNiLpfQBcD5W/gccpY/XEUHQ5j+SP+luam3SIG5oGmmucXA72Dtlq+n9evE/y4IMi8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pH+V+/4B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pH+V+/4B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E5AC2BCB6;
	Thu,  5 Mar 2026 15:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723787;
	bh=93FI6HCbFuKLoTGysvIesP/671jVJYX05qdlxtKR9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pH+V+/4Bk982XSdmUrwHswZNof74somChmhKuPNiywIUOHvNGtgOA+o3i7J8TzNKO
	 yi+dNuAlSEsTqtIbo/pn874vqoPJTXRk9S5+zMXavwtZGl9vkX9JdNpggsKkHNZuny
	 e4Wt7Rf7cg75xnwKEMRO8ehhcf52eumz4ymBslx81yGsv4RsG0lAv1jW2RpTsTOSYl
	 twBa0Omt4lBasTlvLIasaAXUjCcOlcZVcMtervnwQHzNnFbJWv0fQd+jKDUxW+V81R
	 IWe6JvtO5Cl2kcn8nxQ3mJO3BKCCO3ZZ4n80TlSvVxkvSzSBLpTB2Pu4GOvOhoVvTr
	 8jhFl11t8GJ7g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyAR7-0000000HK46-1hMN;
	Thu, 05 Mar 2026 16:16:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 02/11] docs: kdoc_files: document KernelFiles() ABI
Date: Thu,  5 Mar 2026 16:16:09 +0100
Message-ID: <13eb44c341232564eaf2a9c9de4782369fef57e1.1772722474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772722474.git.mchehab+huawei@kernel.org>
References: <cover.1772722474.git.mchehab+huawei@kernel.org>
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

