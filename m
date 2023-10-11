Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF301E523
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 11:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="iVKe1O2h"
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D575B7
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:23 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-405e48d8e72so11541335e9.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023162; x=1697627962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPwBFtd40HLyGqXLen0KbaY9uN71oHhwHjqBqDa/Amo=;
        b=iVKe1O2hh6mtDRMq/avX8IsREhNQZ5Cd46lRcv874rzX8ZgNazQuovcQAkvFKrWeJB
         SJwjm7Qf+Q/WQpJN1R/vdugq3ScJCmVXe0pIDU7hyeYI7y6vQ+3QW0u6c5+8MY1EzpxB
         Dkeo/7YzS5VAgGvNKB8vTxB+D7j7mk4a6Fzhakl8bL8cPH/5k+7d2ACJYbJRM1ETm4zl
         wRzimPPCk7Mifj31I81F6wM9GQk4HAJfn8IZ6UItR0yjNOuCAwWeytbrPkFHgNspdMSZ
         ILmZedft4+YImQDIvmuyCUptiZFrcsLu9lG/mSph8lsAK5LUhPdf4tYCL4IEYQG07FME
         GmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023162; x=1697627962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPwBFtd40HLyGqXLen0KbaY9uN71oHhwHjqBqDa/Amo=;
        b=JaiK6AKwRwSpc3M3V+zTnOAsPoDchJkxVC86jNLGT+mvQQsPd6fMf1OhVGUM3gEGMH
         l3Z6TtwI3LgUowiucERA8Bq/88y2/4XSfc7Tq4PxmR1G22ZrHeMFVK1HFVzdcGnZYgn5
         Ay6ETo1rumF9yiqLugJCBJbFdUhLLCuoW0ucVUGftnAJJLZAOQSvp4hujhBtIsfvTVYY
         oRWgVohj0Rli2rMylBU6d4M+eqV2XClFoUiRoaPrINiPdoYCmM3gZ0s3bktPJAbh3NAX
         HRyvyrzfIS5BPfSaLEkFA+kA2D2hJBdFIRWgcsg342AtBiaWYDFOXIhaifpSXWdqka9C
         1NwA==
X-Gm-Message-State: AOJu0YzmY329ovE3kkuLRqPnm8aM0bY0LW2HbnhBbVuJOt+3f5q7SEyY
	opxP4IkAQE0blj5cQIhxxP3w9g==
X-Google-Smtp-Source: AGHT+IExnIHp9l/UnaTbrZ3Z3/Wvq+vo4xX0Z23oITLpc5cVbubkCxO0IQd8/NJP5tC/mEAiM4RIRw==
X-Received: by 2002:a05:600c:1d18:b0:404:72f9:d59a with SMTP id l24-20020a05600c1d1800b0040472f9d59amr18737359wms.0.1697023161691;
        Wed, 11 Oct 2023 04:19:21 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:21 -0700 (PDT)
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
Subject: [PATCH v1 08/13] riscv: add ISA extension probing for Zihintntl
Date: Wed, 11 Oct 2023 13:14:33 +0200
Message-ID: <20231011111438.909552-9-cleger@rivosinc.com>
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

Add probing for Zihintntl ISA extension[1] that was ratified in commit
0dc91f5 ("Zihintntl is ratified") in riscv-isa-manual[2].

[1] https://drive.google.com/file/d/13_wsN8YmRfH8YWysFyTX-DjTkCnBd9hj/view
[2] https://github.com/riscv/riscv-isa-manual/commit/0dc91f505e6d

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 35f00401afc8..1f09b8b3da2a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -76,6 +76,7 @@
 #define RISCV_ISA_EXT_ZVKT		58
 #define RISCV_ISA_EXT_ZFH		59
 #define RISCV_ISA_EXT_ZFHMIN		60
+#define RISCV_ISA_EXT_ZIHINTNTL		61
 
 #define RISCV_ISA_EXT_MAX		64
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 9ee7814641a4..136e90263ba2 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -169,6 +169,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
 	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
+	__RISCV_ISA_EXT_DATA(zihintntl, RISCV_ISA_EXT_ZIHINTNTL),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
-- 
2.42.0

