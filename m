Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C432C2D02E
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 10:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="vPmItZM7"
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C091D78
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 02:56:18 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c6f4bc7738so11205181fa.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Nov 2023 02:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354577; x=1699959377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4s/6qoHBJWx8IDkipxLTMx5qIdSuDP9Fhxnx/OaR4U=;
        b=vPmItZM7nGGK6tzGcRAfDMCs8+OzzYEq9jsUudufmqf1/Wu5Edle1cnt3fIZ0F6XRz
         HLtyB92zp8Ol8LNLrEmHEhxS63jSEpLZkLrVH8oY2EBcpzHun4F+OCvM+yZxi6FnpAnC
         fGCNLBNI6Ka0hhwfeQtBjkT7S8IhtB4nCeWQa46bCCaIY6wLTeJGpnYkm/EOX3DRa1jS
         f2SlStsC+PrN0/AoK3gkVFndmljVuCWeK9/R721y8YXbTkdbAK5pBoOouqEHTsRcILyn
         6TF6creSbONg4plKxqYvYZpqOOBQ1M32FA2bITa91nEBIUKyicOA1gb2CvKHrM9HupcG
         448w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354577; x=1699959377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4s/6qoHBJWx8IDkipxLTMx5qIdSuDP9Fhxnx/OaR4U=;
        b=gCHQxQMGzybOzXRcKH9/m+LV+XqrjZ6jRbR7Rfp9vt/pFjdPY2xmqajIfhK6fI04Jb
         5ShfiKcPODICgStAZtxqj21I3Js70OThuDnUZASHIywxtTqbTUan3+Dg5xOjyyFzd1gc
         rbcs9HbDmhhP0xqjt2tNtorgEyau5mZPshAMEGiqIGtaXZRDm0WSitir+rn4K7ruP1sM
         7sUKLJIi5zWjiO6WmggR5+XrlxRwzh0wGH1Mt0yWUvIW/9qwWiD9BZPtseNJS85W1VnW
         QR9XPPGTWTxirYj+8+28t6Rk5qHVqk18zZu5GUfmYH7vsCx9c9nL7pwJ4Z3Do0TwSYZp
         IHHA==
X-Gm-Message-State: AOJu0YxE+xbn+X3CCWvQTofKecTE0Y+lJUB8NwlDyV6jHHophrjMvOlk
	XfxR/ntZ+CQzDEp6L54KENlkwg==
X-Google-Smtp-Source: AGHT+IHavrKs5gCTfWWE/t+GviSN/fOuRjyg21bPxGHplb1KOZPOkEuhUgKCY8nRPYJZqATj3n1jgw==
X-Received: by 2002:a2e:9f10:0:b0:2c5:6ab:b817 with SMTP id u16-20020a2e9f10000000b002c506abb817mr22837219ljk.5.1699354576498;
        Tue, 07 Nov 2023 02:56:16 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:15 -0800 (PST)
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
Subject: [PATCH v3 13/20] riscv: hwprobe: export Zhintntl ISA extension
Date: Tue,  7 Nov 2023 11:55:49 +0100
Message-ID: <20231107105556.517187-14-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Export Zihintntl extension[1] through hwprobe.

Link: https://drive.google.com/file/d/13_wsN8YmRfH8YWysFyTX-DjTkCnBd9hj/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 3 +++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_riscv.c         | 1 +
 3 files changed, 5 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index ce0490e3130c..2f37b26d27da 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -143,6 +143,9 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZFHMIN`: The Zfhmin extension version 1.0 is
        supported as defined in the RISC-V ISA manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZIHINTNTL`: The Zihintntl extension version 1.0
+       is supported as defined in the RISC-V ISA manual.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 12680081c602..36c8d073c987 100644
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
index 486e053a0797..af2b01b0a5b6 100644
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

