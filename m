Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CF018E35F
	for <linux-doc@vger.kernel.org>; Thu, 12 Sep 2024 05:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726120564; cv=none; b=DMBHavpDb9xxUj4a6VgGizDgVV0ic/Kk1LxAi5dOMdOsrbcMmaACDGxbWEUr872QohBZOmtm05Puu+wRAbSlVEep/gRsd/RxziOSz6hQJOJN7bP/Hr4pljmCBGGfS95GsGLLVpUWdpre4AnuxO1rafNlILJ49DZkXD0TMgsUDcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726120564; c=relaxed/simple;
	bh=JFu+LGCqiNnapZxee6sXBtAHc3I5ntU7jWhjkky+nXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uqgktNSz9cS3z9tVbqF/4xHKnJTCf1mTFqvtpT3pCFkMyZHEmB8QBIZboApER1j1GLhKhBfCFvml7dj8Ew28vSGeM2HJ9yrC2W0EwIBGAEU2a9e/B1aSA68/lRSaTyeMdnEsN/3P4gNF4Ezt6eTU/4Up7WyK/7ToyQoL44DzqvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=XQID2+2i; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="XQID2+2i"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2054e22ce3fso6442385ad.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Sep 2024 22:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726120562; x=1726725362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSL6WjjHpdqYO1H/eXwGFHcRmPD/KtF7kVjlnnuCHwE=;
        b=XQID2+2iDlpDoWrxUm9TtXaBJZoIRu2TwsndyeKz3M/gJvUfR8NTYXkrhgZmLRj1Xe
         /GqpQl5jD3wiih/86Ij3Yq6A6oPm0IhzmfrjAcizor8R1CyFO8LziG12kXzHBm0VQhTp
         +VslEWtmNlGudHfScT4mUvsGsh68TT3IwWQn5yXA3K6uF/IRJMf9xkSN4SWTRbCQY9pL
         cNyy9qVAl3FjT3bXHLd5NuqsLF/ngQLzKDhFFBYFjU2pw0enpCswDOV1RC1O8oDbAwUs
         tlhFSLG3WskMEU1OcFFLkiNxKkwugDDCmc6avfnlNMTrlAzaCoj+rF2l2hmkqHDi+1bV
         N4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726120562; x=1726725362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSL6WjjHpdqYO1H/eXwGFHcRmPD/KtF7kVjlnnuCHwE=;
        b=KkOR1uZ2GIK4j3dS/FYoqSFm1GV+eExY1zlnMYbcOo/rQbBD47KcZ9yNEhbWpAnTDT
         PpIDFpfBbrW7LS9h8Q0H1VSEHK9zEWW2Ios2nIIrvtcc4h4Zr2OSH+JaPyvgM1+7nVo+
         7wXs45xT0WotAQ/gWym2Ppra4Oh22pblqpedP02qVYtYgd+/OAzMYNGGX+4JiW6qA5Tx
         EplAPp+LZkXxGUEfcgELgAj4e/H7NehX7OPnKitPrVgm6xcPqUYze4hB+fdCpfzSBBqq
         dfXbK1kmSgrveUaOQ61O1XPJGyZ+ceTJP8ygxIEHdpr9AjBrRI8LF7/LJwoNRXY2hovA
         UOYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzI4VHuE/utPjxSisuOi2bZPd80NYcAi8MkqViESy5lq9Z/OK5U7lKlvPwtz62jXl7P4GirEbcYHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOq5ubmruRj1bwCVz5zgfOiWzjSX66rnDqpA8oQVMlpzDUblQR
	wCPJGKn8QBj4qiqMf9/1/nhN3955Qg31IV9A1hjpYHOQwvuP9SegaJYqjeKW6FErDRRBewLeh+k
	N
X-Google-Smtp-Source: AGHT+IECLV4z5WDlwOdbMshxCcr9zLYBzDjXvcLIsnzDjItc5dYHcznYBe2fAYb+H9t8yei2s9bchw==
X-Received: by 2002:a17:902:e94d:b0:205:5f36:ffa0 with SMTP id d9443c01a7336-2076e393a75mr23890435ad.35.1726120562132;
        Wed, 11 Sep 2024 22:56:02 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe99b6sm7870465ad.209.2024.09.11.22.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 22:56:01 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 11 Sep 2024 22:55:16 -0700
Subject: [PATCH v10 08/14] riscv: Add xtheadvector instruction definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240911-xtheadvector-v10-8-8d3930091246@rivosinc.com>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1954; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=JFu+LGCqiNnapZxee6sXBtAHc3I5ntU7jWhjkky+nXI=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qjppjtbE1Gn1/GLT7Y32OjauP5VlT7/OyP+W09k2cLq
 n7awmDcUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwEQYyhj+Z6bdPced43yXUW6D
 orbittf5dpOX+Kz9zpP0a76w9fHN7Qz/dA4YC3+u/hnRdmNK36wKUf6il72pz5yflxyZyXomrly
 LDwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

xtheadvector uses different encodings than standard vector for
vsetvli and vector loads/stores. Write the instruction formats to be
used in assembly code.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/vendor_extensions/thead.h | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/thead.h b/arch/riscv/include/asm/vendor_extensions/thead.h
index 190c91e37e95..118aa0f82c82 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -19,4 +19,30 @@ void disable_xtheadvector(void);
 void disable_xtheadvector(void) { }
 #endif
 
+/* Extension specific helpers */
+
+/*
+ * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an older
+ * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
+ * vsetvli	t4, x0, e8, m8, d1
+ */
+#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
+#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
+
+/*
+ * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the same
+ * encoding as the standard vse8.v and vle8.v, compilers seem to optimize
+ * the call resulting in a different encoding and then using a value for
+ * the "mop" field that is not part of vector-0.7.1
+ * So encode specific variants for vstate_save and _restore.
+ */
+#define THEAD_VSB_V_V0T0		".long	0x02028027\n\t"
+#define THEAD_VSB_V_V8T0		".long	0x02028427\n\t"
+#define THEAD_VSB_V_V16T0		".long	0x02028827\n\t"
+#define THEAD_VSB_V_V24T0		".long	0x02028c27\n\t"
+#define THEAD_VLB_V_V0T0		".long	0x012028007\n\t"
+#define THEAD_VLB_V_V8T0		".long	0x012028407\n\t"
+#define THEAD_VLB_V_V16T0		".long	0x012028807\n\t"
+#define THEAD_VLB_V_V24T0		".long	0x012028c07\n\t"
+
 #endif

-- 
2.45.0

