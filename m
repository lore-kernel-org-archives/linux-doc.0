Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Oly2hJhI"
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9973128
	for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 03:33:19 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40c1e8458b9so11300345e9.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 03:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702467198; x=1703071998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3Huv5MEBJaGZczqd/5TE8MmVw2Iifvm3SE9MHyvArM=;
        b=Oly2hJhIxheMz5fa4PfdMXcJzRBHH+zy0YMNdPKyRAITW28efu3PI+nMTaeBWr94kG
         X/jrtgvPqctTgCXopiYZXF3P98rucKVaKP7SU3yh32DtqLnLa8x+uwz8/ub166H18wZu
         efeHtqYOqYyVX0R9gJVFOESFKvmwNd7ujWaG8XaNXNBdetndniferVbsasmJgHnropcm
         kMV6W4mmEdBbo4lCDDtbBBj8y5uhWkyzsSr+zbpb0bQEg9beoC3b9CM2sQmxf6C4h8QD
         888aQwoUPxi8+DDWnRiii7MDaOeOzhLxHEXWkEuOkE60k9HBnt3vr5D6uuKPAPwtMLdf
         79eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467198; x=1703071998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3Huv5MEBJaGZczqd/5TE8MmVw2Iifvm3SE9MHyvArM=;
        b=C1/IAKC3PSGG2T/sK2JubwrS+2jFKSz7Ilw6Kfpgn/E10lnPZZwR1MVlQhB1h1Ng4u
         ZiypL1pKDCq7RMRE5R84NJPIxeaw5j7yNKDxp4IkKuMaGqza9ozyP/9dnAseNSHXFUDs
         RfJZUdRW39t4abMiCMhdQ1lxCzrDImvJfwH8KefxKURR0YSHMrC23+F56Wdn+x4x5Obi
         vp9ZR6ci9WiTr5D2iJaYXLlclE86qFi6LSeqHEG2/3G4Rc/DTqWmyhH9VGa+karV+Gqa
         3X77+8isWAfNfH7eOzSXlgTq1W/Lq8cccuqoeecehmw1Lql4mWtB3fCtP4MIb/rKqkGM
         ljfg==
X-Gm-Message-State: AOJu0Yywlbn3x9wCQSadJTXGDQ1KJz3Fz5bQrxXqXhuRlbNw3Qdq0/L+
	AJOLDgJsgRoqEHuBB1hJdaUR7860G7csWXZi7xM=
X-Google-Smtp-Source: AGHT+IEuw1QBTiAznUoQrReEOynJMkbQ+ARylSUzX7QvBk7zRYceQKbxX1KCoyBCOFTm72L9SeyM/g==
X-Received: by 2002:a7b:c411:0:b0:40b:4f49:4a33 with SMTP id k17-20020a7bc411000000b0040b4f494a33mr9613789wmi.4.1702467197998;
        Wed, 13 Dec 2023 03:33:17 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:c564:f167:d072:5672])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm22433137wms.30.2023.12.13.03.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:33:17 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>
Subject: [PATCH 5/9] riscv: hwprobe: export Zam ISA extension
Date: Wed, 13 Dec 2023 12:33:01 +0100
Message-ID: <20231213113308.133176-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213113308.133176-1-cleger@rivosinc.com>
References: <20231213113308.133176-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Export Zam ISA extension through hwprobe.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 3 +++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_riscv.c         | 1 +
 3 files changed, 5 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 10bd7b170118..9b19ca3433de 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -165,6 +165,9 @@ The following keys are defined:
        defined in the RISC-V ISA manual starting from commit 5618fb5a216b
        ("Ztso is now ratified.")
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZAM`: The Zam extension v0.1 is supported as
+       defined in the RISC-V ISA manual.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 01ac3dc196e5..2350c45741a6 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -57,6 +57,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZVFHMIN	(1 << 31)
 #define		RISCV_HWPROBE_EXT_ZFA		(1ULL << 32)
 #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
+#define		RISCV_HWPROBE_EXT_ZAM		(1ULL << 34)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 6564fa9e7a7f..a8473d7f9d1e 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -175,6 +175,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZKT);
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZTSO);
+		EXT_KEY(ZAM);
 
 		if (has_vector()) {
 			EXT_KEY(ZVBB);
-- 
2.43.0

