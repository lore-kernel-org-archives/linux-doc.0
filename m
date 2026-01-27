Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E3C33D6C2;
	Tue, 27 Jan 2026 10:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508824; cv=none; b=pXupF4/4evQfKxVDWomUwH6qB2wkJStKFtIImQ4CXi41O66dw1fvtXQQJFQnjsJKJ0Fl98r6F5/culRnpQ5Y5wpqnprtjfEDXZt11LAzA/JAGy/unHvB8zEkbaVzJaw2YQ23INTyK1FWR8XkxRuWNJ81bW8mw1jtNKE4XaP9d5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508824; c=relaxed/simple;
	bh=5//ZOdfzPAeDsrOOPfY5KESFavGP66fIfvEIEsMy5Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GNoB8t3H6CDNtAl7Tjv0Or3B7tOf02l7jLgDDCWSpsI+s13EglMK6m45VtPxpKxrj+zdkotZJ7Pu6UJqMbk2BTD2H9TnFmeHHsdcXMXoGenr+D44AaE5DwF67arj7F6qlCp9kgIefSF0CuWMc/8ESonBaaeuj7OeoCxfFPFjJAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9qYPv1n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9qYPv1n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977D7C2BC9E;
	Tue, 27 Jan 2026 10:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508822;
	bh=5//ZOdfzPAeDsrOOPfY5KESFavGP66fIfvEIEsMy5Zs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e9qYPv1nOAfF1zoRgDeRgk/jhvKvKcERG0IuoEoffZ9HG+XY0ExzfcxJKC3ohwlVo
	 M/DHwRkrfdspGJQ3qVth4VI9uVGb+xbbK8x8M1WUtbCrkMHx8gDIGJ8gKGsWNbsBr/
	 Sz2eisxD/ArdZFSzikitdjjXgewzzh11P+t1fZPoRX3fqGk85UbFvJx2XB5WQm3feZ
	 XBeh/kC76uT31839Z+28mZni7dA6sEnG8XOkCU45tnHFDPHG60NTO9Vsn28owD2iyP
	 RErGvqRu5WvJ751wCWCkSRZLGLGJ8bAwCmc2UnP61Y2NuvT0Vtnb8O/BIynXVhU+4v
	 Wbl+DQLtvGh+Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vkg4q-0000000BVPh-3gxa;
	Tue, 27 Jan 2026 11:13:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 08/14] docs: kdoc_parser: fix the default_value logic for variables
Date: Tue, 27 Jan 2026 11:13:27 +0100
Message-ID: <8ddd54068e779a0258d4f007bd0a8667c42175c5.1769508371.git.mchehab+huawei@kernel.org>
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

The indentation is wrong for the second regex, which causes
problems on variables with defaults.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 94721d6a8204..85f4e90c49c8 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -1018,9 +1018,9 @@ class KernelDoc:
             default_val = r.group(2)
         else:
             r= KernRe(OPTIONAL_VAR_ATTR + r"(?:[\w_]*)?\s+(?:\*+)?(?:[\w_]+)\s*[\d\]\[]*\s*(=.*)?")
-        if r.match(proto):
-            default_val = r.group(1)
 
+            if r.match(proto):
+                default_val = r.group(1)
         if not declaration_name:
            self.emit_msg(ln,f"{proto}: can't parse variable")
            return
-- 
2.52.0

