Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519161E504
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 11:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="JwV/jeoR"
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A5AC9
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:26 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-406553f6976so17190305e9.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023165; x=1697627965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELrfmr7/+eL4h+O/hGMHN5n5h58B6vu8kUgBEeprKDM=;
        b=JwV/jeoRE8dXiEwdRSx01ibal7orBV/WcFAnPyz7D5Y/HBzKwGwfDbqrr07JeRe3cA
         gxWqDxydGrs7Fku6fkli/Rp19klM9dD5EfzZPlidAd/LV+SdSjJpgs/7dPh0eWikXKzD
         JIN3gZNnjtrWeEnSVFMpzJ0QCgcGPIoCZp8aH7Vxb+f9LQ/ASkH0JeCdCwFw1M0ydT0B
         v7im0MlJhGLIbSqXO/GQ9GQUGtWwKlkzmJd9voK8qiqnbuV/eIeyyBvh1y66J/61o+xt
         u0NUsKnJreqUM1yXVqP9yoHXZ2aADJSj+f7zf5+pC6XgzN0YTn5Muafwiqa4FAYTJzAZ
         G34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023165; x=1697627965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELrfmr7/+eL4h+O/hGMHN5n5h58B6vu8kUgBEeprKDM=;
        b=huTErrjZ/VQF7nVfur2jIszi8olFm4l55F36QFIXdQyzU1bRLvGPWzoj3WGFXve5av
         y+HSwWRDLvwHFzZDuRdizXpsVsn+A34ZIHx/40yDPJJ2fR+yz9vTK4i05lVOHhjKlpDz
         hvybnEif30pqfnGnNZjR90jcYXc3AS40gdRu53F6/yDcUi9WvsvZOPlCPAZ85LQyM4qX
         0X2YaxeMCLAx/IaFjM9aaIA5rUDdCdOc1x8+Eqfh+ktod916Maivx4xLzqbGkK7ADu7N
         ocH1TQu9lkq+DswqQWguappg2DIj9kJuZK40vwlVNCcWnaTaGUcD/5i7zidNTAlKYYHZ
         qlMw==
X-Gm-Message-State: AOJu0YxCPn9jnYtq1pYf/bDTQuvIweWPaV/0HBLhGVT6IpMDhXRlG2cv
	qiExwfSy7E01HFaD/zv4CvHsNQ==
X-Google-Smtp-Source: AGHT+IE2y/iGfOk9x0FcfGmLs9von/gSyi9IxV8X3T9o1LjNrBHKENRhq76JY7LxinEZmPIgMRylzA==
X-Received: by 2002:a05:600c:5114:b0:405:4127:f471 with SMTP id o20-20020a05600c511400b004054127f471mr18363952wms.1.1697023165036;
        Wed, 11 Oct 2023 04:19:25 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:24 -0700 (PDT)
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
Subject: [PATCH v1 11/13] riscv: add ISA extension probing for Zvfh[min]
Date: Wed, 11 Oct 2023 13:14:36 +0200
Message-ID: <20231011111438.909552-12-cleger@rivosinc.com>
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
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Add probing for Zvfh[min] ISA extension[1] which were ratified in
june 2023 around commit e2ccd0548d6c ("Remove draft warnings from
Zvfh[min]") in riscv-v-spec[2].

[1] https://drive.google.com/file/d/1_Yt60HGAf1r1hx7JnsIptw0sqkBd9BQ8/view
[2] https://github.com/riscv/riscv-v-spec/commits/e2ccd0548d6c

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 1f09b8b3da2a..ea141cfb8f9c 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -77,6 +77,8 @@
 #define RISCV_ISA_EXT_ZFH		59
 #define RISCV_ISA_EXT_ZFHMIN		60
 #define RISCV_ISA_EXT_ZIHINTNTL		61
+#define RISCV_ISA_EXT_ZVFH		62
+#define RISCV_ISA_EXT_ZVFHMIN		63
 
 #define RISCV_ISA_EXT_MAX		64
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 136e90263ba2..f17b9aca5fba 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -179,6 +179,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
 	__RISCV_ISA_EXT_DATA(zvbb, RISCV_ISA_EXT_ZVBB),
 	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
+	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
+	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
 	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
 	__RISCV_ISA_EXT_DATA(zvkg, RISCV_ISA_EXT_ZVKG),
 	__RISCV_ISA_EXT_DATA(zvkn, RISCV_ISA_EXT_ZVKN),
-- 
2.42.0

