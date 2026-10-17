Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A913876A1
	for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 01:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202190; cv=none; b=Ix+XPg5uKWm1RLSkl6J8caCZe3wsLDEG0Mh976yixFlmIY8QZeIspkVoJLYuyqDPJDRdRiKOMzSOaSAifHyAz3fS/VG/NnLnK84XmCqSWAXjR0iMSEim3qSCowACMXBaai7WP59UaAh8MAilbScS+s/Xec163F7In1RWtmKffRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202190; c=relaxed/simple;
	bh=XzDXuW7sU8rtcOd5zk/hMQc5CYYT30++tB7FfX76MzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s9paTMFaxKh5DZtxi0iB/uX6bg1VNfVUZAgSfiNJcnx4A+knOqxnZm4Tm41+hq8fDDtAQOyjyZ3HjkV22MKtb1xo/PLlTORtjVTJYKHKdEEKtvcWpEknIrgJDRu94ilrvs2/vgxQnZtDYRgKlQDugALqLNo0bPAwHe2+1e2HZwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fszfe2zc; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fszfe2zc"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8ab3d3c5761so4172567b3.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 18:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792202188; x=1792806988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5yiDiU01DIEHMV3YQU+fkAajpEqVu8gHxIrnBDEjtWE=;
        b=fszfe2zciNvw1YmntPOInLymoB+tMNGzPmjy4p4YTPNaKj27mrpWYth7eDjakjO1oX
         14RrqzeMloREl1DbjtrfiePVg8p+TRyGAVALDHAPvpr4KqlGLXlxRQ2mTACHEQ4ai8o+
         +LVr84QnKnt4OzF2ir+yiVoxWApplo0wNoDKpzBZuOmi9p5fYl/UDUFAaXmGIwnNiGYm
         nNqF/EGMJbaB2bB39shiSqd02sm69e72pP0Twq5rKX3x6koWIHRZs7wvPEEXjx/GGvsw
         uMJVWpdoBJmetjd2bL3UvzZIzv7xKZum3oHPESlNa9EVl77N8L3elAzea/4cqagO+jjV
         pdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792202188; x=1792806988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yiDiU01DIEHMV3YQU+fkAajpEqVu8gHxIrnBDEjtWE=;
        b=UOr9ZUbz3EeSGmlOQa5xmDOTaA3v3Su9yeMYsOVE1EtjANrVc3LsiYrXokOrmFYD9L
         OIJvOZlsMmk0nyt+9F54HZFDuAjGZH8JyPIOmMkR5v2Qq88DTxaiJwFmyb8EtOleXxno
         SsCgBmH6gm8jnUTeN0L3VUOzJRbpmSGRSdZkPdysW7FVhfj8NwIGNo33DDSHx0SXHaVp
         qA3bUi0FzwZ/2b6pC4VZklhvW1kKqQzx+ShwxVP9Og51qmwFLmPqfk3Qnr9DH5fS/Wrt
         3iTwmDVayNaj0kCLRuEi9JJ/KCOggkwCyFp71eADo5JbHzsEcvIcVu2DFhujv8FlyVO6
         8Ltg==
X-Forwarded-Encrypted: i=1; AKwUvBz6SUZQVIkPj82hFIuCCy3JyLYGZRcYZ2ZRhbNw/wy3Pdxd9A8Ftj1NKcgElfTklMxe6XboN9btIyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8OpzviU1O3Gc+d6rg6IZkxJFpYDmFBX/z+Wo3hvIBFQpRGY8q
	ZVwNG5ajLEXRbEe2eQS7B8TkERfA7TdBjarwXO+fqdTSObYLc1joVh5X
