Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3CE13FF2
	for <linux-doc@vger.kernel.org>; Sat, 23 Mar 2024 12:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711195406; cv=none; b=hPLIreoTiuCWOpnCcwz2Ydk1pdjFx69sboZbOkorQzj/3rRo2OOpUHln2AULmKwMpzY4W/mLuVXLeRDGwSveDsGRfuFb8GbS0Yyl9/Bglb7Ifj44U1pMAefAnmH4ijp8i1T/I4iWiVO5fEnXgi5kpt+gCyIhCuWoiMLBOTZs8Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711195406; c=relaxed/simple;
	bh=U7DF/BiQH8ysBXlOA74BtHZhqBAj2ETOQtOOuI0V2LA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=l4gap3q3ybiJxBHg7zdkTe5g7WTjG4hoBFy5h96y3HFOP0WidXjMyYLOyChWbdPIYeEAQI3wRGwHxTB9PLelXbOXaP6eY/zeRYPWLvR0zes1H3UVxLqdDdwlMToVr1J1JBGdZtQ5Kpr+2Hltwv558AGrM3jQ8EX8iQ8XpvfDs88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4fMmeD+; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4fMmeD+"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e08512cd8dso16886725ad.2
        for <linux-doc@vger.kernel.org>; Sat, 23 Mar 2024 05:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711195404; x=1711800204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iG2S6hnaZZB0DcuHU7npFKATYKyKOr1oSiW1i6GT3Sw=;
        b=Z4fMmeD+YCIHy81RbhTQHdrrh4cgwaveVSMoif341PCaYlCpIH5TA0fK2PT4Yymj8e
         iTQqsFp9WpK0siv9UkZFTcOG+AMgGYu4n1XQFe9kwjZggu8ofbpslXxiTe9BC5c7MsfI
         QDwgJh9/uzVmidH04p+f3mnFHVAQGbmlMlus8ck5FVylstIw0VRERLheOGgh4wsP+hhX
         JekLETpLzK8Bxrb86CGX9QuwVx57dWdenMuC36In+yxkW+9rrM8voJf2BhdJWYkQ2vl+
         v7Noi7aaHcPosYQ7r/61UVcl4ajrZx/FrgIfx4JXMEoJNJDWf+EYECufFOAADMTEUiee
         sv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711195404; x=1711800204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iG2S6hnaZZB0DcuHU7npFKATYKyKOr1oSiW1i6GT3Sw=;
        b=TBs/kKW794616z1wfLOuftjWEDS7yDR2DulsBWTQdygh6faMsfqte/b89RABk6Zint
         NtlKV70s2iVyws35ruOHyo4+/LRV/PpF8X2hFU2UvUedmIgx2h50T7OO/0OAaB95oGGb
         WtaoaoY0F/t2w39LKq5M/85ov0qTfeZd0hJbyZvA0imCzCmQdHJ/cV0Qko89G1Jpneea
         GfjV+KxowCWjZB6fUfSkDYp8QRPl/5lfdf7rcJsgretK5i8VWAYfaIaHXSMthV16cdZl
         rudmKyh8Bt2x8a8be1L/Regz3OnNJX+RiXB8VPNK29bErswL0O7IjF4tnMbUPd+5Mo2S
         X4FA==
X-Gm-Message-State: AOJu0YyZavhO3qVkzuUzqDhsKRDNzT2T1nqDFyA/A3rBZZqK+treyqDB
	sInAWUyaxUbXVTPtYbceL84XzrxfDnnH46Bi4BgEVhuw9oNKLZXX
X-Google-Smtp-Source: AGHT+IEkkWxm8BJKGgjzrk3YNUNOHyKjLj20yGz+++YuHmSL5tt8Kv/ZYEmdb4hn9raW1HbJiTK5sw==
X-Received: by 2002:a17:903:11c3:b0:1e0:99ec:95a5 with SMTP id q3-20020a17090311c300b001e099ec95a5mr2894798plh.26.1711195404278;
        Sat, 23 Mar 2024 05:03:24 -0700 (PDT)
