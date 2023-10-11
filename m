Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB19F1DFEA
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 11:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="paOaubDp"
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37137AF
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:16 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-406aaccb41dso18557855e9.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023154; x=1697627954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5dECHie5t7w/LFj+hSn2EZYYIuSxKSWdwgSHs3GrYQ=;
        b=paOaubDpSR+Z2YXae5A3aOp7dykvVsDwwtVI3IXsqZ3yl+3b5Lejk7TeZKU9Bk7oRq
         6mReQYe1T2S5mibvGYrut7fLqf9DhNtczvYVWS5OIVhxnSllWe4ogBwjHYvLsk8/V31a
         OrjKh3utE//AJQlQgDYtuT7l/GKkV78RTtmpMpCNTfmFMdGEGhuRZQwORPNJBv8RIZdR
         rsWGJhxBsQD5V+Kmi/WoI4CFMSeBDnAa28tBRxiVTnaCVwmY92nK4PDcUdcxLrHhlYOP
         7q44ySqZs5hnRKxgt/bWrGdCUsT6y2+CDuSFGWO3UugQuRDj4DLWMIYrns6XKoDMZu5K
         niqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023154; x=1697627954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5dECHie5t7w/LFj+hSn2EZYYIuSxKSWdwgSHs3GrYQ=;
        b=b6NZvXfxIk0pjutjfZTvRq2R7SnQTgZkKKtdBawASAYJcIMRVRvnMxX+ItJImsCIwc
         ROxlxHDS5MTSBlx2iN+GNr4u8UPwX1yVoZmrh456x03uTHKQA08Dp+ABiXs8/O4Aqn3r
         aBl+5dI2IOY2Z4cmegkCD/hr3mJNYQPsRxilnh0lB+U3hZyh8lumm9lanMoKN5yHgdoT
         lF+5wrbEWh1pu/zYEIhaPMYn1duqYYeLxcPD9wlyIsC/w5zJWwLoJpUMgLYVJnrckoOB
         9ps2vbHWP12/W3JtoQvwRv95mHcePPw8DrA/bsRWkVVrsEBIkTlabwyLhJME4ttIhACD
         Z4xQ==
X-Gm-Message-State: AOJu0YwCRIR1+/AUd9SEIXiMZacCKULP8LmtqEuxgmzqz70lk6dkA9pi
	5Bt6czHSWQqackZAx4YI6huNbQ==
X-Google-Smtp-Source: AGHT+IGqaMr2lbwiCk/m+ySyisBsIBIICm+Ha1304s+KwZsHP3G7Q7GtnKq3prSiP3Z7bET+xFCu8A==
X-Received: by 2002:a05:600c:214f:b0:406:513d:738f with SMTP id v15-20020a05600c214f00b00406513d738fmr18787352wml.2.1697023154659;
        Wed, 11 Oct 2023 04:19:14 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:14 -0700 (PDT)
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
Subject: [PATCH v1 01/13] riscv: fatorize hwprobe ISA extension reporting
Date: Wed, 11 Oct 2023 13:14:26 +0200
Message-ID: <20231011111438.909552-2-cleger@rivosinc.com>
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
	DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Factorize ISA extension reporting by using a macro rather than
copy/pasting extension names. This will allow adding new extensions more
easily.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/sys_riscv.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 473159b5f303..5ce593ce07a4 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -145,20 +145,18 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
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
+		} while (false)							\
+
+		CHECK_ISA_EXT(ZBA);
+		CHECK_ISA_EXT(ZBB);
+		CHECK_ISA_EXT(ZBS);
+#undef CHECK_ISA_EXT
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */
-- 
2.42.0

