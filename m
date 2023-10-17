Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77A443A82
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Sqf8DRC0"
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63920133
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:46 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40837396b1eso511645e9.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548545; x=1698153345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4LU7gzy3Hbb258ih1CCCOKNMQ4iLpkNhcu+Kc5tvws=;
        b=Sqf8DRC0dIDb8iAXzK5SNL9AgKcXGH/ERKGG7WA2G1+MkJx7YQVm/JwrT9/z8QdKN6
         v9aAN3djgk0HNGrw7/pt28XEDHpUC9FqhQgWuLFfpiTaYw4mJ1uubrKAC9H31fKO/QBi
         rc9IxKjOKp9MCrOi6LBsJDcgl8MJYQwShPBmkAUvuznKr41rcT7G1KQoEZLAPgpuZgiy
         7JtlRznLH1l88ih8dOWFzaDQg5DE1gkfLyrUpPZivT2fZoug0sJ1v31vP19wAX4g15hp
         3h2AaIqn2E6huzasjvfyQ151IEVw/vFViQyJJRQqx37FDigaIyHgduIa9amWoTgzUAPR
         SAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548545; x=1698153345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4LU7gzy3Hbb258ih1CCCOKNMQ4iLpkNhcu+Kc5tvws=;
        b=SAylkceOeetc2ErChYBzsVLxvAHPUPKT2PpKV4DlA6WVdQGXZOZl0t5s29AyJW9fV2
         gHycMtbHH1LwN62kJ/VJHVqgsRon5s47gIR7cmqCRLizKL6Djk2Oesz8wGZnGatRoZcJ
         44+RLaT8fdnotzcA+BjiuJ5kqzuoC0jk2ufMp15vQWbTZ+aCnVrOspfn5HHr88DY3tyz
         NfsLPaz4su6bB6TOpyWvjcSitQWrdVDhl/ukwYyqxggeZQl+c5tt0OxUA5UnizYhAOLz
         vewtwCktMpMZKboCpQQONYuszoccv7mGiqhQuREQZ21Pdz0kFGnygC88wF6xmMjY6yLs
         Y3yA==
X-Gm-Message-State: AOJu0YzM1SdOlcL876bXOP42NlwLbItP60GgLl6CCDycmXI41tTOE/hl
	fRs9ze820wufAvqyN9BMHrypUQ==
X-Google-Smtp-Source: AGHT+IHnpuaE2cK/zZiBwTN9WlDKtqZo7vhcXCnW27rCQU+XEM9WRrUe1J4q6WIg4FdM21J+kwJUfg==
X-Received: by 2002:a05:600c:891:b0:405:4280:341d with SMTP id l17-20020a05600c089100b004054280341dmr1640946wmp.4.1697548544833;
        Tue, 17 Oct 2023 06:15:44 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:44 -0700 (PDT)
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
Subject: [PATCH v2 18/19] riscv: hwprobe: export Zfa ISA extension
Date: Tue, 17 Oct 2023 15:14:55 +0200
Message-ID: <20231017131456.2053396-19-cleger@rivosinc.com>
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
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Export Zfa ISA extension[1] through hwprobe.

Link: https://drive.google.com/file/d/1VT6QIggpb59-8QRV266dEE4T8FZTxGq4/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/riscv/hwprobe.rst       | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_riscv.c         | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 782ac26cb92a..f81e3c93ac1e 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -154,6 +154,10 @@ The following keys are defined:
        defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
        ("Remove draft warnings from Zvfh[min]").
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZFA`: The Zfa extension is supported as
+       defined in the RISC-V ISA manual starting from commit 056b6ff467c7
+       ("Zfa is ratified").
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 79407010952a..4014492c3960 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -54,6 +54,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZIHINTNTL	(1 << 28)
 #define		RISCV_HWPROBE_EXT_ZVFH		(1 << 29)
 #define		RISCV_HWPROBE_EXT_ZVFHMIN	(1 << 30)
+#define		RISCV_HWPROBE_EXT_ZFA		(1 << 31)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 8d6edd721627..a6a063f1dcf5 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -192,6 +192,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		if (has_fpu()) {
 			CHECK_ISA_EXT(ZFH);
 			CHECK_ISA_EXT(ZFHMIN);
+			CHECK_ISA_EXT(ZFA);
 		}
 #undef CHECK_ISA_EXT
 	}
-- 
2.42.0

