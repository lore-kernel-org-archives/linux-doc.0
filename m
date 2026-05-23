Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2A0342C98
	for <linux-doc@vger.kernel.org>; Sat, 23 May 2026 07:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520511; cv=none; b=skUvlIoF6Hj8NIGj8wzbgKSymnMgmgBfSaQcknQKW8Z92NuBnnlXDjP7Wd0zYd+qlKOU7Kwt2bX5LPoROWu9O18nycHyPsdnadDxkdV8sxzZUA/w/AbkdDCFcPxdh1HiMuyGV3CHOJjdP58vTq7rGpJcAQkiJiPIKcHtGAGrDhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520511; c=relaxed/simple;
	bh=hHbUbuvMq67kK92AX9bALnGMbnsaNAMLaVZBi9x7aP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pSBih1srCC1uQ0ydOIvOpx7ePA4+CND66FM5Bkmef2qRoMJzvNWI5m5QP5CrLysGDKDxBxl5Wy3LFjr8WqKY8vtYlq9oG2W6emQeAr0alaw9dDSJ6Qoi9aKRXlwX12+UvlpgLKQf/QFk8FFafHrqhUIGJs2/h8NKb7DPyJkJ/jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kp/FpIu+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kp/FpIu+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891b0786beso54722545e9.1
        for <linux-doc@vger.kernel.org>; Sat, 23 May 2026 00:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779520502; x=1780125302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqFCuVgcu75FRpSrJUke7IG04IUYAp0EBZ0uoXXXPv4=;
        b=Kp/FpIu+JAHdDvxgWdnucmak6TkclLWGfWO/H16/85ZowDKcN2fTKmZClTk1/r7dJW
         RUeRHT+S1vXJWleeHj/lq9D1Lx1oeuGzkbhYLx5e7csyo6IpUGitglrXc78b6UWwqsbL
         Qt0HbKJtrOt/13xLp0G9pkDtBdPTugo5UmaxEdQuf7jEd4sGXj7tZGQ3zRx66LaCTEdh
         pFYev8te/Ed690UNbWT1e/Gcav8DK5d0Voyut1DMW+J7AmRZOOLb3Id9CbvAtpcdq9wn
         +voUEvkDOZGcI1vt9AF+jbfxJzvxRgU8AdH2Hto3lH6uw6cbNFfmvgOm8lU87dOLXpso
         JSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779520502; x=1780125302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IqFCuVgcu75FRpSrJUke7IG04IUYAp0EBZ0uoXXXPv4=;
        b=GfRYJkNwMI8ikyCZtcv5fSl4Ki/w6OodmMh8B0FpVRHo+Z9ionjH4ATYTyXITRQ5xp
         qJG0HZc/5ir4NoFZvMXz/67qk/f4ybjtfmiBVESjUSk5j6BHjelmPMVUP9nB+07563Zv
         8BK1NuPMykvOSs5FQZDDNBp5c8KvQ9nsduTjrwSxZ8d2EQLeWInypkMOR/9GIXvmk3fX
         Uc95/6+dhJ6epYL4uhHfyHabzO+rgBWXiFuVcqYGMc1HhUZIhyiQgaWntqBgJi57MvnB
         N7aV8TkDeOxKWLnaHhNdpityWhoF3rDyA9i0WtMqsTO60kUpstnNI9a8ioOBsplOJR67
         eYNg==
X-Gm-Message-State: AOJu0Ywn49xKI/rz4UsodDL842AqaC8UujGR+4w6FtYABZDgPoaO5bc5
	FPUIO+DB4Y+FmxLNAxRfzUvoSGv37IQI+eh0DLIOxnQx5Z2JRqG2+47O
