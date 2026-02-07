Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5072E5B1B
	for <linux-doc@vger.kernel.org>; Sat,  7 Feb 2026 10:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770460095; cv=none; b=Od+yof+iKbMHrmN3u9caIY5nsnKOsc3o529b2Cn933aHHqqv+O1H31qx+qUNlppnhoe9R5RrRb7SyfsKKpceRYfkKTYaxJe6CPIw9m2OELTuEps5+Rb+xxNsyJ1ibtqBr3sc4lbBqo7d/rpgrUUsCpyFILNPy91Kgmu0R8oXp7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770460095; c=relaxed/simple;
	bh=5V0QGf2MjOww2cVLhP0KhWCW2XLFBbJEF2ikoNQl3Fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gRJlTG2D8jFDpx+LouI6TYsi2fHkKPOzEwfwFUl6FOmQ2u7+thRhWU3lbleUQfkoATl4DW5mvdIMLKRNWQG/NP9FlhPwkUwoxTsEsEoPTw8Tmnmp9d4xo4a3zjBZdNIRd1jkLLGuWL03w+QlsVNojYfEo7eCV0hBzHNlickGNVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KYC5h0kw; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KYC5h0kw"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a09757004cso25521525ad.3
        for <linux-doc@vger.kernel.org>; Sat, 07 Feb 2026 02:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460095; x=1771064895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUoy8LcMVnmchqzfZX24FgqMVeTS5IEuCIGnQQzaKiQ=;
        b=KYC5h0kwWxPakVXIAYgNULmg51GkUt2DruLhsMESjh03SS3KA0BbtsMPADEOkkRHco
         lT62m7RAcybw/54VCyJW+9ZsDvA7dr8KTGGzyHhHxfiPysqBz8kaRA5jdp5JOuBzMLyO
         1aPdBccK0f3645591YAt9Yq+Jl6P4aaW7xYf2tghUUsi1zXRE5MWvR5vGooW8A8GOF98
         MpmKL+av1oiWyknDD5D/ukPAUobMcjNtq+t/AtxbC3Wb4lfgW6/xkzQ81VROmmYJWORd
         NKyZCPsPcTbip0T+gP4iEtRiHUbpGypckgycCNqu0+atAy+CoWLBmC1k6J0Ez49qwr4M
         S4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460095; x=1771064895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MUoy8LcMVnmchqzfZX24FgqMVeTS5IEuCIGnQQzaKiQ=;
        b=vAZdrDkf2c7ZhIpytSXmCxSc3KsO03lQ00YPcK6YksePqd/JTD3YGrKwY/f4IdJ4a1
         291iHlk2fUYwGp8vioH2M4BKtMA0EpLeB3eoAUnVsEFNbTjPoS5I88173zPEoSAx1XIR
         I3Y6izR6V/vcYdksa9ggwEB5d7aR89x3Jji4sxs2ymFdh0q6pHtTQcJ92geHUL7ilfXv
         l/u7VR0Cev2+pByxIlf6WFfXmZPtAVAPtqrip5IZZcE2niLslEa4xs3QJax0O257F095
         SyolAqhSE/+aS34NlaM/Ec6OgJoRcjG9uZ+kATeyOusSmm4g1VoKOnoily4w5TWysCsv
         8SOw==
X-Forwarded-Encrypted: i=1; AJvYcCVC8joYKu9VUHuReQ4X62e1ShNhX8rhTMXXHbjtw/YVVnekAILl5LN8we7cC35X8ZHDLi+geunML2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC4tFWrBwm1x3O7nkOJPHjwL5zjU03X6Vu0bUGhpM2kh4xwqVA
	tcFWUxEv+4VuOKvX4d/Z+XPtMSEBzXL2RLnOqwns7s8cZ7Xtirvu1qpUTgWswTkFj6Q=
X-Gm-Gg: AZuq6aJ8+U8RCaDM1QBC2qk2K8kBz7zeP5WB5oRPAr1T9WUUyS8o3GWpApgSGtjHKo0
	py2LVkRBUVRFBrPqeJkLUnCEy+qjM0NFa0ut1Cl0Oc0ivgo3ZCsEFwlRihA4NW+moZ5P0NpX4Ru
	UNmUecnRNx9570daFukMq6MXqGOEhO27pI51azNjm80/YDsdYF1JYAKJEM6qzJe4L1vyUV2LvkN
	8rpRAQcsOIjMZtJETxZwwTpTc3xcKgdwFD3Nr5BA39Ez/NUXL/0RKD3rovA5y2pzgkCr8izYli6
	mrdkdue+iyiUt8grih4T43yASO5q+c5rCKIAAxh9Zj8bwC6qEOOg9F87DFT1/Tk68BbtdO0nght
	pg5r/E1K/mg1a2IneHkZfDnvWs9A7AUrZQBl3bAzEc1y0Izes6Xs60QAquDvM/3Oe0CZI+LLzlL
	xkW0GX0f5t6AFKPyTysvse1uFMWb0HzJG8UGqC6FI0EYWIlMm3MgtckA==
X-Received: by 2002:a17:903:3885:b0:2a9:327f:aa31 with SMTP id d9443c01a7336-2a951631db5mr50298215ad.21.1770460094619;
        Sat, 07 Feb 2026 02:28:14 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:14 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 07 Feb 2026 18:27:55 +0800
Subject: [PATCH 1/8] riscv: cpufeature: Add parsing for B
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-isa-ext-parse-export-v1-1-a64d3a8bc20a@riscstar.com>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
In-Reply-To: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

The B extension comprises the Zba, Zbb, and Zbs extensions, as defined
by version 20240411 of the RISC-V Instruction Set Manual Volume I
Unprivileged Architecture.

Add B as a superset extension so that when "b" is encountered in the ISA
string or devicetree, its sub-extensions are automatically enabled.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/include/asm/hwcap.h |  1 +
 arch/riscv/kernel/cpufeature.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index aa2af21f3bd32573558e964f94b32f9739f4c89f..35e87e4a8475a9201e84e7f9f8a4d10dfd9e4759 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -11,6 +11,7 @@
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_a		('a' - 'a')
+#define RISCV_ISA_EXT_b		('b' - 'a')
 #define RISCV_ISA_EXT_c		('c' - 'a')
 #define RISCV_ISA_EXT_d		('d' - 'a')
 #define RISCV_ISA_EXT_f		('f' - 'a')
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 63ad6393b2c6dcbfd6e7e247cf4bacb6c11fe58e..3d3af82a53250f29204a3fb138feaf520a878d0e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -480,6 +480,15 @@ static const unsigned int riscv_supm_exts[] = {
 	RISCV_ISA_EXT_SUPM
 };
 
+/*
+ * The B extension comprises Zba, Zbb, and Zbs.
+ */
+static const unsigned int riscv_b_exts[] = {
+	RISCV_ISA_EXT_ZBA,
+	RISCV_ISA_EXT_ZBB,
+	RISCV_ISA_EXT_ZBS,
+};
+
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
  * Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged ISA
@@ -528,6 +537,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_d, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_b, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),

-- 
2.43.0

