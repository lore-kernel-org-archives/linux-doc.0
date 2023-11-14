Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16177405FB
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 14:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="qdk9B3tC"
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 478B9D6D
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:13:45 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-77773d3246aso14493285a.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971224; x=1700576024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1n1l7La6nGZIqWqCT5nqMrjtDpsd0w2BPU1/F2EaPQ=;
        b=qdk9B3tCvRVp5HJczA2iqiVAC84HCdZDdYELhYBDImasDjTQJl8y3/p1R5twMAqDeH
         ncF5tnIXr3HWAA9yV+LGlM8uWVLNR1H5mR0E7xQYvM9v8s0boHsOYTecTd82Fa90Un6c
         9SCsUesIFhXtmd8U9Al1y3JA0uLGkJLEMLMJIvgQ24AUgT5+5kcNoBxfOnIkfME8fIK2
         mwAWoO8SEciFxjl7nEUXc2zjDk3T4+mmqiJbD+pMq2NVSbSjKpY9ag7LiK1Gi/vXxZCo
         jj1g6ME/c99lPmj8Ru6z/kykndgSXMk2YhgUwRiLxHBAV0fQfmgT9m/IkxRarzVD8cLv
         bmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971224; x=1700576024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1n1l7La6nGZIqWqCT5nqMrjtDpsd0w2BPU1/F2EaPQ=;
        b=QBqUfOqjUVolBc+bMbaJWcYDObv3ZeSwPCWUiDxagcFPMf65JwNmOGkEo6NaTH5fO9
         LmkazIiYBrRnaDMouTOT0YRZ6VIeVcgDnEisnb/3UZu0KUAdd2OXjLWkcZ3BmGVKfM4o
         sZ3P9CUtdmBIkOlNoKj8P5VCcNWY6exxocjtrdJrAYMxhkK+b5cDmMUDDpHXGvVkzWO/
         HyEdKnub3xhmYp9Mv0+M3rs5/1BUEQiu6xnG+sgQcP5TKv1zBGsBOCOJpcufnDDv2Baa
         Q7dP4D9KFd/1qIi2w+lC8hT9LxFs9ZvnnsEpMchrQUxx7fzS9RlURU0aqIZGGQ9av6vB
         +trA==
X-Gm-Message-State: AOJu0YxGhEUrYWjzLUa9vQEIe3g6pieid03LqHFVte4+gk19asHTqOdo
	Q5USKPBrNpNurg1wJyZxSsV3yw==
X-Google-Smtp-Source: AGHT+IGdVmknHr9YfYcSME+isGh9g75eDYraT29RTc8VoNjDP7MZEDOfcBgxO+xlzZuc8oVMqtvnkQ==
X-Received: by 2002:a05:620a:1a03:b0:76f:1614:577d with SMTP id bk3-20020a05620a1a0300b0076f1614577dmr2495334qkb.4.1699971224044;
        Tue, 14 Nov 2023 06:13:44 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:43 -0800 (PST)
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
	Samuel Ortiz <sameo@rivosinc.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: [PATCH v4 09/20] riscv: add ISA extension parsing for Zfh/Zfh[min]
Date: Tue, 14 Nov 2023 09:12:45 -0500
Message-ID: <20231114141256.126749-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
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
index 477254668d82..6a6ee93a3c9a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -78,6 +78,8 @@
 #define RISCV_ISA_EXT_ZVKSED		63
 #define RISCV_ISA_EXT_ZVKSH		64
 #define RISCV_ISA_EXT_ZVKT		65
+#define RISCV_ISA_EXT_ZFH		66
+#define RISCV_ISA_EXT_ZFHMIN		67
 
 #define RISCV_ISA_EXT_MAX		128
 #define RISCV_ISA_EXT_INVALID		U32_MAX
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c4d0f16c29b9..7182cf278b1c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -258,6 +258,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
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

