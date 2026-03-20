Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0A736074D;
	Fri, 20 Mar 2026 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000006; cv=none; b=pRaOcZTQid0G6P91zl0JGYjDtq/Q7uxypzQ013f5n3vuIrLogELboZtrzJWjXv2gljDO+iWp6MXy2Pg1eK4nZ7nbdItUxovMOpiONIfW1SLQWJa/5T7mtN6sOyFe8iFfrtViv9eRbmmMlPdbP6GJWedCHMP8GCuXsHk8sR2CMDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000006; c=relaxed/simple;
	bh=amOEbNCdxScY/BrrxmdqbgqqhNfYJZMIZiArzjmasRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mgFeLKwAYYYBWCSVzpuGdQ4MrgRHpEaS/Kl+fOEHqMdI+SZQtG+gu+WdTBnipRquTJj6u4Re3eSousyeKGzNxIdS6n3SnJbJ3pnK0iWR5z4fPjflU+4cTRW55eigRStsacR0vvsyGrVQoUFb7KY/H3izkUlPd9B2tlUJBeOoMYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUXnj1KH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUXnj1KH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17F6C4CEF7;
	Fri, 20 Mar 2026 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774000005;
	bh=amOEbNCdxScY/BrrxmdqbgqqhNfYJZMIZiArzjmasRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JUXnj1KHzN8u2IVYJIL8rwLY/7CQ/PnSU6dPJSbtb0eYQoKmGiOGPXbjQiC841054
	 wT6OYzBrzR82xx5LAxPGTy9poPVFm2JoWDEChoVgK+WquBhovVhCquhMO0DQAhH7pj
	 vFxLNpfXX/hyawtmRFbdF0exg2RVkhYMfqnxHNTF2uk1XhF02bMpQIGYUo3PThMxTH
	 QF2ZOxTzPtrepSvsfI0pns8yPa4b/eWBCeBxw94Euujab/F2QE3x6efI1uS5VZ4AyA
	 j10wLwsdcLCI4r0VS6QFyfgUf+mKkyqb+mVhfsS2gNrY7uzUqR0Bm1ipBgVMpKMUkI
	 6kqmQCAnNelvA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w3WRH-0000000Cbv8-3VfL;
	Fri, 20 Mar 2026 10:46:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH RFC 1/2] docs: kdoc: add a class to parse data items
Date: Fri, 20 Mar 2026 10:46:40 +0100
Message-ID: <202163ad179e3a88b0a2c32e0bbb256a4d7cee8f.1773998596.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773998596.git.mchehab+huawei@kernel.org>
References: <cover.1773998596.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Instead of using very complex regular expressions and hamming
inner structs/unions, use CTokenizer to handle data types.

It should be noticed that this doesn't handle "typedef".

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/data_parser.py | 211 +++++++++++++++++++++++++++
 1 file changed, 211 insertions(+)
 create mode 100644 tools/lib/python/kdoc/data_parser.py

