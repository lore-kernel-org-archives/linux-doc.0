Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E99D2EFDBF;
	Tue, 27 Jan 2026 10:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508821; cv=none; b=GDiaQ0JQRvBF93xwOUN+InnHUoPHtkgOpGE3hNDB7RAS0RKNW6JVETfTmdO2PCP391RUapfx6JGIJzny+beqA/csYQLcWCsE6St2JnOXNVKQ+IwazDAuW51KTHxe2cRHqag0FOkIgSl8HYqv6zm77Rb9CgIKdkYAA6nzueBm4UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508821; c=relaxed/simple;
	bh=BKELuR1jUEbVcQzQ17K35Ky0N8JEPhnejnuv0Z8iM9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IHtCBC4byGfc34nD7hWSaHD3Ju8uVSZeA1myhLSAL34a9hqBA7RMlPAm7jjZos46nB8RsSE4gA45ymhovJlOidheZfDuTsPFCj4dhCWRscXfiXm7aXtJWrIuZiuhivI+jlFWRuoDUouX4QyQH0pW2vISHxsJlDokAziWOilSCTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IhtkOvgr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhtkOvgr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC68C2BC87;
	Tue, 27 Jan 2026 10:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508821;
	bh=BKELuR1jUEbVcQzQ17K35Ky0N8JEPhnejnuv0Z8iM9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IhtkOvgrSVW4I8SyxhkgoSLKIy5px+0opKNiq0R9EBQsLOYO6Yt23DHTXDtDP7q64
	 yBKY9Lx6McocNWYOQ0aHiZL6d68Qp2pNxwZMJkCPzRcG+u3DM/K2bWTgthYCsk4UXK
	 zaQkdt6HiwRLmdjmUBLZIHnaClHGEKA6uZfKeWy+Iw8RGjIjqBDQSvdnTmjMx2lbtX
	 KiVJN0GWQY2+Y59+SiouhWXcSIjvXslBpQfnaNFn1TD5t7wdVW9GmrlvSlgOCbjchP
	 /S2gEmHT+l+HyWqd+gV4XS483ObhJXQqS4bN3oEVzC8pflfUnJkICLVEfWN5j0zW1F
	 ahGuNAVYWTq6g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vkg4p-0000000BVJm-12jZ;
	Tue, 27 Jan 2026 11:13:39 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 03/14] docs: kdoc_parser: move var transformers to the beginning
Date: Tue, 27 Jan 2026 11:13:22 +0100
Message-ID: <19eb57add5abd47948598ada7c860d67e8235775.1769508371.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769508371.git.mchehab+huawei@kernel.org>
References: <cover.1769508371.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Just like functions and structs had their transform variables
placed at the beginning, move variable transforms to there
as well.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index c03505889dc2..de75b102dd64 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -194,6 +194,18 @@ function_xforms  = [
     (KernRe(r"__attribute__\s*\(\((?:[\w\s]+(?:\([^)]*\))?\s*,?)+\)\)\s+"), ""),
 ]
 
+#
+# Transforms for variable prototypes
+#
+var_xforms = [
+    (KernRe(r"__read_mostly"), ""),
+    (KernRe(r"__ro_after_init"), ""),
+    (KernRe(r"(?://.*)$"), ""),
+    (KernRe(r"(?:/\*.*\*/)"), ""),
+    (KernRe(r";$"), ""),
+    (KernRe(r"=.*"), ""),
+]
+
 #
 # Apply a set of transforms to a block of text.
 #
@@ -955,15 +967,6 @@ class KernelDoc:
         ]
         OPTIONAL_VAR_ATTR = "^(?:" + "|".join(VAR_ATTRIBS) + ")?"
 
-        sub_prefixes = [
-            (KernRe(r"__read_mostly"), ""),
-            (KernRe(r"__ro_after_init"), ""),
-            (KernRe(r"(?://.*)$"), ""),
-            (KernRe(r"(?:/\*.*\*/)"), ""),
-            (KernRe(r";$"), ""),
-            (KernRe(r"=.*"), ""),
-        ]
-
         #
         # Store the full prototype before modifying it
         #
@@ -987,7 +990,7 @@ class KernelDoc:
         # Drop comments and macros to have a pure C prototype
         #
         if not declaration_name:
-            for r, sub in sub_prefixes:
+            for r, sub in var_xforms:
                 proto = r.sub(sub, proto)
 
         proto = proto.rstrip()
-- 
2.52.0