X-Gm-Gg: AYBFou16sJ7vvYzj+GoIBnPG4j2elnwnW43P6sOkf31m1YmR2uUULqa8ZHkdxbmqusy
	FxqPntSi6ufG+zJtnq00JtUgiED6TSxBLa19bYdsKA0wyEFuAZBqJ6BH0rL9rynNsoTsyln/grT
	Zd7vkWgNXdNeSlS76GHZZSvXndarYSwdcIoTouSUbbi8BcEBOZulzxAOVGSPmH9fKLprHYrqmhQ
	2sj2d+qHL71KHfcaehmNizlT31emq29V+aWUbvkalFdP9LJ0L1SYduo+ID0BBHIezoYBuA6V+SU
	wYjLPghdiBp0yPggJDo3tx08iL6jMWQ/2hP7edFRL0SlP0LFfb9o6Jl6ngWLEGVWbd8fFAHgLsa
	umIrgUo60S//ZPa742J5qps0KNWJ8q88J13FHBPjxbqCDTFSS73VpKxHIE3eou2gWpc3jrYpzNH
	zGd1D16GzX/ehxpx3928pJtsa1yj4IetXc5CEktcdn6o2H59amT0J+awSfwQTMXgSE59SfcmbtW
	WBrcwzErn/ODo9DXYcOdrACGkjpndARVw8foiF9r/lMqq169+pXJepLTvTGr9qr31rHqLaDlYFp
	yEA2ILy5auortHX64sSaOIG/Lpew
X-Received: by 2002:a05:690c:c68b:b0:8b0:6d14:23fe with SMTP id 00721157ae682-8b0f2202eb1mr4915017b3.52.1792202188255;
        Fri, 16 Oct 2026 18:56:28 -0700 (PDT)
Received: from localhost (108-93-236-139.lightspeed.chtnsc.sbcglobal.net. [108.93.236.139])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e58f84c3sm16439187b3.28.2026.10.16.18.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:56:27 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 21:55:51 -0400
Subject: [PATCH v2 5/5] alpha: fill in pc for software event samples
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-alpha-perf-regs-v3-v2-5-17654742226a@gmail.com>
References: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com>
In-Reply-To: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=XzDXuW7sU8rtcOd5zk/hMQc5CYYT30++tB7FfX76MzY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIuXV3McGFl+7mwrwp6NzzcLjky9fEnCTSWbbKVTfrdu
 kCZJbyv4yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK45w8jwV9aXW2KKpO
 wFkVt84gfZwvfbTbm4h0//4nrxQK3jN8Jm7WVk+NUp2qN6LOJCXAiPIb87+6MXm1srtpqHNTzVv
 +zQ/GYGEwA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Context switch and tracepoint events have no trap frame, so perf builds
one with perf_fetch_caller_regs(). Alpha does not define
perf_arch_fetch_caller_regs(), which leaves that pt_regs zeroed, and
these samples report pc as 0.

Record the caller's address as pc. The zero ps already marks the frame
as kernel mode, and pt_regs has nowhere to keep sp, so pc is all that
can be filled in.

Reported-by: Magnus Lindholm <linmag7@gmail.com>
Closes: https://lore.kernel.org/all/CA%2B%3DFv5S8-Zk8-LUpZnWiBfTGSQXthepmRc_-a9O%2BpEPmVW0mRA@mail.gmail.com/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/perf_event.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/alpha/include/asm/perf_event.h b/arch/alpha/include/asm/perf_event.h
index 5996e7a6757e..72536566014a 100644
--- a/arch/alpha/include/asm/perf_event.h
+++ b/arch/alpha/include/asm/perf_event.h
@@ -1,4 +1,11 @@
 #ifndef __ASM_ALPHA_PERF_EVENT_H
 #define __ASM_ALPHA_PERF_EVENT_H
 
+/*
+ * Software events have no trap frame, so perf_fetch_caller_regs() fills
+ * in a zeroed pt_regs. A zero ps already means kernel mode; only pc is
+ * missing.
+ */
+#define perf_arch_fetch_caller_regs(regs, __ip)	((regs)->pc = (__ip))
+
 #endif /* __ASM_ALPHA_PERF_EVENT_H */

-- 
2.55.0

