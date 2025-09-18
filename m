Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F772D9491;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196506; cv=none; b=kFxtgmHTzvGmRLWxmX9jP+miFpqCpUPKO89/aqoj7n7RmidBisWbXtkWfF8uaWYQo8HIsNdtM5/IRWp6kLIvGRuc+JtV2hvxFxbM5RBxU/ywduL1xcYyDoPEt+bqKJe3Y+slXbNS3CVA4xFNHrdGl9LSXem92RXgSjVgbr7cOnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196506; c=relaxed/simple;
	bh=wgeju9sHn9sGYAdF8T8ePAcnZc8uoFBBK8ROWiPi7/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QGxokk+E1P6X//Dxt2HN7Hil6G0ZF2c2/O8WzBabQqeXlRP17oVZ/hDUMVP7q/ZOaJfbGejCgLRKgoSNo5FfjXYXC5rbjclSXSP0SVkC69cYLfhnkRhCwzmmdJEsJEcABD7rW/TdNyAzrIjNyHcr3XUU0CP27dtIBjewEJ9ah3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vDOJiC6P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vDOJiC6P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278BBC113D0;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196506;
	bh=wgeju9sHn9sGYAdF8T8ePAcnZc8uoFBBK8ROWiPi7/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vDOJiC6PXNj3WVhh5kDe4ugwRU8W2+eEU5jldQybysSRGT9rwucc5/9mDc1hmCZ8J
	 Au0BWA0WaL4UcySjQlu6Igm+FfGFWrrMpRRbasYJMecy7fXaAZ5PiGj8zy7nf2dX2r
	 QoimRqwjjbXwVvKCV03k4fFmWXCsQW4NinwkhHow6T69uGtnRrPg+xSTZeoaSMFD3R
	 +o53E1jyjlQSXjnMkF+h1uYMSl64NOKqtqvjwi8GMP9pNlbSHsbL7oqqy72qwHCSAw
	 HutSkUDrDZiA/Yj4oMHLbjVxJ13LGqasPFRbP1Lqs21+8RI5rqP60lGXuzuexN+LKq
	 In8U0jSN909Ug==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uzDE7-0000000CrnA-3fLb;
	Thu, 18 Sep 2025 13:55:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 06/24] check-variable-fonts.py: add a helper to display instructions
Date: Thu, 18 Sep 2025 13:54:40 +0200
Message-ID: <577162cf4e07de74c4a783f16e3404f0040e5e0a.1758196090.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758196090.git.mchehab+huawei@kernel.org>
References: <cover.1758196090.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Use lib docstring to output the comments via --help/-h. With
that, update the default instructions to recomment it instead
of asking the user to read the source code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/check-variable-fonts.py | 12 +++++++++++-
 tools/docs/lib/latex_fonts.py      | 13 +++++++++----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/tools/docs/check-variable-fonts.py b/tools/docs/check-variable-fonts.py
index 79b28f0f7d85..c0997d6861dc 100755
--- a/tools/docs/check-variable-fonts.py
+++ b/tools/docs/check-variable-fonts.py
@@ -12,11 +12,21 @@ Detect problematic Noto CJK variable fonts.
 or more details, see lib/latex_fonts.py.
 """
 
+import argparse
 import sys
 
 from lib.latex_fonts import LatexFontChecker
 
-msg = LatexFontChecker().check()
+checker = LatexFontChecker()
+
+parser=argparse.ArgumentParser(description=checker.description(),
+                               formatter_class=argparse.RawTextHelpFormatter)
+parser.add_argument("--deny-vf",
+                    help="XDG_CONFIG_HOME dir containing fontconfig/fonts.conf file")
+
+args=parser.parse_args()
+
+msg = LatexFontChecker(args.deny_vf).check()
 if msg:
     print(msg)
 
diff --git a/tools/docs/lib/latex_fonts.py b/tools/docs/lib/latex_fonts.py
index 81358a70f320..29317f8006ea 100755
--- a/tools/docs/lib/latex_fonts.py
+++ b/tools/docs/lib/latex_fonts.py
@@ -105,14 +105,18 @@ class LatexFontChecker:
     translations.
     """
 
-    def __init__(self):
-        deny_vf = os.environ.get('FONTS_CONF_DENY_VF', "~/deny-vf")
+    def __init__(self, deny_vf=None):
+        if not deny_vf:
+            deny_vf = os.environ.get('FONTS_CONF_DENY_VF', "~/deny-vf")
 
         self.environ = os.environ.copy()
         self.environ['XDG_CONFIG_HOME'] = os.path.expanduser(deny_vf)
 
         self.re_cjk = re.compile(r"([^:]+):\s*Noto\s+(Sans|Sans Mono|Serif) CJK")
 
+    def description(self):
+        return __doc__
+
     def get_noto_cjk_vf_fonts(self):
         """Get Noto CJK fonts"""
 
@@ -154,8 +158,9 @@ class LatexFontChecker:
                 For CJK pages in PDF, they need to be hidden from XeTeX by denylisting.
                 Or, CJK pages can be skipped by uninstalling texlive-xecjk.
 
-                For more info on denylisting, other options, and variable font, see header
-                comments of {rel_file}.
+                For more info on denylisting, other options, and variable font, run:
+
+                    tools/docs/check-variable-fonts.py -h
             """)
         msg += "=" * 77
 
-- 
2.51.0

