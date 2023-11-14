Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B13B405FB
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="l6CokWOZ"
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB77195
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:13:41 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-778a25cad6dso14499685a.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971220; x=1700576020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keCbZUlhJhR2ZwXU737WvxpdBzfAu930SEAq7brrB2I=;
        b=l6CokWOZqVrzhHF+vsc+H+M4KEZVPhFAXq1iUfvErmv5zCfyovHSAIL+Rlo4LZ0gDo
         8aBy6NEZnjc9KUnSw6kEjJHUIJl6N8DmZfwG6gJIpCGbGI1WaDE/vYVLX9iTmfk9H70e
         R1HGVciQjnfc9KVBGmQiv0bF0bK1U1CvbgVLxQ0C4g137F2wtJkRR+AnWt+1xCTUZn5j
         NjDBvw5fQxNhuyJjLa5lQBhLcf5lGGOsJ4bwnOxl2KbUTUQon4KWB4CXnoOZEm/PMapT
         Vacr5Iuy4oWjhiAyWxZI0QC7/Shg9YqoQ1SrZyileAY/eq+uJoYKllY92gQAwUKbpVE8
         jdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971220; x=1700576020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=keCbZUlhJhR2ZwXU737WvxpdBzfAu930SEAq7brrB2I=;
        b=WHcNm295OWPmk0IzSLaoqXMiKQwuwBMozzfZqLzOvJWLGMS4W0DejKQIlZleqKsZDN
         2ClBhZUH29d9D8NUdgSzIMMgEstvdGR3Wh90yFiwc/sitVPAdmlDBIq6ZzP012bPAfnm
         4wc7mt4KH3Oivdggv99M9874fhcajSYXljdyUF1A7KQWT/T0SCp9RWuDpbQtd+fijTI4
         qfpZZAbYzLY6ggMDSI3p6JadXznGzESjnSG9DXw/F8wc92NF9XzTZHgdu6Z7ewmNZyO4
         owdWtBdtCfxvn3+bSXW67z6SQVFrCo+TsWH44L4KnPjahKRiYzxc1MakqdC6AEEs/PAv
         eA/A==
X-Gm-Message-State: AOJu0Yw4V1ukWUbI7Idzxb0OmRLAgZRjXQ+XWz4pwLQz4y3k8lIdW4DV
	tprxC0QmSMsx//oXQf1yoG1Quw==
X-Google-Smtp-Source: AGHT+IH/a2FfbthDBterj2ExvRydm8PsEE46bPyI6vhg+6wuJOSTbSR3GQBAEKTJRnI4P9fwyid4gg==
X-Received: by 2002:a05:6214:5ec5:b0:66d:1178:8729 with SMTP id mn5-20020a0562145ec500b0066d11788729mr2432438qvb.0.1699971220091;
        Tue, 14 Nov 2023 06:13:40 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:39 -0800 (PST)
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
Subject: [PATCH v4 07/20] riscv: hwprobe: export vector crypto ISA extensions
Date: Tue, 14 Nov 2023 09:12:43 -0500
Message-ID: <20231114141256.126749-8-cleger@rivosinc.com>
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

Export Zv* vector crypto ISA extensions that were added in "RISC-V
Cryptography Extensions Volume II" specification[1] through hwprobe.
This adds support for the following instructions:

- Zvbb: Vector Basic Bit-manipulation
- Zvbc: Vector Carryless Multiplication
- Zvkb: Vector Cryptography Bit-manipulation
- Zvkg: Vector GCM/GMAC.
- Zvkned: NIST Suite: Vector AES Block Cipher
- Zvknh[ab]: NIST Suite: Vector SHA-2 Secure Hash
- Zvksed: ShangMi Suite: SM4 Block Cipher
- Zvksh: ShangMi Suite: SM3 Secure Hash
- Zvknc: NIST Algorithm Suite with carryless multiply
- Zvkng: NIST Algorithm Suite with GCM.
- Zvksc: ShangMi Algorithm Suite with carryless multiplication
- Zvksg: ShangMi Algorithm Suite with GCM.
- Zvkt: Vector Data-Independent Execution Latency.

Zvkn and Zvks are ommited since they are a superset of other extensions.

Link: https://drive.google.com/file/d/1gb9OLH-DhbCgWp7VwpPOVrrY6f3oSJLL/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 30 +++++++++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h | 10 +++++++++
 arch/riscv/kernel/sys_riscv.c         | 13 ++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 3a18a31e32c3..a08fcd899b6d 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -110,6 +110,36 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZKT` The Zkt extension is supported, as defined
        in version 1.0 of the Scalar Crypto ISA extensions.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVBB`: The Zvbb extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVBC`: The Zvbc extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKB`: The Zvkb extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKG`: The Zvkg extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKNED`: The Zvkned extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKNHA`: The Zvknha extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKNHB`: The Zvknhb extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKSED`: The Zvksed extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKSH`: The Zvksh extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVKT`: The Zvkt extension is supported as
+       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 624abd5cde29..89628a76ca04 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -40,6 +40,16 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZKSED		(1 << 14)
 #define		RISCV_HWPROBE_EXT_ZKSH		(1 << 15)
 #define		RISCV_HWPROBE_EXT_ZKT		(1 << 16)
+#define		RISCV_HWPROBE_EXT_ZVBB		(1 << 17)
+#define		RISCV_HWPROBE_EXT_ZVBC		(1 << 18)
+#define		RISCV_HWPROBE_EXT_ZVKB		(1 << 19)
+#define		RISCV_HWPROBE_EXT_ZVKG		(1 << 20)
+#define		RISCV_HWPROBE_EXT_ZVKNED	(1 << 21)
+#define		RISCV_HWPROBE_EXT_ZVKNHA	(1 << 22)
+#define		RISCV_HWPROBE_EXT_ZVKNHB	(1 << 23)
+#define		RISCV_HWPROBE_EXT_ZVKSED	(1 << 24)
+#define		RISCV_HWPROBE_EXT_ZVKSH		(1 << 25)
+#define		RISCV_HWPROBE_EXT_ZVKT		(1 << 26)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 43aa66e71418..9bbcd7334d96 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -173,6 +173,19 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZKSED);
 		EXT_KEY(ZKSH);
 		EXT_KEY(ZKT);
+
+		if (has_vector()) {
+			EXT_KEY(ZVBB);
+			EXT_KEY(ZVBC);
+			EXT_KEY(ZVKB);
+			EXT_KEY(ZVKG);
+			EXT_KEY(ZVKNED);
+			EXT_KEY(ZVKNHA);
+			EXT_KEY(ZVKNHB);
+			EXT_KEY(ZVKSED);
+			EXT_KEY(ZVKSH);
+			EXT_KEY(ZVKT);
+		}
 #undef EXT_KEY
 	}
 
-- 
2.42.0

