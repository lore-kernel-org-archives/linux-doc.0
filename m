Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9DE47DD74
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 22:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202886; cv=none; b=uVvCbXBPqS4hIqeE2wQTI0Eo4Py7q9tN5Ip17InuoxbBqaL2Te6uW9Gw7RQf+MK1BePHENR3JL4PAtEoBwfB1OzmsTNFM1rSSiRU5uHJgWCZbXpt6KDtmNTzwwsofYkLBOSqaZfeTGek8G1kh4usvt4d994yBbEUffXFiSbv8sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202886; c=relaxed/simple;
	bh=6qxe0gy40UPEdl0jWeVq5+K3tVsIJlZLuSqprPmS8d0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDJ2WR9X0Pt0jt5FXjUet8TPuJXL52Kt2xfUOdPENxcpvTCGzuURbhG7xK6YuIHn5g/rQCNf0+hbzDNjraIngxIyuTHIKM5VzuChDBrLZchNmPEDUQHS3jkZVnVWbC+mdyedy9aLapn3CqrYcp2VHX3XhV2LBhGVywU9QR3pMwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7UypNpx; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7UypNpx"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae736c63so921623eaf.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 15:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202882; x=1790807682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnMlaIiyV9uCkDgs9M5hIDK+zz/c3R7cHWP4ep9lWHU=;
        b=U7UypNpxlVShj9rYNOoyccV1Co6CKM3+LNrIgKc9y0bTqUx217TeKWbyMw0aFLEr1n
         E4JvoK8BPyKj+fbWol5KfeLjYTkcYY4v1hf0hy1nbDdPxoRh+ChMJY1fmjwdINqk/u7p
         tjVw+NlYmOzgajW/mABVFGZadsgUTyeRvwFLD1liR1CNOCEpn4jh1MpfmD5/tD4v8st5
         8APDqD0xt6C6ChvyzadUsB2MHKFCA2+Ve9lD7o8xeSWd1QgtT+fVw+fPWvPHCoEw/ybS
         eaQGvUlclJf+OLtH0Np5zGoXXO5o9YmZWVYe03TcpPE9Kwd2OIBh8FqqaaJP2G4Rvg/w
         hHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202882; x=1790807682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnMlaIiyV9uCkDgs9M5hIDK+zz/c3R7cHWP4ep9lWHU=;
        b=FV4racycOrHefGvlGCmAUZYZyW2Gs4/tp5bayiZ9FkEHroojqD8CwSnQqNAZjti5Eq
         pvQ6fAzjRO3uEd9J6LeANld/xPJGC3Ed6e64+peOCrc6N5soSWjIVryePe7nGX3Q9yZp
         o4ODwrjN3MqATm8sX3gAx7caFSDSZw5agJJyZrfRaVkC5EPdbwDV7+Z/oN6HQ6xcr/ld
         RPOeTi5xxJcsNGlTtWphL+N1t9hOry1GpCFZ6oxK+7DVdGv8HNkBZ0kTw0dlkj/8p26N
         Ta5zjGpkQcaZpzL65G3YrlVg/3vISccqnTq7O1NHyFlzHdlRYamC/xXd8acpdAwh/4Ag
         A6QQ==
X-Forwarded-Encrypted: i=1; AKwUvBwr3GFLO60ND9QVzLFQ5NcEgsXO0O5gZGdX+BMBPCSrFnEazo6nL5sLRXPlmN3B1OSYjDPrGhwaXOs=@vger.kernel.org
X-Gm-Message-State: AFuF++k3j1NOxQvBDLX7JkWouGbKLUai3stG2XnIFCXxf/lHBTaLbpzA
	WctZ3T0jBBW9WfUWwlTY0k+iaGr7vnrnXwD6Gvl3JJbFZx8J8Xpn90hr
X-Gm-Gg: AYBFou3XaVSmhD8ffh3IYDljpLMSK5otbxTg6wshleVAfWGn4iZpAeqgISOM3ATH7db
	UlQN8lfiJzi/VQY9NPJTrtQRtCIE1KHViCCceELQfv7xfxxSdfW95ymBUEmshKd9IbtczpPD+OB
	G8dmFenGyfqyLJBSYxWFhcL7W8mlhDPQYuV9SwMu9+kPrw5f2jXqbtoKLqoMSSTgSZOnlBLXQqj
	VAm3V+rOx6ur6uDmKLI0as+5cxviem00VkSGLyXi6/cTI+8xA1Q9zJ04P+a3nO9FyYsLRnoSRlX
	XG4yQmFHktfXQp4XliaP4GYFTJE2UORGfTwYTFt/P/eciIvCgK49j7NEr2sC4zbJ9QaJwG6lFrU
	gjF8lP4X4vJibbeiSGSxh2ROAQ+PCbsDDTWXq4M6jVuYPcQyq8/FRdOalbLjKIPh3vqkutwhjcy
	fFWe4zWJrd7UkwRxDmNbXZ73GPpBOMs3b/GSuoplrCnbJJQuXlVMC5BRDUnsHdfiDhGtAnzXmJV
	QQFR+3I8UmiKd5A7s0vmozkuBJloNGddnYBJNAi/iLfZF85LFHfbPq/1U4G2j/QPtuB8UXl++I+
	Z5zNX/OBKbCLj0Xdszw=
X-Received: by 2002:a05:6820:f02f:b0:6cd:3fec:de73 with SMTP id 006d021491bc7-6d441b81d40mr645833eaf.73.1790202881675;
        Wed, 23 Sep 2026 15:34:41 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-491ee1ac486sm559401fac.16.2026.09.23.15.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:34:40 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 23 Sep 2026 16:34:26 -0600
Subject: [PATCH v11 02/38] vmlinux.lds.h: refactor BOUNDED_SECTION_* macros
 into bounded_sections.lds.h
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dd-cmap-part2-clean-v11-2-9b6c217fdf2f@gmail.com>
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
In-Reply-To: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
To: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Jonathan Corbet <corbet@net.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790202874; l=4249;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=6qxe0gy40UPEdl0jWeVq5+K3tVsIJlZLuSqprPmS8d0=;
 b=SbE6VLJkKQA4ZmuNShacCQ41GeiHEqiikvRAmn7Y/poA+1ah98T6vCjhM8agKA4SSUV1iLPsi
 lAjSmEq3yPPDEM+C7k7FjZCi5nPx+bOkRUPxtSyMlpAUpaE+b8snz3X
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
index 2187fb463de6..019072d3d391 100644
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

