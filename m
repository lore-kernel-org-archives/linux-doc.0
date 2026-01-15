Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6E13A9D97;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491642; cv=none; b=T8ahRIQXHu1GIh/pMnjMriOpwgooHfPTv1gFH2flyAWAQWvJkGjXXx7oQrVGZswwCNScXwBi9wteXKoBzAfKx5wEzc4kp7ThxG/cAfGl6NOPwsThy8nIPiSFBtOnEj7/iktzbhMTphh9J4DeDzZ1+h21eNG5nTPvvH3ZLMjDpvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491642; c=relaxed/simple;
	bh=V/BLZs4Nlt58GEgPnSOwtNktnB67g/V/fdysHWNMdM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YnDt+VzNu2phLr7ST6P2HzK8HqfeE1qxksUFj8eNKuPneAFelc+ry7vVIO7WLx+pxAtJLulKHxuNozCLq769M7d4nXlvOXNaujssiw+fiMIF7de9ta8QFKIcOHDeKCHXTXunuYSka6Y6P0KDpadojYRzV9pRYLzZ1khzzdCYA2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/i8IiiM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/i8IiiM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4E9C4AF0B;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491642;
	bh=V/BLZs4Nlt58GEgPnSOwtNktnB67g/V/fdysHWNMdM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S/i8IiiM1TAnp2+cfeeZudPMcIcNvhK35D/OXwYUY8aISz2eqMNRZzodENjCWvLd/
	 LOuX/PJfqPyH05nWaBCkrs5NmZgLnsqKr88azhHfaMqF/vZFzNpYyNujVSAfeOdYeh
	 N+fPW9dwov3a/Qb3TZ0M18tiwePf7RemcpTQ1Hyor48r+lLDKZUIeoXPD8ER5ZNJMN
	 VI6s1Ij+S+BEIJBonRLErHEI0UebtaAt8UyOZJPggsYw7K1Q9vmhGkw2LY09lGTNy/
	 svIOdccv/k94PGUmKbVQp2Cq33HVM8FFyPEaV6mBCxo9QDgvzaiRZre3d8QdjvDeAB
	 PdjYOughB/bUg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vgPSi-000000043IV-14JY;
	Thu, 15 Jan 2026 16:40:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 06/15] docs: kdoc: latex_fonts: Improve docstrings and comments
Date: Thu, 15 Jan 2026 16:40:27 +0100
Message-ID: <07a7dfd6c78f1b884cb5f4bb3a367e10a43d832b.1768488832.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768488832.git.mchehab+huawei@kernel.org>
References: <cover.1768488832.git.mchehab+huawei@kernel.org>
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

