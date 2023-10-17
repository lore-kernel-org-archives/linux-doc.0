Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A5442BFC
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 13:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ZmHE+lp9"
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33754EA
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:31 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c504a51a18so12429961fa.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548529; x=1698153329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+YdsWcYVn6169SyHd6y47aRn9PEH1vqa+UZ/lbiRsM=;
        b=ZmHE+lp9gUvBlTFls+B3coyoGQcuLuCvba/fnBqOq6oKhTxdI5h69tuv49oPAwQgTZ
         rvbQNv53ZxO7Iqgsg6YbdipkmzLVooKXxCLqkcle8btOw8MzfzcE0Hkvtrm7Tlb1FNj7
         sB1KUZN7sMk1tR3sVCSH/t+QOZVu+adK45pnckekYiJC6rzeu9JAevg8gKSKGzPX+Fg4
         qA1pUONO9qFhJ9QcF2mxM9csC4HB3DIZ1mPOqCGjvaz3zASVx5p+6KzSiinWCFuYvJcf
         rwW3Qvv+Z0KOgmvHgscK5f3ktAO+VwJtpff64sMCEU6AZBpfCqU2POgbe76t7F3MH2QY
         qaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548529; x=1698153329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+YdsWcYVn6169SyHd6y47aRn9PEH1vqa+UZ/lbiRsM=;
        b=ZTjqg+0Q+xdnXHE0PDdiEzbIJRdMO7+bKaGxJ/BbsckVv4A0uLQUVNVedIxlPsus82
         f4OPCBD1+MW3X+WiGU+SVE5hcLxby8fKWIiYKFoMjdEYeqyPiSno2UoIE1IY77YwEzaJ
         vRHKNk2BvSMw3TCFXCqAnewbeceutP2IhD9HexXop8CRhaOwgw7nqVWYuGcx4KAwEqDf
         DMH09q9SSz3Rkdlpk83qszL+k21UZMWJYfUv/qRWt7eYuBlxd3Ilk+1tbLwTq/3sfFmE
         BkrER1F9Op6Y8f6YXOsUuI/5IWwFoyW2Td7RkoRwI8ABgF1goVjuud3acGJDalY4hCsd
         o8eg==
X-Gm-Message-State: AOJu0Yw4xtbIfc1y/gMjes/fqDhq2X8RlF0dhuWYi1cHW242VC/+lUUy
	xIAW4M0krYP0tVrIODYXApHjKg==
X-Google-Smtp-Source: AGHT+IFBOTXEXr43gdsOEXZTLGsCUTwXsN7icrp4K+mwx8bu9OZBA4TzovT3zYwulcSpy9TKNqZz8A==
X-Received: by 2002:a05:651c:115:b0:2bc:d505:2bf3 with SMTP id a21-20020a05651c011500b002bcd5052bf3mr1744042ljb.1.1697548529526;
        Tue, 17 Oct 2023 06:15:29 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:29 -0700 (PDT)
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
Subject: [PATCH v2 03/19] riscv: hwprobe: add support for scalar crypto ISA extensions
Date: Tue, 17 Oct 2023 15:14:40 +0200
Message-ID: <20231017131456.2053396-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Export the following scalar crypto extensions through hwprobe:

- Zbkb
- Zbkc
- Zbkx
- Zknd
- Zkne
- Zknh
- Zksed
- Zksh
- Zkt

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/riscv/hwprobe.rst       | 30 +++++++++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h | 10 +++++++++
 arch/riscv/kernel/sys_riscv.c         | 10 +++++++++
 3 files changed, 50 insertions(+)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index a52996b22f75..968895562d42 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -77,6 +77,36 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZBS`: The Zbs extension is supported, as defined
        in version 1.0 of the Bit-Manipulation ISA extensions.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBC` The Zbc extension is supported, as defined
+       in version 1.0 of the Scalar Crypto ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBKB` The Zbkb extension is supported, as
+       defined in version 1.0 of the Scalar Crypto ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBKC` The Zbkc extension is supported, as
+       defined in version 1.0 of the Scalar Crypto ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBKX` The Zbkx extension is supported, as
+       defined in version 1.0 of the Scalar Crypto ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKND` The Zknd extension is supported, as
+       defined in version 1.0 of the Scalar Crypto ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKNE` The Zkne extension is supported, as
+       defined in version 1.0 of the Scalar Crypto ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKNH` The Zknh extension is supported, as
+       defined in version 1.0 of the Scalar Crypto ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKSED` The Zksed extension is supported, as
+       defined in version 1.0 of the Scalar Crypto ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKSH` The Zksh extension is supported, as
+       defined in version 1.0 of the Scalar Crypto ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKT` The Zkt extension is supported, as defined
+       in version 1.0 of the Scalar Crypto ISA extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 006bfb48343d..89d0e37a01e9 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -29,6 +29,16 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZBA		(1 << 3)
 #define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
 #define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
+#define		RISCV_HWPROBE_EXT_ZBC		(1 << 6)
+#define		RISCV_HWPROBE_EXT_ZBKB		(1 << 7)
+#define		RISCV_HWPROBE_EXT_ZBKC		(1 << 8)
+#define		RISCV_HWPROBE_EXT_ZBKX		(1 << 9)
+#define		RISCV_HWPROBE_EXT_ZKND		(1 << 10)
+#define		RISCV_HWPROBE_EXT_ZKNE		(1 << 11)
+#define		RISCV_HWPROBE_EXT_ZKNH		(1 << 12)
+#define		RISCV_HWPROBE_EXT_ZKSED		(1 << 13)
+#define		RISCV_HWPROBE_EXT_ZKSH		(1 << 14)
+#define		RISCV_HWPROBE_EXT_ZKT		(1 << 15)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index e207874e686e..2b50c661da90 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -162,6 +162,16 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		CHECK_ISA_EXT(ZBA);
 		CHECK_ISA_EXT(ZBB);
 		CHECK_ISA_EXT(ZBS);
+		CHECK_ISA_EXT(ZBC);
+		CHECK_ISA_EXT(ZBKB);
+		CHECK_ISA_EXT(ZBKC);
+		CHECK_ISA_EXT(ZBKX);
+		CHECK_ISA_EXT(ZKND);
+		CHECK_ISA_EXT(ZKNE);
+		CHECK_ISA_EXT(ZKNH);
+		CHECK_ISA_EXT(ZKSED);
+		CHECK_ISA_EXT(ZKSH);
+		CHECK_ISA_EXT(ZKT);
 #undef CHECK_ISA_EXT
 	}
 
-- 
2.42.0

