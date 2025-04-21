Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5720F83A14
	for <linux-doc@vger.kernel.org>; Mon, 21 Apr 2025 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745244897; cv=none; b=b+bsfk+nEguj088Nv2/Lh7Mp1Z5TLOgteZoMIA4CRGxLitkdDSjXpP/Mrb5sGw+hRRPl5Bc9ZL9va/QJ7+u1ydCoxfZ2oWyW0D6ows40GlEJUu5zFhmrim7HjSm6e0EUkkfp0sWVZz/aBecaPdgd8+bi+VX3CAbPxH3wGKmgqlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745244897; c=relaxed/simple;
	bh=MiHZ0TZLJAnpgW7IuP7V1rNCVEWEj2CMr1JZ0gSvWd0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cIWGkJ0EFlfFueXmPP4D7UFHyttj36seFkxfzNMyeqppvATPX/ZMEjlz/itxBtqtea/5Lt0iDhxCFUhog1ocilrdTM6h2YASRU5Y3xsbzlLXyxcwHEMeHBFesR7/39kpVR0+7f8mUMsrR0i/mIjQupsjGmQR8hlCnDIbv2LptHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=DUxLKrMS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="DUxLKrMS"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso39576795e9.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Apr 2025 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745244892; x=1745849692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iId3OO4iPPoDitEFGGflVRfgetsV2ygJtDXi0T0AxTY=;
        b=DUxLKrMSTJO2QAKjvNsZArojkfz5cOYedE2hlOXSEqGAo8F+moisG/cOkqNIhWCbrU
         nrRmJzw0D84IOA+ZG0CNMnRPVuh3gdRkh7pL2FyCmnR/dlMJrdOqM8Z0mTVHm16YwcvG
         fk2hZc7Qk8H0dpY5LACh2ehgwX3965+dgiHcHbp6PVUlPXF7C2xFmnYsdqv63T/3ijBX
         cObfyIvbU4BeBQJPE2+CunfR4fG0e7OxW0fS5lkg6jlQ5S05FAoaZVBwi1Aji1rdNw2B
         leE+n0FZVMXmyul1pIybwQr8qAu6rNFDa9MDF1kPmDRQU5EweowfuIdc1LBKk0n8M78P
         BBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745244892; x=1745849692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iId3OO4iPPoDitEFGGflVRfgetsV2ygJtDXi0T0AxTY=;
        b=Cz4TNZsBPFLd3A15VaCiX6ukrwkpQBoVTAZ0e6tPzsl4MYjn3BSNKzRYrbHTutXLM0
         vyEJbdfMdtpESkeq9WDfk1L9TwaWLpxgSPY/fT8ij2Y+xVarVdgueuV8jZigmFeZLq71
         uaSEkeUWO4tuLCmzf5xiTWnh+ZlfO2VZAWlzR0pPNOCRBPQ+1IQjxkkJv1Uxm0hyo9ak
         OihxnFocOFrsJyzxZW5cIWHd/PrvQNRfSQMTNw32QAlBps/wAuOJPPBG2SNaQfsDvx3x
         c331eV8Fum6H20g4bQnYuFpWQeISh90VJEEbBV1TjzzBs73jC12tvkGmSTfLFJTITaGJ
         kPvg==
X-Forwarded-Encrypted: i=1; AJvYcCXeDbCeyGLT0S1YKJOu8jLWxFcdompQd/U3d+YSrbIz8uzKxuiCzSUW/7mTdAwnhQEM4pjLMb/wBc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaE13RPIMC3lJjhmwjvcAIARFkUSvDS8HXE+Ldb7QczRjG9D+6
	1kiEQkM520Y0e5meT7/UgewPFOeASp5DwqSXynKcbufqA9wE5qfi5zpBlzrKID/yT9YJqyvfS4q
	K
X-Gm-Gg: ASbGncv+w2IjVEt03So2uFeIPMwhfuqRR/za5uEdA+PFkDv3icx3WBnZc6Gj0xHdaaN
	9apDJMV6ANHj4annt+INeAACtlMGDeQAsvzXxEBTu6obuwfTRGxXSrOhUSWn0hHKytSCLYJhO+q
	i5BicZEiM5KSuNq3NJAbMpn12dWALAFoinF1X7PrHtCuCSE4o1tioY9HhRe//d0ZGCkUqppxHgd
	rr2Qu7NjkYY1MUOn0WpalC0jDFDujGvSfV4n2Sw4Jauifo0rrhB/Y7B9eRjfIa5P1yNcN2YJ4CF
	KkxE6ml5f+DYX1Yju5gKscCd5XQkjbSdI0UU5RksuIeF/tc/k5xK2H6cx+p9QXu9dD5YvVDctnc
	yAvhoTKrs
X-Google-Smtp-Source: AGHT+IG7GDN4v2GYmvAvZdURoHs4uth6LMLhvKJsf8zWUpG9THKVhntnk/wGfEVNyfGlNchCxTCbDw==
X-Received: by 2002:a05:600c:4ecc:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-4406ac17729mr92801105e9.29.1745244892524;
        Mon, 21 Apr 2025 07:14:52 -0700 (PDT)
Received: from localhost.localdomain (176-147-145-44.abo.bbox.fr. [176.147.145.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4403605892fsm116767405e9.2.2025.04.21.07.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 07:14:51 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: hwprobe: export Zabha extension
Date: Mon, 21 Apr 2025 16:14:13 +0200
Message-Id: <20250421141413.394444-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export Zabha through the hwprobe syscall.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index f60bf5991755..a4998ad2dfe0 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -271,6 +271,10 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is supported, as
        ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZABHA`: The Zabha extension is supported as
+       ratified in commit 49f49c842ff9 ("Update to Rafified state") of
+       riscv-zabha.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
      :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
      mistakenly classified as a bitmask rather than a value.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 3c2fce939673..fca15f2bf6f3 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -81,6 +81,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICBOM	(1ULL << 55)
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
+#define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 249aec8594a9..ed3123396a96 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -96,6 +96,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		 * presence in the hart_isa bitmap, are made.
 		 */
 		EXT_KEY(ZAAMO);
+		EXT_KEY(ZABHA);
 		EXT_KEY(ZACAS);
 		EXT_KEY(ZALRSC);
 		EXT_KEY(ZAWRS);
-- 
2.39.2

