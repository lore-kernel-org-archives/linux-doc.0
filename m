Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FA524CEC4
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 21:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223369; cv=none; b=tfaRpQQJTqpHP/AlOUWxzgGaFWmIGnJ40o0doFqQaAntw2TbQ518cyDAApmjyisgO9ziXRO6AiAuwvmj4m2Iethfi7826jwHyvKGmnmxVelzIc0nE7he4gyOc4gfmayW3+5tpn6NzNI0zx0AIUd1rUaEgFl5/w2UVOk5SQtLUcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223369; c=relaxed/simple;
	bh=pmkjbFivpopT/t1TZQFWk2I+IyDpQtxJktgGqR1CYS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQrux9S8nVnbIbENSHmx3IDnEN1o/J5qtKvP4sc0sz6hCGMYGSMbnZ9CRIZisPSfgt01jT9GlD4mUtLXyy03aQB3dDs93IL9BRXFW5pRLtnn3IlML8b2G4npJ6utIzZFrcwQdciW1Ibvb5NmdOEzv4vS1UnmkK2Pb3FJpG3nTjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ElJIDrr+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ElJIDrr+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43675b1155bso54261695e9.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 13:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223364; x=1739828164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNygMxZnETinUIbqht3HdG0xEf8Y/zFmGWQC8EBuXhA=;
        b=ElJIDrr+OQmC6jPe4mIqSUR5mRtwFbqWwlWYxdQY172qlMaLocL9xC3e5VOO+gRaBa
         3naV6gwfGy38sh/uaicAqANkjcJP4WPFwOUVvy9FE1sKKJtNlYjVDHyg9uwjITm1kBo9
         NPeuA/E4aS0R0U6gA1TvQ5e3tj/Mj2mDiH0MA275Qu+wl3ds+1COyLrv9BfDf9Exfo3M
         fgcP45ipCYrBFuBvkl5FkZ51sctmxLmrhVdtDkK+Pl0uCJp6TiaBzyUqdxYWjhfvjivN
         gDL2AFe0gXWxcsj9XgQNXVa1ax8b1RhCxKRvHEL/aQ55di+FO7oVzu4dwy2pcG7gDqaC
         WIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223364; x=1739828164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNygMxZnETinUIbqht3HdG0xEf8Y/zFmGWQC8EBuXhA=;
        b=IK6cVJD5BX/cZY4icp1Xb1Mei2FR8wY4h/UTMuwLjk0N8b9chKcPBJj8kaPjzxunZF
         Ofydn6lnz1S43mqZIuO0jHVjR2o5c3VOpjT2Nh10t2unI23ESYM1G+cWd0bwlzBWQPRz
         Gy3CWMaTYeOFy+FJDxj7WWASiV0o4QUD1T+sxHBnPUkuIxgSZe7SPWV/FM2WYhvNQvzD
         KMiOpesFymLXGXRsUuUdooLS1UL6sFezuS2+bKNX8ZFTdz8bHVONbLMeBJVJaCtQzd/F
         M5S7c8QXTdacfuogPPleYzJ30EUc+L87qrieCBFHERABvJTEeJIYXfVhez4b3pdCEo4z
         3YgA==
X-Forwarded-Encrypted: i=1; AJvYcCULA+5TRkS+HvpIayikGWxrH/ml7/jJYAbbwRHgFyATJzHT4Ohx7A7VsfrbvspzyI/aZT4bPbQP/sc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg61RF7l+ExrkhV5sO1sgcRdS0kE76XkQ1QyK18mAYGGxWF3hW
	YiFAhWnW+Tup069M+eNns02RbcnhBxNrGUDBsa17XJBmshhQtiE2kZ4LUCGLg0I=
