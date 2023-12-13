Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="wRW7vS6m"
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF91FE
	for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 03:33:16 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c9ebc04891so16179171fa.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 03:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702467194; x=1703071994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxiI83AWHviDA1K2goPpANE3T3h3Nt6zkBhZOZxUOr0=;
        b=wRW7vS6mmRB6RaimzdIgDNsK6NJw7bhKdfXHy2vM3cDcXt1YHDdKPFuSOiqzvbEbUt
         ZlnpU2N+qGRwg7UAlOqSx6DuDvJGaZxCNuTFSwK4us5/h/q8WZ7Ip6CRufFvFHaNCB4Q
         RFssjBuUa1STuLPUM1zyhpmEyGUSo3fs2WwINTIzhTPObP5+9pfcdLZzA7A/wNnEV6bq
         I0HzL0TZd0SuXfslCnaB0cGz6DqUxLFOdoZoxlDq9Z66Z3vPKDoJeEtZrzZQdu3p7N7U
         1rhH+6dukhcf1HY4MaUoJcWRjsPA6OKjF2zqhtRfMWe9PTQ5qXp2lvFp2Yv3qkzczodj
         xxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467194; x=1703071994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxiI83AWHviDA1K2goPpANE3T3h3Nt6zkBhZOZxUOr0=;
        b=jrLQsWntenuMCdSv96DS7Yaz9ZJ9PCPkas28ciNWLcjQBrZQ24/njeu/IXN+TR2RkF
         QaYStMQytR7LvDc5cA3Qd/I6EMv/IgEuW1sQb7qPQ+5TiZcgEu4vNw4rMnmu3T2SWv15
         /FuazKKPkzl0LdoAYXIMJlFOrZfvk4Fm0hDKTuQdgvFsXluDpBvs/Y4hVtetjxpHFR4c
         YtMbRGsJ9q+sUWGLjM5JjmRxg4ThYr+71RHwbmg95n/KKMU+z2AzxscACtAZ7/Q60rsF
         Rx7oTBonKD7fz822skHvguVHnseaHYAsa42sOmrqd7ulSugVJI9HQljnrWvQrnX/DzJe
         EW9w==
X-Gm-Message-State: AOJu0YzMKdMqnqkepCSfNECTuhu86uidlGVDnxHncejmJjrENrmFK0aO
	qbk/UaPXNqWFtocNVhiGfuixBtHtaysH4F8WUSI=
X-Google-Smtp-Source: AGHT+IGFQ9eQ0IrP8TYC+dSFSgqEE4ePc+Ww0dv4Sk8Ab3H2/aQW5oT0kIoa/QE1H0U8J0J6zKys2w==
X-Received: by 2002:a2e:bc23:0:b0:2c9:edfa:f7a0 with SMTP id b35-20020a2ebc23000000b002c9edfaf7a0mr8605317ljf.1.1702467194165;
        Wed, 13 Dec 2023 03:33:14 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:c564:f167:d072:5672])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm22433137wms.30.2023.12.13.03.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:33:13 -0800 (PST)
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
Subject: [PATCH 2/9] riscv: hwprobe: export Ztso ISA extension
Date: Wed, 13 Dec 2023 12:32:58 +0100
Message-ID: <20231213113308.133176-3-cleger@rivosinc.com>
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

Export the Ztso extension to userspace.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_riscv.c         | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 41463b932268..10bd7b170118 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -161,6 +161,10 @@ The following keys are defined:
        defined in the RISC-V ISA manual starting from commit 056b6ff467c7
        ("Zfa is ratified").
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZTSO`: The Ztso extension is supported as
+       defined in the RISC-V ISA manual starting from commit 5618fb5a216b
+       ("Ztso is now ratified.")
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 91fbe1a7f2e2..01ac3dc196e5 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -56,6 +56,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZVFH		(1 << 30)
 #define		RISCV_HWPROBE_EXT_ZVFHMIN	(1 << 31)
 #define		RISCV_HWPROBE_EXT_ZFA		(1ULL << 32)
+#define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index f0bd7b480b7f..6564fa9e7a7f 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -174,6 +174,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZKSH);
 		EXT_KEY(ZKT);
 		EXT_KEY(ZIHINTNTL);
+		EXT_KEY(ZTSO);
 
 		if (has_vector()) {
 			EXT_KEY(ZVBB);
-- 
2.43.0

