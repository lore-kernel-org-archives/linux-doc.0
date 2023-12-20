Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0098745C09
	for <linux-doc@vger.kernel.org>; Wed, 20 Dec 2023 15:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Z6iYwN3I"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3364bfc850fso315487f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 20 Dec 2023 07:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703087864; x=1703692664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZT3AkmSaqumQ97ecuZBaz7B+rLb1J+xdw7pERlw1ck=;
        b=Z6iYwN3I37Qg/yMkxLLrsXU9Lc6aPdB6HSwmf6Sj+FcrCaOyiRLYpRlSyzDWEit8GD
         PfKcIJ4IIXvs2Kt/TvtH/u0xhg7dkXkvnqV98aSqRY02e40zClOqAIIw0klXQB13Hjh/
         /4tYyNCyfrq1IgHA6E8+G8dLUH/dIDySzFVYNKW48hxXNaRIK/R5jvph7qASCEJduP0W
         4hgHwPb6C/z2yy7SoOKw5iSdfXjxTg8Ev+p0M2BxrrDc0tFV/4EAJk4/csXZBCH0Tjmt
         iaMLIGKxwYXrh0JPQk4+Xm7BL7DZgOQYgvHWAd2dj9xKhkzopmF/CwGVlF8CBiyQj0/X
         KNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703087864; x=1703692664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZT3AkmSaqumQ97ecuZBaz7B+rLb1J+xdw7pERlw1ck=;
        b=eaLCk8YMkDfAC+6Ee7g9ZX4HPtzdqJss2oVliYFWHvI0+ZUNZNByCGpsjZPmbO5yai
         XNyH+W2ibQ259ZIUjwicyPNPYxr38sIhZiQynpKf+usDLHEw78Q93OxiULflp0qDZ/Lp
         OpwL6m3dlqyeISxGQjfE+Mz5yARNrMFg59YVnwMD8Rv3aNOTfbWZ8Va/6aWkFfQ5krXs
         NmHtQ1szidFV0S80gTiVmt8GMA5egUcYVNUPgFxOfZll0Q+GzGNdAAUkBPwyge0kp0CD
         L/y5TBBCi60QlmiE4Ccvb0EdTX4NSj5VuE9XJX0RkgspesM2hAsSrp2HwC2GX/2nQR69
         bM8w==
X-Gm-Message-State: AOJu0Ywje319L6rmh+E80R/JvjOmk9+H7tfq4i76CLMEXaXl23uy6w+S
	glamf6iO3ng/SUoPCe7riMm+Voi0uLWpOkN/dQx+OQ==
X-Google-Smtp-Source: AGHT+IEAqrHN3Za66t0NZjui8EhChki4mQcTMIh6RZgm58ClLt3lfkny0M8iVRzoKzGcB9ZORNH4uw==
X-Received: by 2002:a05:6000:18c9:b0:336:5c96:a3c7 with SMTP id w9-20020a05600018c900b003365c96a3c7mr7715482wrq.0.1703087864600;
        Wed, 20 Dec 2023 07:57:44 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:3eae:b70:f27f:7aa1])
        by smtp.gmail.com with ESMTPSA id h18-20020adffd52000000b003366af9d611sm7279693wrs.22.2023.12.20.07.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:57:43 -0800 (PST)
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
	Robbin Ehn <rehn@rivosinc.com>,
	Gianluca Guida <gianluca@rivosinc.com>
Subject: [PATCH v2 4/6] riscv: add ISA extension parsing for Zacas
Date: Wed, 20 Dec 2023 16:57:20 +0100
Message-ID: <20231220155723.684081-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220155723.684081-1-cleger@rivosinc.com>
References: <20231220155723.684081-1-cleger@rivosinc.com>
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
index 3b31efe2f716..34f86424d743 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -85,6 +85,7 @@
 #define RISCV_ISA_EXT_ZVFHMIN		70
 #define RISCV_ISA_EXT_ZFA		71
 #define RISCV_ISA_EXT_ZTSO		72
+#define RISCV_ISA_EXT_ZACAS		73
 
 #define RISCV_ISA_EXT_MAX		128
 #define RISCV_ISA_EXT_INVALID		U32_MAX
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3eb48a0eecb3..9a9d915b5bb2 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -259,6 +259,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintntl, RISCV_ISA_EXT_ZIHINTNTL),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
+	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
 	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
 	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
-- 
2.43.0

