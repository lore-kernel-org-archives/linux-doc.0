Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A6E2EB85E;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=oZar4wOy/zBxljMxJzoBIeXIzmm1Ev2PTHBeaHCc1Y5dumEForLgCghNZAm10aQgczcrLFOlS5RzLQVKZ8WavM72RhjK6q5/mHUHZZrCrr69JJhz93VxXL+cqW9kqiIjK+K2H2uOxqYIcfzTczqmq4iFf3mKGmDihT7oICvTI0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=V/BLZs4Nlt58GEgPnSOwtNktnB67g/V/fdysHWNMdM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NMY2O/QqoJUijH2o6u0076UGFgwnho9mFgt+XONGh4jnmblhmQoHAMqmDTCEqQweuOc/DLSBapf82wlh0+Q62dXm34lsYckKpEumYGa7zBi/Ta21WKAyMjKTIbctrI/PJPkaSlXnnf5crYP+K13Qfs6zkvlO0C8xl+pwbbxjfWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2gjrXwL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2gjrXwL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CCDC2BC9E;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=V/BLZs4Nlt58GEgPnSOwtNktnB67g/V/fdysHWNMdM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U2gjrXwL1OlFQWyjT+UgU+lYWTdcwwRnJSHkiDHLdmw6bXAZXU4IUvMr0on4LBQsx
	 gmSji4zZuwDKJPBc20MHmzOnEI2NCKqyXhAbwTKuh03AbtWrecncHwLrWZvshjF+Pp
	 aoKZlTSLZlBgFVEawqikk06RxXoblqe1h7uS/qtl47N3i5BP8QjPTrTcO5gqk/Ehr6
	 yONByuxhWpSpSbSHiUlVNt6VWdXx6T2UyRGHBo+os1q1J30F8kjfvBdiXCswJAwzCn
	 rkh3DlrtYFPrFX9fz02QerjF0lHMJZyQdnHb6aTEexYGMbvCEpMLaa6DXgpQpRuhb4
	 +pOv7xBTTDTaA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j1k-11Yz;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 06/25] docs: kdoc: latex_fonts: Improve docstrings and comments
Date: Mon, 19 Jan 2026 17:23:09 +0100
Message-ID: <6e0eb2e245eae9b4f39cf231dee32df00b9e8b7b.1768838938.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768838938.git.mchehab+huawei@kernel.org>
References: <cover.1768838938.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

In preparation to document kernel-doc module, improve its
documentation.

Among the changes, it had to place the xml template inside
a code block, as otherwise doc build would break.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/latex_fonts.py | 95 ++++++++++++++++------------
 1 file changed, 56 insertions(+), 39 deletions(-)

