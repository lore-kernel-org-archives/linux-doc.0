Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA811DEFD6;
	Wed, 29 Jan 2025 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738167000; cv=none; b=DEH9GVp2sQGNjoVaOPYpqpyqorcEXfx9LN2sEPEei9IwxiWiVNE8EIRiHqqmEy6U1mDdu3haMSqq7bAmM1sP8m5Tw36Xslab6du+m/VgQW0uBnl/KlHVwnmMWrOARewl4yfsEAiyHAs1TVR9/Xpn6G6TZiFCRaDFB2UYsqx5jwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738167000; c=relaxed/simple;
	bh=GrjMjuoBldG0YBxJhhKh6xKhPGHktjhoxv5+WyCxFXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUPYHwJDTItBqgmV90vDbQ17XuOl032F2S2pGxPlu0iI3bpzDqfgqV58ssNA/WZVOSFJhQGLH4SMukxvtvAmWbwf6JBPy7HKmYBfZNReO8TU6umdYDSdIaYj2qAQDvW2TlFF4I4EADncoYjpc/iMRq3irg8kbE/7FKzY5H+xwhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjA+ZtGu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjA+ZtGu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F304C4CED3;
	Wed, 29 Jan 2025 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738166999;
	bh=GrjMjuoBldG0YBxJhhKh6xKhPGHktjhoxv5+WyCxFXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mjA+ZtGuPSLlwIHm4vTZ+NmhNhpJczu8vHLjr81KsC6KbUTkU2MufBJSbj7UnTNra
	 vnh2EPuqWhrNW0EK/RR2vd0Wr/QulxBN7slt5FQ7PvnfZ1dXluSpW2cf1thwRp6eg6
	 JrjX9no43DYnznHQXiOAQ6tkegAYQ608a3oj1OwWc6GoqbIuhFLZADtaXP52EeS2WT
	 D5IEwIGMZa7TYT53PsfKt8sjr9I2OdPSLVhHZfMN+pnsHmBaLK8wyIQ40KEm41r6q1
	 aYUmHCzYRn5awHfXt5PcyDXXF98YaB/ROSKr9ZUCf7dAex0sdOpzWAf4lf10Lo9bvV
	 22ARUVsehJrrg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tdAdZ-00000004PES-1sJO;
	Wed, 29 Jan 2025 17:09:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC 3/6] docs: automarkup: drop legacy support
Date: Wed, 29 Jan 2025 17:09:34 +0100
Message-ID: <748e0f011eb9be114737851094ad3a3406412244.1738166451.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738166451.git.mchehab+huawei@kernel.org>
References: <cover.1738166451.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Python 2 is already EOL for quite some time. Drop support for
it.

Also, the minimal Sphinx version is now 3.4.3. So, we can drop
support for Sphinx < 3.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/automarkup.py | 32 +++++++-----------------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index 03bb7020f5cb..ecf54d22e9dc 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -13,14 +13,6 @@ from itertools import chain
 
 from kernel_abi import get_kernel_abi
 
-#
-# Python 2 lacks re.ASCII...
-#
-try:
-    ascii_p3 = re.ASCII
-except AttributeError:
-    ascii_p3 = 0
-
 #
 # Regex nastiness.  Of course.
 # Try to identify "function()" that's not already marked up some
@@ -28,22 +20,22 @@ except AttributeError:
 # :c:func: block (i.e. ":c:func:`mmap()`s" flakes out), so the last
 # bit tries to restrict matches to things that won't create trouble.
 #
-RE_function = re.compile(r'\b(([a-zA-Z_]\w+)\(\))', flags=ascii_p3)
+RE_function = re.compile(r'\b(([a-zA-Z_]\w+)\(\))', flags=re.ASCII)
 
 #
 # Sphinx 2 uses the same :c:type role for struct, union, enum and typedef
 #
 RE_generic_type = re.compile(r'\b(struct|union|enum|typedef)\s+([a-zA-Z_]\w+)',
-                             flags=ascii_p3)
+                             flags=re.ASCII)
 
 #
 # Sphinx 3 uses a different C role for each one of struct, union, enum and
 # typedef
 #
-RE_struct = re.compile(r'\b(struct)\s+([a-zA-Z_]\w+)', flags=ascii_p3)
-RE_union = re.compile(r'\b(union)\s+([a-zA-Z_]\w+)', flags=ascii_p3)
-RE_enum = re.compile(r'\b(enum)\s+([a-zA-Z_]\w+)', flags=ascii_p3)
-RE_typedef = re.compile(r'\b(typedef)\s+([a-zA-Z_]\w+)', flags=ascii_p3)
+RE_struct = re.compile(r'\b(struct)\s+([a-zA-Z_]\w+)', flags=re.ASCII)
+RE_union = re.compile(r'\b(union)\s+([a-zA-Z_]\w+)', flags=re.ASCII)
+RE_enum = re.compile(r'\b(enum)\s+([a-zA-Z_]\w+)', flags=re.ASCII)
+RE_typedef = re.compile(r'\b(typedef)\s+([a-zA-Z_]\w+)', flags=re.ASCII)
 
 #
 # Detects a reference to a documentation page of the form Documentation/... with
@@ -87,13 +79,8 @@ def markup_refs(docname, app, node):
     #
     # Associate each regex with the function that will markup its matches
     #
-    markup_func_sphinx2 = {RE_doc: markup_doc_ref,
-                           RE_abi_file: markup_abi_file_ref,
-                           RE_abi_symbol: markup_abi_ref,
-                           RE_function: markup_c_ref,
-                           RE_generic_type: markup_c_ref}
 
-    markup_func_sphinx3 = {RE_doc: markup_doc_ref,
+    markup_func = {RE_doc: markup_doc_ref,
                            RE_abi_file: markup_abi_file_ref,
                            RE_abi_symbol: markup_abi_ref,
                            RE_function: markup_func_ref_sphinx3,
@@ -103,11 +90,6 @@ def markup_refs(docname, app, node):
                            RE_typedef: markup_c_ref,
                            RE_git: markup_git}
 
-    if sphinx.version_info[0] >= 3:
-        markup_func = markup_func_sphinx3
-    else:
-        markup_func = markup_func_sphinx2
-
     match_iterators = [regex.finditer(t) for regex in markup_func]
     #
     # Sort all references by the starting position in text
-- 
2.48.1

