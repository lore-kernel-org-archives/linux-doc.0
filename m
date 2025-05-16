Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8B825E833
	for <linux-doc@vger.kernel.org>; Fri, 16 May 2025 03:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364756; cv=none; b=o3fzlrmr1M0la05ENBkFuG2bVacsrdJLgA+0RdFPaP/F0XQfUGgvMsGiqtdHAP7C2Y2E3yB3YPRVKdnlVxtk8F6r/QzOXlRCgZ2BGSITp2MB2LJvOqInubLB0uNn1NmJzRXgs/4qaBbOvwV/gxh3dFlSkAMCE1S+9xgOaPX9G5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364756; c=relaxed/simple;
	bh=jwzybOogsnpwjXZfW60XYhy2TYjkOLviZX+I0L3/c8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JuJgb98n8obrJln5WJLR2iLGThjg2ZX7izWRwX7zkouRIkHDGhO6ghcrybFiTGoeLujKbLHEzMa2hq0fJVBQrvQLEBLTrZ3RKhmGjtjMizqv3cY/DNd0nyCGtfRXv/mb/Yhwg1+9KAkEl28FWX1yiXVJtgLme/5m7mA0P7EOkOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=SwixV3/Z; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SwixV3/Z"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22c33677183so15632915ad.2
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 20:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364754; x=1747969554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9SYuNTu0FAVFrwp78RXEvkkHj//qONU+zmTxNF3YZI=;
        b=SwixV3/ZbIl+Jer0vLp9EoYWI2T1isFyt7iIoO4YYKa+QLeEaddwfUXAS3JMKGDnUp
         MRykxpF/WPkjVaJjLUM2IkFo5SCfEYSeEeTgkvJvRbWevR+sRa/KS5lLIAqljlTHC7nQ
         FmBc8DBgJEm0ziw7wfTH4k+FIR27qTYampFkQyVutF/79K7s7PwwScme5SGmF4jkgbeQ
         qeuFGovK3PMLgaiTmkGdwCh+sgmBvCLjrUe6OWRsLx/f3lRzMCoUbFhmjYzUt5O6w4+m
         D6rgtK5I4e0lI3AKDkZLoI7zgHbPKTqi4YRd2tVcu/jdh+WU4QkhRxxwGliFX/0QpYVF
         lLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364754; x=1747969554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9SYuNTu0FAVFrwp78RXEvkkHj//qONU+zmTxNF3YZI=;
        b=LLGbaGhuGe0R8kOkr9BWIOSyKiFMXhVLyhcK5pRGra6FgXGMRZXGE3I9TCAgmDO3Qv
         wrxS87lTio/R1pfRXbOc5Cx2CUMNWV5kR0YuTMhpDz0yv46Djhu66fojBOG3PMWZM6sy
         5M0jYqbtVG6cqTbrKPkpuE5W/bWu8C/WGbfuStvJ4MGL7Z6Mj2Wuci1FRFhlpyQPQdny
         O0XwdC7unI9nJNt0Dqjnn6OjTRrCjuw5y8UnyA1hSsdt9H8QDiGTbr3sX+l4Ogo5Q9kr
         mnc8sfq5fY6y3qtEg/dK/iDUWJaRoLwVqvXHUSuthhJ/IdAEGh7N+IuoBlj9CvSPOjOS
         EMcw==
X-Gm-Message-State: AOJu0YwJAnvan5w/VR1YzhrLcGGc5AHtq6RFeS4ZrlnTA41MfQ6zZiM9
	P3+ZTM/hUgygijrq25+6+6CL30X3dkPVyV7jBNaY31fiMMtsYFp7VqNY5Zp3tbMOz2U=
X-Gm-Gg: ASbGncvbXwsiLaKaTPMrnQzQ8nL9TfTffvH2C2UGosMEDukDtx7uOaKfuE5Y8XCoEAC
	vEW3YMzqYadX6qBIY7IPqKKjpvg0Bqdy4XjcqPopcgpYS5ZHe6ZvCaFl09ru8CA24/vRhpUrCYE
	UH90L+Ug7YDI7iV9N21c7jeRvl3n9KiVu5k+xn2w05EZUV+8lSFv+huL6Hh1ORwxxud9efFa18C
	5xFLkyH3LYLTeBS+d1hWOwijGr7cp5ptnPllUVdaiCjApJI+ZPqqhEQ7xw78jEatTJaBg9Gohd3
	t+7AwhzVRHGLmSp3+ELO7LmlguCNH5rmXsa1/y19iYuO6YQRLcm/maITSCfjolF9Cc/gHibCBWo
	nGWqhbb+KlfE=
X-Google-Smtp-Source: AGHT+IEZ2ronJfVBYw0CNofcDTNPNdTruhtwvA5nHbntYV+GYPIfnd+sdXjNknRMWd6vX6/qWCPU7A==
X-Received: by 2002:a17:902:e786:b0:231:d143:746c with SMTP id d9443c01a7336-231de3ada00mr9814335ad.39.1747364754532;
        Thu, 15 May 2025 20:05:54 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:53 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH v2 06/12] riscv: Add SiFive xsfvfnrclipxfqf vendor extension
Date: Fri, 16 May 2025 11:03:04 +0800
Message-Id: <20250516030310.16950-7-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SiFive vendor extension "xsfvfnrclipxfqf" support to the kernel.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/asm/vendor_extensions/sifive.h | 1 +
 arch/riscv/kernel/vendor_extensions/sifive.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/sifive.h b/arch/riscv/include/asm/vendor_extensions/sifive.h
index 608004250e2e..2d05e3e73170 100644
--- a/arch/riscv/include/asm/vendor_extensions/sifive.h
+++ b/arch/riscv/include/asm/vendor_extensions/sifive.h
@@ -8,6 +8,7 @@
 
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD		0
 #define RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ		1
+#define RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF		2
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_sifive;
 
diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/kernel/vendor_extensions/sifive.c
index 6042cc3021de..9376e1ce133a 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive.c
@@ -9,6 +9,7 @@
 
 /* All SiFive vendor extensions supported in Linux */
 static const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
+	__RISCV_ISA_EXT_DATA(xsfvfnrclipxfqf, RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
 	__RISCV_ISA_EXT_DATA(xsfvqmaccqoq, RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ),
 };
-- 
2.39.5 (Apple Git-154)

