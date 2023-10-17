Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B79842C13
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 13:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="jkN1Ogm7"
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001D0FE
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:40 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c51774da07so6838091fa.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 06:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548539; x=1698153339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1rHWB6wPm7iXDYEGbhbD+aT0XqxKs0nvsJfpQIGqGo=;
        b=jkN1Ogm7S6sQdClJBzy0QES9thVqUxfXiF9F2SYGnmanBU5tfPG36FJg87aAKWukLe
         5wypRc07Igqnye9M3t62M/ZsFIl5QU/PBpVHshXKdMoMwznzg3m6FkqCWlAwVGyJYOgV
         m9z0vwpYu1U94jVUN8FcJRvHPqe9TOpTGDFFb4eLcw41eOw3WHbl6Y0WK+/7e3n139Zk
         7Zr54o1ds4x11TzFOy4OeFn50kKQsmZZzSCscD6/ra9L9H2+x80Huqzcx6gIS2l4PS0v
         dY79f0SevdFzRBrpvdznCEyLORMkf+DQWnag4MT1fb/MTOYjuj1yt63O+7UzHMEHl4Ls
         PnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548539; x=1698153339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1rHWB6wPm7iXDYEGbhbD+aT0XqxKs0nvsJfpQIGqGo=;
        b=u+nMIyCE5iwTuJWlPHkNkIBYGkGOpCsHTQ22b87agIPzgqF9MJFKDPSWRNONRm+1Mk
         fZCiXXy8y37nrTkzar01pb3LrVSpW3KUYkQHwdIM/+G8nx8KdpP95lpX6CXRn1qFzG6e
         AK5yABrpBGuE0RVlrBn97s0QWkZOOEiKEYLQRti5TtFt3BlPJNgvjIBNOC4D/2/l3BNV
         ebg3iA5xO/3DQDrrWbHxTp6py/OAPfBItnHlRpBro/qjdloLb582SRJt22P40zuk66H1
         Cjk24slyZH1uKUgstZK392sh920u8MymP9KN8zg+9AqVZmZ1EurrtMbWGtfZkkVCo2NM
         3TvQ==
X-Gm-Message-State: AOJu0YwCQZeyIICDXDZKJZgE0h9b/sm9a4Ej7URpOE7P/MwB1kGgQtXs
	i4PgW5ZXl8btTfrFb8lEHUd0J9IJECaOunq3DxzhwA==
X-Google-Smtp-Source: AGHT+IE8o+inTRSVUnhN0nXkjkUhZnyVP1Kvn8PbG9YD2TzCATvewF2se7oUMFMIdsxNUL5t0bXQaA==
X-Received: by 2002:a2e:9b4b:0:b0:2b9:e10b:a511 with SMTP id o11-20020a2e9b4b000000b002b9e10ba511mr1660431ljj.0.1697548538766;
        Tue, 17 Oct 2023 06:15:38 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:37 -0700 (PDT)
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
Subject: [PATCH v2 12/19] riscv: hwprobe: export Zhintntl ISA extension
Date: Tue, 17 Oct 2023 15:14:49 +0200
Message-ID: <20231017131456.2053396-13-cleger@rivosinc.com>
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
	DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Export Zihintntl extension[1] through hwprobe.

Link: https://drive.google.com/file/d/13_wsN8YmRfH8YWysFyTX-DjTkCnBd9hj/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/riscv/hwprobe.rst       | 3 +++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_riscv.c         | 1 +
 3 files changed, 5 insertions(+)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 35aedfff5049..9c909e0d5316 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -143,6 +143,9 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZFHMIN`: The Zfhmin extension version 1.0 is
        supported as defined in the RISC-V ISA manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZIHINTNTL`: The Zihintntl extension version 1.0
+       is supported as defined in the RISC-V ISA manual.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 390805c49674..dc4eaa978ad1 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -51,6 +51,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZVKT		(1 << 25)
 #define		RISCV_HWPROBE_EXT_ZFH		(1 << 26)
 #define		RISCV_HWPROBE_EXT_ZFHMIN	(1 << 27)
+#define		RISCV_HWPROBE_EXT_ZIHINTNTL	(1 << 28)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 4cca8b982a7a..84daaf6ed4a1 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -172,6 +172,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		CHECK_ISA_EXT(ZKSED);
 		CHECK_ISA_EXT(ZKSH);
 		CHECK_ISA_EXT(ZKT);
+		CHECK_ISA_EXT(ZIHINTNTL);
 
 		if (has_vector()) {
 			CHECK_ISA_EXT(ZVBB);
-- 
2.42.0