diff --git a/tools/lib/python/kdoc/latex_fonts.py b/tools/lib/python/kdoc/latex_fonts.py
index 29317f8006ea..1d04cbda169f 100755
--- a/tools/lib/python/kdoc/latex_fonts.py
+++ b/tools/lib/python/kdoc/latex_fonts.py
@@ -5,12 +5,13 @@
 # Ported to Python by (c) Mauro Carvalho Chehab, 2025
 
 """
-Detect problematic Noto CJK variable fonts.
+Detect problematic Noto CJK variable fonts
+==========================================
 
-For "make pdfdocs", reports of build errors of translations.pdf started
-arriving early 2024 [1, 2].  It turned out that Fedora and openSUSE
-tumbleweed have started deploying variable-font [3] format of "Noto CJK"
-fonts [4, 5].  For PDF, a LaTeX package named xeCJK is used for CJK
+For ``make pdfdocs``, reports of build errors of translations.pdf started
+arriving early 2024 [1]_ [2]_.  It turned out that Fedora and openSUSE
+tumbleweed have started deploying variable-font [3]_ format of "Noto CJK"
+fonts [4]_ [5]_.  For PDF, a LaTeX package named xeCJK is used for CJK
 (Chinese, Japanese, Korean) pages.  xeCJK requires XeLaTeX/XeTeX, which
 does not (and likely never will) understand variable fonts for historical
 reasons.
@@ -25,68 +26,77 @@ This script is invoked from the error path of "make pdfdocs" and emits
 suggestions if variable-font files of "Noto CJK" fonts are in the list of
 fonts accessible from XeTeX.
 
-References:
-[1]: https://lore.kernel.org/r/8734tqsrt7.fsf@meer.lwn.net/
-[2]: https://lore.kernel.org/r/1708585803.600323099@f111.i.mail.ru/
-[3]: https://en.wikipedia.org/wiki/Variable_font
-[4]: https://fedoraproject.org/wiki/Changes/Noto_CJK_Variable_Fonts
-[5]: https://build.opensuse.org/request/show/1157217
+.. [1] https://lore.kernel.org/r/8734tqsrt7.fsf@meer.lwn.net/
+.. [2] https://lore.kernel.org/r/1708585803.600323099@f111.i.mail.ru/
+.. [3] https://en.wikipedia.org/wiki/Variable_font
+.. [4] https://fedoraproject.org/wiki/Changes/Noto_CJK_Variable_Fonts
+.. [5] https://build.opensuse.org/request/show/1157217
 
-#===========================================================================
 Workarounds for building translations.pdf
-#===========================================================================
+-----------------------------------------
 
 * Denylist "variable font" Noto CJK fonts.
+
   - Create $HOME/deny-vf/fontconfig/fonts.conf from template below, with
     tweaks if necessary.  Remove leading "".
+
   - Path of fontconfig/fonts.conf can be overridden by setting an env
     variable FONTS_CONF_DENY_VF.
 
-    * Template:
------------------------------------------------------------------
-<?xml version="1.0"?>
-<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
-<fontconfig>
-<!--
-  Ignore variable-font glob (not to break xetex)
--->
-    <selectfont>
-        <rejectfont>
-            <!--
-                for Fedora
-            -->
-            <glob>/usr/share/fonts/google-noto-*-cjk-vf-fonts</glob>
-            <!--
-                for openSUSE tumbleweed
-            -->
-            <glob>/usr/share/fonts/truetype/Noto*CJK*-VF.otf</glob>
-        </rejectfont>
-    </selectfont>
-</fontconfig>
------------------------------------------------------------------
+    * Template::
+
+        <?xml version="1.0"?>
+        <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
+        <fontconfig>
+        <!--
+        Ignore variable-font glob (not to break xetex)
+        -->
+            <selectfont>
+                <rejectfont>
+                    <!--
+                        for Fedora
+                    -->
+                    <glob>/usr/share/fonts/google-noto-*-cjk-vf-fonts</glob>
+                    <!--
+                        for openSUSE tumbleweed
+                    -->
+                    <glob>/usr/share/fonts/truetype/Noto*CJK*-VF.otf</glob>
+                </rejectfont>
+            </selectfont>
+        </fontconfig>
 
     The denylisting is activated for "make pdfdocs".
 
 * For skipping CJK pages in PDF
+
   - Uninstall texlive-xecjk.
     Denylisting is not needed in this case.
 
 * For printing CJK pages in PDF
+
   - Need non-variable "Noto CJK" fonts.
+
     * Fedora
+
       - google-noto-sans-cjk-fonts
       - google-noto-serif-cjk-fonts
+
     * openSUSE tumbleweed
+
       - Non-variable "Noto CJK" fonts are not available as distro packages
         as of April, 2024.  Fetch a set of font files from upstream Noto
         CJK Font released at:
+
           https://github.com/notofonts/noto-cjk/tree/main/Sans#super-otc
+
         and at:
+
           https://github.com/notofonts/noto-cjk/tree/main/Serif#super-otc
-        , then uncompress and deploy them.
+
+        then uncompress and deploy them.
       - Remember to update fontconfig cache by running fc-cache.
 
-!!! Caution !!!
+.. caution::
     Uninstalling "variable font" packages can be dangerous.
     They might be depended upon by other packages important for your work.
     Denylisting should be less invasive, as it is effective only while
@@ -115,10 +125,15 @@ class LatexFontChecker:
         self.re_cjk = re.compile(r"([^:]+):\s*Noto\s+(Sans|Sans Mono|Serif) CJK")
 
     def description(self):
+        """
+        Returns module description.
+        """
         return __doc__
 
     def get_noto_cjk_vf_fonts(self):
-        """Get Noto CJK fonts"""
+        """
+        Get Noto CJK fonts.
+        """
 
         cjk_fonts = set()
         cmd = ["fc-list", ":", "file", "family", "variable"]
@@ -143,7 +158,9 @@ class LatexFontChecker:
         return sorted(cjk_fonts)
 
     def check(self):
-        """Check for problems with CJK fonts"""
+        """
+        Check for problems with CJK fonts.
+        """
 
         fonts = textwrap.indent("\n".join(self.get_noto_cjk_vf_fonts()), "    ")
         if not fonts:
-- 
2.52.0