X-Gm-Gg: Acq92OHuCMgOlohnUU8KNkYTzp76IZmljp4uFsPKo/rM632wdrlVblyE89ap8ISpzra
	e6tcpBQxwCrgVb9FnHHe+eFm9k5gUF3DMFtg3cP3jeJRteiAmB7SdyuKmrnpQ3U3tJvlJCa4sur
	9JWZHj9695n4jZQ7deKHL+qFtMwbVKWyd32XOuvtBmQyx96TE/2C+8PII+WTwxw80HdXH/YaDiJ
	dtO3GObJZg9cRO8jo9YRWMlXwdEj8raYcP0hGu9zNZp9CjnE7agrrtqUCNE7MY2CDqk7iCqltNy
	bv7byxebkkgEGagsJxyljGCiEm3vTi/AEodM5n8t27WX2xI8jcr84Tq8r0aQ7DptKCgF8xzGpPX
	bOpIhd8KpRItHPCLq3dSNwuOYk41NJlwE5izp7m4NX/IBX5MagHGPjCmKcVjdXXjjFD6zRIt7En
	0MiCvRyziphN52SUAo1UKPXjwolJ6L
X-Received: by 2002:a05:600c:154d:b0:490:44eb:c1e4 with SMTP id 5b1f17b1804b1-49044ebc273mr92866025e9.26.1779520501613;
        Sat, 23 May 2026 00:15:01 -0700 (PDT)
Received: from [192.168.0.174] ([31.96.183.250])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm8639838f8f.25.2026.05.23.00.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 00:15:01 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 23 May 2026 01:14:40 -0600
Subject: [PATCH v2 07/24] dyndbg.lds.S: fix lost dyndbg sections in modules
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-dd-maint-2-v2-7-b937312aa083@gmail.com>
References: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
In-Reply-To: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779520485; l=5103;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=hHbUbuvMq67kK92AX9bALnGMbnsaNAMLaVZBi9x7aP8=;
 b=qNGOyDxAj678uYPPSb3AMv+D39xUv181s2qeCaRNn8MAS2/vJ951M1OnGqV9FrNQYKjM0c4e3
 udMiRqeIIYUCrA8M36uQ1otlhDsqiqVZChLkGkRzKDAM2Rg1gLLaJ7F
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

With CONFIG_DRM_USE_DYNAMIC_DEBUG=y, several build configs had
problems with __dyndbg* sections getting lost in drm drivers.  Fix
this by following the model demonstrated in codetag.lds.h.

Introduce include/asm-generic/dyndbg.lds.h, to bundle dynamic-debug's
multiple sections together, into 2 macros:

vmlinux.lds.h DATA_DATA: move the 2 BOUNDED_SECTION_BY(__dyndbg*)
calls into dyndbg.lds.h DYNDBG_SECTIONS(). vmlinux.lds.h now includes
the new file and calls the new macro.

MOD_DYNDBG_SECTIONS keeps the 2 sections by name, aligns them and sets
the output address to 0 when the sections are empty.

dyndbg.lds.h includes (reuses) bounded-section.lds.h

scripts/module.lds.S: now calls MOD_DYNDBG_SECTIONS right before the
CODETAG macro (consistent with their placements in vmlinux.lds.h), and
also includes dyndbg.lds.h

This isolates vmlinux.lds.h from further __dyndbg section additions.

CC: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
v3: move #includes to top, drop extra ALIGN(8) in DYNDBG_SECTIONS, add RvBy

v2: Address linker script review feedback for relocatable modules.

MOD_DYNDBG_SECTIONS() used the BOUNDED_SECTION_BY() macro, which
proved problematic for kernel modules for two reasons:

1. Unwanted Empty Sections:
   BOUNDED_SECTION_BY() automatically generates `__start` and `__stop`
   symbols. When applied to `MOD_DYNDBG_SECTIONS()`, the linker assumes
   the sections are populated due to the symbol definitions, forcing an
   empty `__dyndbg` and `__dyndbg_classes` output section in every
   compiled module, even those without dynamic debug configuration.
   Since the module loader uses `section_objs()` to locate data via
   ELF headers instead of relying on `__start`/`__stop` symbols, these
   assignments are completely unnecessary.

