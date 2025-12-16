Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908DF2C2343;
	Tue, 16 Dec 2025 14:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894779; cv=none; b=iIJLOORci7voLJpFubLjlTH37MCZVaNQniGrIcUEmG8u6DD16ck8wXR+VrobrpdQ0NjwBqLRpp7rhpdW0PkirxrGMQL3zP/e2HmFsolRR7TPXb8ArqYXrjWnqthWd2VFKTR7pqRSg34Y9BUqxlBSrtaM0DGrhff4+tWGf/1yG6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894779; c=relaxed/simple;
	bh=NGjJSzPHUhLrxbgjeCgA2jiaySSHpT2Q4b/PjRan67U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r8isvdcIQQfHTmG/elR8tvaA5hLtjwyAvpySvMjbGl22DCWIjaraC19SfBBT/h2vcKe2eAiRDm3OqQmvFVT3TbICNSPCHboZ8YhDZIp74nAlARUVuykOHyP2SaQi2c4+Ild2fzPO96Q0V/xQyFrWInsNxWP/DxLW6qVZWbDv7dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ih32hZy2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ih32hZy2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EF0C4CEF5;
	Tue, 16 Dec 2025 14:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765894779;
	bh=NGjJSzPHUhLrxbgjeCgA2jiaySSHpT2Q4b/PjRan67U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ih32hZy2NMeiMnKdTY5+YicwHWn4JqpOpeLU4Gg/dZs/1rl1st+Xvck9TbQLamu7e
	 qUzq46auSvgvjpYr8MSb8p2TKfpkiINJmO6FuL7bYopitg5etdfb8OHRsWOJwTMDhJ
	 +wH76c6sX6ywS3dXioFLqylSu8M15dL+YRuRDj8/0oe3vkrP5oqg/Z/+/1wjZHPqgq
	 NS0qTBN2tyM4EpU6r8RPLQXTKA4rdpCHtcJZyarpfKel+RWoHcMZNk4leqvFYKMplw
	 HLxoWZ40FY4zOkzjFMp5Ard881++8EudcQAu8zfRWr998iPbcK8wWqtyFgvHmWF1ZI
	 G6mkVgbpFiG+g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vVVtp-00000000sRf-0tiE;
	Tue, 16 Dec 2025 15:19:37 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/6] kernel-doc: add support to handle DEFINE_ variables
Date: Tue, 16 Dec 2025 15:19:24 +0100
Message-ID: <757a45100cfc493984574ff780aa9d90506eecb4.1765894670.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765894670.git.mchehab+huawei@kernel.org>
References: <cover.1765894670.git.mchehab+huawei@kernel.org>
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

