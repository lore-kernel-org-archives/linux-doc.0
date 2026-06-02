Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D393C4B94
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 22:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780440505; cv=none; b=mY9pSS7I/QO9DX5gCpkSZoyMuoTYnmrjSL91JMkI2UO9oeNZV8hyfIXqkbADEY4Dz6E3pGNOCV+F0W/7VBn9JmL9IA5rJuWZmq5otxnjXIrNerhyq4MZMVq/zPvqR/8a3trsGo9K0K0HJ/A7BHl7+xRhh4RqJAph/MqTD3jtcXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780440505; c=relaxed/simple;
	bh=gyhl2dDHOhDRfo2EoLm//e3PBy86xHd/L/qSVe14+FQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=No1eS05ema1Gj2ob4VJU9Xj2CwOuwh/NbftSmvl09rTBnQvRC/8SaURDF5yD83qv0MjPwdMWHnDrPgJUuNDeN6ruihje8u1tQ0THLyjS1TBkh4MUbA1rWFnIon59+dYc3C6mRaqoMnvDp3AxV/LtOBrCT/yAb6HoQK21S+dahNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhpFbID4; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhpFbID4"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4600ddc4017so2535723f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 15:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780440502; x=1781045302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GsoCp+QEhPQqcC7YciJ1pPB6BZ3pQYi3CKXlL70tQeM=;
        b=AhpFbID4JCIUXOJSzh/dJxAv0z16VlrytM49g+48C2VKBz/4pL55rX2dgMdicIM6Xc
         i4c6K7ehBhnVPYB0MqlPvpqEmDZVXlCHRze4fUyzXeHUOT/maImXRE1FCVIG0iKF3B0U
         J4XQCUeCFpzPJcZ8o6uh7jnpTCG1zRmkEHggRviL/qQdwzx6AT8TIcZgsoZOzcgT41Gj
         9WWX09T8frTb9pXONy4hRAYR8Jd9yeZcv1U6eb3KAdbQBmBNcgCIma75xUgt0rGaByhu
         A3qdVmyrtNnS90D1UMln/kcTxNH36oOmJP0NbQ5VnAu33eOmoPW6yPBRb9J29+HwTtjG
         G/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780440502; x=1781045302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GsoCp+QEhPQqcC7YciJ1pPB6BZ3pQYi3CKXlL70tQeM=;
        b=a+1GNXhpk3lqgp9r4sFu2KSiI2XgNaRoGa7G4bFVTcz0ZzvS4cFmnMY/wbJWE+USuC
         e0+JjVeznhFge+LE4tJ3+NkZ4o1rptop3+6mhamaQU2t/r6Wh+fPcAYwvfw8FcaRcr4z
         yFjoV4JCoCRkPTs/W5aEO6CBdPSIWFRgtBums/IZC+jCQlzStkDJd3DURgHfFhGjq06h
         4+pbHCxNL7QIfI4U5Le+veD+kmS26nehaNzFl4NUHrPSNJ4//xX1BRU35mNYAxt/ytCp
         EWSaZci5JWG1qlGDtcFHGDqM8NEkMmbpZRNkxiPPZ4ED/5BsE72vGoS0zsLEmJzYEZEh
         t0Ew==
X-Gm-Message-State: AOJu0YzoPcT9padqJsOC1L98/Rw7tGj8uhvFGcdo4ps6LJE1elAWUraj
	jmXM2UX2dk1cHaqvy9huYvIwnnd/3vKpG7MhsQx8a4j4vV6DdLbdFqUH
X-Gm-Gg: Acq92OGTw7JlwGaWRgdJsavZMjTZzmjS9VbDv+o/xJqX09M4OyYvo07nP5gX6e2OOon
	mwkSeMpT0/EhwE6G9cX3Tj4kB/dJulwh0mV5DElTBy26dBl9pWfPfeIjgxP1+fvqHAiOaKmQDIO
	NIqQU61nTfiuSSwa9zrOfBydCb2NB44Ru34IVKzi//NqfA02O0RYeKu06ov6ZCxf6kes6uew5P6
	qBvJedbzYbDExVIyuhpl2GrYVsRoX6bshAm48+L4RPutkDL4lbnA8woeZsESTgodLoWNcm42/vI
	bp0lVaDDVR8ThHuuLDma03W+6W7Xrkv+cbIF1YvsUirinZwPggcEBTGTMCrLxxwEgUNrLOulguj
	eZWkFmSMFD0h+5diENJ2G6uYf4xvRfdNYUgaXIWdYUAOXMrPEI7pXhsjgfyHsTuHcd36pqiWDTw
	pjf4ow7nQRhTxeT/Wd62/dDQeboo1xDISjaOta0PICVaaIZfQ+SpAF
X-Received: by 2002:a5d:4987:0:b0:45e:f780:6181 with SMTP id ffacd0b85a97d-4602182cd9emr456749f8f.23.1780440501948;
        Tue, 02 Jun 2026 15:48:21 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm1999791f8f.14.2026.06.02.15.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:48:21 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 02 Jun 2026 22:48:01 +0000
Subject: [PATCH v4 04/25] vmlinux.lds.h: drop unused HEADERED_SECTION*
 macros
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dd-maint-2-v4-4-19a1445585a8@gmail.com>
References: <20260602-dd-maint-2-v4-0-19a1445585a8@gmail.com>
In-Reply-To: <20260602-dd-maint-2-v4-0-19a1445585a8@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780440488; l=1428;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=gyhl2dDHOhDRfo2EoLm//e3PBy86xHd/L/qSVe14+FQ=;
 b=MvsNf/S/xSTGRA+QFVkd0l5ykeS++JYaB1FrXileFx3gCJmyjVcFCFJQIWqeiUZo7GqEj3BlU
 9d1r+RLMW7bDHjfviGujkjn0nEiFeEV5seia07THPaU+H02yfAvWuLZ
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

These macros are unused, no point in carrying them any more.

NB: these macros were just moved to bounded_sections.lds.h, from
vmlinux.lds.h, which is the known entity, and therefore more
meaningful in the 1-line summary, so thats what I used as the topic.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/bounded_sections.lds.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/include/asm-generic/bounded_sections.lds.h b/include/asm-generic/bounded_sections.lds.h
index 8c29293ca7fb..268cdc34389b 100644
--- a/include/asm-generic/bounded_sections.lds.h
+++ b/include/asm-generic/bounded_sections.lds.h
@@ -18,19 +18,4 @@
 
 #define BOUNDED_SECTION(_sec)	 BOUNDED_SECTION_BY(_sec, _sec)
 
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
 #endif /* _ASM_GENERIC_BOUNDED_SECTIONS_H */

-- 
2.54.0