2. Non-zero Output Addresses:
   During relocatable linking (e.g., `ld.bfd -r`), omitting an explicit
   base address causes the section to inherit the current location
   counter. This results in non-zero sh_addr values in `.ko` files,
   which is confusing, degrades compressibility, and can cause issues
   with external tools parsing the ELF.

Fix both issues by dropping `BOUNDED_SECTION_BY()` in favor of a simple
`KEEP(*(...))` constraint and explicitly defining the sections with a `0`
base address: `__dyndbg 0 : ALIGN(8) { ... }`.

fixup-inc-vml
---
 MAINTAINERS                       |  1 +
 include/asm-generic/dyndbg.lds.h  | 18 ++++++++++++++++++
 include/asm-generic/vmlinux.lds.h |  6 ++----
 scripts/module.lds.S              |  2 ++
 4 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2c6d79275c6..e87bfe2e9e62 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9079,6 +9079,7 @@ DYNAMIC DEBUG
 M:	Jason Baron <jbaron@akamai.com>
 M:	Jim Cromie <jim.cromie@gmail.com>
 S:	Maintained
+F:	include/asm-generic/dyndbg.lds.h
 F:	include/linux/dynamic_debug.h
 F:	lib/dynamic_debug.c
 F:	lib/test_dynamic_debug.c
diff --git a/include/asm-generic/dyndbg.lds.h b/include/asm-generic/dyndbg.lds.h
new file mode 100644
index 000000000000..9d8951bef688
--- /dev/null
+++ b/include/asm-generic/dyndbg.lds.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_DYNDBG_LDS_H
+#define __ASM_GENERIC_DYNDBG_LDS_H
+
+#include <asm-generic/bounded_sections.lds.h>
+#define DYNDBG_SECTIONS()					\
+	BOUNDED_SECTION_BY(__dyndbg, ___dyndbg)			\
+	BOUNDED_SECTION_BY(__dyndbg_classes, ___dyndbg_classes)
+
+#define MOD_DYNDBG_SECTIONS()						\
+	__dyndbg 0 : ALIGN(8) {						\
+		KEEP(*(__dyndbg))					\
+	}								\
+	__dyndbg_classes 0 : ALIGN(8) {					\
+		KEEP(*(__dyndbg_classes))				\
+	}
+
+#endif /* __ASM_GENERIC_DYNDBG_LDS_H */
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 0e4677b71d16..f2ec36a35809 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -52,6 +52,7 @@
 
 #include <asm-generic/bounded_sections.lds.h>
 #include <asm-generic/codetag.lds.h>
+#include <asm-generic/dyndbg.lds.h>
 
 #ifndef LOAD_OFFSET
 #define LOAD_OFFSET 0
@@ -344,10 +345,7 @@
 	*(.data..do_once)						\
 	STRUCT_ALIGN();							\
 	*(__tracepoints)						\
-	/* implement dynamic printk debug */				\
-	. = ALIGN(8);							\
-	BOUNDED_SECTION_BY(__dyndbg_classes, ___dyndbg_classes)		\
-	BOUNDED_SECTION_BY(__dyndbg, ___dyndbg)				\
+	DYNDBG_SECTIONS()						\
 	CODETAG_SECTIONS()						\
 	LIKELY_PROFILE()		       				\
 	BRANCH_PROFILE()						\
diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index b62683061d79..2e62dc5bd5d4 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -10,6 +10,7 @@
 #endif
 
 #include <asm-generic/codetag.lds.h>
+#include <asm-generic/dyndbg.lds.h>
 
 SECTIONS {
 	/DISCARD/ : {
@@ -61,6 +62,7 @@ SECTIONS {
 		*(.rodata..L*)
 	}
 
+	MOD_DYNDBG_SECTIONS()
 	MOD_SEPARATE_CODETAG_SECTIONS()
 }
 

-- 
2.54.0

