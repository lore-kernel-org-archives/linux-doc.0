Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD83F12B6C
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481790; cv=none; b=WptlEcMLs66CRphgb7mKD4GHJWwBGIiVcoJnO0cHIRNVvrPyTOqKqbcIMWcWGkPQkgEjitDmomwHgbnXhH/dVjuTINogyoSVbXm6SIvck+17Snlmo11dVEusm2qP9bcTmZzWletjEldXghdu9H1z19cAiuH2zTBjxdMt/Utm2eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481790; c=relaxed/simple;
	bh=0Ry0mLoe/ZIYFGBWvBzr34n+IWXk5nQPB4zkbRncZ5Q=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=JKCuuSZ5Mu8RLf5BKHS5c11i+c3w8VuwFuniHuh43kEWdozV0G/1RsAUMLIljk8TNTKbRTcJ+RbMVlGWR+/FvigPQozr7sec/ji1iZIewLW7Y59fWSNdGDH1uszX930punq9cshcKJiQEgQyhHjks9i4QnZmMjutiS0hu2JXiFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=SjcniENA; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SjcniENA"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3bd72353d9fso2905262b6e.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481788; x=1706086588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARkFrhbG2tTIRKc07d0JfpN+S08zsLzpKtG57OwBS88=;
        b=SjcniENAdspS39jVtmYcYSqWUv1Dw482ATyYfVCOqfH3jGl6VLFB9rljjaxdUXzmNy
         G9CqTnw0YW9VHYUhXc2gslrcb4YqHnWFHF+w4SMvlE+Yf7tm4Asy836ph0XouHZuRkpF
         rUci3ruSiUtyEl2fHCuOwjPMsWeG29RrP68Mo3379LfAiiIK4F5cQvtxw40Izmtw6pds
         rAzxLAkjpfyP3UrzOGxdt83m4r/GI5rx5mlk/roiR6JMeGEuuf1OokVUBATBwB56327u
         mv2FpMd2t7/ioQW5BdGJY0M1D4gzcfcuGM+/r+X7hQlFLLXihjvesZAzYYb5rPste4Qj
         Z5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481788; x=1706086588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARkFrhbG2tTIRKc07d0JfpN+S08zsLzpKtG57OwBS88=;
        b=EAlKXyx7dYA1pmxceXCX0OqByXV5wCZo6xJWS9OZrtdBQsz8y8i9rja5Md9uXl+oY0
         3JqUacbEZbwSVZ37ImR3nQ4BZK5wudh5T8f2CR6M+VdbQfBLuIjnNBbKeewIMn9z3lJr
         4Y+t5R9719SUv8l72zme1OFTiFsrBS5qE/yqHPvTW+UfBNnmJq+ubA7Ps9uAULG131iA
         i4TcfHpBd9K+yxmc0cMRYOl6GqgYINCvAleCWjB94nCqWyt9P/kx/McbPI1OAosKmEqY
         qHzThPZpBoiIzZ1R0LOmi35Tiu5mA8xDPjvWXJDVhJPlmASwjqCf30bCS0Xi2arqBFxq
         Wacw==
X-Gm-Message-State: AOJu0YxK3Iv1xqqaki4oYJBDMnQu8gPMvIdva4/B1/HaIYsnA8FdBINz
	cohZnEUiEx+gBqWkW0r3Ed1xkgW5gYNmLA==
X-Google-Smtp-Source: AGHT+IGmGU5jMfwpd4Wm2ZQKDmEd0Iod9j6KSaNM2Aw27y9o3z0BGVPSEkTvmu4cMTWfaV2zdWklBw==
X-Received: by 2002:a05:6808:ec6:b0:3bd:27a9:3f57 with SMTP id q6-20020a0568080ec600b003bd27a93f57mr10565288oiv.77.1705481788115;
        Wed, 17 Jan 2024 00:56:28 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:56:27 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Hao Jia <jiahao.os@bytedance.com>
Subject: [PATCH v3 17/19] arm64: text replication: fix compilation warning
Date: Wed, 17 Jan 2024 16:53:55 +0800
Message-Id: <20240117085357.31693-18-jiahao.os@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240117085357.31693-1-jiahao.os@bytedance.com>
References: <20240117085357.31693-1-jiahao.os@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit fixes the following compilation warning When
configured CONFIG_ARM64_64K_PAGES.

./arch/arm64/include/asm/memory.h:56:6: warning: "CONFIG_ARM64_4K_PAGES" is not defined, evaluates to 0 [-Wundef]
 #if (CONFIG_ARM64_4K_PAGES && CONFIG_PGTABLE_LEVELS < 4) || \
      ^~~~~~~~~~~~~~~~~~~~~
./arch/arm64/include/asm/memory.h:57:6: warning: "CONFIG_ARM64_16K_PAGES" is not defined, evaluates to 0 [-Wundef]
     (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \

Signed-off-by: Hao Jia <jiahao.os@bytedance.com>
---
 arch/arm64/include/asm/memory.h | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index c73820fb36a3..2652ce170550 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -53,11 +53,19 @@
  * CONFIG_ARM64_16K_PAGES, PGDIR_SIZE is 32M, 64G or 128T
  * CONFIG_ARM64_64K_PAGES, PGDIR_SIZE is 512M or 4T
  */
-#if (CONFIG_ARM64_4K_PAGES && CONFIG_PGTABLE_LEVELS < 4) || \
-    (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
-    (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)
+#if defined(CONFIG_ARM64_4K_PAGES) && CONFIG_PGTABLE_LEVELS < 4
 #define KIMAGE_OFFSET		MODULES_VSIZE
-#else
+#elif defined(CONFIG_ARM64_4K_PAGES)
+#define KIMAGE_OFFSET		PGDIR_SIZE
+#endif
+#if defined(CONFIG_ARM64_16K_PAGES) && CONFIG_PGTABLE_LEVELS < 3
+#define KIMAGE_OFFSET		MODULES_VSIZE
+#elif defined(CONFIG_ARM64_16K_PAGES)
+#define KIMAGE_OFFSET		PGDIR_SIZE
+#endif
+#if defined(CONFIG_ARM64_64K_PAGES) && CONFIG_PGTABLE_LEVELS < 2
+#define KIMAGE_OFFSET		MODULES_VSIZE
+#elif defined(CONFIG_ARM64_64K_PAGES)
 #define KIMAGE_OFFSET		PGDIR_SIZE
 #endif
 #define KIMAGE_VADDR		(_PAGE_END(VA_BITS_MIN) + KIMAGE_OFFSET)
-- 
2.20.1

