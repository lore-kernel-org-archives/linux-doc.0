Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D39F101F2;
	Tue, 28 Jan 2025 00:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=F15FFFJxhTMK9TW2SHYIFjDeO8L+SZaXtpOGvJcRI05WTYXH2Secoy8bGAzTFgk1/xXl2cbMkGdEHF5e9SRBCPLZ/nQSt33dvE91JtueScwXGKjkvdc+c7KUOCaZ0RbmDgGO+vfEvWY8jMM767eu6lH86YxHIbDNQ2Txs1FIaV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=Ig/wrssKDOB8y1m2J/EooG9A8FvmBFRH9/TycqOd21E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MsYiH5QrMVOON3qiGKO/E1CQ8FVdROzATsQridnnrcG3GVTEOCD2oW2vvDRbEpC7XEwg2jgohxiPVDX1AY070unuPr6t5zQYIJXmQhNjtDNIXnKDSd2NhgZZUW1HeQWu2maoAewyjQDnMJWaEMQv2ZNJiPeLBvcRqt5dsovQJcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SVC2MNhR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVC2MNhR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBE3C4CEF7;
	Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022796;
	bh=Ig/wrssKDOB8y1m2J/EooG9A8FvmBFRH9/TycqOd21E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SVC2MNhRvYZRnrULbrk14qiuRYZr+EbHxmhLiw/LKs5FIfJTPakgjzvELglMjFUin
	 hEu/iWJ5DmdFpzLvbdQTQAnwCTYpmcV/Uyc+G1WUfiseqO1ml9tYDw6LKbwTlr482b
	 gFxiNeVJnoVozjE5ii3jjfYi7qwC+GBDrwkUy1yfM5o4Upp72yeN6ZmIpQ2iYlmDIO
	 ggGTZoTsNGtMkNHQCfhhWzYfRKdpqMTtazjGDbHFiHuXUqWz6BOy6NBUX6+iz12YAu
	 5fEGVObZ+qLX7fW/JZ1Nt3SUdcm85cDK9OOtAEAdOpQ8vLntyBsFqZD1QWdRjrXT/l
	 bQN1wXQV9caAw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7i-0000000DRLb-0LCE;
	Tue, 28 Jan 2025 01:06:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 19/38] docs: sphinx/kernel_abi: reduce buffer usage for ABI messages
Date: Tue, 28 Jan 2025 01:06:08 +0100
Message-ID: <a883f72c90a51b0355ab220caba9a6f481caf6a3.1738020236.git.mchehab+huawei@kernel.org>
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

Instead of producing a big message with all ABI contents and then
parse as a whole, simplify the code by handling each ABI symbol
in separate. As an additional benefit, there's no need to place
file/line nubers inlined at the data and use a regex to convert
them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kernel_abi.py | 76 +++++++++++++++---------------
 scripts/get_abi.py                 | 17 +++----
 2 files changed, 48 insertions(+), 45 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 93d537d8cb6c..025a4f02e1a4 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -68,6 +68,7 @@ class KernelCmd(Directive):
     has_content = False
     final_argument_whitespace = True
     logger = logging.getLogger('kernel_abi')
