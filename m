Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EF4EAD7;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=eh2Hyi2qN4in66Co5qprtYWTmTY0GFlObM4htVSgmoFf6TVNFOpLNp1Dwe31ZNh6yZZd0+dDMhfYPGG2klWEUkCV1DAUir+vF8gwa/vS/tLbjN/WOOM7RkKUZGR54Y1XFEnYRcr5tfEcjWlPtGMRG+AbFulxvJ9XkQIcfz4Wj7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=/+kwnUbLgQbBGzPsJj4pevKvmAZb3+SqJUlcwCOPCc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aauV69pXH9yG7FsNL8HPogkrqEEdJUkssidPU3nyFsEHLsrwc3cSCcEgiQDgNIZySs07U2hQyivziOR7lDYdkphfePa+0UkbGRj+Teju5g5/uGNyJf31EdWtybg/saZ0hP9+zTRHKEuYSohh/HA2cv8F2NDjvfVTFBCI+5BGn7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kBWIL7l3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kBWIL7l3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33CAC4AF0F;
	Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022795;
	bh=/+kwnUbLgQbBGzPsJj4pevKvmAZb3+SqJUlcwCOPCc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kBWIL7l34bzSzECMQI8jSVIeZCPGyH4KShAClPTYT0qAuQhk+O6j4BoM9yn/KpbO4
	 +ylfsWD/WhczQGo1unne4PHTgO0ExMUSoidouhQi2U9NRA8XYpjMqGgL0AhtkGlwjD
	 GTnEE5I5rj2SasVu6f2f6iZyl58HDfm2Jarins/zXYthD161+LqWCjc0wpJnPVz9q/
	 ory4YhAc6F6WDuJhEG+23mituJoYp3TjC3F1Ow4hVH9TvkyMOPzmjAzcErEZ3vDWrc
	 2e1ng3L7B07Cu9f1PCOKpEI8l+s187x8WDnSvgloCLGxJf0TPNLiarew/uysjW2zsi
	 tBAimKndFh+Ew==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7i-0000000DRLX-0Eh7;
	Tue, 28 Jan 2025 01:06:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 18/38] docs: sphinx/kernel_abi: use AbiParser directly
Date: Tue, 28 Jan 2025 01:06:07 +0100
Message-ID: <fb800900352d90a0e501e5d6732e1bea277478f2.1738020236.git.mchehab+huawei@kernel.org>
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

Instead of running get_abi.py script, import AbiParser class and
handle messages directly there using an interactor. This shold save some
memory, as there's no need to exec python inside the Sphinx python
extension.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kernel_abi.py | 26 +++++++++++++++-----------
 scripts/get_abi.py                 |  2 +-
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index fc7500fad119..93d537d8cb6c 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -42,6 +42,11 @@ from docutils.parsers.rst import directives, Directive
 from sphinx.util.docutils import switch_source_input
 from sphinx.util import logging
 
+srctree = os.path.abspath(os.environ["srctree"])
+sys.path.insert(0, os.path.join(srctree, "scripts"))
+
+from get_abi import AbiParser
+
 __version__ = "1.0"
 
 
@@ -65,7 +70,7 @@ class KernelCmd(Directive):
     logger = logging.getLogger('kernel_abi')
 
     option_spec = {
-        "debug"     : directives.flag,
+        "debug": directives.flag,
     }
 
     def run(self):
@@ -73,18 +78,17 @@ class KernelCmd(Directive):
         if not doc.settings.file_insertion_enabled:
             raise self.warning("docutils: file insertion disabled")
 
-        srctree = os.path.abspath(os.environ["srctree"])
+        path = os.path.join(srctree, "Documentation", self.arguments[0])
+        parser = AbiParser(path, logger=self.logger)
+        parser.parse_abi()
+        parser.check_issues()
 
-        args = [
-            os.path.join(srctree, 'scripts/get_abi.py'),
-            '-D', os.path.join(srctree, 'Documentation', self.arguments[0]),
-            'rest',
-            '--enable-lineno',
-        ]
+        msg = ""
+        for m in parser.doc(enable_lineno=True, show_file=True):
+            msg += m
 
-        lines = subprocess.check_output(args, cwd=os.path.dirname(doc.current_source)).decode('utf-8')
-        nodeList = self.nestedParse(lines, self.arguments[0])
-        return nodeList
+        node = self.nested_parse(msg, self.arguments[0])
+        return node
 
     def nested_parse(self, lines, fname):
         env = self.state.document.settings.env
diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index 2aec1f9dc5aa..3a8dcff85dc2 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -441,7 +441,7 @@ class AbiParser:
 
         return new_desc + "\n\n"
 
-    def doc(self, enable_lineno, output_in_txt, show_file=False):
+    def doc(self, enable_lineno=False, output_in_txt=False, show_file=False):
         """Print ABI at stdout"""
 
         part = None
-- 
2.48.1

