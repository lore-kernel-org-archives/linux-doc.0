Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB22939B4A8;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396652; cv=none; b=usMA389xmkuHBDitEUg2MpbxhmTNrjLlr+nz907g9HCvCGraSv4SCUvHTliEbcK6AAmqtIcWTfChFcsJGUyDaHqNNb+c6+Xx5tiMGr24Z1x7Kul43RFoo+xTb6BC3u2MkZgA6RHeYezc8tq26Aw2kHhsfHo8GG5xOoyefS5dNxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396652; c=relaxed/simple;
	bh=V/BLZs4Nlt58GEgPnSOwtNktnB67g/V/fdysHWNMdM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SB00hB9STX20YBxaLY5yA5iUVNF9VymqdcunBogDo1LzI1CVxVBjgdd0H5SJfsvyYI7P7KbypbA07RAzoDD2f4Mm8Dyl+VuBlac+TpMGwdsd97KAKG8T78XRzFWOa3P4NzBBEmx7h1UtEB6JCHAxi1cPIkGnceAGXxMvu4Q1SZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWes6Urx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWes6Urx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C6AC2BC86;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768396652;
	bh=V/BLZs4Nlt58GEgPnSOwtNktnB67g/V/fdysHWNMdM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kWes6UrxbEbLekLy9Vnnt956jh9ZzAyjJCcL5x7uun5boe5iBXXeYXFTaUFo1noXq
	 qcHrrmy7/qWY9CRyaFfHv5C9gEgo+MtGBDi5CXL2c10aICi+1ZlJAyENiujFhWfUSq
	 Y7ZLw+V3ER0Bhx/z/aJYQ0pX/RoJikEyrtD5p3pKiO4fI+PcFgp5HgVM8wcakk5e3O
	 zlk6G9+e9TYQuyBWAwW9fIeSnqf8aHyt8XdW2syzpM03tMiCbSnOa8kKqpXC1pbvev
	 hTxdIfa4SsKbinlitq29fSospcgNn5v2bHffJ9uW6UBZtDMZujiP+7kbflRz+fShNU
	 ykse6EazSetwA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vg0kc-00000002mxk-3GSm;
	Wed, 14 Jan 2026 14:17:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 04/13] docs: kdoc: latex_fonts: Improve docstrings and comments
Date: Wed, 14 Jan 2026 14:17:17 +0100
Message-ID: <646e3a478f1838a951b05df176a107e2f4ebfcab.1768396023.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768396023.git.mchehab+huawei@kernel.org>
References: <cover.1768396023.git.mchehab+huawei@kernel.org>
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

