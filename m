Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFFF405DB
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 14:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="HBsLFE+r"
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32B611BCC
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:13:57 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-77773d3246aso14496685a.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971235; x=1700576035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhcCtOR2GZrdrPK8F2RJJNrJMtAQGPXOJeJBoGOeT7I=;
        b=HBsLFE+r07aglPpovHuOYS6UcCt5hTIo6KX0SVkBk8PYFWMxogNbsTW4tPzn/qUzbG
         hA7+ORL7dCyye1oqpkJcQLYGjfdUD0uxV4lv5Vizt1HkDqYH/rUJCb4yacwOcdpumFYW
         AHtjFEsruLOphHJSQRf2Nw1vBBt75SgkwfMUrX/a6hU7RtLWT4wIPGzbXFAoX4iR2Wee
         dxHTFx9mp6Mnr2EYsc8Vbg3frqWKaJ9Y7GC1Ad9bs+RpjwT30nu7K4RCxzcaUk8q7yVY
         g0QRb4/Eo8LrG71+o6B6Erk5hIWeYVAGkrzE0974YDTCIi8/Peg5HvXXl5c8akADe9X1
         uUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971235; x=1700576035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhcCtOR2GZrdrPK8F2RJJNrJMtAQGPXOJeJBoGOeT7I=;
        b=u75idHIXay6fU56sPIhtvbfbVQOtOWXI5Niv2rfif2qvQKkFu4lxuTKJovn9YD2LKQ
         tzduhPqlLQyU7hrZmA58pb4JTcDp4xK4Ukllg6p7hKrT8ISFQK4JmdxNObn3aKlARivf
         RW7U2p7Js+oYXTJ3ZW6ErU4NBVoP9AypAJ85sZXSC7/LIvtxKSHiEGwD6A8cuR5ItqSe
         r548pWwyaIEVzXWfCo0M2b4N6wKBZR7Zitskhddss3kqat7p0egaGcQ41lFv+UbSeDS3
         iyY5bfw5CMePf2RQSNAvfwJNyoTRxCFRW+B1U8h2tQb+iwohBhHDf7KPG1/ltcnLBEAK
         P2/w==
X-Gm-Message-State: AOJu0YzTE4cfVKUwt8CsmUDyy+qxRyBVVZ7MOm/T2nmwBlabcuajU1IY
	wvFjOeiO00gBQ4XmhK1yaZeZtg==
X-Google-Smtp-Source: AGHT+IHw6SoyZ+QahmzQ/8JDfKi56le+NNxYvZ8O/S2hYgiLZdXnFM9RxTYP4C4LF3pIviuj3zDP+A==
X-Received: by 2002:a05:620a:f12:b0:77b:d8aa:6755 with SMTP id v18-20020a05620a0f1200b0077bd8aa6755mr2516814qkl.3.1699971235353;
        Tue, 14 Nov 2023 06:13:55 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:54 -0800 (PST)
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
	Samuel Ortiz <sameo@rivosinc.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: [PATCH v4 18/20] riscv: add ISA extension parsing for Zfa
Date: Tue, 14 Nov 2023 09:12:54 -0500
Message-ID: <20231114141256.126749-19-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add parsing for Zfa ISA extension [1] which were ratified in commit
056b6ff467c7 ("Zfa is ratified") of riscv-isa-manual[2].

Link: https://drive.google.com/file/d/1VT6QIggpb59-8QRV266dEE4T8FZTxGq4/view [1]
Link: https://github.com/riscv/riscv-isa-manual/commits/056b6ff467c7 [2]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 103d4f0aaf15..2438d4685da6 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -83,6 +83,7 @@
 #define RISCV_ISA_EXT_ZIHINTNTL		68
 #define RISCV_ISA_EXT_ZVFH		69
 #define RISCV_ISA_EXT_ZVFHMIN		70
+#define RISCV_ISA_EXT_ZFA		71
 
 #define RISCV_ISA_EXT_MAX		128
 #define RISCV_ISA_EXT_INVALID		U32_MAX
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 623a5fa48cf4..dc0ab3e97cd2 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -259,6 +259,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintntl, RISCV_ISA_EXT_ZIHINTNTL),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
+	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
 	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
 	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
 	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
-- 
2.42.0