X-Gm-Gg: ASbGncs1CcvaMKf/aJGWybxyMnuUcP9HKONAHVgF/1z41ztUU5ydBtYmeOOYB5mkfnv
	7VwntjklBnq5AuG1e//age86pdRJ4YNInb/8esQjfnaYUr1VW+xC7RvScwmPbNCynAiXEmru+uD
	xQ9Z6tyhtGnqHZWh6Ho7XxNQcg5FjKgzkm63riNHL57p73fwr9Y4trCJJXNu/y9LD0GSIoBsqly
	jjp/jWaUSBWbKrLrYfT7g/ga9h8fzhHJbRWYUaRwB2W2FYW742Uwf/bHY+n2WOYT+pKFbMjyy22
	oTDBxxdzzznoe9fU
X-Google-Smtp-Source: AGHT+IEAhlsJGIdKtITdkCqcTf1jglZE/SWwXLDChC0QYiT0cR7GNzwUW0cObTxbcQCBuKABIqPOaA==
X-Received: by 2002:a05:600c:1f17:b0:436:e8b4:36e7 with SMTP id 5b1f17b1804b1-43924987efbmr120307725e9.8.1739223364575;
        Mon, 10 Feb 2025 13:36:04 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:03 -0800 (PST)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 01/15] riscv: add Firmware Feature (FWFT) SBI extensions definitions
Date: Mon, 10 Feb 2025 22:35:34 +0100
Message-ID: <20250210213549.1867704-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Firmware Features extension (FWFT) was added as part of the SBI 3.0
specification. Add SBI definitions to use this extension.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>
---
 arch/riscv/include/asm/sbi.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..d373b5c08039 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -35,6 +35,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_FWFT = 0x46574654,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -402,6 +403,33 @@ enum sbi_ext_nacl_feature {
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
 
+/* SBI function IDs for FW feature extension */
+#define SBI_EXT_FWFT_SET		0x0
+#define SBI_EXT_FWFT_GET		0x1
+
+enum sbi_fwft_feature_t {
+	SBI_FWFT_MISALIGNED_EXC_DELEG		= 0x0,
+	SBI_FWFT_LANDING_PAD			= 0x1,
+	SBI_FWFT_SHADOW_STACK			= 0x2,
+	SBI_FWFT_DOUBLE_TRAP			= 0x3,
+	SBI_FWFT_PTE_AD_HW_UPDATING		= 0x4,
+	SBI_FWFT_POINTER_MASKING_PMLEN		= 0x5,
+	SBI_FWFT_LOCAL_RESERVED_START		= 0x6,
+	SBI_FWFT_LOCAL_RESERVED_END		= 0x3fffffff,
+	SBI_FWFT_LOCAL_PLATFORM_START		= 0x40000000,
+	SBI_FWFT_LOCAL_PLATFORM_END		= 0x7fffffff,
+
+	SBI_FWFT_GLOBAL_RESERVED_START		= 0x80000000,
+	SBI_FWFT_GLOBAL_RESERVED_END		= 0xbfffffff,
+	SBI_FWFT_GLOBAL_PLATFORM_START		= 0xc0000000,
+	SBI_FWFT_GLOBAL_PLATFORM_END		= 0xffffffff,
+};
+
+#define SBI_FWFT_PLATFORM_FEATURE_BIT		(1 << 30)
+#define SBI_FWFT_GLOBAL_FEATURE_BIT		(1 << 31)
+
+#define SBI_FWFT_SET_FLAG_LOCK			(1 << 0)
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
@@ -419,6 +447,11 @@ enum sbi_ext_nacl_feature {
 #define SBI_ERR_ALREADY_STARTED -7
 #define SBI_ERR_ALREADY_STOPPED -8
 #define SBI_ERR_NO_SHMEM	-9
+#define SBI_ERR_INVALID_STATE	-10
+#define SBI_ERR_BAD_RANGE	-11
+#define SBI_ERR_TIMEOUT		-12
+#define SBI_ERR_IO		-13
+#define SBI_ERR_DENIED_LOCKED	-14
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
-- 
2.47.2

