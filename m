Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419432F7465;
	Mon, 24 Nov 2025 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763978276; cv=none; b=h7rBR2aJmbqnX3/VJxcSr6qADkq4+E4X9L2tU34M/dt9CtrlweEuN17jZwMn6o19JlNOglU4JO1dENer+Ldku8j3SmlFvzon2o3BoEdNlG8EkSCT0zubU/zfPiozroJTQnxfGcobFxV6y02KMle0gX2J7N4k94lcPlPpk66Lswo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763978276; c=relaxed/simple;
	bh=3mMj2/bpTFkS1JYhOQCrsyMcgLS2GZpq30GUkfbjkfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8GmIFoAAp6sxsJc0ooumrf4FrOZboGmh1eLMdJ/SN+QIqTv64C98FUt3jvq0QSvBrGEmvORDz91dNwWOdLO+XZYtgKAfoeOmHFyuxy+Sqn6TeYbp6jcjRMXyr9zkMRbFtXcbLhd/4YQLNC9li+2zj9awmSO8ucEzMIbAmS0IuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRjkr/9y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRjkr/9y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9983C4CEF1;
	Mon, 24 Nov 2025 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763978275;
	bh=3mMj2/bpTFkS1JYhOQCrsyMcgLS2GZpq30GUkfbjkfo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sRjkr/9y/S3J3nn0oRA1BYaYl+/9FpdqkM5DZvharGOT2C3VGHgsC1TZJWXR5y8Qo
	 T+zueOrYe4A6gph7oFdJmBUZPTiFYZrx5hzHEIJfFtjG/t+EqhdUMeQa4aai/bc2SO
	 IYYelnnwYAtvjH933HONP8CNYuu0WK0W9dvON4LutrNWpj4QqPDK/6HODFGyhguzjM
	 c4A0pQfeCKMW1LHSc5UDhyOdmECMC7yXz8zIQanbm+HMxyrfkEC0Qh7fMlfZd0sT0f
	 lHCeUtVH0BGUEMLBpZOKC3CKS12K6AFvHviYdqlKnhjuHUeTEVFX30+XFU/tZ+nDQr
	 4paur02+oYAHg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vNTKU-000000013c0-0WII;
	Mon, 24 Nov 2025 10:57:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/5] kernel-doc: add support for handling global variables
Date: Mon, 24 Nov 2025 10:57:42 +0100
Message-ID: <c08067e2bfe253e5969076c0fc76dc9cfd7f3d3b.1763978209.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763978209.git.mchehab+huawei@kernel.org>
References: <cover.1763978209.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Specially on kAPI, sometimes it is desirable to be able to
describe global variables that are part of kAPI.

Documenting vars with Sphinx is simple, as we don't need
to parse a data struct. All we need is the variable
declaration and use natice C domain ::c:var: to format it
for us.

Add support for it.

Link: https://lore.kernel.org/linux-doc/491c3022-cef8-4860-a945-c9c4a3b63c09@infradead.org/T/#m947c25d95cb1d96a394410ab1131dc8e9e5013f1
Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 47 +++++++++++++++++++++++
 tools/lib/python/kdoc/kdoc_parser.py | 56 +++++++++++++++++++++++++++-
 2 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 14378953301b..8d811c2afaab 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -199,6 +199,10 @@ class OutputFormat:
             self.out_enum(fname, name, args)
             return self.data
 
+        if dtype == "var":
+            self.out_var(fname, name, args)
+            return self.data
+
         if dtype == "typedef":
             self.out_typedef(fname, name, args)
             return self.data
@@ -227,6 +231,9 @@ class OutputFormat:
     def out_enum(self, fname, name, args):
         """Outputs an enum"""
 
+    def out_var(self, fname, name, args):
+        """Outputs a variable"""
+
     def out_typedef(self, fname, name, args):
         """Outputs a typedef"""
 
@@ -472,6 +479,25 @@ class RestFormat(OutputFormat):
         self.lineprefix = oldprefix
         self.out_section(args)
 
+    def out_var(self, fname, name, args):
+        oldprefix = self.lineprefix
+        ln = args.declaration_start_line
+        full_proto = args.other_stuff["full_proto"]
+
+        self.lineprefix = "  "
+
+        self.data += f"\n\n.. c:macro:: {name}\n\n{self.lineprefix}{full_proto}\n\n"
+
+        self.print_lineno(ln)
+        self.output_highlight(args.get('purpose', ''))
+        self.data += "\n"
+
+        if args.other_stuff["default_val"]:
+            self.data += f'{self.lineprefix}**Initialization**\n\n'
+            self.output_highlight(f'default: ``{args.other_stuff["default_val"]}``')
+
+        self.out_section(args)
+
     def out_typedef(self, fname, name, args):
 
         oldprefix = self.lineprefix
