Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407AF1487C5
	for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 16:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721405960; cv=none; b=lpERjnvMHNjMNUp5dqyBfi0B83fO0NQvSIn44oGN9HOOqWelByZc2yxlmcW/vex5MsFleny2+IfjXvr8dYdOMIqs9dHKYkcNBkLogk0BZJMP9+0TZzoz+R10t+/zk1Loi+qAmIJtNiwqC3Qk0pXL0nI9x24qspCFj02YkwQvsyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721405960; c=relaxed/simple;
	bh=/awdvkpT37Pcv9l+R6WHhK0Ytr8TrWH5wurC23dujZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gRGDmRbqEw9i26ZPw/ZMGtSVdnPDYB5UUiSuAGVfzyJcjXiw1WCyFf8tqydFLvcader/Tsew3KHVvowSe4RmHm0N7M1X7xem0aSAPb8pkTd60n5TeeNK7DOJl8LL8ZGtNzfDJ0c4EvfzDmxZXel5TdSWucssc7kyNMy9idtAr2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yPFtWxCG; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yPFtWxCG"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fd69e44596so4478755ad.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 09:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405957; x=1722010757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=yPFtWxCGAqlH3MxuCFadiTKWIvgSt8ptUQemtZBcXcrP0aXx2SkkDPCk3itxIhpFVE
         3wYR7Dr0H8o56tII0uo73kXblPfsdcFZfbZ06xi3cQ6YvV/N/R2gdoLpv+Aw98rsuv93
         ZQ4Vm+oFmeA9jcoUgSQZh5PSqgEODR+dE4sXNZfhSaympi1pn1ov7W+XFHtQScc+8s0o
         +Yknk9uL2tD2lLaV1Oe80tdEjSKRSEmd/Uo4clTgpLWwOxCP/oYljG9qLhrq2mTNCMrQ
         5IY19PIadlH+1sy0JlPuNYO1UTc3wt/RPXCZFxsCuyZWJgCT2fbeE/DHDKEeQ29B5aaW
         HxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405957; x=1722010757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=BiZMQcW9YDt2/HcHoTrCnznWa1dNM1FpcTslU12uqZ31lYQYuoxqnWFiBNYJfUxRIQ
         r9s/ITX3bAHTFW03LORwjItp31/VxMvLmX0JMLw2ieVhTVq9npdfRvwmaNQwj9iyG0Yp
         Fnexp4MBQE1Mt6/PsXGR0srHiqM+WMKmih2gde6kpWKIuDGesy/sxXWo+8dqQ1TSL2ZO
         bS+UQr/Y/9bfUsc613+GV/TYtqHq9FpmSlu9yxYK0nVwzroGzGXReRHv6+9jQ1VG8xca
         Sv6Hy7+pZjvklz35eF7gC+vOZ6vUXkUW1Tg7bWH56hf9pyQMLXsCkC3DhdXiJPDqUhF7
         H3pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOFy1nSKWJCl/OA5/4F/KwZMuA1tlt/Ms2Xu6XozKf+SvnVE3stauirZB8DqoLqBhDnVWoFoH/VXBc6YCydurD/iaCXTq+J4YV
X-Gm-Message-State: AOJu0YxwbU9UJFiSE4JyJFI+Nr99pLcFuSkqIMcrNCugv78qHpw1dlYU
	9M9y0bd7xH0C/dMtgNNnRWyfb64QgE2tGPxQcoezR5OE6k7xXzPj6Ldb9O6jjng=
X-Google-Smtp-Source: AGHT+IFPhJygvM7cOI2sFvOpJgwcTC6OzMCPu80xmtOCEp8XNQ6D5wygI1YJpk89nnaU6ND8ioVjQQ==
X-Received: by 2002:a17:902:e54e:b0:1fb:6e83:7cc5 with SMTP id d9443c01a7336-1fc5b58436dmr96085525ad.2.1721405956704;
        Fri, 19 Jul 2024 09:19:16 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f490dcbsm6461435ad.297.2024.07.19.09.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:19:16 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:19:02 -0700
Subject: [PATCH v5 07/13] riscv: csr: Add CSR encodings for
 CSR_VXRM/CSR_VXSAT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-xtheadvector-v5-7-4b485fc7d55f@rivosinc.com>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
In-Reply-To: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405940; l=1045;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/awdvkpT37Pcv9l+R6WHhK0Ytr8TrWH5wurC23dujZY=;
 b=V/PMHUAjK0OP/Y/zQ4VqwTikKOoyDyb7MFDrNBGQKWmByMekzQweSn5mpBoX7qu1LxbxT4AQ9
 wY71YtPGHNrA18pqy6FN6yA9i9xO/a7HH4WJHKJw5sFUp5DfL89Zut4
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
has an encoding of 0x9.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 3eeb07d73065..c0a60c4ed911 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -300,9 +300,14 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
-#define VCSR_VXRM_MASK			3
-#define VCSR_VXRM_SHIFT			1
-#define VCSR_VXSAT_MASK			1
+/* xtheadvector symbolic CSR names */
+#define CSR_VXSAT		0x9
+#define CSR_VXRM		0xa
+
+/* xtheadvector CSR masks */
+#define CSR_VXRM_MASK		3
+#define CSR_VXRM_SHIFT		1
+#define CSR_VXSAT_MASK		1
 
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150

-- 
2.44.0

