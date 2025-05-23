Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9C7226D04
	for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 10:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995659; cv=none; b=lrZoQI74ITGuwBQqVwX9aPX2Mpj5ORq5MLdAVTAZN3iiC9SM0Y4727zd4tRG7/mEVx+5v1Xt+BxwRqJZZQqjtRVubZ5Ir8Av/4SyGbQPWbXc7f5YFhp6y89TubLFeJCe4JfO7mC+a3G5M177SMrRBXKI2S3IiyUprECOIMFek6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995659; c=relaxed/simple;
	bh=a4HmXbZsUXBGVxOtLEuaSzvGsxTBPYeLxEetHvR5itM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gU71C7SSyLTjzUsQCVgNflFHkQK4qqQ0eUYct9yQDkKWPy8LUwF8AeiijUVfrY8pDMDGS8866pV1GvL7btNaUUN0bFGN+6v3AkXX8VgpsgUcwvYChhhded1QOcmoHMCZiaV46/Apth2PbXBefQ81k5iULdeofDFHIE4w/kFqHS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=JO7P8Gn2; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="JO7P8Gn2"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742af84818cso5527915b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995656; x=1748600456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GthJpHk7CYaw8f95HNVaUdqkaGIjKWsbIYnr+62Txtw=;
        b=JO7P8Gn2GUKnkLClg5bKzQ2DJBV3RGt5ZDmJK8U4FUqR44njdxvcp6hvfEKLGcVTfC
         0yvagZmYw2y/V1eGs2SoSW7Y5eBM6iKDCtyGic33o9oGRTYhtqbR3e1qIssvNDCp+rjh
         DgYwAYo1RD7Lv2uCR899VqrtIlWzWFzwDg8vq4DfvIA441nL2k72plHZDQXOQpm8C4hQ
         1ZSkWPhcWz4s/rjSdrih5qja/d9oy4a2MiJZjKp9+m4CEH8nWGQRSMfMkaxudbDKMTdW
         EZRLTf/kklD+ElyJXua3UmbLosLJMYo4yaMW/s722RGFJMJ7CX6bdzFBqWuNaPkVsicH
         7JUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995656; x=1748600456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GthJpHk7CYaw8f95HNVaUdqkaGIjKWsbIYnr+62Txtw=;
        b=tmI+pxIIz2MRCe0UktrkvOh7vj4c/Aj/5N+3oWRDkigWHSAjb19sBrFIEGD+9an5aN
         AWaCbWjYN3tFgKq92sInwHp5csdKZvvw5aOOJho24w7BdZO94a7i+xMnjEy8SVqJHVEJ
         hrsm1MBuW1Q26r68FOXcRHckNI/rqebWXhyQtC0JqJUyTr5fSgTlQ2kWu4OdaSVX9ar9
         0snVilRXQEeS0mu80lYQW6Seg1O/LkFk+lpgd0FWqA4ZO8iEd0yFn+i41eEk8cfy6tM1
         fci374pwrNgluK20FkU3LIkZy6NA1eBAabvAS3xqbyKxQx+BBX28E/KBiibXQUIgW1dX
         sYbw==
X-Forwarded-Encrypted: i=1; AJvYcCXYLzLuI9wv6XfIUmgU3scL5Tbl0ealwbsAUb1YPKu7b/tCR1bwqclJNfFLjeHIIlItPG2BBqCKxLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSUOb/A0mQacPuIGb7e6vJGIctHeGanv4DKvoj7jmnvq4CEGkg
	4DDNWju3WX6+1v4V9Nb1y19kzUiOx2aIEm1YvZOfSo1i6ZYDh57EMLM9IZMn27VCy3k=
X-Gm-Gg: ASbGncugY1NfgnTc10ozw02cQy1Ohb7N9HwsaFJNOyuEaX0QGRwPC0C6p47EY2ZF9I7
	J79GvzrM/U7qWOnBMfZMwzi40vgs5gRSi349xCfYhrWELJSQwtWXMZmAwRkgQP1nrneU/apY9Wy
	lBvO2tKbR43831wJOvduOyJa4WfU/dV1gfkqT7k1mHqdSoVSsYViUu7LupclpYPQgPnIya/bOeC
	m2+kSIR6XsZ3CYYv1k7fyJ1HgD+T4xRVBIBlnvQOrwDn+JTFxsLvJ/zPRUYoU1eKtJW6pjSyR8C
	LlqSQnKrbpCTQDexgpevJpsJn5Vv5Sg/lvHMZjzts0R3XGvOqikdhTFROkv7Pb4=
X-Google-Smtp-Source: AGHT+IGNn5Ze7RmeDktlCW0T183bymn1C862lKIDtG+J3J1vY1Fk8ZeY7B6o/JkpGeXA+XwUMijVpg==
X-Received: by 2002:aa7:888e:0:b0:742:39fa:13df with SMTP id d2e1a72fcca58-742a98a2520mr39921026b3a.19.1747995656125;
        Fri, 23 May 2025 03:20:56 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:20:55 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 01/14] riscv: sbi: add Firmware Feature (FWFT) SBI extensions definitions
Date: Fri, 23 May 2025 12:19:18 +0200
Message-ID: <20250523101932.1594077-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
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
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..bb077d0c912f 100644
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
+#define SBI_FWFT_PLATFORM_FEATURE_BIT		BIT(30)
+#define SBI_FWFT_GLOBAL_FEATURE_BIT		BIT(31)
+
+#define SBI_FWFT_SET_FLAG_LOCK			BIT(0)
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
2.49.0

