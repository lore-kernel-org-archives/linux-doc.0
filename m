Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093151D5AA7
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 04:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737691265; cv=none; b=IjQi2tgPFAbWmJyALzJ9piYmh5GaF31jmOGGStRMD5eA4G0xA7qDO0k9yMKXoKs0nCm/SKIqV4TOn1dDDosTLItKQPzvM7MIEJ2gf7ubFFm1apCY9zK/fJnMbmhz5oGFRoICj7Jcqpf+CEyHsdRC6+4LCksfYvJWt2UM+IQx6VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737691265; c=relaxed/simple;
	bh=G+K9MvSpAIpwDwMmunI0YSdJnqQJGTJZcC3ONEVxX60=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sjuj7YWfJGJV1s7Q+L1BIjhUEkfoYmUyEPaPMzFb0tioGm9ytRCXuLdiHYRIE7HiLDILXh04gfIm601hUYwVXnNBmp0GVFcbDaHVLWcWlyrG6obZthuYCkAsLI7oVAJC+SzFEVSyQowatE8M4vSsqgatD2sbB1MplxTP4KiOf0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=VRwZSVXO; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="VRwZSVXO"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2161eb95317so29386375ad.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 20:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737691263; x=1738296063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+lHU8O3OzxopxeMRFW7AZqN84liiT6mDTuuIRoGMNs=;
        b=VRwZSVXOhTD2P4yJYnfWOX55FTyD+UgYkwpt7B3k1j4K28tpvuxAW2u73V/X8VbzoM
         +I2v0tnJVVWgvYokh1mzGuPJ+pxtHDONQDaJdDLeLy1pbjvra0u1WxfcVOAZ/SHG5fME
         DVk+tO8D5KWKJH55uAPk1YeTxEXuI8SrKzxggelsisEhPrSd9qKkUOw/hzT3cHCuw3ZW
         iOo0/hKtg1hAipzplBu1OdcZ2VxIeS8gPbCUL2zjENcLNoEPdnjJ6QftpP1pRDFm9ZRC
         HLjhVGlW20atzF9jHdZ6QKijprPSefUtf47WLZlUlr8P37Al/+6M0BAdO0lABD4ToqW7
         7Lrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737691263; x=1738296063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+lHU8O3OzxopxeMRFW7AZqN84liiT6mDTuuIRoGMNs=;
        b=GEcIoQs9JsBiuc8kzOGldsRnuLEevrluxVfjJfjlmLSkayQRdht9tJINPUJM4qFmFP
         K1fFbkRi1yC+5jXt+TADQaXCHKMhdAqnGM1MqSHkuLdKOpIZeKNWKsvgFRSFUWC4aPPG
         ZCxQatvS9z0G7fqELGfClpAIPlrEuCuafiU9EZ6F2RNyOLlA49f5mgXFqx6/om95t4ey
         42iYHJ3gxFIiwXJPSFomSlXlxfrHCJImFt4aGgkxvqZ2VH1SU4quDsfI/MKQHvzduqtV
         ZLg6s7IXHGgJSUuKG9tIVBvxzMbULaz4eO7htCY6AZvcxPcfLjxJY9W+BJigUXpIJfSh
         a4KA==
X-Forwarded-Encrypted: i=1; AJvYcCUF7/4tIJgv03J7xOB/PYScpsvaiOHm2TcLRiA2bi8APnNK0hOqYc02ScQFy/mjydR1rqfiqjSQyYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YycvnHkfAdyTNh3PzmjbeaUqGPvH/0vTNVALH1pCOw2nayuLdMh
	SMEutYbXrXLJTjZ1N5BCtEe8e2sudMgc0aao9QOT1t6uKylP6nJqEJMu9KRyJLE=
X-Gm-Gg: ASbGncsmi4N5yXs9GFfLvc9hD4bMaVnF95rtRQebxBUwBRgKjYOJuk09YMnssCkHPZI
	8idgj02FeZBOeKXIfIdJU2QskghGhVjcKGxcSFKlaeW7HYIgDRpAq77DwCAIgpgRT4hHiRyXJtX
	/2/ZiLhhATATwj30uMHwBvRysXhYlR35LEyLTIE1J3NzqX41m71T0TcKTG3P2B5OzQqLDCFLZgq
	MzINyqLztSRIFjLQ0AXi65JQfNyKeifFZSQANDLNbVxIoRFGtugAal2V49Dgw5zwxO69EYL8/oG
	1pyWoNzhBq84cS1zt393c3d5Vr7NR2HonKugAVxQFe/MU6y4Xg==
X-Google-Smtp-Source: AGHT+IHEVuIwXoOL2BRMckKQdUn6rThK8+gCeYIzAbtbkLa2fGtpENXBcF3NVF3avHHuHE184wgyUA==
X-Received: by 2002:a17:903:8cb:b0:21a:874e:8adf with SMTP id d9443c01a7336-21c355dc4eemr425518995ad.45.1737691263230;
        Thu, 23 Jan 2025 20:01:03 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([2408:8406:78d1:bf49:24c4:f518:9b3b:36de])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141d67sm6758915ad.153.2025.01.23.20.00.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 20:01:02 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v6 1/3] RISC-V: Enable cbo.clean/flush in usermode
Date: Fri, 24 Jan 2025 11:59:57 +0800
Message-Id: <20250124035959.45499-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250124035959.45499-1-cuiyunhui@bytedance.com>
References: <20250124035959.45499-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling cbo.clean and cbo.flush in user mode makes it more
convenient to manage the cache state and achieve better performance.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/cpufeature.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c0916ed318c2..60d180b98f52 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -30,6 +30,7 @@
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
 static bool any_cpu_has_zicboz;
+static bool any_cpu_has_zicbom;
 
 unsigned long elf_hwcap __read_mostly;
 
@@ -87,6 +88,8 @@ static int riscv_ext_zicbom_validate(const struct riscv_isa_ext_data *data,
 		pr_err("Zicbom disabled as cbom-block-size present, but is not a power-of-2\n");
 		return -EINVAL;
 	}
+
+	any_cpu_has_zicbom = true;
 	return 0;
 }
 
@@ -944,6 +947,11 @@ void __init riscv_user_isa_enable(void)
 		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
+
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOM))
+		current->thread.envcfg |= ENVCFG_CBCFE;
+	else if (any_cpu_has_zicbom)
+		pr_warn("Zicbom disabled as it is unavailable on some harts\n");
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
-- 
2.39.2

