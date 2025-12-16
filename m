Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3667F34BA54;
	Tue, 16 Dec 2025 14:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895185; cv=none; b=bAUxR4k+lL0SSDGaLTDK6YuwUSNUJA7ojGdPewfdfZC6NK/cp6reldw7RuoqYxnlufUHw+K5OFNic2nRijdGQyRGTlal2ZjyhaWFPFXGhH9l/hXPMtVCF5RawCc6kEzzkEmT/lr+tlSi6PU6x0wu2JO0ep9A6D7VPJvXY3eayIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895185; c=relaxed/simple;
	bh=NGjJSzPHUhLrxbgjeCgA2jiaySSHpT2Q4b/PjRan67U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MDAgBLXUx3zEEaw4rU+XC2rM/Zu7D0myn+bD/Zp1CreA2NCS3gPlP7necEIAbVc2sfJuQCi7Z4Qic81hqjfYTQlFEV/TLIoaDvtv0NQ+d0ueo4/0GpxcVgnTDHnD2l/nhanu+akMq9NjAtkDNiVPyOqCsTDPl7Wjn5/jLrZlgyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5WwbdsE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5WwbdsE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9199C4CEF5;
	Tue, 16 Dec 2025 14:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765895184;
	bh=NGjJSzPHUhLrxbgjeCgA2jiaySSHpT2Q4b/PjRan67U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q5WwbdsE/K0OG7NIAv8XijYPMHpv9OxMzE7s53Nh7bvPiQmXH7N96Q/RZ6fVajZ5c
	 U/0TIvFqUILi8n2bKc83SfyvVI0JLtEBYr+HmkwzT4RJF30+NktKLaeLl6OGyoWWO3
	 M+YXRCreLYWlyucxeZVTYAgovAftGkabLMexAflzQasXF9xh4sLGArMp9L+ryN/M1h
	 oVrs0pyDPHg/uOpHFjHG06tVZjdwNUZeUNTlREzgFVb6jraIXP+wupza7BpcMkmUGU
	 TD4o/MYTr58Z5AQzAtpDNXqqPkSc3d+4FcXndl+hSDu2CBH/STZf+aEeAhYnsN4WP5
	 F3epAUx0IIXWA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vVW0N-00000000stQ-059y;
	Tue, 16 Dec 2025 15:26:23 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/6] kernel-doc: add support to handle DEFINE_ variables
Date: Tue, 16 Dec 2025 15:26:13 +0100
Message-ID: <757a45100cfc493984574ff780aa9d90506eecb4.1765894964.git.mchehab+huawei@kernel.org>
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

Improve the parser and output plugin to work with macros,
adding support for the common pattern of using DEFINE_*
to create variables.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py |  5 ++---
 tools/lib/python/kdoc/kdoc_parser.py | 25 +++++++++++++++++++++----
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 50aedbb3d6de..d2bf94275d65 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -486,7 +486,7 @@ class RestFormat(OutputFormat):
 
         self.lineprefix = "  "
 
-        self.data += f"\n\n.. c:macro:: {name}\n\n{self.lineprefix}{full_proto}\n\n"
+        self.data += f"\n\n.. c:macro:: {name}\n\n{self.lineprefix}``{full_proto}``\n\n"
 
         self.print_lineno(ln)
         self.output_highlight(args.get('purpose', ''))
@@ -801,13 +801,12 @@ class ManFormat(OutputFormat):
 
     def out_var(self, fname, name, args):
         out_name = self.arg_name(args, name)
-        prototype = args.other_stuff["var_type"]
         full_proto = args.other_stuff["full_proto"]
 
         self.data += f'.TH "{self.modulename}" 9 "{out_name}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
         self.data += ".SH NAME\n"
-        self.data += f"{prototype} \\- {args['purpose']}\n"
+        self.data += f"{name} \\- {args['purpose']}\n"
 
         self.data += ".SH SYNOPSIS\n"
         self.data += f"{full_proto}\n"
diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 06bed1a12a45..aaa352855717 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -949,12 +949,27 @@ class KernelDoc:
         # Store the full prototype before modifying it
         #
         full_proto = proto
+        declaration_name = None
+
+        #
+        # Handle macro definitions
+        #
+        macro_prefixes = [
+            KernRe(r"DEFINE_[\w_]+\s*\(([\w_]+)\)"),
+        ]
+
+        for r in macro_prefixes:
+            match = r.search(proto)
+            if match:
+                declaration_name = match.group(1)
+                break
 
         #
         # Drop comments and macros to have a pure C prototype
         #
-        for search, sub in sub_prefixes:
-            proto = search.sub(sub, proto)
+        if not declaration_name:
+            for r, sub in sub_prefixes:
+                proto = r.sub(sub, proto)
 
         proto = proto.rstrip()
 
@@ -968,14 +983,16 @@ class KernelDoc:
            return
 
         var_type = r.group(0)
-        declaration_name = r.group(1)
+
+        if not declaration_name:
+            declaration_name = r.group(1)
+
         default_val = r.group(2)
         if default_val:
             default_val = default_val.lstrip("=").strip()
 
         self.output_declaration("var", declaration_name,
                                 full_proto=full_proto,
-                                var_type=var_type,
                                 default_val=default_val,
                                 purpose=self.entry.declaration_purpose)
 
-- 
2.52.0

