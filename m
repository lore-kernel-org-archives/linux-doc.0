Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dbtjg5ig"
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB8A123
	for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 03:33:21 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40c495ab68cso5702015e9.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 03:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702467200; x=1703072000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSyk12PGgNh6ZiEbOULW7RPQKbPPPMGsxhdUj3Rl3fw=;
        b=dbtjg5igt6+QL9XNlD/CQQCAi//+3rRvDDG38AGTrAOAa0XN62sUZZqJ10vWn+Flse
         zhVGcViymdSlnPN6dlESEmSqtcehaYdIHP5d8cskhCTqDxWc5Hne1KbRbVsUGTnme46b
         UzeZDJ2Y8bruodbRbH0jTdqYXLN5Udz0nXyj7pjBIZo1guCRs7+AQ+eKZPGbk8cKH0Zj
         bxZlzRmMh1qi0IA+5BsNhinM6pM150LVihzoIz5xZNtrREOdGlYGuupJbbtBgCyDYZmy
         AQVP7T+AqDBJA41f4UpCqxumXT84rSJfON6c3v5eQWwJl4kRvPTS+SPZrMZyKQKEflWR
         hxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467200; x=1703072000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSyk12PGgNh6ZiEbOULW7RPQKbPPPMGsxhdUj3Rl3fw=;
        b=MRlhGaluR0fUTvtX8sT5fi0tEqK5qnyhRH81IjWGkhefd/JS7xa+H81lBslHAat924
         Z73dxQnkFZaBgw3AmQePsWtUXVoY7W0WWIv27tmqBSfg9s+x0pTrfN92ax1kjvvOmpG7
         C0nNtoOZqhCUs++a5GYW2FHLrX/XaByzZoc3I/nosaIMh09ebb7nwMsmHwwupwM+xrhZ
         o8ipT8sd5zqtIHyEYxo58V8OdrCbzVgB1wx3WxljWE2hWxK/9rjXa/QzxN918uiY0IKG
         FCr0IPPVk8ABBK5O1qser+Aj1eGf3AYXHWDHGFrT0LZvJIAiJPBPuOv9LT3i3NyBHhg3
         QmcQ==
X-Gm-Message-State: AOJu0YzBX98PuFKKDlmp4NhA+H3C8CCp/SzIcioit9my1tsghEBQLUxB
	QzD6yV+3Esn1aLlyZG3g9LS8FVZHvST7Tq08Fbg=
X-Google-Smtp-Source: AGHT+IGpaCx+D5ojXDBVQxpZqQUYiYfjlRdA9ehLOCWbM5XAh+lwFxnI5yxd/Hyl3z3Rfp/Vdi/pXA==
X-Received: by 2002:a05:600c:3b23:b0:40c:2631:7c3d with SMTP id m35-20020a05600c3b2300b0040c26317c3dmr9593738wms.2.1702467199960;
        Wed, 13 Dec 2023 03:33:19 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:c564:f167:d072:5672])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm22433137wms.30.2023.12.13.03.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:33:19 -0800 (PST)
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
Subject: [PATCH 7/9] riscv: add ISA extension parsing for Zacas
Date: Wed, 13 Dec 2023 12:33:03 +0100
Message-ID: <20231213113308.133176-8-cleger@rivosinc.com>
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

Add parsing for Zacas ISA extension which was ratified recently in the
riscv-zacas manual.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 016faa08c8ba..8aee032f092f 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -86,6 +86,7 @@
 #define RISCV_ISA_EXT_ZFA		71
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZAM		73
+#define RISCV_ISA_EXT_ZACAS		74
 
 #define RISCV_ISA_EXT_MAX		128
 #define RISCV_ISA_EXT_INVALID		U32_MAX
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index e999320398b7..62443cd632b8 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -259,6 +259,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintntl, RISCV_ISA_EXT_ZIHINTNTL),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
+	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
 	__RISCV_ISA_EXT_DATA(zam, RISCV_ISA_EXT_ZAM),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
 	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
-- 
2.43.0

