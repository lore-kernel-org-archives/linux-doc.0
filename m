Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDB97E0E4
	for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 14:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715957616; cv=none; b=SHzg5waShZaUZYTc8Qzuh23ipLyekzr5zC3n8elnSBJoz1xURwWcEczE0QKRf+OCrXlmM7BqVVQtVDXUny+HTcP8anWfz5c6QtAbWa8NFzeGSXkGz1SWTRN7yWEzt+9fLxPqe2xPMpWut/4halCNYcATAQ0oG/lIaaPfbGAUV6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715957616; c=relaxed/simple;
	bh=Lg02bseGYv3ysTywI8RCrbB6LMHH6lsEnS8ExUzwERk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nYZOP47fG7upD2pCvGEU1zuQvlvRMuj0pTGy/AagXbGU0JIdCjlPs851bnfECjm/mboy5xP6zns0wpfQEn3ies7w/QfptyWwvGbV2dNsZkwSuy/ZAePomlQvH4/iypPtNVuE50ZEXpAJtHl93NvU9uGhmF96SYCXaPdJHJx6iNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ttKD+rn9; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ttKD+rn9"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e70f6b22e2so751251fa.1
        for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 07:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957613; x=1716562413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKs6nP2IvbAkKOrGa5+RoTJoO1OEnrEjZ7TnjWCI1Y4=;
        b=ttKD+rn9FF4+d31akcjlwv+JbLV8AAMzllKvOmTcoeiSzX/oDdlkXzmhEzyL2ZVigG
         /qnplPMARAC4cOgY2h9wBjWsp/pWuB6ODLqmAV2uyxlMz/c3UFS4Byx6sX0vWr/gylTQ
         ujbzTAqYih6fJsse63eDPabVWqvHrlp1NVFns5t6kmGaL4+geME/PsXmpqXxBC3t1KqN
         DuufVvcFkfpfzptIWbvE7LXlTX53p3CcW5AD+QRFmB/LqcD030Ch9eTJLbp+IZftgHQV
         n8cXvJcfdHZfl91/WtcnTGDK2m6il5P6Di7StK+PrpzfRQqKmcPvWCFPOlgojIC61pLG
         P0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957613; x=1716562413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKs6nP2IvbAkKOrGa5+RoTJoO1OEnrEjZ7TnjWCI1Y4=;
        b=Wl3/eTbwSU1kxujKqs3CDmX4XgQrVbsfVsLsu0/MtTGM0rnYoAkNWoNRyQyW6dd1e8
         w1XXPSRnacXuIxRdCXDnevHuPuZTmEmEuqv95nS+PtmSuJ3N7+p+k6Tb3q2+hrBcc04G
         4nYEPZU9VBABRw2D4oVtfbL8iwFNzpKVRa98bM8lYWen7KWyaHL9uM4oqjREQIgSLJix
         MNchvqG0qoqbSjRjVGxkQjm1PbneADQgjML5D+qi3oGPEj21n1n9s0kEe3akgxqwtt+B
         wdqgo7sE4BQ7Dzip1zT127lKjg8CL1y9043OCFP6CXNNyEJtIWIorWXuPFU09FovVaW4
         Z41w==
X-Forwarded-Encrypted: i=1; AJvYcCVNSNqyR1MxLTe8vAFx5a6YW7iVqChzL9723UxBQNJrATI3ljlKj/WZ/SOpnhfMpTuOUDwxLO3SZ5JrqHjXYqpjN0iA6MtdWBkt
X-Gm-Message-State: AOJu0YwVZQKiZW/5Q/W7/u4D0Jxm/r1be2i9u0Mw5og5MDlbCDLeBXMh
	tcdm7I7bL4Wq27/jsdIXrrQ0WWQ4FQEc1tp5yHU+Q2t12ekOeIjp8ARSw0OwvOE=
X-Google-Smtp-Source: AGHT+IHR6zTwRG0jWxIyCMSq5u4kvH12lVHrxENgcXG9CeU/DaflTem7ntPab7y54mPzIbQdgLeTIw==
X-Received: by 2002:a2e:a4d9:0:b0:2e7:14a4:1f75 with SMTP id 38308e7fff4ca-2e714a42f3dmr2240021fa.3.1715957612950;
        Fri, 17 May 2024 07:53:32 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:32 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 13/16] riscv: add ISA extension parsing for Zcmop
Date: Fri, 17 May 2024 16:52:53 +0200
Message-ID: <20240517145302.971019-14-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add parsing for Zcmop ISA extension which was ratified in commit
b854a709c00 ("Zcmop is ratified/1.0") of the riscv-isa-manual.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index a5836fa6b998..aaaf23f204ac 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -85,6 +85,7 @@
 #define RISCV_ISA_EXT_ZCB		76
 #define RISCV_ISA_EXT_ZCD		77
 #define RISCV_ISA_EXT_ZCF		78
+#define RISCV_ISA_EXT_ZCMOP		79
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3bb2ef52a38b..0a40fa1faa04 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -290,6 +290,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(zcb, RISCV_ISA_EXT_ZCB, riscv_ext_zca_depends),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zcd, RISCV_ISA_EXT_ZCD, riscv_ext_zcd_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zcf, RISCV_ISA_EXT_ZCF, riscv_ext_zcf_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zcmop, RISCV_ISA_EXT_ZCMOP, riscv_ext_zca_depends),
 	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
-- 
2.43.0

