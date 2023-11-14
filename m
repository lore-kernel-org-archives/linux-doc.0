Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6266141210
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 14:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dnx4y6VF"
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910C01BF4
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:13:58 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-778a25cad6dso14504985a.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971237; x=1700576037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oJqbvRhcnLQ4NxthWPQmg85qomzW1aIjvQdZvqQ+P8=;
        b=dnx4y6VFVZXXxHxrPOZEMg+iwKsctF0YCegxpcgZ/bb45IGDJdKj4Y8+McR3vD6lI5
         y2T4cb1YbVszVikjWD42lwmNcxbHGVd6w9MD/TqmJvjdWRPwfGpWRniaRgFPXgXtpw0r
         CekBGC17nhNv8+evmB3Ke3NNJSyC2p1l7UO/tchmEyHmU1LTpo+GTvH2cKwnGsfW6N9I
         WK50pJpK80jGRpPiSQHMsNACQxFI5dgz76zrgd9AcA1AurxepWt6XLTl376nS4yju3Ti
         RWrDD7Ng5Y4Le361FOJ7lj3e0zdTnfSIfP8ilouMgdtmsUEvINxXqo6mDB+1iorQy/0F
         +szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971237; x=1700576037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oJqbvRhcnLQ4NxthWPQmg85qomzW1aIjvQdZvqQ+P8=;
        b=TEe77AiuMvImZRhnFyQHdSmQM+pUsbMC42OvxI2hZZYPLPkOTFMLpviAlq6UAmyYMM
         738oTXoZp+3wUVK1RyzWdmDKKbfZyjMYnYhXFLBiyAdZsjm664jCd9plU5u0VXt8PM/0
         yTXEYsQ3vLC7VEMlhGZElELuD26kkNewuaEMuzZ6szAca6WvMoWEd4L+7qWWof/ba+Jd
         aNI8dOMnaG5YVRLcKh+wabkN+njw74N9JTCnVoo5nDPoGL8OR0lPKp8uNlWrXiR18Elk
         6ufZsfeV1bprSTlMAcMAB3yJHxmqFPxhwgZncjHQczm9nvChgMbF9R92R4R/zvRBEIit
         hb0Q==
X-Gm-Message-State: AOJu0YzqSqSOWiUu8q1TBCOZ8Do8f9wzptfVplsigQGIMCMzQK+Cy33s
	Om44HSOlQ6cpHwOevmfeOYeaGA==
X-Google-Smtp-Source: AGHT+IF9EjIfzzCxNwPyM1ga1yNOhI5yYokOjuEfqsXGtogg+vNsqW/HCxpZN6Ez5oZMRSmIbkGJGw==
X-Received: by 2002:a05:620a:28d4:b0:773:a789:cd15 with SMTP id l20-20020a05620a28d400b00773a789cd15mr2090356qkp.6.1699971236775;
        Tue, 14 Nov 2023 06:13:56 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:56 -0800 (PST)
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
Subject: [PATCH v4 19/20] riscv: hwprobe: export Zfa ISA extension
Date: Tue, 14 Nov 2023 09:12:55 -0500
Message-ID: <20231114141256.126749-20-cleger@rivosinc.com>
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

Export Zfa ISA extension[1] through hwprobe.

Link: https://drive.google.com/file/d/1VT6QIggpb59-8QRV266dEE4T8FZTxGq4/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_riscv.c         | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 896ecfbbe5f4..41463b932268 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -157,6 +157,10 @@ The following keys are defined:
        defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
        ("Remove draft warnings from Zvfh[min]").
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZFA`: The Zfa extension is supported as
+       defined in the RISC-V ISA manual starting from commit 056b6ff467c7
+       ("Zfa is ratified").
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index fffc69d9f6ba..91fbe1a7f2e2 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -55,6 +55,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZIHINTNTL	(1 << 29)
 #define		RISCV_HWPROBE_EXT_ZVFH		(1 << 30)
 #define		RISCV_HWPROBE_EXT_ZVFHMIN	(1 << 31)
+#define		RISCV_HWPROBE_EXT_ZFA		(1ULL << 32)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index e90537593f5f..f0bd7b480b7f 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -193,6 +193,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		if (has_fpu()) {
 			EXT_KEY(ZFH);
 			EXT_KEY(ZFHMIN);
+			EXT_KEY(ZFA);
 		}
 #undef EXT_KEY
 	}
-- 
2.42.0

