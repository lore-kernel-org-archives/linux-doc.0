Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F78829CF2
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="HuLzHD5+"
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 606DB10D2
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 02:56:23 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32f9baca5bcso817464f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Nov 2023 02:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354581; x=1699959381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5SlhQ+MFK/oE1hG84P6kssLtuGPrTemJS5B/ituwJs=;
        b=HuLzHD5+NUplFSRSEigRYCAeD0v0cEK2NPID/6oGjjEmaPDUHskQwVpB+cWEvkFNFN
         NLIXXtPCTYKJCr+iwcVISdLgyRoD0Ghc5Y2NxjsB4ERA1RuGWaxrgSEjhxJWZzcjOVgl
         epmv7DDwCUkdjvpTYcao+ZD/WCzd8c6rsMgyv97wph253i5bbm5UPKrZrBjBff97WAJ9
         h6Gue5A1/boJ6p9HATQZo5uXfW53Wm9NjqMb/tTW5dwlygNm6B48cSqj1DxcosSFuZDq
         5A7M8z5EsZSF5ssB7cD5fLPSiKSd7DBa32/fq1epkaUuLNBeewtAwqfJkmLsMF7rp3XE
         1XGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354581; x=1699959381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5SlhQ+MFK/oE1hG84P6kssLtuGPrTemJS5B/ituwJs=;
        b=o+mDFcUXvNdrCxxfnbfLQEnCz5trx9/4hdUaAKn5yF3EMxTaIWb9IcODLlKgxJ2hOc
         E7cVV2I0qrB3azGAvxfMyVyQ3AFxLG4S84zmqxia2A8VyWd2uMBk8qUjUxKc73TQydt+
         o/mOMKc7QLeVBAXMBzJe1NP4QH1o0Nhem1tdTLR0oHrvFGz6PgcxVXKTVjiPA+V94IpQ
         e+SrS0yrvVGJxG7/CrBDNb6WtTypuTprrGB0mNEOZsFFG8PWPNoPj2KK5eV3Nfu7BhmD
         FxviTap5oK904mTVjVHfigenPA88HHYr08x6uxrd4EGQz0zuU9UbJefG+HNs1GuxcJAh
         j+Fg==
X-Gm-Message-State: AOJu0Yz2WWAAipbL0NLZx833/HqG8DFf499PTA6X0grXHQEvhm6Q1rfN
	HSD+9r6e0GTzYnhJzC2mpo4ZXA==
X-Google-Smtp-Source: AGHT+IFQS7qfkMNRtAKpq/tiaOzmGYA+PKb/n54XAFPfjBLLUBdHDw7kelXyOwVBWWtsxlUnnASLNQ==
X-Received: by 2002:a05:600c:ac3:b0:404:72f9:d59a with SMTP id c3-20020a05600c0ac300b0040472f9d59amr26109516wmr.0.1699354580425;
        Tue, 07 Nov 2023 02:56:20 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:20 -0800 (PST)
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
Subject: [PATCH v3 16/20] riscv: hwprobe: export Zvfh[min] ISA extensions
Date: Tue,  7 Nov 2023 11:55:52 +0100
Message-ID: <20231107105556.517187-17-cleger@rivosinc.com>
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

Export Zvfh[min] ISA extension[1] through hwprobe.

Link: https://drive.google.com/file/d/1_Yt60HGAf1r1hx7JnsIptw0sqkBd9BQ8/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 8 ++++++++
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_riscv.c         | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 2f37b26d27da..2a2fe4b026e7 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -146,6 +146,14 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZIHINTNTL`: The Zihintntl extension version 1.0
        is supported as defined in the RISC-V ISA manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVFH`: The Zvfh extension is supported as
+       defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
+       ("Remove draft warnings from Zvfh[min]").
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVFHMIN`: The Zvfhmin extension is supported as
+       defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
+       ("Remove draft warnings from Zvfh[min]").
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 36c8d073c987..5124327b70ff 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -52,6 +52,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZFH		(1 << 26)
 #define		RISCV_HWPROBE_EXT_ZFHMIN	(1 << 27)
 #define		RISCV_HWPROBE_EXT_ZIHINTNTL	(1 << 28)
+#define		RISCV_HWPROBE_EXT_ZVFH		(1 << 29)
+#define		RISCV_HWPROBE_EXT_ZVFHMIN	(1 << 30)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index af2b01b0a5b6..3cd5d42ae01f 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -185,6 +185,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 			CHECK_ISA_EXT(ZVKSED);
 			CHECK_ISA_EXT(ZVKSH);
 			CHECK_ISA_EXT(ZVKT);
+			CHECK_ISA_EXT(ZVFH);
+			CHECK_ISA_EXT(ZVFHMIN);
 		}
 
 		if (has_fpu()) {
-- 
2.42.0

