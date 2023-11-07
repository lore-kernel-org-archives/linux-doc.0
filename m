Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E549F2D047
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 10:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CPmH/a2T"
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB0818F
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 02:56:13 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32fa4183535so811455f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Nov 2023 02:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354572; x=1699959372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bP/Xz2BZ0CN3QwJs26MNtdiNNK8TyKjqE/jUpDPgkTo=;
        b=CPmH/a2Tp+R4syctTx0yG2r1QKUgFeEl5B2EHNfrX1zA1Bl8q58AGHuXkystiSbISR
         DzPQ5/fv/MTNFsyVhr/N3wKMCdelJgeEVdO8XVt/a/XxCNhrWl9WWWR65BIhrX15zB62
         4z48sMKyIOdFHzJqHcd/p312EfKRL3cLRttfQxOm1iNHnZ97na6E2goRN3SChAOYDnLv
         QyW/t50gG8JQabdq/wdXK7FkXTPgDLrAoLdPLuGANLNwW7uVfxcMsh9ECYmCZ52NbamV
         6hraY7EyYUkH4qaL0swyq//9a968QgEyUsm7ycOWgvRJsOh7ujptxQe20tbH7pQzfle4
         QhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354572; x=1699959372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bP/Xz2BZ0CN3QwJs26MNtdiNNK8TyKjqE/jUpDPgkTo=;
        b=ZjhnAns37z32viyEgCK8xhVhvXIu0Okd/D62FOLyljJIU3Jp8pkR2swE82JvgbXs+e
         EhfUjwc767yopz8BqonQ9b07BgJblRDRAnnsWatUWT3th6ZPRNPdiNN5/e1cLh89423g
         MrKkSF0QWbzhUH5Y4Q6gbxMCJv+fWfR7jn6Tc23ILsgzdkCxh6XmtH4T9KJN9FtIZDvO
         qMzpSZ1FWeYNk8niiNT656nFAAgYXqeBoGZbaJiVkx95mycOpPoQqcjBjvVXRSPoMwcj
         I05inj4HCnXRE2Q/8/i3zWhBSglEeKuS3k3eyaKSbOg9Lu/H2rCAs95IgcYYPckd0cwi
         3Uqw==
X-Gm-Message-State: AOJu0YwzGqB6m0gEmBmVbLrznosmyBNg0cuaPGtuBqWj+8kXa8qR3Qa2
	0DI0HWJq75xShekc3Gd1txiRdw==
X-Google-Smtp-Source: AGHT+IE6VYSHRuwoE2N98xFWFeww3WuAv2d6RelnI44p7pd6PDNb8XsMUCdLyux86n2WxtMje6eQ5g==
X-Received: by 2002:a05:600c:3b91:b0:407:52f0:b01a with SMTP id n17-20020a05600c3b9100b0040752f0b01amr26054544wms.2.1699354571542;
        Tue, 07 Nov 2023 02:56:11 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:11 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v3 09/20] riscv: add ISA extension parsing for Zfh/Zfh[min]
Date: Tue,  7 Nov 2023 11:55:45 +0100
Message-ID: <20231107105556.517187-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add parsing for Zfh[min] ISA extensions[1].

Link: https://drive.google.com/file/d/1z3tQQLm5ALsAD77PM0l0CHnapxWCeVzP/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 556d1da02877..10ebd36f67e0 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -81,6 +81,8 @@
 #define RISCV_ISA_EXT_ZVKSED		63
 #define RISCV_ISA_EXT_ZVKSH		64
 #define RISCV_ISA_EXT_ZVKT		65
+#define RISCV_ISA_EXT_ZFH		66
+#define RISCV_ISA_EXT_ZFHMIN		67
 
 #define RISCV_ISA_EXT_MAX		128
 #define RISCV_ISA_EXT_INVALID		U32_MAX
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 56570b838910..7c04c03e435f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -260,6 +260,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
+	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
+	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
 	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
-- 
2.42.0

