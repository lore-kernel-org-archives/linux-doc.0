Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FA424DCE5;
	Sun, 16 Nov 2025 11:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763292218; cv=none; b=I2UUL/lXv7/nutUgQrwGs2Mn8E3Z5oEx2x0FOKGZH2cqO4YM62V9iYe+UGfsva+e7X8saVdzHuSbJhKYtynxe0ddeLXZY11h1ko+Jz0NfcK4tlh2VhNqv711LikVEt3KzfVj6J8ftCDJNOu+bbZqqnXG3/DQeJ/2anoXw5hpeeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763292218; c=relaxed/simple;
	bh=v7eo6iHRBABPHRCTaz5JBdEuPRSbCaStWmPRTQRGhbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IsQEC+umzwTzeA399YATFUXpKVHyALKSoQz/V4H4A6ZQgbB31RjHav+ZIVUfRaP2BcLSBClvIGHGMxSa70ui+kRYwmaENpAgmvjoWmyZyCy7FRWd3qJZwfjaCwRg39LuZp3F5q/5Vtp3OM+d4uuJ4KDm4mDpVO/HmgVlmBP/09M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YeZeQnpn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YeZeQnpn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D398FC16AAE;
	Sun, 16 Nov 2025 11:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763292217;
	bh=v7eo6iHRBABPHRCTaz5JBdEuPRSbCaStWmPRTQRGhbo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YeZeQnpnUt4XgWb+jadloOcZ+pJju+xB/tKKqWu/u3hExgyvrQf+yvi/YnZPy4iS5
	 7eopaC4Qb5K5CFEfNksCyO+dS/9RZV5J7P3G6IqbIgakqnQeUZAzJ05DE32w3REjgt
	 FUXLEEAgv+tBcdxvB5ObLaIXdum2oZrBzataz+e+/gFEsNyuAfcjZ+oI0klrMiQ6Wg
	 A1gtdX4socomyFm8RG7RtaDorhT6XdAFef77af4pTlsCMH49burSVgnCu3CAuq4bpU
	 nffX4bBA9z16xwaFcCvbBwJmU5Z9YG7zqSKMXcHVpZd+Hfutl1AHZDYdss0qR8l3sX
	 kUdIagPipxwaw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vKar1-0000000Ffke-2vsb;
	Sun, 16 Nov 2025 12:23:35 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] kernel-doc: add support for handling global variables
Date: Sun, 16 Nov 2025 12:23:30 +0100
Message-ID: <2d3108a03afc4e48de85835667f5875af97b6a38.1763291890.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763291890.git.mchehab+huawei@kernel.org>
References: <cover.1763291890.git.mchehab+huawei@kernel.org>
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
 scripts/lib/kdoc/kdoc_output.py | 45 ++++++++++++++++++++++++++
 scripts/lib/kdoc/kdoc_parser.py | 56 ++++++++++++++++++++++++++++++++-
 2 files changed, 100 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index 58f115059e93..1d97a3f2c738 100644
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
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
 
@@ -472,6 +479,24 @@ class RestFormat(OutputFormat):
         self.lineprefix = oldprefix
         self.out_section(args)
 
+    def out_var(self, fname, name, args):
+        oldprefix = self.lineprefix
+        ln = args.declaration_start_line
+        prototype = args.other_stuff["var_type"]
+
+        self.data += f"\n\n.. c:var:: {prototype}\n\n"
+
+        self.print_lineno(ln)
+        self.lineprefix = "  "
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
@@ -773,6 +798,26 @@ class ManFormat(OutputFormat):
             self.data += f'.SH "{section}"' + "\n"
             self.output_highlight(text)
 
+    def out_var(self, fname, name, args):
+        out_name = self.arg_name(args, name)
+        prototype = args.other_stuff["var_type"]
+
+        self.data += f'.TH "{self.modulename}" 9 "{out_name}" "{self.man_date}" "API Manual" LINUX' + "\n"
+
+        self.data += ".SH NAME\n"
+        self.data += f"{prototype} \\- {args['purpose']}\n"
+
+        self.data += ".SH SYNOPSIS\n"
+        self.data += f"{prototype};\n"
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
diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index f7dbb0868367..26f529e58eee 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
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

