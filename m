Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE3C42C13
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="uyB2M5R+"
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24BDDF9
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:29 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-406aaccb41dso18299145e9.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548528; x=1698153328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsST45qXCpXW6hXAZjZQAx82ZOViPLGcbU4pTeMM644=;
        b=uyB2M5R+DJ/rHyT6Pmb69lo81ITr7UvFocveAU7syQsTuFPZxtnivmU/7djjdH/e6y
         jqgjPATS5uES8wvBOPABCuOv4f/R+zRAN3MdNnMzTncivzd5IZH+DqPJjLzjIdcoe7Ba
         /oa7xLRjmNZHwV6KbrMMXEJFfO8mj1Qrikef9zh4o1Zwe0Dxxm28SpQXViBtQNm3S+sW
         H11nLtitzYJ9AuozwHdAWW7oC9/9zQWJXRRIkqj0iR+GscKQSF/kVuux8aCcvsdpeZvW
         yjHjr54HHK8XFYFurSGbMdcwOtOOTcWJly8QKti6dxieiw8Oo+GiIzxiAww27Rtnjbua
         EthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548528; x=1698153328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsST45qXCpXW6hXAZjZQAx82ZOViPLGcbU4pTeMM644=;
        b=ByV10AmfO3EdMTgRLdLGKcp83OqURdC4J16S8JqsHJK9JQloZo6jxHKzgFSz+xlQuc
         yP/f6Xot/Wv60wB51vYpwOy4ckGKwcV+wiz3lXBMEzU/zsgXtddcDZGhNBVWSoQwaQxY
         /1iGLOaZY2YeSwE66RDmExZL44ATsn6XEWkVEwmK0+enMLpAmz4JWZLm+7Eo7SgHR/Zv
         7RQ0IHGH75UGI/yPO1Tl2K9IOstam9vC0ogUOWTCsuZURV7xe5HNugazneT3s6J+FHKf
         nUChPoVEJnvYZhFEa3AUCr9ya3VTt17Jv0klDKR2LyxHE9hKBZiiRd2IKEl50eqx4xqq
         6fpw==
X-Gm-Message-State: AOJu0YyqASlTe0mLbZgleHrawLkGtgpAh7jCdwU6hAB4D5Okucr1npNZ
	iVxXStVTmiK21X8NEhBZbPSDYg==
X-Google-Smtp-Source: AGHT+IFnvMoT3qyr2NCLvQJOx6T+CGM+XTBB3O4jbC4CPq2HYp9VCIzFJSZf5tnuM4q6zh/FfvWWOA==
X-Received: by 2002:a05:600c:4f88:b0:405:3cc1:e115 with SMTP id n8-20020a05600c4f8800b004053cc1e115mr1603989wmq.3.1697548527550;
        Tue, 17 Oct 2023 06:15:27 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:26 -0700 (PDT)
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
Subject: [PATCH v2 01/19] riscv: hwprobe: factorize hwprobe ISA extension reporting
Date: Tue, 17 Oct 2023 15:14:38 +0200
Message-ID: <20231017131456.2053396-2-cleger@rivosinc.com>
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

Factorize ISA extension reporting by using a macro rather than
copy/pasting extension names. This will allow adding new extensions more
easily.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/sys_riscv.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 473159b5f303..e207874e686e 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -145,20 +145,24 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	for_each_cpu(cpu, cpus) {
 		struct riscv_isainfo *isainfo = &hart_isa[cpu];
 
-		if (riscv_isa_extension_available(isainfo->isa, ZBA))
-			pair->value |= RISCV_HWPROBE_EXT_ZBA;
-		else
-			missing |= RISCV_HWPROBE_EXT_ZBA;
-
-		if (riscv_isa_extension_available(isainfo->isa, ZBB))
-			pair->value |= RISCV_HWPROBE_EXT_ZBB;
-		else
-			missing |= RISCV_HWPROBE_EXT_ZBB;
-
-		if (riscv_isa_extension_available(isainfo->isa, ZBS))
-			pair->value |= RISCV_HWPROBE_EXT_ZBS;
-		else
-			missing |= RISCV_HWPROBE_EXT_ZBS;
+#define CHECK_ISA_EXT(__ext)							\
+		do {								\
+			if (riscv_isa_extension_available(isainfo->isa, __ext))	\
+				pair->value |= RISCV_HWPROBE_EXT_##__ext;	\
+			else							\
+				missing |= RISCV_HWPROBE_EXT_##__ext;		\
+		} while (false)
+
+		/*
+		 * Only use CHECK_ISA_EXT() for extensions which can be exposed
+		 * to userspace, regardless of the kernel's configuration, as no
+		 * other checks, besides presence in the hart_isa bitmap, are
+		 * made.
+		 */
+		CHECK_ISA_EXT(ZBA);
+		CHECK_ISA_EXT(ZBB);
+		CHECK_ISA_EXT(ZBS);
+#undef CHECK_ISA_EXT
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */
-- 
2.42.0

