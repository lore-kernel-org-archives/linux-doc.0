Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E80F16D4E3
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 19:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721848450; cv=none; b=p6aWP0eccWm4TNnqqFX76t9LV1bwDfisY44pk2tbE0/rZYwXuEKJPSTOQ5BgBgtxWZP4M5KKA0zD/yUVnAZa1X+NYMvOZUlXdXWo6EO2HrUew76j7JdImo2XErWZpq/Uf4M61NLF7wVAkhX0o4y0H8xt+0T2ZuLlh1KfKNwnLDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721848450; c=relaxed/simple;
	bh=I9BB6+DSsEot7edtm0hreUvYP0RvytEdbSv790C0uE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ee+HYmsVUFt8C5KV/Y58619h9ErXMgOR1qR+1WGTOwBpld6hadpTrSl2wdoPNb61yx2NU5pH2wQyQSrBL5UexFhpOWbVW/6PyezyfWH8kmcyNykvoPmqozG5BNp7mhsB/+X02TDn0rMkGzG3P7b0AGa3AEvusZPmFQ0tX0Dp2Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=LzKdK1g2; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="LzKdK1g2"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-710437d0affso108464a12.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 12:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721848447; x=1722453247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0g1DxVy9Ij2OMsYu7oTE9l+cI+PV2f969LKgw+PL+a8=;
        b=LzKdK1g23goUhLjG3RayQUu5BJ9usif4sPLre1WAYW+GqFIG0E0/RsgE+1ybge+M4Q
         hFDPyUi8l36gsZq/1o3rwghurWyvy9jmKSyPeVyssXlwssPpfarGJ0VX6UVmBqIH+MVr
         pW2dYwDoX3xc6Lbbm4Lqa7Ba24XZrlO8ior7UJzGkJ8PL9IvWa2DyshTdrTSuqp3h3gn
         7NIW8sSmPU5ifLhfxRK70TRiOrjKfRkfKbPaK1ss/O+8PBQob+a+n+jXqEmJMgoEjbPB
         V5Oyy0YTtMCDq3e857TTcqz1afxmir7oq9ILZpRNRxOA3HD8aSSbDlagKKgh4vC7cOu3
         /xNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721848447; x=1722453247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0g1DxVy9Ij2OMsYu7oTE9l+cI+PV2f969LKgw+PL+a8=;
        b=udZahlC8MJlK0k9Ol0x5P1hrLupy+eMUDYWJ8h4PoEspvP6jyaMIwMDbrQ2sKj8x+t
         rouE4MPMX2LG51/KfdD0X8Wiw/Lhfp+TxKFisD/l3eo+eyWgYOs8GpIWO8vRqyaaU61i
         7tQT1oYJYfqSGs+Gel6Ji8gB26Aa4X0EEhPaKqIzlNRZGPxsQ0rrY9KEPduxPQZ+ZBCG
         t14s9IE4zaLHrMcmwvzh17jrTOTodcK2dr8GuCNrsgwOKxYGkFvU3l/d8icTPEsh/JCy
         R0Q6xy4Slr+ZkWDlS8sSVq/azPWn4D5iiPCwy2l783m0EcEK2dy76B//i/cZDCcH3Y7j
         VJbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZk5c4GA4X46MMBq/akwH0VrBIqXN/JQx0Qavcxx7/oSn/wqs8l3xj6Y08B3c5xSTZfIj4+SjIs0cqfxqKOkAl7+Wzm925P6/+
X-Gm-Message-State: AOJu0Yxlx7SZB/7FOhkhOxfNhpV54LvufroFKHxGaSIS2kkoJpIleo6X
	GHqmTzyRuvaI2UA0Sf6lXybNzR3LHtfcs9f9/kHgDbTfsGkbi8uHplJrgVUy/rY=
X-Google-Smtp-Source: AGHT+IHtxpf6eLL9S8Er7UvbJBMxHlKrbPdpzoeadTvWp1fhgdvuJzDzXE0gomqsRN2y5VYWthLAFg==
X-Received: by 2002:a17:90b:4b89:b0:2c4:dc63:96d7 with SMTP id 98e67ed59e1d1-2cf239438e2mr508418a91.41.1721848446968;
        Wed, 24 Jul 2024 12:14:06 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73edecesm2022359a91.32.2024.07.24.12.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 12:14:06 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 12:13:54 -0700
Subject: [PATCH v7 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240724-xtheadvector-v7-3-b741910ada3e@rivosinc.com>
References: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721848437; l=960;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=I9BB6+DSsEot7edtm0hreUvYP0RvytEdbSv790C0uE4=;
 b=BR79F5fx+1PKOKbmgSX10ig/17c6YGFoXm8Oca9orEDbCA3b+lNgPaFfErEQtWEMDLMS0uZpi
 Hf1XG2FylXYBR9whYF5CWJ5Bf2VZxTdRFId6dweNtTPYn0e2uFEm2qo
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The D1/D1s SoCs support xtheadvector so it can be included in the
devicetree. Also include vlenb for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..6367112e614a 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,8 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0