Received: from ubuntu-2204.. (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id e4-20020a17090301c400b001dee4a22c2bsm1435080plh.34.2024.03.23.05.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 05:03:24 -0700 (PDT)
From: Akira Yokosawa <akiyks@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>,
	=?UTF-8?q?=D0=98=D0=B2=D0=B0=D0=BD=20=D0=98=D0=B2=D0=B0=D0=BD=D0=BE=D0=B2=D0=B8=D1=87?= <relect@bk.ru>
Subject: [PATCH] docs: Detect variable fonts and suggest removing them
Date: Sat, 23 Mar 2024 21:02:04 +0900
Message-Id: <20240323120204.155678-1-akiyks@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xelatex doesn't understand variable font format.  Recent deployment
of variable Noto CJK fonts in Fedora and openSUSE tumbleweed breaks
builds of translations.pdf.

To help developers work around the build error, add a script for
checking existence of variable form of those fonts and emitting
suggestions.  Invoke it in the error path of "make pdfdocs" so that it
is activated only when PDF build actually fails.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Reported-by: Jonathan Corbet <corbet@lwn.net>
Link: https://lore.kernel.org/r/8734tqsrt7.fsf@meer.lwn.net/
Reported-by: "Иван Иванович" <relect@bk.ru>
Link: https://lore.kernel.org/linux-doc/1708585803.600323099@f111.i.mail.ru/
---
This is not in line with Jon's suggestion of tweaking sphinx-pre-install
and/or kerneldoc-preamble.sty [1].

[1]: https://lore.kernel.org/r/87o7ccpcob.fsf@meer.lwn.net/

It would be ideal if kerneldoc-preamble.sty can be taught about the
way to detect the existence of variable fonts and to skip CJK contents.
However, it seems that it would add overly complex code for choosing
fonts by file names with meticulous options to select CJK variant (SC,
TC, KR, or JP) to use.  Furthermore, as location and names of font files
can be different among distro packages, keeping portability of the preamble
is impossible in practice.

As for sphinx-pre-install, even if variable "Noto CJK" fonts are found,
they don't matter for non-CJK PDFs.  Emitting warning every time would
be noisy.

Therefore, as a minimal approach, to help developers find a way forward,
giving suggestions after the fact sounds like a reasonable approach to me,
at least for the time being.

Jon, you said in [1]:

>> What does
>>
>>     fc-list | grep NotoSansCJK-VF.ttc
>>
>> say?
>
> No output at all, even though I had google-noto-sans-cjk-vf-fonts
> installed.

So I'm wondering if scripts/check-variable-font.sh in this patch emits
useful suggestions.  Could you give it a try?

  - Install google-noto-sans-cjk-vf-fonts
  - Install google-noto-serif-cjk-vf-fonts
  - What does "sh scripts/check-variable-font.sh" say?
  - Run "make cleandocs; make SPHINXDIRS=translations pdfdocs".
    Do you see the suggestion after the build error?
  - Uninstall above 2 font packages.
  - What does "sh scripts/check-variable-font.sh" say now?
  - Run "make cleandocs; make SPHINXDIRS=translations pdfdocs" again.
    Does it complete successfully?

        Thanks, Akira
---
Cc: linux-doc@vger.kernel.org
---
 Documentation/Makefile          |  2 +-
 MAINTAINERS                     |  1 +
 scripts/check-variable-fonts.sh | 30 ++++++++++++++++++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100755 scripts/check-variable-fonts.sh

diff --git a/Documentation/Makefile b/Documentation/Makefile
index b68f8c816897..e7ff288bfd15 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -154,7 +154,7 @@ else # HAVE_PDFLATEX
 pdfdocs: latexdocs
 	@$(srctree)/scripts/sphinx-pre-install --version-check
 	$(foreach var,$(SPHINXDIRS), \
-	   $(MAKE) PDFLATEX="$(PDFLATEX)" LATEXOPTS="$(LATEXOPTS)" -C $(BUILDDIR)/$(var)/latex || exit; \
+	   $(MAKE) PDFLATEX="$(PDFLATEX)" LATEXOPTS="$(LATEXOPTS)" -C $(BUILDDIR)/$(var)/latex || sh $(srctree)/scripts/check-variable-fonts.sh || exit; \
 	   mkdir -p $(BUILDDIR)/$(var)/pdf; \
 	   mv $(subst .tex,.pdf,$(wildcard $(BUILDDIR)/$(var)/latex/*.tex)) $(BUILDDIR)/$(var)/pdf/; \
 	)
diff --git a/MAINTAINERS b/MAINTAINERS
index 741d9142b343..3858416a2d67 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6346,6 +6346,7 @@ S:	Maintained
 P:	Documentation/doc-guide/maintainer-profile.rst
 T:	git git://git.lwn.net/linux.git docs-next
 F:	Documentation/
+F:	scripts/check-variable-font.sh
 F:	scripts/documentation-file-ref-check
 F:	scripts/kernel-doc
 F:	scripts/sphinx-pre-install
diff --git a/scripts/check-variable-fonts.sh b/scripts/check-variable-fonts.sh
new file mode 100755
index 000000000000..775800edb9fc
--- /dev/null
+++ b/scripts/check-variable-fonts.sh
@@ -0,0 +1,30 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# For "make pdfdocs", recent trend of deploying variable type of
+# "Noto Sans CJK" and "Noto Serif CJK" fonts breaks xelatex, which does
+# not understand variable fonts.
+#
+# It is hard to distinguish variable fonts from static ones in the preamble
+# of LaTeX source code.  Instead, this script is invoked in the error path
+# of "make pdfdocs" and emit suggestions if such font files are found.
+#
+# Assumption:
+# File names are not changed from those of upstream Noto CJK fonts:
+#     https://github.com/notofonts/noto-cjk/
+
+vffonts=`fc-list -b | grep -i noto | grep -i cjk | grep -F -i -e "-vf" | \
+	 sort | uniq | sed -e 's/\tfile:/  file:/' | sed -e 's/(s)$//'`
+
+if [ "x$vffonts" != "x" ] ; then
+	echo "====================================================================="
+	echo "Detected variable form of Noto CJK fonts incompatible with xelatex:"
+	echo "$vffonts"
+	echo "If you need CJK contents in PDF, remove them and install static ones."
+	echo "Otherwise, get rid of texlive-xecjk."
+	echo "====================================================================="
+fi
+
+# As this script is invoked from Makefile's error path, always error exit
+# even if no variable font is detected.
+exit 1

base-commit: b8cfda5c9065cd619a97c17da081cbfab3b1e756
-- 
2.34.1

