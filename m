Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4783AEF34
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 02:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783477109; cv=none; b=F0Z0bNpCjcXSOLsDRLe7NfZVqWnOrviPqhquUQT7SNzXiUiX/GV8ZOVTARQRqjO2HasgtFgOJLauqec2pxb6l0jf9FnEht+rFicpJ5M9qHYImcAvpA5ioQtiY/nmlF0i3sSDi7j1eKbCkpoNuP6dB+yAOehZl1TPEwq2VRh7p6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783477109; c=relaxed/simple;
	bh=0NmENmK0/2sRvdDIHaL4q/g343CMSJD/KWi2ZY5I1ss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CoMxTapURNUTjFQANPGdvgM48bPeb/PA7IaqWELbwbTB1mUv5B12lwFcF7y+RaFhOpWbJvWocOH/jqEvB0KMhF4GLbNpE5AcMUoVHVGsH/K15gYMgBOPlTuL4GRPLFZC1SWqHWERwqYPLmNkhRaxV5tpQLlu35XwUOMSv4mEJ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chb653We; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chb653We"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-495b98b4f6aso91666b6e.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 19:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783477106; x=1784081906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4NFPrNHM8NGh27YAZAj6cHMKoI1eI/0WdJe3lAHUCg=;
        b=chb653WeF7ERtPfV88c89axP55atVFNMNC5YeBw0ediRZaLF494Q6mSoentWIFtk7F
         ONpJ+HA/DhnWo0TXH8HqHgnCR/+OD908Biybo41xfMomdtF5TzJOb2yLyklO+8GEkCCf
         MmPl7tSm/cCE0tJ2RB2NkQH3EA8yPcnu90IYn5exq9xVZs0i1WdOo66kougbfxHVTjh0
         aqbwqGqpetmTHuAk87BAbJIYpzeIsxVq40CFea1jZmYPbfE1hhmZHNas+cMmbL+HRJPd
         aU4eZbchvotSMA3pNGVVXXVfvFw6WZnQzB7riuOZKsDpX1gzcWwH9fz7Sss51wa7Vro2
         hhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783477106; x=1784081906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y4NFPrNHM8NGh27YAZAj6cHMKoI1eI/0WdJe3lAHUCg=;
        b=mImcVCuL51mg7VE731QUnmhUSbf9XzTBzih80MYz65Tic0onE9APjWW67zR6kbBl45
         I/sjmWN/L35vKWoHdTptbB6Ay+vJKPYCAcg8ADuq8rIGuAc4pgV+vfxjNk2prm6EMaYT
         yO4xaqcGuUfiY4xt8il3HlknIbavwqa1Po4ZXiTQ1L8zJPz+qGXso9EP7QFev1+GXhVp
         L6rTVIWqaFy29ypCMRQfrFlJuP6/x5juhsJPL+DNIrVTbPs+U6d3i21XQ8To05HyhuJT
         MHZE9SZm6NZ0rOozj5eCncn2LieUYzdNIiGScX007B82l5b0og02WuWT3AXdn2RTMT5W
         iTJQ==
X-Forwarded-Encrypted: i=1; AFNElJ90uUS7MLK1lxNYOA7TQ/0J+0EYmX8dBqifcxdIHs9t9WDfo8EmscScHyGC9+MBLqOasHaYcbvtdRo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyai2t3xvCxYv1o7pjtiMUB0xDTHgZM80N+UhZcZLP+UkF4XeSo
	Xrr78VCJEl/L/2oiuOsAfwjwe+UgESc7ICID/a8U8Kt4cztcyXcj8YWT
X-Gm-Gg: AfdE7cnvaE+3AiwyXs7C68X2zIMpPwMeH+zYlHQrqSA/RUsTUlRz8S5n1Id4FAeCYWM
	Qs00kY2EOMPasHiLAJFryyi6kRKnd4W5fmzMZilqf47W+J13Q1r3azA0g8wxaJQZrmVT/00WdLS
	L5FC6c1UKiv0Gj+YK2mkpYc+Fq3c0bGmwml7nuGHsVSA9nPkUw64lRX2JPTVSM5DtWocSIVxRTp
	l6MydDr8deTP0ST8WwK7bONP9MPYG5s1PsQ8vIGMqaJm7vQ2HQMaubesFyZSKy54ZsIZEiKKgU3
	UCrkolP9ZP3t0S2xrGJdSo+gV6GKwjsqgB2kFdzCRD83qoQUn5bn18llBVCBQ47RcWFclOuWtfo
	mhdTcVHf5O8CZZqH/7ex3wHcGOb2h426AIY/MUF4JBpAe41JB0Y9ECl3lSgUjez5mNIuku2Bxa+
	Gc19oxvlQRLXlEUQHCskNI/97N53X3zp0d39bTv8Tlsz+P4HO8n5c=
X-Received: by 2002:a05:6808:d52:b0:497:e39e:a002 with SMTP id 5614622812f47-4a204ce54bemr328581b6e.30.1783477106446;
        Tue, 07 Jul 2026 19:18:26 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4a1aa006f74sm799975b6e.0.2026.07.07.19.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 19:18:25 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 07 Jul 2026 20:18:01 -0600
