Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEBA13BC19
	for <linux-doc@vger.kernel.org>; Fri,  3 May 2024 04:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714711629; cv=none; b=ZdsN4/JnWQBTkPgoXsg+qPXtM47blmL8qEXKFNEVu/b4RjtUFNkUhE8mKZA0VhFOqLUMn74HO7q8sDdu6f452EZSTZHdewAtaw30ep+oKzCyzzNb3QJkBymR0uFed6k6UFmO3VRxAjoNT43Ihw1v0en3OIQd2tBGyk+keDx1R3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714711629; c=relaxed/simple;
	bh=hSZDQKNr3tkZT93AWiF+tJx7RzaJfBNyv2pzte748aU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qCgw0hE5P6+f4eFiGhpUznid+/osYH/vSU8Zr6xC4jDjb8qf86N/Y1zkl65ONu52PIazv8DYW5I2LGlZIlz/etM3TNunKWAgI8T6Tp5n0LpKS7baUtPeaoEYyFphoE+Uka4PIzJHgl2jMbUWkFCXSXAwKQuHCu5eVVhIilQc1gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dxDDEAek; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dxDDEAek"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ec4b2400b6so33826835ad.3
        for <linux-doc@vger.kernel.org>; Thu, 02 May 2024 21:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711627; x=1715316427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=dxDDEAektpJAi68fOu7OGfcJgr5pzgWUdrLc0v/0da2JvGNVFRjJZICqwetDDqztt6
         7B82HASj2knJsUDS4xs7IgOrq2/yMPRHnbmt5HtxjgFAJ8kJ/9dC507VZcC/JvoNNF/I
         C/qidGNo99Wi2tcbXYbI4b6mIURU3WiN2Q8XJ4TJvwIeZVr3CqKjbEWZ+l8emreRNIIR
         HZALnd0z+rMkvBH7mjr1IAFxLdrg3ocCSCVHjwThdkdDEom3XGSq2AuAvcE6lrigAN50
         Hv6DF5pv5Im1SOTEWkrMHCJnOK3yG6UZiIx1FZtzQTx5XW6myrpWbzCCuhTwCX68pafb
         05mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711627; x=1715316427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=XP55WIb1KffRESEtcDUUq0zRWV9AInwbNaUW7/5CIRAaI2UHyj4J5PLp9iwjmEWBRR
         XqHu07KkIJGzNZCfIdmt7O95vaFZLN6Cm/4BTKpFu9Fc6fTwchBNkH+T8Pch85zjgtO8
         Et8unTDmaKCHjxyNN8Hx+vPqj1CtkQ/RCyJtePsj7gUYsXpLT/40gXvqgeoiFQF1r2Qd
         J3Q4OqEhF+27e4IczQZE36Y2+wUKT9RNeArilnIpojA6BnPt9Tvuf2o1awKLHUANbU2S
         f1DairDEjDi7fYXMu528cvehZJD4gLaDExIL9ZLnCwd0Ad+NtDXHEehplKdvGAg+eqva
         JpDw==
X-Forwarded-Encrypted: i=1; AJvYcCVN7z697IpNHO1ky0NUpl8Y9/lEakdTnh6pjaNi88aQVSN4innzp3oEWiFD54/YIS9432AUAk5tTq0btaJ7eJkpZfTKb6XOzL7A
X-Gm-Message-State: AOJu0YxkukOx6c3xpS9O3Ng2WViBTyk/ulVwOwssRo8mEYdyUA1Ko0+0
	in2mxPc6pa2o0QXwLv6vW6gVlsn6tU75BNEpJu6+k/oBqaR5C8m93J2TPgGkxCw=
X-Google-Smtp-Source: AGHT+IGLvfuIAlBMYBUVi+TLiO4QdvrYlPkTzw3LbvYys310NrxKX5klWbfcjGlfYftnOqjktyh3bg==
X-Received: by 2002:a17:903:191:b0:1eb:73c2:6b4a with SMTP id z17-20020a170903019100b001eb73c26b4amr1926925plg.8.1714711627297;
        Thu, 02 May 2024 21:47:07 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:47:06 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:46 -0700
Subject: [PATCH v5 11/17] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-11-d1b5c013a966@rivosinc.com>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=706;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=hSZDQKNr3tkZT93AWiF+tJx7RzaJfBNyv2pzte748aU=;
 b=UFZlFM3RPKRvEq4iil4sCALt5muWs8uugdi45/DJmZsHXC3Ny7LZMEMUZMpO4ymqs1OLTreJo
 XGaQ1FIh62qCFEPNP6HOy8o4Nghcqt7bK10HySuu2pzzpqXLVPmjp7o
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
has an encoding of 0x9.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 13bc99c995d1..e5a35efd56e0 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -219,6 +219,8 @@
 #define VCSR_VXRM_MASK			3
 #define VCSR_VXRM_SHIFT			1
 #define VCSR_VXSAT_MASK			1
+#define VCSR_VXSAT			0x9
+#define VCSR_VXRM			0xa
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00

-- 
2.44.0

