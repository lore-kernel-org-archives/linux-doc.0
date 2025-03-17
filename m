Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6EA1537CB
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 17:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231304; cv=none; b=SCmEHWy4dn9i3dHLzUF+yXue5xS4arJHH5pvdEjx1PYMG0DNISL9ypiGFwtNc48/A/j8zUfteNXmtKODUjBeAMIT/+HmnyXQIhsWUFxHGuAi8enUDCYBpprrRMax9uvtYDkL8n2az3SXEXeCRhbLZkUOlNpc51/gj1WBQt8hA4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231304; c=relaxed/simple;
	bh=NrkciCzcfMsvIfgMNhHy3LIzh0NIZkRsvpzrJFbFJ/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s3dUGjUQ8kuDrDTGBqiuvFClx+q1CFSLp5tuUazXIuxQbklXdCcMELh8/+7o7wY9+1WkML5P0DvrXjIies9c/YGu/f/69YZfDn502ne+0Azofjqt5J9by+/Y3IPXN6Q6tCEvk+CgUHTyPuLZRoMYlinG2CRzoA8pVDhy1K/WeU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=tHO/2EPG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="tHO/2EPG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394036c0efso16188175e9.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 10:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231300; x=1742836100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8U+T9Diad+CXpLV3u2uHxRVp5OvAkVUCVXAkQQVM7Y=;
        b=tHO/2EPGYoeUHl4RrmFGDy77abGJZlR4BpX/cXBzxheJJ3zHn8pJetgqKmvg7L101X
         BHuL94HBPfcS60utSgZOudJQ3G85MLcvB6lGapvIbEz6yaE4mkJPfrIqG/48gMGYdqyo
         l0EUM3aIGVoPO0xAULYa1wW5Oxcw7aZfxDgjd9VlloeG8G5lns4Ske6kYmEuDGn5+4gX
         1YcMGB4IJoKaveNqU36LoQPOY8LCjgLjcyUGxqlViAjySMi1jfwtOVrPfGhH0hnMLIPE
         l9WXxZx+Eg0e1iEOVw/CWzWgBxqAbFLF0WXtdvcJbv2lXWGhkvWiBHqcjNWoD6n8s1Vt
         R09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231300; x=1742836100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8U+T9Diad+CXpLV3u2uHxRVp5OvAkVUCVXAkQQVM7Y=;
        b=L8EHpR65mVK27U9k61OA+VtzPLwFFp0dkbSumsly0vQPBjVFtPNzZGEEcBis64LQLH
         /OvCLROPMct8OBxlGT/LSlTyf/jGDBE3f9ZDUovHV5hVIC/+2c3nZG0myTr/jEpY4/Ns
         er6IDCiwUlgkELJ0vLzu4iVTkaA6fTrcG09QHD+xz+X543pCt9ER5vi+91F0CMyphboL
         e4ysjuYSnsJENcwG6Ab301frukto2cyRnoDRBJmmdCwpaS/WAUM+61BDxMQaoWX8RWit
         /wBOt2u55+7s+vaCWsWd+DbwXY94YCIxGr6by49UUDiIHqSe3CCh9/hX1MtI7v2C0w6k
         amrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX665SukJ6m4hllK5qx2Ct97JxMFHBluObzYq12G5ES4VsobA7txyXlorBjhtkGgN0CcbrDuU0FWrA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1CGV8nE3dZOarLffNZrEF8uCGzZn70sh03ucT47nlYY0gjrYu
	RUhLfkV/vkSFxT53LLysZQITsjslDXq3aL2Nfg2AFcmRF9+1dg8n/U2YcunGEHE=
X-Gm-Gg: ASbGncvs/GYiCbWQdGFPLzeUTlca41+PHDuYu6A2sleVDVK15LuO+09/5hAJeOBnVYO
	ABpssm6SN2RZnqq1n6xU+iaaMJT+6Vouj30F6LaDS/iFp9ogHp2gErtPcv+uk5EG8a0AQQmsCqi
	9qIArEvJMwoyoyMWtYiGnDMkuMm0/QBUrCA0QD3x2P1FFpj6oMEBei2sYdiMC6YRkMa8xzjEmp5
	OxQEE/rEmazinvSPmRmWJ+XrjoTxwYL7EoTPzvwb+7cEdAYPGr5gdQ8YceEE8jModCzchYCdBzR
	BiZcKyyFo6+4zMOrrEuknVUejvc+Upe8ddyA0OHvCfmbHQ==
X-Google-Smtp-Source: AGHT+IFmrC4L2BBEGglHCKwEAqKUy9nE7lsKyuSMTJqBTFYq88vyNhKpBkqIwmbEPtXGJrbb0KbkPQ==
X-Received: by 2002:a05:600c:4ed0:b0:43d:ed:acd5 with SMTP id 5b1f17b1804b1-43d2a2eca5bmr70290895e9.10.1742231300051;
        Mon, 17 Mar 2025 10:08:20 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:19 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 12/18] riscv: misaligned: use get_user() instead of __get_user()
Date: Mon, 17 Mar 2025 18:06:18 +0100
Message-ID: <20250317170625.1142870-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that we can safely handle user memory accesses while in the
misaligned access handlers, use get_user() instead of __get_user() to
have user memory access checks.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/traps_misaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 0fb663ac200f..90466a171f58 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -269,7 +269,7 @@ static unsigned long get_f32_rs(unsigned long insn, u8 fp_reg_offset,
 	int __ret;					\
 							\
 	if (user_mode(regs)) {				\
-		__ret = __get_user(insn, (type __user *) insn_addr); \
+		__ret = get_user(insn, (type __user *) insn_addr); \
 	} else {					\
 		insn = *(type *)insn_addr;		\
 		__ret = 0;				\
-- 
2.47.2

