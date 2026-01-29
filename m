Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7F037A490
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671801; cv=none; b=myYwnNREXLa7GjWAVq+tLt/N52XrH3rH9FMjm+iPp1x0uQUFAewNsTqNDgb13N4B3MUKVtqIpo063Q06C1YU0qI9sJOY4Lbc3NMzIlsHad1wH5MovmgT3uSfpuE9hmg0/APrpfexo115WUqy1G3H6OEP+ECEvqyulyghTMxiaeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671801; c=relaxed/simple;
	bh=2jDt6YqP3a+1aVh/FNMF9Opi3r8HiPtSmUoSz9PHaeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hlRqWzMOqZ7JQgMZbmNXySqGe5CvFlaCl4uQvj08kxOSW1nDIzjIQfgz5OqZzHhnzZOj+ga2tEJT7gZAoUPb+QD3Tc4DnxvfVWzIXu67pAJJClQ4sewJi3kaHNThDf1xgcxDuFwGGzuNgLCsEamIxj5KW4NMjLv7y8qKJi5JKhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOMX8F7X; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOMX8F7X"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-45c93313721so440454b6e.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671797; x=1770276597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEl8972ECcp8sqKxvk2A+g1VyC8mDuDWjsB9ih2/jOg=;
        b=LOMX8F7X42GHZrcCfUt1OXQQcjK/SeM0UDLi3tJfoT5qh4s113oUYIJjlbQ9VbbbXZ
         xPwAFxHhHU8ykSCrP48wgROK2oBIV7sjfFh85yYWMPnbBboJQDZRc5OyFjwY2sa7H2eG
         OQiFYNSjvrTBJqtxu7788wie6Rfdnt8W1GeqWk1TDR5NRPdTwpmRozxq2G4sEgBd9Ikh
         meRWzrfZnU62Qt0elNAd2KpAuSp3vVQNG0FhwIwnNnDlzN9ms1H0H4/SB3l5O1kiPK2N
         ERrv05c0nyR9v4mMMuHw9aJLZ6EY4vURS/Ojaimi4HjWHBP99hCjFluUNpgVgrhevcT+
         DuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671797; x=1770276597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mEl8972ECcp8sqKxvk2A+g1VyC8mDuDWjsB9ih2/jOg=;
        b=awsMT2Eard+YgV6DjFHzC3nLmZITQrpKbkG3fnndNdN3vFbQ4K+ckVDQcKDFUxz8Z4
         i2D9z/34BCcEZyMDLGROAwtqb53SEpehWgZia+z9ACEnUTJ19+43bCS4GmTMdo7a7z6L
         F3gHinlngg+ebn3VnZ3EzJsiiMHY4Sv7DrZ0xpixYD8FRXPAs5Z6aAwWCjB44btLScXd
         3PQ+6xA7xbbJQrflreOBG6pqEIRd4rWgLw68c2tNOK3I+EglJ+nu0yMa+1VS69w5q5AI
         dlgNSFeDj57j4wHKPkY04wjUa+MtpXzSl8mPrO8rc1hq4tkZ2tWHIMPIZ2c3htNJsBLd
         T0wA==
X-Forwarded-Encrypted: i=1; AJvYcCXVUml+ShjocmwJ82lAHRzFux5LaXxGJYnOVWZAqnnUXYyjCeBRNWbiUBUuFNAvjG48B4v6oWJK0u0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWHalHibFLg//FBokyDFFb6dAYTszcmKpe57a1BEkv6lRpU+fV
	jP1ExBNBZ4jQbt2izHx0fU4dY5IJThQ5VIFrQ+jeLCcFINKYvO5QlBrn
X-Gm-Gg: AZuq6aJbRO/2EiW9H1xzfWvCIzZzSP/lTic4btDGZckJntTRRqPGJRihEUpVUzMSvAs
	4rgTDqHkhVlLCz0sfMDu0iaQrjqqHbfx/WtwfBiz5M0gZqTDQExoYuFIX5aJKGPx0PATx8xi9FW
	WcfCn8ZjE8HJcQvJ2uQlzxqsx9gh+6kChNT8SmU9xyyIXQJJ9RhXq1KzSFDhOQgPfugNppt+eUZ
	TMwSzx1mzNtCtB2s5XnTw5CFTnTI0h66cvOCi4y44fKhb/OXX2c4MQm+Kvrd/1IBZzOjNiqvF0E
	QwAl52oGVuDCmHa1kVNACsgXHndNwt+rAWlnDi82yhPgvVU8ePHT4hlj4gj2yBpWzLk1UagYIgA
	YzBUIdW/mVgLYCp5U6CekQiC8TqUHiQ/nuW1oZwd5wAFc1c/bGcluRdDYOrPMcJUor1DIdg3L+X
	Qg7goUdafjrvZ1HQ34QK1SLgHyCaa2daJC/TVv6QFx
