Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C3D3A1DA
	for <linux-doc@vger.kernel.org>; Fri, 26 Apr 2024 21:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714166976; cv=none; b=imQotygD+D3eV/x/wPWfOk1I0ZDePMMKMFI+sdCMTPEBgqPJNtoMKxUR6CDklEhRzm01Ta5l5qTlxvrrxfvI0nSHt0/QgFOtUqlymtsrM1XN8u7SeQ+rLJEiTJeWQu7iX0L3QarnuZ44WsrGnxou9GF0n/SxgeX/g3POo5LVsz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714166976; c=relaxed/simple;
	bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LSguMBihpX/1gyoEvCS7QOXrxp7cA1T7bEZuJee8HWZ2hkcKASX2ZzG4YeSTPfEX/roI1GXJ2GZbpFm0gQAEU7Xc3CgH/rypiMmlHDVb65pJx2r9p8m3NLRZg8buL0lkrxYNh+hQCbh4A5YhhzeRTOV0H5nImPd8HorGF+EprzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=uGCxbewo; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="uGCxbewo"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e36b7e7dd2so23162855ad.1
        for <linux-doc@vger.kernel.org>; Fri, 26 Apr 2024 14:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714166974; x=1714771774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=uGCxbewooTQzz/gNhuA9zeEqDacU65L9p0w/+ODXw5fcpenfUCLch8KjmxtR/Md0S7
         SPt96KnuKT5AYv4vE0KDJ3m/FdBnoqb3UMzSvkR5vsWO157HqVKQuuXpegKoueR3Wo44
         FMhaOrmRsEyDOo9Mm8xt6M/Y2WhkmoIakHaIR20NWZVtqX15Z+fmE6W0emClbVTsLHVg
         KEc5UQMIeiC94/DeNUzFPHIlKo5K4vfIaD1D6jkEbEeSdSHGHkrBHsPjUTW9IBLoBoo6
         ekKw5UgFyK4LCMRsvTrzPjDDU3BRYAz+v8TMUIzZT+GbGZi9WMmiexMCFeKAVtFbOSH8
         NJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714166974; x=1714771774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=E+J+IDiKUERzAEOgDhsf10lir13Lchj2jtjAgDkvGNUdx8Hh7ia+CWxlxmrJH0jrwH
         CmN0lfuhyMPheAbTD/fUzsIA3pdnHuiCehoblx5F3KyrnZrPhOgYfbvcf1yTrqb3nDky
         7xPvGZd/1yk4bHeAvz2a4RYvC4HBJ6S0ObjBfwOOIVqwjXSueMMIEXSqMfOGrHOPfW4u
         wB5/kQNkItx5X14KMkZcsk81u9/silwzBQS9l8/Jy1Bs8/3iHSvOxaSAGVMdMnnE//bt
         olVCY3aU1eyH/XmQE16vl4VlymcOmrcsW5B2p91WsdrIUoGRTty/XGRWFiRTYA9dJZVB
         2rgg==
X-Forwarded-Encrypted: i=1; AJvYcCULmURcFv6GuK0ckyQmlaWasezvmL8mFprD+Rwf/I2YyJ4gvMhFjYzELRRBTcuDyQsub8nZkvDC9QR4yftNt6tLfQsU2YL4nNEC
X-Gm-Message-State: AOJu0YxyrkjxYbXTqSOF/Kf11XMZucbPJQBoPU7ydfAJRJ2ZV9U8tX2d
	lqtCFpaoEWUB1SJY/jJgt55aC1zjXgyhder+KUzn0B0JqNokqAxq+M9gAhIvMyA=
X-Google-Smtp-Source: AGHT+IFEldMgHYwrrE/WDKjCeD0h2bT0Le//pf+RTk6e30ppKuQzsBrdr7KrhuDT58Oa4s45KZPzFw==
X-Received: by 2002:a17:902:d543:b0:1ea:c7a4:7e8 with SMTP id z3-20020a170902d54300b001eac7a407e8mr1151133plf.17.1714166973673;
        Fri, 26 Apr 2024 14:29:33 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902650300b001ea2838fa5dsm7226720plk.76.2024.04.26.14.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:29:32 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:29:18 -0700
Subject: [PATCH v4 04/16] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-4-b692f3c516ec@rivosinc.com>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714166962; l=904;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
 b=TRlVfhuV1SKW+NgB2OB5kOL4FF8D9pv84FgA25MEizKMQ2QpkjW4elwnFJEHnNkZ+bTFe0b42
 CPsJoDFwMOwAR8P1a4akFOABH0l1U2tKr+32Eqba9Iryz5WqcOWERRG
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The D1/D1s SoCs support xtheadvector so it can be included in the
devicetree. Also include vlenb for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..50c9f4ec8a7f 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,8 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			riscv,vlenb = <128>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0

