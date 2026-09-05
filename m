Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C38376A0D
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 19:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636575; cv=none; b=edNJ/FTB5ZHwgksXMcpEOrHW+NGpRrC0ubqCvEAiVrYthPeviOiUJ2vXFUqXIzG0QVs9+Sd/JUXaD0YnggE52jGvMkCFZ+iJkpqr0NoDckJ//r6Br0NbX0rBe8Xrgbmx4NzMqTcgXi2RL35BnH3ins0p5E0Kb6yrQvXaVKViNUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636575; c=relaxed/simple;
	bh=a0msCzSodHHUo5LvLfRIZiI9maeBlwWaS3zqrFGDqqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ntPP0on14Rwvrt3ooTYuupaqWqDVJZT/WSeSpn3hNgeYJocVb9R6feQqw3VbYWRImcVofJtcOOh1uLK9SJzhOXxmhMlCoHsHG8wUciNroy2qqfffOergQ0omBgGmqN80qFXibt+pxIJHkSvrRPBH7n4e8JQ8Li5Or3GBbeLcb8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fupXj+7q; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fupXj+7q"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66c9995ca60so3283116d50.1
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 12:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636573; x=1789241373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhc3iJtISB6P0hFw3z/r/ijHfuUne/Bcxaq3qoJqnI8=;
        b=fupXj+7qkqcbVpjLLJ40di41lvQUGX3VLRsMh2cRTMcUMceuJsdYW5/M7HP0lr85DP
         ftiwHzLJzBYxcvspJonYBT4Bpu5mdv6pDmkhPEeWO/qRM7bOtcwwCEdUUxu3EMQ33kW+
         +hUKcS37hKg2ocUhCQck9Ma8IhW44HVsXVg2wM9ZKMz77QdOI97RvFoBWBaY7T8Uiy30
         A44F+X6SgUANzYmj4MZ7C3mjRlbwMJXXiQCngmsOF8luB3djT0QID6OAQqt2fHO+L9yO
         bFV75LOqP8SH4MHDtM6IEhSFeC+0UI10TTQb5k1bfcSvlLTdNkg77+4JXfuQSj+Dbp4a
         f+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636573; x=1789241373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhc3iJtISB6P0hFw3z/r/ijHfuUne/Bcxaq3qoJqnI8=;
        b=VsvOS/i3hNK82jvmcOFmzTLcuXCM74RshM2u/kQ1/4hiq4btEfbQFV9HxyoHP4PotW
         3AAkXjL6qAG6QeK1OcgaKIrZ9e9bbjASygFSjm63+utSmUyKlKdXkAmF5Vw2iJmB6v9M
         y9U3zST0DsOCQSipABS5VUT9krLCl6SHFiFQsgPcUqqqjz8pPWKd+nAUTxfktGb7F7WY
         rdR0PUmXiasqGTEHm4R1vxB9LbmsOb8TQV74xLRa0l95lLkBl4btqot0yYikMi2n/4or
         LcnXkysayYPtUQGRR52S9J40VSK57TBYD9oCqXmTaJA7w5nhOCVpWA7+8vNy1lnT4DmB
         NnvQ==
X-Forwarded-Encrypted: i=1; AKwUvBw78bk+3GzHxlWLZSdL7l9/TQZ/ijS5au8cGjHZhY0q9Mv9eJj3DJIfmjFJUmKENUsz8r48JPZp0ss=@vger.kernel.org
X-Gm-Message-State: AFuF++m/Gvopmhc3cGcySlsxBA5Mo0TYvSl134G1nbYBiUY2RAhHKmiC
	T43pq7iDhyxmxXmhogi7FrVBHJCf34JRnb12zulR7pOWQ1TNWjJX0Fo0
X-Gm-Gg: AYBFou2FqpdoqEIi11H0KbcObvuadRc8LEPxBxy+ccpRTEzQZdKyI9i6Rn3BTRCNf04
	xvAJeo9o1+9+L06cMIdgRW8Zyvkp1Eix9GqcywPUxhRdp1xLE/VYl0hwv67WpysBr7Y8s3/Kqz1
	mC5tIqShaPtUPZUicWO8fCAGi6eqGSSjLelfNb1PQdHdtFvAMf+UBJT+w8yF0WTrKa1QmU8qm2k
	HjMoIO2nw3sJxJbss8tSngtgqWU/yLiyR1fFrlX/rRknGoKYQUNLR+uABAnUB/XnPnKRDpRlIBV
	a5p+uV8f31FwxPnja5AdkNEBDJhSmRdNfkYg06EZyFvBC5qDyWp1yqkfv7hjham/zbVsh3BelUW
	AF7ChHDIAmHXfKW/K6dFwXd98i8QWWtxMJBUt8py0b+o+TL6nhY7+m7bPalU1qPB4eLUBOgBwwb
	leFgjB6V/k+JLBYJitia078ePijbpuCvGfcmhCGH7i2OgR+dM4tEHljFDycN6v
X-Received: by 2002:a05:690e:12c1:b0:66d:1c2a:9e5e with SMTP id 956f58d0204a3-66fb6d8ec90mr2866274d50.19.1788636572794;
        Sat, 05 Sep 2026 12:29:32 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb495eccesm4997275d50.18.2026.09.05.12.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:31 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:24 -0400
Subject: [PATCH v2 03/22] alpha: select ARCH_HAS_GCOV_PROFILE_ALL
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-3-83e8245761a2@gmail.com>
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Kees Cook <kees@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 linux-doc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1671; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=a0msCzSodHHUo5LvLfRIZiI9maeBlwWaS3zqrFGDqqw=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E7ekd99/4HjhP29k1m3XUmV9ElcJqcl9Fao+wrvP
 cc1s4zzOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaa5/sYGfbwtu09Fn
 Xy4fsfImICm468uviXLU5iwd3cCauu5F9ZdJ2JkeHM48itGt2/evW1mf9/yRVz7PbN4HG+9eLcq
 gVBUvfyr/ACAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

GCC's gcov instrumentation (-fprofile-arcs -ftest-coverage) has no
architecture-specific runtime requirements. Enable GCOV_PROFILE_ALL
support for Alpha to allow whole-kernel code coverage analysis.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>

Also mark Alpha as "ok" in the gcov-profile-all feature matrix.
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 Documentation/features/debug/gcov-profile-all/arch-support.txt | 2 +-
 arch/alpha/Kconfig                                             | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/features/debug/gcov-profile-all/arch-support.txt b/Documentation/features/debug/gcov-profile-all/arch-support.txt
index 63494bddc263..4701209b869d 100644
--- a/Documentation/features/debug/gcov-profile-all/arch-support.txt
+++ b/Documentation/features/debug/gcov-profile-all/arch-support.txt
@@ -6,7 +6,7 @@
     -----------------------
     |         arch |status|
     -----------------------
-    |       alpha: | TODO |
+    |       alpha: |  ok  |
     |         arc: | TODO |
     |         arm: |  ok  |
     |       arm64: |  ok  |
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 713a0c1cc930..c4da16971652 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -7,6 +7,7 @@ config ALPHA
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DMA_OPS if PCI
+	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_UBSAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO

-- 
2.54.0

