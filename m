Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D423BD225
	for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 12:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787401027; cv=none; b=D1j76BFHWgrDTnUMOmqfCDelZV0DaEYl6SLY3mRmAQnrN32MfGSGFNamXCc1D4n7AMJcxkv/ftjdWfOIfwVkfNHLNlhStewLlTyVjE7+ZJC9X5WjiuDgchy25TuFduNEez2BRMJ2+uioWlR3SiPDujgqghd91f2e3qsdLY+oMok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787401027; c=relaxed/simple;
	bh=fw5VpdYq0K5ku0qatR0RvsgLztlfq95NkgJWi83f/NA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PNrHSAFNtio6wGgdA0ZAPnGAWhy7ndW3l1hUxPlj9It14FIlJ51p6rpzKgn4hmZVnKPa4WdYIdhvgdFaJSXL4vZ3ZZXjddAxbLJpHnR2gqj/GyrtmJXLtnBrbrz9S2B/yD6fs1teAy+NdShEh+PkAwasndaF6Dm90wjmrohhz+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRm8vMN6; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRm8vMN6"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso5232993a12.2
        for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787401023; x=1788005823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCQsunrvNdXa/eWs1SVMxqySCA7kUPdIECHm5s9pb4c=;
        b=mRm8vMN6slzEDkvPDrzPxybfn8OwIvNDO1k1EXptEflEM+AVJEy5C4Ns5c84EuXt+I
         ofN+gJcojYvAAEfezKyadNCGr3mPAWrDcha9dE754Jb3qi18ysQSpurzKiyAB4OJSj8I
         HINTFZF8m1VZSroPg3awMjHOIqxm8P5sYfWxgElgLxEA6T380w33gGyziAOPEW5hwbP8
         dOp5X5tl28BjwZozJnZjuGDVcSjp6kbHjI2G2cwqSopQNkee5ujmns12K4KRCg3op9Zg
         HxifKe3gqwGQ/M37K5Heswz6xQuxLyoOgfpLIPWZ6j0Mcd0VgIWZxAEE40+6QtEQO3wg
         LbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787401023; x=1788005823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCQsunrvNdXa/eWs1SVMxqySCA7kUPdIECHm5s9pb4c=;
        b=FC+Xp6pcFDbLYqOePM71pglh5DqJPhcYuwAghgbdAU3qy3n2yVodoB3snq/6hwryXG
         hknNTVUJYUdCsBflAxOnM0jG7igKdaEnZmjRhpU/lZU7KkaTlZ8urLuZP995gHXod9PM
         ictiyQMARD3s+KJ2oZ7+PgRY/61uKdRtdlEoFg3GKE3ieI0wGD9RDejKt5cFMGgZmNCk
         3uqKtUY2i5bxlq3AGAwNfX5aQZTWNs7pkl32+KaBrUdz7X39kzEmY+Siba8j0velrnX2
         qhxQ0i3B2boLD4NBVMHbI8NskzudOT2B23wkXyV8vP2f6QinsNY3qejXQcfrF4DtwGwF
         8nNg==
X-Forwarded-Encrypted: i=1; AHgh+RrRtPASILHuOX6lHveW9q60SM3oHMeulzpxuAzmg4PcsozNkCNqEAqauT/gfEHCIMg6seN0Yu5FgMA=@vger.kernel.org
X-Gm-Message-State: AFuF++npnXdRD/KD/k6RM6cMPg2FbiNJPHb3QfA1dIg8k7ExmTkjoa5U
	W3Z4ZEY1jOxkxJre0QmBVR4f3/nwouUEVK3gDaxmWlrF4imKEOX9B+T6
X-Gm-Gg: AR+sD13Rp5KL9pfKy0ssqv62jk28EpN8zL8P57+ENyHiNgDxpq439GRl7FdN6dellKe
	Ar8luPiR+VNmsl9/rkTQkVlQTqlujo+MM4PX+gdgPc89WAh8XLZYc06GND8IEgzmGCYDtTyviUK
	hmQEHP1Js7ISjgMjCGyUyzBenSKKoOArMJ34n926alFauz3TiFkZreppfbvkffKQgDngFHS+WUK
	bS2MlClKezHVMKwLL1MVncVeMx1N2GEecayOFr6cLNB5WJme1YL2S0YGFqd6iE0d2NtkkMHbj72
	L+I6XB1b8rLdvw5llKMDlSEjW2J/T1U3+d9/SRf2mKA/bFUEmaaYONP0sAiWB1NjBinA2FHxpu6
	3G1X69PGXJxb4wJJIsKVGGGg+4MDqlJNkgqWn2Ij+YdP9X+uJ96P8hRm93R5dt3ZAMyxYxrBBzR
	UBKRz6ZPwihtiiOFE2+RLIUmSVXNoH3GrULN71+EqOAfL7JuMhL+hiVifzTtwwBIrPW8WhC2Pce
	hbfLvgbrUjTTAx/m8buFOtRnK9tWuH82btVoDkp7ZSPebhuz5mMXZ6dMb8u+LPhtKHUJniVzjlo
	XsJgGzeo0gRFYSDCxbmgW+/LCXRWsqSHrAQGT3tVjDJhbfej5gkAEp/STWWH0jT5Xxg3
X-Received: by 2002:a05:6402:2382:b0:6a0:ffb0:273b with SMTP id 4fb4d7f45d1cf-6a42eebff97mr14014957a12.0.1787401023185;
        Sat, 22 Aug 2026 05:17:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c30casm10998322a12.7.2026.08.22.05.17.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 05:17:02 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] docs: dma-attributes: Fix dma_alloc_attrs() name
Date: Sat, 22 Aug 2026 14:16:47 +0200
Message-Id: <20260822121651.1559-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822121651.1559-1-kmehltretter@gmail.com>
References: <20260822121651.1559-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma_alloc_attr() does not exist; the allocation API is
dma_alloc_attrs().

Fixes: d5724f172fd1 ("common: DMA-mapping: add DMA_ATTR_NO_KERNEL_MAPPING attribute")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/core-api/dma-attributes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/dma-attributes.rst b/Documentation/core-api/dma-attributes.rst
index 123c8468d58f2..067ce6dbb404b 100644
--- a/Documentation/core-api/dma-attributes.rst
+++ b/Documentation/core-api/dma-attributes.rst
@@ -34,7 +34,7 @@ such mapping is non-trivial task and consumes very limited resources
 (like kernel virtual address space or dma consistent address space).
 Buffers allocated with this attribute can be only passed to user space
 by calling dma_mmap_attrs(). By using this API, you are guaranteeing
-that you won't dereference the pointer returned by dma_alloc_attr(). You
+that you won't dereference the pointer returned by dma_alloc_attrs(). You
 can treat it as a cookie that must be passed to dma_mmap_attrs() and
 dma_free_attrs(). Make sure that both of these also get this attribute
 set on each call.
-- 
2.53.0

