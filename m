Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32493C2779;
	Thu,  5 Mar 2026 15:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723788; cv=none; b=jMiUKgsWmAB+oNyRHDYTzyfU64a+b4odKCGblCICzzSClGaGnJzRdiIebut3LOtN7Od1bxGm0/bkTq5D2e//WjZdMFOOLi/56EmgyLIpuRXRlzMCkOkuvC8kGr0LsAEUv7yVr4qqi4jO6gv3dfOE7kuXPODPGlXuA6VnUud1WqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723788; c=relaxed/simple;
	bh=XMzNqgRp0gmQJyWaL/t7SqMf5vJ/1MBUlDjM38i47fA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZEHsKh21DadbvyUzxz8dFbvUoIcXaokVfowjhAfZu/SeXs5v/pFfGE3WYiPaGderfZj0FjC7qJylK/zraIFah50NpDDqODHh2vkBZESa87fKrKQhWkgW3wm1u322shziqdqe3oa7Hjh3vdKV3ALs3iP1YJrtAVAI700LHP6Ks2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdNfVPby; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdNfVPby"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0CD8C2BC87;
	Thu,  5 Mar 2026 15:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723787;
	bh=XMzNqgRp0gmQJyWaL/t7SqMf5vJ/1MBUlDjM38i47fA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KdNfVPbyPdr0d+NmXpEOu+fcCEg2Mfni/3RH38q/ouRHzw7/OxuuPYInGCfNe22/d
	 G68ni5ITQDErj0UFqN70yZThFiQfFSSBD4pC+J831CYoKGYK1vlQzNKanDr5uqeXHw
	 ga4yWHizjxViVn+u4Ykdkg/UJL1DEXW0b9asqf0mMUBFFhqu6tpKf9APx8rSwc6nCT
	 l8wzCNnmDCBRMC+5XpopXPJrE4jTWredCtXcdp9ry6mg2TJTW7f68V4xm2IDCv5Y4c
	 BEezdBhcdvZuuS9iH29wcIjeePiTZ1mcuFnMLOLAwD5dSSkrgrU7nEYXhNefw/AQaE
	 HRLjyg2h8CJdg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyAR8-0000000HK85-04Ci;
	Thu, 05 Mar 2026 16:16:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] docs: kdoc_output: use a method to emit the .TH header
Date: Thu,  5 Mar 2026 16:16:12 +0100
Message-ID: <bdf80f4523e6b3433f5e6e5925b62d9f48f81bea.1772722474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772722474.git.mchehab+huawei@kernel.org>
References: <cover.1772722474.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

All man emit functions need to add a .TH header. Move the code
to a common function, as we'll be addressing some issues at
the common code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 34 +++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 4210b91dde5f..fb6b90c54c8a 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -607,7 +607,20 @@ class ManFormat(OutputFormat):
         "%m %d %Y",
     ]
 
-    def __init__(self, modulename):
+    def emit_th(self, name, modulename = None, manual=None):
+        """Emit a title header line."""
+        name = name.strip()
+
+        if not manual:
+            manual = self.manual
+
+        if not modulename:
+            modulename = self.modulename
+
+        self.data += f'.TH "{modulename}" {self.section} "{name}" '
+        self.data += f'"{self.date}" "{manual}" LINUX\n'
+
+    def __init__(self, modulename, section="9", manual="API Manual"):
         """
         Creates class variables.
 
@@ -616,7 +629,11 @@ class ManFormat(OutputFormat):
         """
 
         super().__init__()
+
         self.modulename = modulename
+        self.section = section
+        self.manual = manual
+
         self.symbols = []
 
         dt = None
@@ -632,7 +649,7 @@ class ManFormat(OutputFormat):
         if not dt:
             dt = datetime.now()
 
-        self.man_date = dt.strftime("%B %Y")
+        self.date = dt.strftime("%B %Y")
 
     def arg_name(self, args, name):
         """
@@ -724,7 +741,7 @@ class ManFormat(OutputFormat):
 
         out_name = self.arg_name(args, name)
 
-        self.data += f'.TH "{self.modulename}" 9 "{out_name}" "{self.man_date}" "API Manual" LINUX' + "\n"
+        self.emit_th(out_name)
 
         for section, text in args.sections.items():
             self.data += f'.SH "{section}"' + "\n"
@@ -734,7 +751,8 @@ class ManFormat(OutputFormat):
 
         out_name = self.arg_name(args, name)
 
-        self.data += f'.TH "{name}" 9 "{out_name}" "{self.man_date}" "Kernel Hacker\'s Manual" LINUX' + "\n"
+        self.emit_th(out_name, modulename = name,
+                     manual="Kernel Hacker\'s Manual")
 
         self.data += ".SH NAME\n"
         self.data += f"{name} \\- {args['purpose']}\n"
@@ -780,7 +798,7 @@ class ManFormat(OutputFormat):
     def out_enum(self, fname, name, args):
         out_name = self.arg_name(args, name)
 
-        self.data += f'.TH "{self.modulename}" 9 "{out_name}" "{self.man_date}" "API Manual" LINUX' + "\n"
+        self.emit_th(out_name)
 
         self.data += ".SH NAME\n"
         self.data += f"enum {name} \\- {args['purpose']}\n"
@@ -813,7 +831,7 @@ class ManFormat(OutputFormat):
         out_name = self.arg_name(args, name)
         full_proto = args.other_stuff["full_proto"]
 
-        self.data += f'.TH "{self.modulename}" 9 "{out_name}" "{self.man_date}" "API Manual" LINUX' + "\n"
+        self.emit_th(out_name)
 
         self.data += ".SH NAME\n"
         self.data += f"{name} \\- {args['purpose']}\n"
@@ -834,7 +852,7 @@ class ManFormat(OutputFormat):
         purpose = args.get('purpose')
         out_name = self.arg_name(args, name)
 
-        self.data += f'.TH "{module}" 9 "{out_name}" "{self.man_date}" "API Manual" LINUX' + "\n"
+        self.emit_th(out_name)
 
         self.data += ".SH NAME\n"
         self.data += f"typedef {name} \\- {purpose}\n"
@@ -849,7 +867,7 @@ class ManFormat(OutputFormat):
         definition = args.get('definition')
         out_name = self.arg_name(args, name)
 
-        self.data += f'.TH "{module}" 9 "{out_name}" "{self.man_date}" "API Manual" LINUX' + "\n"
+        self.emit_th(out_name)
 
         self.data += ".SH NAME\n"
         self.data += f"{args.type} {name} \\- {purpose}\n"
-- 
2.52.0

