Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D460C18BB94
	for <linux-doc@vger.kernel.org>; Thu, 12 Sep 2024 05:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726120554; cv=none; b=NM+AlnmRCe8HqAL945tiPrdAN1vDgDRINnvR0/SibTAyQE1VICgMMxIfwHR+lSvtL5AD5bez4V8VQ2Z5IUyOGB3Qccek2b+5wM75cOX5A77mwvpYXS7VjaSPPH9VokdW30Dq9PYUK0xXx2Vo/3msaxp9HJSuALiBgo6qS3/7HXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726120554; c=relaxed/simple;
	bh=twijwVNwXlRnqiWorC6lSyhzIHtshmEdOl4sTIAcK5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1nHeyAtLfNdMc7KUPUMrehtOwu8DzDaG/qkq/Rn5R50ORQe8xqWCYl0KSy6JjpRgNQxVAIGaPIw4DowWYZr8dqYP9yxPaa3Iharw7+DJ6ImRN6kR5syP4ym1XBlymWpkNdNuGjAJk+d6OQf2P4DOWa8hyKY1y7qaBV6ACIrhvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ardJLvNY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ardJLvNY"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20570b42f24so6797735ad.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Sep 2024 22:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726120552; x=1726725352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34tWDw4L8SN+akOs9Do5H0mwwhItc2hNKASWAYLthDo=;
        b=ardJLvNYZg5KC9Zh1GkwJJZOeIJWKLY3NH4zVjzGRbTtgz+ZUi683PNOIZyICYh4/x
         vJ0Paaapn5FRD+Jx6rjI9hiMRFim/PaTjppCy+5x4zE+7xnACoPNMOdbrzvS3vi/j3T4
         AazJrhJztXwuPRF055H1z4yYaEVx1vENwGFQ3CuWnoEo9WWZFzsHwlEygwjdtghvqmAe
         KSDVcsreN7HqzSPS6uKgCwArB4tasjezM8n5Q551v4rXZavJdWsMrAVjdGhVN89H162a
         XkMLfhlNSu0XLeVLFoHuv862Y27xuqGO6tgQy1N9QwfVUtAYB631O/genSNmaWyBtovk
         4d0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726120552; x=1726725352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34tWDw4L8SN+akOs9Do5H0mwwhItc2hNKASWAYLthDo=;
        b=Gp4wvZjHUTxsW0Nh0kDKZf0ZZ7IzFxYTBdknJNVGBtorFLTDxdLUKe28AeRt4DJgzp
         2rr/h6iMHYAslveMTh675Hp0X1zDsjgP45L6z2PEHq9XDJNEp60r8nAiDbDgCzVL3HAn
         xPi+LUTlIDNfuAJqL60mZZdyDfuJ3GwPgDx2yllFriSBJIwgw9d3lUsMCIygYzhaoS+m
         U7kK00Iv8Pt4bt7GWC5KFNJQRUCCQui4zdOjOdhfVG6NnnzGDeAXcjVZP6pql6If5OHi
         4hwmVi9r/PIpoJtE71vCBs2db8+1V3Ps8TGFrCLl8tGcDJ5nF9yqiE+9jIw7pf3ksMJV
         /67g==
X-Forwarded-Encrypted: i=1; AJvYcCVR3kvAjoRZ4V41Lgj8zMmLspjs0FbyFdF9dveD4AkLNEpqouX+XJuum79thJ0z5RccyGSo61MTkIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAGK4VmynRQ9UyGLYyVQCRyRP2lin/aPG4snLTwOfnq5VqelPz
	KQNlEsQxntyDRN5cQLh2kZlLzCodEkz5og1V3lWAxIQK9A3podiwkrGYhERqxJFUYh8r3yVngBJ
	d
X-Google-Smtp-Source: AGHT+IFiwN7AL0oMOImj8Bb6j31gbdzpkXOKklYI/Dyd/oOvuPIOVHkDWeO1Nnywoc6bxuIJ7G506g==
X-Received: by 2002:a17:902:fc4c:b0:207:4c7c:743b with SMTP id d9443c01a7336-2076d90a1aamr22272135ad.0.1726120551451;
        Wed, 11 Sep 2024 22:55:51 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe99b6sm7870465ad.209.2024.09.11.22.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 22:55:50 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 11 Sep 2024 22:55:11 -0700
Subject: [PATCH v10 03/14] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240911-xtheadvector-v10-3-8d3930091246@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=960; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=twijwVNwXlRnqiWorC6lSyhzIHtshmEdOl4sTIAcK5Q=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qjpqjdgupZ/AlK1Q7FNw/u1tnC9ORpXqpi78+DtXKPk
 5uMNrJ2lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMJG3rAz/VOd8nRK482XkT6UZ
 tYt2FjXdjPqi+VXavm/u3tKdInOD3zMyPI7n++V4VnP92xmlpRHdhfJLrru5Hwm1Pvs24Vmrmdc
 lDgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

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
2.45.0