@@ -773,6 +799,27 @@ class ManFormat(OutputFormat):
             self.data += f'.SH "{section}"' + "\n"
             self.output_highlight(text)
 
+    def out_var(self, fname, name, args):
+        out_name = self.arg_name(args, name)
+        prototype = args.other_stuff["var_type"]
+        full_proto = args.other_stuff["full_proto"]
+
+        self.data += f'.TH "{self.modulename}" 9 "{out_name}" "{self.man_date}" "API Manual" LINUX' + "\n"
+
+        self.data += ".SH NAME\n"
+        self.data += f"{prototype} \\- {args['purpose']}\n"
+
+        self.data += ".SH SYNOPSIS\n"
+        self.data += f"{full_proto}\n"
+
+        if args.other_stuff["default_val"]:
+            self.data += f'.SH "Initialization"' + "\n"
+            self.output_highlight(f'default: {args.other_stuff["default_val"]}')
+
+        for section, text in args.sections.items():
+            self.data += f'.SH "{section}"' + "\n"
+            self.output_highlight(text)
+
     def out_typedef(self, fname, name, args):
         module = self.modulename
         purpose = args.get('purpose')
diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index c0cc714d4d6f..edb0fb5330e0 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -64,7 +64,7 @@ type_param = KernRe(r"@(\w*((\.\w+)|(->\w+))*(\.\.\.)?)", cache=False)
 # Tests for the beginning of a kerneldoc block in its various forms.
 #
 doc_block = doc_com + KernRe(r'DOC:\s*(.*)?', cache=False)
-doc_begin_data = KernRe(r"^\s*\*?\s*(struct|union|enum|typedef)\b\s*(\w*)", cache = False)
+doc_begin_data = KernRe(r"^\s*\*?\s*(struct|union|enum|typedef|var)\b\s*(\w*)", cache = False)
 doc_begin_func = KernRe(str(doc_com) +			# initial " * '
                         r"(?:\w+\s*\*\s*)?" + 		# type (not captured)
                         r'(?:define\s+)?' + 		# possible "define" (not captured)
@@ -924,6 +924,58 @@ class KernelDoc:
         self.output_declaration('enum', declaration_name,
                                 purpose=self.entry.declaration_purpose)
 
+    def dump_var(self, ln, proto):
+        """
+        Store variables that are part of kAPI.
+        """
+        VAR_ATTRIBS = [
+            "extern",
+        ]
+        OPTIONAL_VAR_ATTR = "^(?:" + "|".join(VAR_ATTRIBS) + ")?"
+
+        sub_prefixes = [
+            (KernRe(r"__read_mostly"), ""),
+            (KernRe(r"__ro_after_init"), ""),
+            (KernRe(r"(?://.*)$"), ""),
+            (KernRe(r"(?:/\*.*\*/)"), ""),
+            (KernRe(r";$"), ""),
+            (KernRe(r"=.*"), ""),
+        ]
+
+        #
+        # Store the full prototype before modifying it
+        #
+        full_proto = proto
+
+        #
+        # Drop comments and macros to have a pure C prototype
+        #
+        for search, sub in sub_prefixes:
+            proto = search.sub(sub, proto)
+
+        proto = proto.rstrip()
+
+        #
+        # Variable name is at the end of the declaration
+        #
+
+        r= KernRe(OPTIONAL_VAR_ATTR + r"\w.*\s+(?:\*+)?([\w_]+)\s*[\d\]\[]*\s*(=.*)?")
+        if not r.match(proto):
+           self.emit_msg(ln,f"{proto}: can't parse variable")
+           return
+
+        var_type = r.group(0)
+        declaration_name = r.group(1)
+        default_val = r.group(2)
+        if default_val:
+            default_val = default_val.lstrip("=").strip()
+
+        self.output_declaration("var", declaration_name,
+                                full_proto=full_proto,
+                                var_type=var_type,
+                                default_val=default_val,
+                                purpose=self.entry.declaration_purpose)
+
     def dump_declaration(self, ln, prototype):
         """
         Stores a data declaration inside self.entries array.
@@ -935,6 +987,8 @@ class KernelDoc:
             self.dump_typedef(ln, prototype)
         elif self.entry.decl_type in ["union", "struct"]:
             self.dump_struct(ln, prototype)
+        elif self.entry.decl_type == "var":
+            self.dump_var(ln, prototype)
         else:
             # This would be a bug
             self.emit_message(ln, f'Unknown declaration type: {self.entry.decl_type}')
-- 
2.51.1

