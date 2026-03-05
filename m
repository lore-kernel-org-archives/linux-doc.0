Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F983C6A2E;
	Thu,  5 Mar 2026 15:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723789; cv=none; b=mTjERiJ/zwVbDI8exNE1OWKZvHOJjD2IBSx0xpaTXOvgfKnFKcDTVQNMLf8ma0qJUO0xgFUbCKK4GMuZJ1XftDig5n8Zucyvu94F+hF8FOHQLOKDdlK0WaO/K5D/p8oQmjTZTuM/o6jqSZLh2XIauE7IvbVwemBfGi09bPudTOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723789; c=relaxed/simple;
	bh=KRhaVj36QPpFVRt1j0+gEDFYVEUP/qyFJd2IndbJHfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XNzl1lson5pPTNMNlNdF68a3RIK6Tq+c3iKW9YwJgcESXAS25Ub0XU40PiZjrw4DZdfOU2EQRsGg0JBXR2PvsYswHsZbFmzNrCUUG1hakGb28qUtZjq7UvpRLwFPEKt/MTNZwa196p/7she3yEEoeXPRJ2DFD3aDwUX3s2Yba7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSFIuG7I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSFIuG7I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3BCC19423;
	Thu,  5 Mar 2026 15:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723788;
	bh=KRhaVj36QPpFVRt1j0+gEDFYVEUP/qyFJd2IndbJHfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kSFIuG7IZonQGHHdPJDQwAjl54WLr6jkqE/S3GQf/C1Ze62oUQeu0hDwPSdhHTJqn
	 oRl2DoKqSJiOAInkCUnAeqQyOHygMU09nxb5nkHkjsuGf+xwPhXkA5QN2eRIqUXdOx
	 TSEA7zNqo9sslNsI7OkIOOJfV6nWDWdE9RuE4RVfuNklaDagQ5Hq1vUbBcPwgNhMx4
	 9PHcxZWYS06uuUVOqm/QbXZn2gQtlXyEnuKUm5DMSRPjwTsF0QNAw2OF/964U4CHqv
	 JKNRkzjGzB1Y9v8zY/EoMrblnMwg3o51tWSkvln1g8vjfNsbvomCacPXtgW6GzBxQm
	 Sca8Lr63JvzAw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyAR9-0000000HKFO-0jdT;
	Thu, 05 Mar 2026 16:16:27 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 11/11] docs: kdoc_output: pick a better default for modulename
Date: Thu,  5 Mar 2026 16:16:18 +0100
Message-ID: <651be6529cd926802cc555840595421dbb158ab8.1772722474.git.mchehab+huawei@kernel.org>
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

Instead of placing the same data for modulename for all generated
man pages, use the directory from the filename used to produce
kernel docs as basis.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/kernel-doc                |  1 -
 tools/lib/python/kdoc/kdoc_output.py | 41 +++++++++++++++++-----------
 2 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/tools/docs/kernel-doc b/tools/docs/kernel-doc
index aed09f9a54dd..3a932f95bdf5 100755
--- a/tools/docs/kernel-doc
+++ b/tools/docs/kernel-doc
@@ -210,7 +210,6 @@ def main():
                         help="Enable debug messages")
 
     parser.add_argument("-M", "-modulename", "--modulename",
-                        default="Kernel API",
                         help="Allow setting a module name at the output.")
 
     parser.add_argument("-l", "-enable-lineno", "--enable_lineno",
diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 52fc41bd17b7..8d415b79b6f9 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -589,7 +589,8 @@ class ManFormat(OutputFormat):
     ``modulename``
         Defines the module name to be used at the troff ``.TH`` output.
 
-        This argument is mandatory.
+        This argument is optional. If not specified, it will be filled
+        with the directory which contains the documented file.
 
     ``section``
         Usually a numeric value from 0 to 9, but man pages also accept
@@ -634,14 +635,21 @@ class ManFormat(OutputFormat):
         "%m %d %Y",
     ]
 
-    def emit_th(self, name):
+    def emit_th(self, name, args):
         """Emit a title header line."""
-        name = name.strip()
+        title = name.strip()
+        module = self.modulename(args)
 
-        self.data += f'.TH "{name}" {self.section} "{self.date}" '
-        self.data += f'"{self.modulename}" "{self.manual}"\n'
+        self.data += f'.TH "{title}" {self.section} "{self.date}" '
+        self.data += f'"{module}" "{self.manual}"\n'
 
-    def __init__(self, modulename, section="9", manual="Kernel API Manual"):
+    def modulename(self, args):
+        if self._modulename:
+            return self._modulename
+
+        return os.path.dirname(args.fname)
+
+    def __init__(self, modulename=None, section="9", manual="Kernel API Manual"):
         """
         Creates class variables.
 
@@ -651,7 +659,7 @@ class ManFormat(OutputFormat):
 
         super().__init__()
 
-        self.modulename = modulename
+        self._modulename = modulename
         self.section = section
         self.manual = manual
 
@@ -685,7 +693,8 @@ class ManFormat(OutputFormat):
         dtype = args.type
 
         if dtype == "doc":
-            return self.modulename
+            return name
+#            return os.path.basename(self.modulename(args))
 
         if dtype in ["function", "typedef"]:
             return name
@@ -762,7 +771,7 @@ class ManFormat(OutputFormat):
 
         out_name = self.arg_name(args, name)
 
-        self.emit_th(out_name)
+        self.emit_th(out_name, args)
 
         for section, text in args.sections.items():
             self.data += f'.SH "{section}"' + "\n"
@@ -772,7 +781,7 @@ class ManFormat(OutputFormat):
 
         out_name = self.arg_name(args, name)
 
-        self.emit_th(out_name)
+        self.emit_th(out_name, args)
 
         self.data += ".SH NAME\n"
         self.data += f"{name} \\- {args['purpose']}\n"
@@ -818,7 +827,7 @@ class ManFormat(OutputFormat):
     def out_enum(self, fname, name, args):
         out_name = self.arg_name(args, name)
 
-        self.emit_th(out_name)
+        self.emit_th(out_name, args)
 
         self.data += ".SH NAME\n"
         self.data += f"enum {name} \\- {args['purpose']}\n"
@@ -851,7 +860,7 @@ class ManFormat(OutputFormat):
         out_name = self.arg_name(args, name)
         full_proto = args.other_stuff["full_proto"]
 
-        self.emit_th(out_name)
+        self.emit_th(out_name, args)
 
         self.data += ".SH NAME\n"
         self.data += f"{name} \\- {args['purpose']}\n"
@@ -868,11 +877,11 @@ class ManFormat(OutputFormat):
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
@@ -882,12 +891,12 @@ class ManFormat(OutputFormat):
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