X-Received: by 2002:a05:6820:1612:b0:65f:335d:e2ed with SMTP id 006d021491bc7-662f216fe00mr4222030eaf.74.1769671795811;
        Wed, 28 Jan 2026 23:29:55 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-662f9a18776sm2798249eaf.12.2026.01.28.23.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:29:55 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Jason Baron <jbaron@akamai.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Petr Mladek <pmladek@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	kernel test robot <oliver.sang@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 01/32] dyndbg: fix NULL ptr on i386 due to section alignment
Date: Thu, 29 Jan 2026 00:28:47 -0700
Message-ID: <20260129072932.2190803-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129072932.2190803-1-jim.cromie@gmail.com>
References: <20260129072932.2190803-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When dyndbg classmaps get used (later in this series), the
__dyndbg_classes section (which has 28 byte structs on i386), causes
mis-alignment of the following __dyndbg section, resulting in a NULL
pointer deref in dynamic_debug_init().

To fix this, employ belt + suspenders:

1. move __dyndbg section above __dyndbg_classes.  This restores it to
its original position directly after the ALIGN(8), and fixes the
immediate problem.

2. add ALIGN(8) to the BOUNDED_SECTION* macros.  This aligns all
existing sections using the macro, and also fixes a future
dyndbg_class_* addition which would suffer the same misalignment on
i386.  Many of the existing macro uses already have a preceding ALIGN,
these are now redundant, but are harmless, so are left to avoid churn.

3. remove BOUNDED_SECTION* uses in ORC_UNWINDER sections.  These have
smaller alignments, *and* scripts/sorttable.c does not tolerate the
added ALIGN(8) padding.

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202601211325.7e1f336-lkp@intel.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/vmlinux.lds.h | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 8ca130af301f..4b4d2773aa22 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -212,11 +212,13 @@
 #endif
 
 #define BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
+	. = ALIGN(8);							\
 	_BEGIN_##_label_ = .;						\
 	KEEP(*(_sec_))							\
 	_END_##_label_ = .;
 
 #define BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
+	. = ALIGN(8);							\
 	_label_##_BEGIN_ = .;						\
 	KEEP(*(_sec_))							\
 	_label_##_END_ = .;
@@ -383,8 +385,8 @@
 	*(__tracepoints)						\
 	/* implement dynamic printk debug */				\
 	. = ALIGN(8);							\
-	BOUNDED_SECTION_BY(__dyndbg_classes, ___dyndbg_classes)		\
 	BOUNDED_SECTION_BY(__dyndbg, ___dyndbg)				\
+	BOUNDED_SECTION_BY(__dyndbg_classes, ___dyndbg_classes)		\
 	CODETAG_SECTIONS()						\
 	LIKELY_PROFILE()		       				\
 	BRANCH_PROFILE()						\
@@ -867,15 +869,21 @@
 #ifdef CONFIG_UNWINDER_ORC
 #define ORC_UNWIND_TABLE						\
 	.orc_header : AT(ADDR(.orc_header) - LOAD_OFFSET) {		\
-		BOUNDED_SECTION_BY(.orc_header, _orc_header)		\
+		__start_orc_header = .;					\
+		KEEP(*(.orc_header))					\
+		__stop_orc_header = .;					\
 	}								\
 	. = ALIGN(4);							\
 	.orc_unwind_ip : AT(ADDR(.orc_unwind_ip) - LOAD_OFFSET) {	\
-		BOUNDED_SECTION_BY(.orc_unwind_ip, _orc_unwind_ip)	\
+		__start_orc_unwind_ip = .;				\
+		KEEP(*(.orc_unwind_ip))					\
+		__stop_orc_unwind_ip = .;				\
 	}								\
 	. = ALIGN(2);							\
 	.orc_unwind : AT(ADDR(.orc_unwind) - LOAD_OFFSET) {		\
-		BOUNDED_SECTION_BY(.orc_unwind, _orc_unwind)		\
+		__start_orc_unwind = .;					\
+		KEEP(*(.orc_unwind))					\
+		__stop_orc_unwind = .;					\
 	}								\
 	text_size = _etext - _stext;					\
 	. = ALIGN(4);							\
-- 
2.52.0

