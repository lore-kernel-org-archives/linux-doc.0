Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E934A3B2FC0
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 20:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667442; cv=none; b=N3A+Vi0WTTVGDVPQ3y7SsiTyxjv6/a84YtWKCBtSYDPw7uoOKIRPp27pFPUcgfOe7O/ZSsOyuGfY8yEz9cWDMkipLaPqFK3hfn2hzZq3IrVjWTFBKyqi8iAh6BI6ICd6D81BBHH+WYEDFGOdyrLQ6Zaa+Zvu2jSJsOcQobtjYvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667442; c=relaxed/simple;
	bh=0NmENmK0/2sRvdDIHaL4q/g343CMSJD/KWi2ZY5I1ss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=llYwh08eVChaAROBMjXgwxmBneWYw5rocZeGpQ8WJq8k/QhpfMs6L6bfDdJRlMawv/1Gg2pt4rGYL0SXwixc0yhUnOIfXqHj94FJaLshDBOPW9B37KbdYq3vfeFG7bVjkyL3QhSJZ6ejP183L5be7uxQgHTosuN63AkbLdLGeEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZdQ3TYr; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZdQ3TYr"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7eb1dc6bd53so6587455a34.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784667438; x=1785272238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4NFPrNHM8NGh27YAZAj6cHMKoI1eI/0WdJe3lAHUCg=;
        b=RZdQ3TYrt2asR3y8HNoRVZI/dObbtdbBx0QRiJgpI7AEFaVHw9zA7WDbgegfhQNgrf
         ntC8KGJNUIeUwS0nGHB8cXxEN9gIxOXoFn8ebv3GzXTljBZZtIIkt+7V+bsR4g37tj51
         XYkxGQA8CadCkojXoTmBt+q7fY3A6pqGVof+l3bFqsumIfzRTK7+8Dsx61xnKrIUmrWM
         mkpUsTbJejGXK7obbsppVLvnU1+niuemGECH0SZuoabq1JldhRdJKMxZWVr8wV1pjM6r
         0svRdGXrH7fwd0oDrSSReBHL615oBKKdeSynOeMm2an96VqY0dnyWWu5dvaGwXa/nxmY
         FqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667438; x=1785272238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4NFPrNHM8NGh27YAZAj6cHMKoI1eI/0WdJe3lAHUCg=;
        b=VYIZg/qph0bRvA5LSz/SLwh3vtV3eh4y8snK7coTXGPZkSYAcKIbaHTH/fVr9tPV46
         Vq7bfzWB0YGRh5jFTYZNRqXCRGcYt3PJHXtcii3jJQcLt02Y4tQYFMc2eoeGBg95G7hI
         efJEVazU9zpyUjK0ysNZvfJXeZ/cIXCoQsISSfZsLCCr33As5r1UoLBxy9qHjyUYXsFV
         Nu96LXed7tHNaOtVaLAdOcSktOIGO+sNPhdxFGg8CpaTo+jDJL/WrMjdQj9PQ6wHFcnx
         EANzBghpktq0NgqBTMBprUVsUafnvNwXjx3N22fzvKha5+z2Lxje28NwEw09xQg6I/+i
         Fw/g==
X-Forwarded-Encrypted: i=1; AHgh+RrPc+0jPnioNdFn3+1sBt0UQ3ERSNEbKHT/ZbcHgUXDhfxQFsccdN3p8gtAd2MfW3eH2ggF1ncZ3sY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXQcNnwQeKpM+hLWkGdhVCf50+do/Wd0Wb7u6S9uQXNjZ7xbuj
	nu8ljAzC/RbJoaaRnvkr4srSQXCBvrnPhwlJXC0yqWxh/M7nkQV0Ygbw
X-Gm-Gg: AfdE7ckZcvUfg2gIHNah8TtDq6lJ0EWcyAjAYxhCMKQfcUhwPC5PvVAjfdTbMW+uS8/
	W9hEmcWEd35bbXNlaXyiyOqq4RbP9fFZm71ZROq+yj4BpsuIcJN95kxdrel6ZFjgb7s0LxOKm7N
	wpBKOk8M+kM019rgA5e4/j141Y4nDXUHhAcQZno2+SI1moWdES/Smtqde+HHz2OOmOGTNEWEO05
	uO+Zn/7TZZuBfofrO+KCCvDk69tXqDY2aMQDZOjQN79JsOtnnhcB+y1ch0+AaWWwOu7/1wg4ph3
	qqnM1BV0IS0tRMn9mzHuwYMCUcjlILVVJ/LSDXMe1x3o8FU0QAIHdJjwsggUEM2GlwiB4a2Rrjj
	37tkeSqMk04ksXv8iOyEQNtidHJsYH25OPGvCCbt0Mh2dY+Jppzgy87wdre4Q3KdXFAThcx3flF
	qCzyQKYdwabpim6sqYXiAWwUiLiZkAzqy67vPEq31E0h77PZoXXl2IGO9c47C5v98x/aqnhSBJD
	Sgy+M9jU0hU+tWjTxXqkHegGw==
X-Received: by 2002:a05:6830:64c9:b0:7eb:3af8:8c09 with SMTP id 46e09a7af769-7ed9aa576edmr11770945a34.3.1784667438495;
        Tue, 21 Jul 2026 13:57:18 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7edaf94a494sm11134501a34.13.2026.07.21.13.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:57:18 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 21 Jul 2026 14:56:55 -0600
Subject: [PATCH v7 06/29] vmlinux.lds.h: refactor BOUNDED_SECTION_* macros
 into bounded_sections.lds.h
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dd-maint-2-v7-6-010fbe73b311@gmail.com>
References: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
In-Reply-To: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, Simona Vetter <simona@ffwll.ch>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784667429; l=4249;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=0NmENmK0/2sRvdDIHaL4q/g343CMSJD/KWi2ZY5I1ss=;
 b=dJWJ27WqUk8fONxl4JaK5ZSZie5CaNJLzGVkKtYbqjvEm+5q2H9asVwQDtieoqiRI55uEdi9S
 E+ydmXc7WnKD6vkFx0yr6fOfmwtMO4X4a3Xyg1ysvv/m8KPsCPRGU3z
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

