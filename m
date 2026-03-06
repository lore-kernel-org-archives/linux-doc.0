Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E3F36C5BA;
	Fri,  6 Mar 2026 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811958; cv=none; b=YnM0zMkYJ7Z/BfBJoG0ZhiyvP95Kj+k4zLEZ/iycnjIGZIlMxOFQICYvbo7PzUS+jI6JhOH/LecSUVxX6fU/mgpwdULIQwT3HsblY8rFlazB5GBAUEQNQX704Rx3QMLDGzlj0q2mLPyfm/VOCth2RMpkgSC1ByGgnY/IzTZlCyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811958; c=relaxed/simple;
	bh=XMzNqgRp0gmQJyWaL/t7SqMf5vJ/1MBUlDjM38i47fA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OhGru5untn5wzUG71pXXJaamilhU5TKkEQv0N6j0x5h5PQDNjaM0s315moVe4Swj4+1eg4n+mGNbwP3ccwyXJAWpl6U0/wRq1uni/VXzm94y3lVAAUplXIBNDBf/imxQ2IleaJ8ug0RxuhAb3u6Bt8lKLIYGGlpDAOQcMaCikRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pe8tqRYx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pe8tqRYx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74848C2BCAF;
	Fri,  6 Mar 2026 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772811958;
	bh=XMzNqgRp0gmQJyWaL/t7SqMf5vJ/1MBUlDjM38i47fA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pe8tqRYxiLf2hf+HD72SZUIrHGMcAGb1NRvdmmIpY35XeyUge5tikhhaZ7myFI48s
	 71zmALJqa/iBjpWKYk7edtleloxz1E5L7l/3zC7EoQAZR3g+BDEXfZVBjeinc3QT+N
	 LlZjwEt8HrRi/t5YxEROao3MADkanvDCILNRTArWALdiAkc/mTpIez/Xhoe9/GuJFV
	 pYsrSuCueTZPTOLzS7hExcZZLq+qJ/6KvEYUmlxBMExSpbuBsRjgPGcwbHZLCgkmTI
	 OOtEat2qzW7wLi8fUsmTfMPaEFQYqmBrdgDoej7I41v/28Gcj2iSxv8Y2sCmGAIkSj
	 6st1GCbY9tT5w==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyXNE-00000007EYt-2OV5;
	Fri, 06 Mar 2026 16:45:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/13] docs: kdoc_output: use a method to emit the .TH header
Date: Fri,  6 Mar 2026 16:45:41 +0100
Message-ID: <2e55fcfe8724fde08a78635a1a3f8b449a6adf82.1772810752.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772810752.git.mchehab+huawei@kernel.org>
References: <cover.1772810752.git.mchehab+huawei@kernel.org>
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

