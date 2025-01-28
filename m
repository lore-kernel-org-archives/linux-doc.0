Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE09C2ED;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=QvguzV/cS6XC0ZEeFhAFVvML4/rSepB5U/lMBcS6/DsnNhDPNhS/ZXNSLG9TsRDX8wk6nG7BQAybJKFVtqPNSL5iFL41B3rkoy5XEY49B2qaRJ3aewuKRDr0D/kh68SqGR0G4b3oNcRhyX5A7P5ErVngo92fUbqtpwAlbctTWDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=TU7X7H9KcDN4F2n1V6tnT6V+uLjYBbHR0Lyzk9YmCgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q/bQ5IWxeNE6g51Y+8g6v2usvsJFgYMMU+cJWv1JfnVtQzgrFqFh5z5Q9MyAgD8CAXuDZ72cUznY3w2ygy/A419HVsgwzzZOxO/2ih7rjSIGi9RI0Tlf7TWCcL/gP7jKX4IVhfWYokdEScZ6xbINjgHqn4EZe4k1E8WeQRwWvgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZtLvJFC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZtLvJFC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7548C4CEF4;
	Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022795;
	bh=TU7X7H9KcDN4F2n1V6tnT6V+uLjYBbHR0Lyzk9YmCgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XZtLvJFCPElgsXdvhNFgzqPOa23krxpnxtz6hDDyxJKscZB9ZYhiH7TPzPNTSa5RU
	 4a9PaZSl89lRyYcGkvA1/Bs54Lef0ufD5Owwt7Gjw9/KIcnM4AyvDOQKPiUGXAObMV
	 IRqtC1+W5pDt/ra8ujLllS1i4ACUmAbHZLvTjbAKVPcyEyQ5YDS5tbchRlwEMSs8KT
	 c/ltYM3zJsnEtw9w5eBBfX+Acu4nISb8L1Upc3SVFme8d9ct4vFkZM+R/O5/3O+N7A
	 EW4uaQsFiEIXrua6i2I3e13JUYiCrO7cVofcr31Lhhb6xJddZLu1PWqirsvcY4N+l1
	 YbCG06HIa4GlA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7i-0000000DRLT-07kE;
	Tue, 28 Jan 2025 01:06:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 17/38] scripts/get_abi.py: use an interactor for ReST output
Date: Tue, 28 Jan 2025 01:06:06 +0100
Message-ID: <72a53ca85e554b0c1fb90488d55aa62ec1d7defe.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Instead of printing all results line per line, use an interactor
to return each variable as a separate message.

This won't change much when using it via command line, but it
will help Sphinx integration by providing an interactor that
could be used there to handle ABI symbol by symbol.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.py | 52 ++++++++++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index 73613fb29c1c..2aec1f9dc5aa 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -349,7 +349,7 @@ class AbiParser:
                 name = os.path.join(root, entry.name)
 
                 if entry.is_dir():
-                    self.parse_abi(name)
+                    self._parse_abi(name)
                     continue
 
                 if not entry.is_file():
@@ -378,14 +378,14 @@ class AbiParser:
         if self.debug & DEBUG_DUMP_ABI_STRUCTS:
             self.log.debug(pformat(self.data))
 
-    def print_desc_txt(self, desc):
+    def desc_txt(self, desc):
         """Print description as found inside ABI files"""
 
         desc = desc.strip(" \t\n")
 
-        print(desc + "\n")
+        return desc + "\n\n"
 
-    def print_desc_rst(self, desc):
+    def desc_rst(self, desc):
         """Enrich ReST output by creating cross-references"""
 
         # Remove title markups from the description
@@ -439,9 +439,9 @@ class AbiParser:
 
             new_desc += d + "\n"
 
-        print(new_desc + "\n")
+        return new_desc + "\n\n"
 
-    def print_data(self, enable_lineno, output_in_txt, show_file=False):
+    def doc(self, enable_lineno, output_in_txt, show_file=False):
         """Print ABI at stdout"""
 
         part = None
@@ -456,9 +456,11 @@ class AbiParser:
             if not show_file and wtype == "File":
                 continue
 
+            msg = ""
+
             if enable_lineno:
                 ln = v.get("line_no", 1)
-                print(f".. LINENO {file_ref[0][0]}#{ln}\n")
+                msg += f".. LINENO {file_ref[0][0]}#{ln}\n\n"
 
             if wtype != "File":
                 cur_part = names[0]
@@ -470,9 +472,9 @@ class AbiParser:
 
                 if cur_part and cur_part != part:
                     part = cur_part
-                    print(f"{part}\n{"-" * len(part)}\n")
+                    msg += f"{part}\n{"-" * len(part)}\n\n"
 
-                print(f".. _{key}:\n")
+                msg += f".. _{key}:\n\n"
 
                 max_len = 0
                 for i in range(0, len(names)):           # pylint: disable=C0200
@@ -480,45 +482,47 @@ class AbiParser:
 
                     max_len = max(max_len, len(names[i]))
 
-                print("+-" + "-" * max_len + "-+")
+                msg += "+-" + "-" * max_len + "-+\n"
                 for name in names:
-                    print(f"| {name}" + " " * (max_len - len(name)) + " |")
-                    print("+-" + "-" * max_len + "-+")
-                print()
+                    msg += f"| {name}" + " " * (max_len - len(name)) + " |\n"
+                    msg += "+-" + "-" * max_len + "-+\n"
+                msg += "\n"
 
             for ref in file_ref:
                 if wtype == "File":
-                    print(f".. _{ref[1]}:\n")
+                    msg += f".. _{ref[1]}:\n\n"
                 else:
                     base = os.path.basename(ref[0])
-                    print(f"Defined on file :ref:`{base} <{ref[1]}>`\n")
+                    msg += f"Defined on file :ref:`{base} <{ref[1]}>`\n\n"
 
             if wtype == "File":
-                print(f"{names[0]}\n{"-" * len(names[0])}\n")
+                msg += f"{names[0]}\n{"-" * len(names[0])}\n\n"
 
             desc = v.get("description")
             if not desc and wtype != "File":
-                print(f"DESCRIPTION MISSING for {names[0]}\n")
+                msg += f"DESCRIPTION MISSING for {names[0]}\n\n"
 
             if desc:
                 if output_in_txt:
-                    self.print_desc_txt(desc)
+                    msg += self.desc_txt(desc)
                 else:
-                    self.print_desc_rst(desc)
+                    msg += self.desc_rst(desc)
 
             symbols = v.get("symbols")
             if symbols:
-                print("Has the following ABI:\n")
+                msg += "Has the following ABI:\n\n"
 
                 for w, label in symbols:
                     # Escape special chars from content
                     content = self.re_escape.sub(r"\\\1", w)
 
-                    print(f"- :ref:`{content} <{label}>`\n")
+                    msg += f"- :ref:`{content} <{label}>`\n\n"
 
             users = v.get("users")
             if users and users.strip(" \t\n"):
-                print(f"Users:\n\t{users.strip("\n").replace('\n', '\n\t')}\n")
+                msg += f"Users:\n\t{users.strip("\n").replace('\n', '\n\t')}\n\n"
+
+            yield msg
 
     def check_issues(self):
         """Warn about duplicated ABI entries"""
@@ -625,7 +629,9 @@ class AbiRest:
         parser = AbiParser(args.dir, debug=args.debug)
         parser.parse_abi()
         parser.check_issues()
-        parser.print_data(args.enable_lineno, args.raw, not args.no_file)
+
+        for msg in parser.doc(args.enable_lineno, args.raw, not args.no_file):
+            print(msg)
 
 
 class AbiValidate:
-- 
2.48.1

