Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F9634B19A;
	Tue, 16 Dec 2025 14:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895184; cv=none; b=dXj9F2cZ9mYrDkbX3cajwMPFiWThoU2mgvBIGqC4+IWYnF88va532BISuEouqqniZUsRIZCI3QKLB1W1JnQSGxUA7CFX74rFTRj9inFMIBd6ydTu/lMAPId6dZJx8fXbjvIKoo3s3NuF5dy+lpIM26oWDNGzIXbHIGbOGbIkJMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895184; c=relaxed/simple;
	bh=D5Dan+chdaKCsHfpLGspv1TIRzMfinLgSlG6JG25Zz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YsOEBZx+jgInlyvYtkD3gCzC3JtsQyuage8YjAE7TzylDX6p4yAoGoZ67cwqvBw+/u58A7UdU9u0hPqjj72Cb5YXwforM+hgXC9WienhJwTzuKQWZMvYx3MIiMshfX2cupCQhtBKm1IOIE3Ql6fS2vJPmLsmwSpSms1OQl4vIBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4ZhULlt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4ZhULlt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC15C4CEF1;
	Tue, 16 Dec 2025 14:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765895184;
	bh=D5Dan+chdaKCsHfpLGspv1TIRzMfinLgSlG6JG25Zz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F4ZhULltBwmzjiMZjPBrfdObM140oLI9BuiA0GVHSyMKW4rNqKuto+4t5EgZqHQoD
	 JtgeQLbTAUEMmOJ2HPv7YT1xCjNgyucjLBWSoyxPomvphMRp/H/uCZoeP8pMRGp4bW
	 NzIJCAEa6kncocXw2jVxSvvl264NiOOgDKIJIBp3MorCUieREzX9JRJq/3qPYl4RMZ
	 70jJbUtdURE2Xd0Co8ZEgXUWFR3JkH3S3SEfnXu8r+cg0CEY5duTa+H4Pwh6Hicx4C
	 lU11i9CWU/2FUgLgIVnle6q2tf5lyK8TMH7NsFShPSPFU+zKrGMK22r/lHaH7CqCuO
	 fAy4M52DihLqA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vVW0M-00000000ssF-2YcS;
	Tue, 16 Dec 2025 15:26:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/6] kernel-doc: add support for handling global variables
Date: Tue, 16 Dec 2025 15:26:12 +0100
Message-ID: <fa7d1c61a8de9150f71b318382f1507d3b13848d.1765894964.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765894964.git.mchehab+huawei@kernel.org>
References: <cover.1765894964.git.mchehab+huawei@kernel.org>
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
declaration and use native C domain ::c:var: to format it
for us.

Add support for it.

Link: https://lore.kernel.org/linux-doc/491c3022-cef8-4860-a945-c9c4a3b63c09@infradead.org/T/#m947c25d95cb1d96a394410ab1131dc8e9e5013f1
Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 47 +++++++++++++++++++++++
 tools/lib/python/kdoc/kdoc_parser.py | 56 +++++++++++++++++++++++++++-
 2 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index b1aaa7fc3604..50aedbb3d6de 100644
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
index 500aafc50032..06bed1a12a45 100644
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
@@ -927,6 +927,58 @@ class KernelDoc:
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
@@ -938,6 +990,8 @@ class KernelDoc:
             self.dump_typedef(ln, prototype)
         elif self.entry.decl_type in ["union", "struct"]:
             self.dump_struct(ln, prototype)
+        elif self.entry.decl_type == "var":
+            self.dump_var(ln, prototype)
         else:
             # This would be a bug
             self.emit_message(ln, f'Unknown declaration type: {self.entry.decl_type}')
-- 
2.52.0