diff --git a/tools/lib/python/kdoc/data_parser.py b/tools/lib/python/kdoc/data_parser.py
new file mode 100644
index 000000000000..f04915b67d6b
--- /dev/null
+++ b/tools/lib/python/kdoc/data_parser.py
@@ -0,0 +1,211 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+# Copyright(c) 2025: Mauro Carvalho Chehab <mchehab@kernel.org>.
+
+"""
+C lexical parser for variables.
+"""
+
+import logging
+import re
+
+from .c_lex import CTokenizer, CToken
+
+class CDataItem:
+    """
+    Represent a data declaration.
+    """
+    def __init__(self):
+        self.decl_name = None
+        self.decl_type = None
+        self.parameterlist = []
+        self.parametertypes = {}
+
+    def __repr__(self) -> str:
+        """
+        Return contents of the CDataItem.
+        Useful for debugging purposes.
+        """
+        return (f"CDataItem(decl_type={self.decl_type!r}, "
+                f"decl_name={self.decl_name!r}, "
+                f"parameterlist={self.parameterlist!r}, "
+                f"parametertypes={self.parametertypes!r})")
+
+class CDataParser:
+    """
+    Handles a C data prototype, converting it into a data element
+    describing it.
+    """
+
+    IGNORE_TOKENS = [CToken.SPACE, CToken.COMMENT]
+
+    def __init__(self, source):
+        self.source = source
+        self.item = CDataItem()
+
+        self._parse()
+
+    def _push_struct(self, tokens, stack, prev_kind, i):
+        """
+        Handles Structs and enums, picking the identifier just after
+        ``struct`` or ``union``.
+        """
+
+        if prev_kind:
+            j = prev_kind + 1
+            while j < len(tokens) and tokens[j].kind in self.IGNORE_TOKENS:
+                j += 1
+
+            if j < len(tokens) and tokens[j].kind == CToken.NAME:
+                stack.append(tokens[j].value)
+                return
+
+            name = "{unnamed " + tokens[prev_kind].value + "}"
+            stack.append(name)
+            self.item.parameterlist.append(name)
+            return
+
+        #
+        # Empty block. We still need to append for stack levels to match
+        #
+        stack.append(None)
+
+    def _parse(self):
+        """
+        Core algorithm  it is a lightweight rewrite of the
+        walk-the-tokens logic we sketched in the previous answer.
+        """
+        tokens = CTokenizer(self.source).tokens
+
+        stack= []
+        current_type = []
+        parameters = []
+        types = {}
+
+        prev_kind = None
+        get_id = False
+        level = 0
+
+        for i in range(0, len(tokens)):
+            tok = tokens[i]
+            if tok.kind == CToken.COMMENT:
+                continue
+
+            if tok.kind in [CToken.STRUCT, CToken.UNION, CToken.ENUM]:
+                prev_kind = i
+
+            if tok.kind == CToken.BEGIN:
+                if tok.value == "{":
+                    if (prev_kind and
+                        tokens[prev_kind].kind in [CToken.STRUCT, CToken.UNION]):
+
+                        self._push_struct(tokens, stack, prev_kind, i)
+                        if not self.item.decl_name:
+                            self.item.decl_name = stack[0]
+                    else:
+                        stack.append(None)
+
+                        #
+                        # Add previous tokens
+                        #
+                        if prev_kind:
+                            get_id = True
+
+                    if not self.item.decl_type:
+                        self.item.decl_type = tokens[prev_kind].value
+
+                    current_type = []
+
+                    continue
+
+                level += 1
+
+            if tok.kind == CToken.END:
+                if tok.value == "}":
+                    if stack:
+                        stack.pop()
+
+                    if get_id and prev_kind:
+                        current_type = []
+                        for j in range(prev_kind, i + 1):
+                            current_type.append((level, tokens[j]))
+                            if tok.kind == CToken.BEGIN:
+                                break
+
+                        while j < len(tokens):
+                            if tokens[j].kind not in self.IGNORE_TOKENS:
+                                break
+                            j += 1
+
+                        name = None
+
+                        if tokens[j].kind == CToken.NAME:
+                            name = tokens[j].value
+
+                        if not self.item.decl_type and len(stack) ==  1:
+                            self.item.decl_name = stack[0]
+
+                            self.item.parameterlist.append(name)
+                            current_type.append((level, tok))
+
+                    get_id = False
+                    prev_kind = None
+                    continue
+
+                level -= 1
+
+            if tok.kind != CToken.ENDSTMT:
+                current_type.append((level, tok))
+                continue
+
+            #
+            # End of an statement. Parse it if tokens are present
+            #
+
+            if not current_type:
+                current_type = []
+                continue
+
+            #
+            # the last NAME token with level 0 is the field name
+            #
+            name_token = None
+            for pos, t in enumerate(reversed(current_type)):
+                cur_level, cur_tok = t
+                if not cur_level and cur_tok.kind == CToken.NAME:
+                    name_token = cur_tok. value
+                    break
+
+            #
+            # TODO: we should likely emit a Warning here
+            #
+
+            if not name_token:
+                current_type = []
+                continue
+
+            #
+            # As we used reversed, we need to adjust pos here
+            #
+            pos = len(current_type) - pos - 1
+
+            #
+            # For the type, pick everything but the name
+            #
+
+            out = ""
+            for l, t in current_type:
+                out += t.value
+
+            names = []
+            for n in stack[1:] + [name_token]:
+                if n:
+                    if not "{unnamed" in n:
+                        names.append(n)
+
+            full_name = ".".join(names)
+
+            self.item.parameterlist.append(full_name)
+            self.item.parametertypes[full_name] = out.strip()
+
+            current_type = []
-- 
2.53.0