+    parser = None
 
     option_spec = {
         "debug": directives.flag,
@@ -79,59 +80,60 @@ class KernelCmd(Directive):
             raise self.warning("docutils: file insertion disabled")
 
         path = os.path.join(srctree, "Documentation", self.arguments[0])
-        parser = AbiParser(path, logger=self.logger)
-        parser.parse_abi()
-        parser.check_issues()
+        self.parser = AbiParser(path, logger=self.logger)
+        self.parser.parse_abi()
+        self.parser.check_issues()
 
-        msg = ""
-        for m in parser.doc(enable_lineno=True, show_file=True):
-            msg += m
-
-        node = self.nested_parse(msg, self.arguments[0])
+        node = self.nested_parse(None, self.arguments[0])
         return node
 
-    def nested_parse(self, lines, fname):
+    def nested_parse(self, data, fname):
         env = self.state.document.settings.env
         content = ViewList()
         node = nodes.section()
 
-        if "debug" in self.options:
-            code_block = "\n\n.. code-block:: rst\n    :linenos:\n"
-            for line in lines.split("\n"):
-                code_block += "\n    " + line
-            lines = code_block + "\n\n"
+        if data is not None:
+            # Handles the .rst file
+            for line in data.split("\n"):
+                content.append(line, fname, 0)
 
-        line_regex = re.compile(r"^\.\. LINENO (\S+)\#([0-9]+)$")
-        ln = 0
-        n = 0
-        f = fname
+            self.do_parse(content, node)
 
-        for line in lines.split("\n"):
-            n = n + 1
-            match = line_regex.search(line)
-            if match:
-                new_f = match.group(1)
+        else:
+            # Handles the ABI parser content, symbol by symbol
 
-                # Sphinx parser is lazy: it stops parsing contents in the
-                # middle, if it is too big. So, handle it per input file
-                if new_f != f and content:
-                    self.do_parse(content, node)
-                    content = ViewList()
+            old_f = fname
+            n = 0
+            for msg, f, ln in self.parser.doc():
+                msg_list = msg.split("\n")
+                if "debug" in self.options:
+                    lines = [
+                        "", "",  ".. code-block:: rst",
+                        "    :linenos:", ""
+                    ]
+                    for m in msg_list:
+                        lines.append("    " + m)
+                else:
+                    lines = msg_list
 
+                for line in lines:
+                    # sphinx counts lines from 0
+                    content.append(line, f, ln - 1)
+                    n += 1
+
+                if f != old_f:
                     # Add the file to Sphinx build dependencies
                     env.note_dependency(os.path.abspath(f))
 
-                f = new_f
+                    old_f = f
 
-                # sphinx counts lines from 0
-                ln = int(match.group(2)) - 1
-            else:
-                content.append(line, f, ln)
+                # Sphinx doesn't like to parse big messages. So, let's
+                # add content symbol by symbol
+                if content:
+                    self.do_parse(content, node)
+                    content = ViewList()
 
-        self.logger.info("%s: parsed %i lines" % (fname, n))
-
-        if content:
-            self.do_parse(content, node)
+            self.logger.info("%s: parsed %i lines" % (fname, n))
 
         return node.children
 
diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index 3a8dcff85dc2..b57f46b91828 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -441,7 +441,7 @@ class AbiParser:
 
         return new_desc + "\n\n"
 
-    def doc(self, enable_lineno=False, output_in_txt=False, show_file=False):
+    def doc(self, output_in_txt=False, show_file=True):
         """Print ABI at stdout"""
 
         part = None
@@ -458,10 +458,6 @@ class AbiParser:
 
             msg = ""
 
-            if enable_lineno:
-                ln = v.get("line_no", 1)
-                msg += f".. LINENO {file_ref[0][0]}#{ln}\n\n"
-
             if wtype != "File":
                 cur_part = names[0]
                 if cur_part.find("/") >= 0:
@@ -522,7 +518,9 @@ class AbiParser:
             if users and users.strip(" \t\n"):
                 msg += f"Users:\n\t{users.strip("\n").replace('\n', '\n\t')}\n\n"
 
-            yield msg
+            ln = v.get("line_no", 1)
+
+            yield (msg, file_ref[0][0], ln)
 
     def check_issues(self):
         """Warn about duplicated ABI entries"""
@@ -630,8 +628,11 @@ class AbiRest:
         parser.parse_abi()
         parser.check_issues()
 
-        for msg in parser.doc(args.enable_lineno, args.raw, not args.no_file):
-            print(msg)
+        for t in parser.doc(args.raw, not args.no_file):
+            if args.enable_lineno:
+                print (f".. LINENO {t[1]}#{t[2]}\n\n")
+
+            print(t[0])
 
 
 class AbiValidate:
-- 
2.48.1

