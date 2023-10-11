Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097E21DDFB
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 11:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rOHMONfH"
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F12A8F
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:21 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-406aaccb41dso18558205e9.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023160; x=1697627960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBNgr4CfRjqqsWxQ2+6f8weSNRNIv9nwhwGw5L11t7E=;
        b=rOHMONfHM93YWtd5GUio9nmRIB4OWwOPZmyZc1185UHpTKBRoLHNPUxgO0o3IvBzuN
         J8DmTMtN+ZdJVGIQIX3lpcFzv2v/Rseo2tdRWXYzpkpntFmdeI1C9KhdK0JyNMHO96Md
         GwIm+PThwEKLlfZD7enltjd8MiWeYg42w7R4fqyTWZmXuB/GHIV6dK5QtQ86EtaBOYXf
         +iwh5YCYl1zQOiAeyFv7CFSdO48OV6vZaOLdUR1gMganXqj6AuZ13+4/TNAi5arTKqOh
         UnUpLV1xJy7sRUyV6ReVBdChEpmUGM7Z7TpwqN2i44PVQGlOZn2Lb0tT6LA0EYE1Syyh
         mK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023160; x=1697627960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBNgr4CfRjqqsWxQ2+6f8weSNRNIv9nwhwGw5L11t7E=;
        b=gP2amYD1vP6xhh6MtobCzNQziNBRiFDJwc9gYFK0q8i28T6bKyOAhJkagQpSFBIV+E
         MmaNen4lKzBoJHtQJeuBf7vpyB8oTsQICfgbrmEOxMOXNTNpphIISL5wPyhck2SukV2T
         BpQwXsC2s5MHfCYFISe7C06f+rxk01wW0UhSGuM8LsLdXJt15tUDQFNeV/yeyMQE+c21
         s0/kHkb3NKOrZECZzQW04ufS0zogwerX51MKVlWS4K2SfLT6ceQzcLTSXVp2x9njlAD/
         sg9vrEbRCqBhXsZ6zB4kRkLSSUoupFTW5e3/gF3eJ51EPEXgqCeuN/R4fS46yLM5zkW7
         LTvg==
X-Gm-Message-State: AOJu0Yy5vYZacyTuXp5VmaYWHVSx6KdozZu6AHVFv8oI4fR6tZylywzO
	yBeD4UkyBYnIrA9ccN17aLtdkw==
X-Google-Smtp-Source: AGHT+IGz2OBUFL5jTgh2YCxEN7qoM5h2KX6lIy42xfQJumWv/niH0yRdWTx+Aa/sRSbVnW7ryNwO9Q==
X-Received: by 2002:a05:600c:214f:b0:406:513d:738f with SMTP id v15-20020a05600c214f00b00406513d738fmr18787533wml.2.1697023159566;
        Wed, 11 Oct 2023 04:19:19 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:19 -0700 (PDT)
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
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v1 06/13] riscv: hwprobe: export Zfh/Zfhmin ISA extensions
Date: Wed, 11 Oct 2023 13:14:31 +0200
Message-ID: <20231011111438.909552-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011111438.909552-1-cleger@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Export Zfh/Zfhmin ISA extensions[1] through hwprobe only if FPU support
is available.

[1] https://drive.google.com/file/d/1z3tQQLm5ALsAD77PM0l0CHnapxWCeVzP/view

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/riscv/hwprobe.rst       | 6 ++++++
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_riscv.c         | 5 +++++
 3 files changed, 13 insertions(+)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index edfed33669ea..06f49a095f19 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -125,6 +125,12 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKT`: The Zvkt extension is supported as
        defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZFH`: The Zfh extension version 1.0 is supported
+       as defined in the RISC-V ISA manual.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZFHMIN`: The Zfhmin extension version 1.0 is
+       supported as defined in the RISC-V ISA manual.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index d868eb431cd6..c9016abf099e 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -45,6 +45,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZVKSH		(1 << 19)
 #define		RISCV_HWPROBE_EXT_ZVKSG		(1 << 20)
 #define		RISCV_HWPROBE_EXT_ZVKT		(1 << 21)
+#define		RISCV_HWPROBE_EXT_ZFH		(1 << 22)
+#define		RISCV_HWPROBE_EXT_ZFHMIN	(1 << 23)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 4f5e51c192d5..da916981934b 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -175,6 +175,11 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 			CHECK_ISA_EXT(ZVKSG);
 			CHECK_ISA_EXT(ZVKT);
 		}
+
+		if (has_fpu()) {
+			CHECK_ISA_EXT(ZFH);
+			CHECK_ISA_EXT(ZFHMIN);
+		}
 #undef CHECK_ISA_EXT
 	}
 
-- 
2.42.0