Subject: [PATCH v6 01/24] vmlinux.lds.h: refactor BOUNDED_SECTION_* macros
 into bounded_sections.lds.h
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dd-maint-2-v6-1-381f3edb0045@gmail.com>
References: <20260707-dd-maint-2-v6-0-381f3edb0045@gmail.com>
In-Reply-To: <20260707-dd-maint-2-v6-0-381f3edb0045@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783477102; l=4249;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=0NmENmK0/2sRvdDIHaL4q/g343CMSJD/KWi2ZY5I1ss=;
 b=J5qh+4g10P6PxlYU4nAckTFiyCYyWy8E12UFb35F97Nw7iIf6MPXOCAEx5iDTUw+fHx2cU5pf
 cf9ZNbHSrxBDC+PzcTD/aLHqo1Ed7y4Hj6FhQAs+Z0+HxpF1ROodkbk
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Move BOUNDED_SECTION_* macros to a new helper file:
include/asm-generic/bounded_sections.lds.h and include it back into
vmlinux.lds.h.  This allows its reuse later to fix a failure to keep
dyndbg sections in some circumstances.

NOTES:

These macros are only for use in vmlinux.lds.h, where the _start &
_end symbols are needed.  Modules keep sections separate in ELF
sections, with their boundaries known, so the _start and _end are not
useful, and may confuse tools not expecting them.

This patch ignores a checkpatch warning, because new file is covered
by "GENERIC INCLUDE/ASM HEADER FILES" in MAINTAINERS

CC: Arnd Bergmann <arnd@arndb.de>
CC: linux-arch@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3: move include to top
---
 include/asm-generic/bounded_sections.lds.h | 36 ++++++++++++++++++++++++++++++
 include/asm-generic/vmlinux.lds.h          | 31 +------------------------
 2 files changed, 37 insertions(+), 30 deletions(-)

diff --git a/include/asm-generic/bounded_sections.lds.h b/include/asm-generic/bounded_sections.lds.h
new file mode 100644
index 000000000000..8c29293ca7fb
--- /dev/null
+++ b/include/asm-generic/bounded_sections.lds.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef _ASM_GENERIC_BOUNDED_SECTIONS_H
+#define _ASM_GENERIC_BOUNDED_SECTIONS_H
+
+#define BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
+	_BEGIN_##_label_ = .;						\
+	KEEP(*(_sec_))							\
+	_END_##_label_ = .;
+
+#define BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
+	_label_##_BEGIN_ = .;						\
+	KEEP(*(_sec_))							\
+	_label_##_END_ = .;
+
+#define BOUNDED_SECTION_BY(_sec_, _label_)				\
+	BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop)
+
+#define BOUNDED_SECTION(_sec)	 BOUNDED_SECTION_BY(_sec, _sec)
+
+#define HEADERED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_, _HDR_) \
+	_HDR_##_label_	= .;						\
+	KEEP(*(.gnu.linkonce.##_sec_))					\
+	BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)
+
+#define HEADERED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_, _HDR_) \
+	_label_##_HDR_ = .;						\
+	KEEP(*(.gnu.linkonce.##_sec_))					\
+	BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)
+
+#define HEADERED_SECTION_BY(_sec_, _label_)				\
+	HEADERED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop)
+
+#define HEADERED_SECTION(_sec)	 HEADERED_SECTION_BY(_sec, _sec)
+
+#endif /* _ASM_GENERIC_BOUNDED_SECTIONS_H */
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 5659f4b5a125..f5ddf31b7f26 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -50,6 +50,7 @@
  *               [__nosave_begin, __nosave_end] for the nosave data
  */
 
+#include <asm-generic/bounded_sections.lds.h>
 #include <asm-generic/codetag.lds.h>
 
 #ifndef LOAD_OFFSET
@@ -211,36 +212,6 @@
 # endif
 #endif
 
-#define BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
-	_BEGIN_##_label_ = .;						\
-	KEEP(*(_sec_))							\
-	_END_##_label_ = .;
-
-#define BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
-	_label_##_BEGIN_ = .;						\
-	KEEP(*(_sec_))							\
-	_label_##_END_ = .;
-
-#define BOUNDED_SECTION_BY(_sec_, _label_)				\
-	BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop)
-
-#define BOUNDED_SECTION(_sec)	 BOUNDED_SECTION_BY(_sec, _sec)
-
-#define HEADERED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_, _HDR_) \
-	_HDR_##_label_	= .;						\
-	KEEP(*(.gnu.linkonce.##_sec_))					\
-	BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)
-
-#define HEADERED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_, _HDR_) \
-	_label_##_HDR_ = .;						\
-	KEEP(*(.gnu.linkonce.##_sec_))					\
-	BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)
-
-#define HEADERED_SECTION_BY(_sec_, _label_)				\
-	HEADERED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop)
-
-#define HEADERED_SECTION(_sec)	 HEADERED_SECTION_BY(_sec, _sec)
-
 #ifdef CONFIG_TRACE_BRANCH_PROFILING
 #define LIKELY_PROFILE()						\
 	BOUNDED_SECTION_BY(_ftrace_annotated_branch, _annotated_branch_profile)

-- 
2.55.0

