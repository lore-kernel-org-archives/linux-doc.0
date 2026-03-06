Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6BC3EBF28;
	Fri,  6 Mar 2026 15:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811959; cv=none; b=dWh0+UbQD9EWc8EEZxebw5qLgamuntvCjQDCiBPdVOhhGuVqPnqO1mxBP9W4q0eYm+jGgY6KsdLY6XB0eltmLeEDb4aGw7HhPU0nQ0a0oPn3AhqYQK+a+kW4Fs8fc+iSBCWfHVa5JoVi4ceBQTWly0Z1DywmohrejrSZiaV3c4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811959; c=relaxed/simple;
	bh=aKvP29cXF0GJiPOdswGAUP5rFW3a8a2+GzBPBrAzC1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cF7Xv/Dp2EHBT5G3f3CZT86kOWn46XazMXIPLa9oCLLjSk+2OnwX/+oDb4ZjcZB8RdxTQkJRIh2tROIDa3NSci3zO8SVYqaagSjyXb9qSwjE1ZobzRFKx2YjvFa31tEr72V9ilechIiuUef2s1622k+XalFpfs/BAgW5Ie5t1jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUC+NM1y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUC+NM1y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174CAC2BC9E;
	Fri,  6 Mar 2026 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772811959;
	bh=aKvP29cXF0GJiPOdswGAUP5rFW3a8a2+GzBPBrAzC1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YUC+NM1yp4roEYOexFeWOtB2/0rAlaI0f3tOIX9PpTCaxD9K4yyFKKY7be7uYY0X/
	 JDTYjr2gnbFYg0G9h0uQ4fnd4KcGvUt46L/2xxS0Ay8wg8E6QBEBbBjsIUmUJheeqm
	 VS/E4ZgZ9ybwmyuR6r3Tb+c/UwV64FkKUeA4qlPW5aOoLVFOVttYkfdaexaUZvW8Pl
	 eIS3IsmDQ/BgL9zJnS2ueTvNSLsSBRz3LASFF1DJ5GNoGFbza7mM2WzX8Bd5khieIc
	 bETUlls+RDuapzGBwqUA1GsqIi7A7+vVley/Dc3S86B/YHN92hVi9VI9rC+mQapmKF
	 g1Ag1Fw4E1ssg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyXNF-00000007Edn-1RF1;
	Fri, 06 Mar 2026 16:45:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 07/13] docs: kdoc_output: fix naming for DOC markups
Date: Fri,  6 Mar 2026 16:45:45 +0100
Message-ID: <11d809e5c4bec23240d3ace3f342dbb2a9263446.1772810752.git.mchehab+huawei@kernel.org>
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

Right now, DOC markups aren't being handled properly, as it was
using the same name for all output.

Fix it by filling the title argument on a different way.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/sphinx-build-wrapper      |  2 +-
 tools/lib/python/kdoc/kdoc_output.py | 38 +++++++++++++++++-----------
 2 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index d3f0dba13da1..2c63d28f639d 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -625,7 +625,7 @@ class SphinxBuilder:
 
                 # Use shlex here, as it handles well parameters with commas
                 args = shlex.split(line)
-                fname = f"{args[3]}.{args[2]}"
+                fname = f"{args[1]}.{args[2]}"
                 fname = fname.replace("/", " ")
                 fname = f"{output_dir}/{fname}"
 
diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 62e300e65405..cf834dbf2725 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -607,14 +607,21 @@ class ManFormat(OutputFormat):
         "%m %d %Y",
     ]
 
-    def emit_th(self, name):
+    def modulename(self, args):
+        if self._modulename:
+            return self._modulename
+
+        return os.path.dirname(args.fname)
+
+    def emit_th(self, name, args):
         """Emit a title header line."""
-        name = name.strip()
+        title = name.strip()
+        module = self.modulename(args)
 
-        self.data += f'.TH "{self.modulename}" {self.section} "{name}" '
-        self.data += f'"{self.date}" "{self.manual}"\n'
+        self.data += f'.TH "{name}" {self.section} "{self.date}" '
+        self.data += f'"{self.modulename}" "{self.manual}"\n'
 
-    def __init__(self, modulename, section="9", manual="Kernel API Manual"):
+    def __init__(self, modulename=None, section="9", manual="Kernel API Manual"):
         """
         Creates class variables.
 
@@ -624,7 +631,7 @@ class ManFormat(OutputFormat):
 
         super().__init__()
 
-        self.modulename = modulename
+        self._modulename = modulename
         self.section = section
         self.manual = manual
 
@@ -658,7 +665,8 @@ class ManFormat(OutputFormat):
         dtype = args.type
 
         if dtype == "doc":
-            return self.modulename
+            return name
+#            return os.path.basename(self.modulename(args))
 
         if dtype in ["function", "typedef"]:
             return name
@@ -735,7 +743,7 @@ class ManFormat(OutputFormat):
 
         out_name = self.arg_name(args, name)
 
-        self.emit_th(out_name)
+        self.emit_th(out_name, args)
 
         for section, text in args.sections.items():
             self.data += f'.SH "{section}"' + "\n"
@@ -745,7 +753,7 @@ class ManFormat(OutputFormat):
 
         out_name = self.arg_name(args, name)
 
-        self.emit_th(out_name)
+        self.emit_th(out_name, args)
 
         self.data += ".SH NAME\n"
         self.data += f"{name} \\- {args['purpose']}\n"
@@ -791,7 +799,7 @@ class ManFormat(OutputFormat):
     def out_enum(self, fname, name, args):
         out_name = self.arg_name(args, name)
 
-        self.emit_th(out_name)
+        self.emit_th(out_name, args)
 
         self.data += ".SH NAME\n"
         self.data += f"enum {name} \\- {args['purpose']}\n"
@@ -824,7 +832,7 @@ class ManFormat(OutputFormat):
         out_name = self.arg_name(args, name)
         full_proto = args.other_stuff["full_proto"]
 
-        self.emit_th(out_name)
+        self.emit_th(out_name, args)
 
         self.data += ".SH NAME\n"
         self.data += f"{name} \\- {args['purpose']}\n"
@@ -841,11 +849,11 @@ class ManFormat(OutputFormat):
             self.output_highlight(text)
 
     def out_typedef(self, fname, name, args):
-        module = self.modulename
+        module = self.modulename(args)
         purpose = args.get('purpose')
         out_name = self.arg_name(args, name)
 
-        self.emit_th(out_name)
+        self.emit_th(out_name, args)
 
         self.data += ".SH NAME\n"
         self.data += f"typedef {name} \\- {purpose}\n"
@@ -855,12 +863,12 @@ class ManFormat(OutputFormat):
             self.output_highlight(text)
 
     def out_struct(self, fname, name, args):
-        module = self.modulename
+        module = self.modulename(args)
         purpose = args.get('purpose')
         definition = args.get('definition')
         out_name = self.arg_name(args, name)
 
-        self.emit_th(out_name)
+        self.emit_th(out_name, args)
 
         self.data += ".SH NAME\n"
         self.data += f"{args.type} {name} \\- {purpose}\n"
-- 
2.52.0

