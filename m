Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D3115ECF7
	for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2024 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712740285; cv=none; b=s0kBlFSAA1P4lfbiYiPTOM7fICM8XBJWXwWExOjyDsdORWUqEPqZIWCWN26EKIXZR4WDCCLARMTI0AQsrGdXPcS9gfCKKV3rvNtd7HxjOygjrrLA5TtC8oH0x8FeUIxY4JmxagKrVyPpV3FANYkIYaehGyrXL58zFnkRtn68/uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712740285; c=relaxed/simple;
	bh=EgIgRQR1tXHGs2ASTKg5pKvhyudgCZB4oM0BiuQ65ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hUljQipguJcA3CzpmTWas1MH+YbtxbjuhyE23Ka3MosCD1MY10lGbjk9ieD2iRbOtWw7UiBfymAm14gK0lBwieTg05UpMvTC4jZDOT/u9NPMLJ/nHt6cRlPByOxweT2JsydeI6OKoggnmIzVam+TKQvcAXmQmsERMLl/N4VGGY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=JTcczxgp; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="JTcczxgp"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-343c8d7064aso1125292f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2024 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712740282; x=1713345082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdcDTJcebnZeQ1JIaCOE86KIfZmbyqQMd2Sc3N5X9Dw=;
        b=JTcczxgpWMOvdTeVhywOj39LhBREWXAQ3/rmqNc3FFrylu7Mt/h1X7mWWy6Au5snAo
         eD4UHLFCx49LzaEaclUy1w7xoFBdRDJtqSajIftixd201XyoCa0ICMXLbKgXBg8/k9ez
         N0sbJklQyZJZMPNGqk9LQkGBe1L4GYkPF3+s4EgZkSTnXoWqpBGNrB65c5YomTSRVgWS
         K+85rKisXM9wOMHkwdUj71J0PekqcihyKh1PNPWWsU+c1Im5BlNxUQSBvS6va1O8Zsey
         2ieNoPI4ab9jea4PyNQSoFsbgkHFpRXAJeZoC+2QFUa+hRMByZYWrTBxiBQTl83Nmwtn
         2TZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740282; x=1713345082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdcDTJcebnZeQ1JIaCOE86KIfZmbyqQMd2Sc3N5X9Dw=;
        b=P82AMO4X8iojhNEAPpqY2c30yimNketZ+/BOaSNNQWFYVqfEdniNFJ4LgQpuFgVxQ2
         Cw4ZvXwjiGBn8eYLW8Lg4DFwWc3nS4+3TAWps9MR+kUhGBsdap6xGI70slJVS4Uj3iCV
         DsddB4WBN0gML7NgZYZ1Yq8RACUFKAdmmhY36yieRNVwAVG48x9fHR70QTorpfz1vAW+
         goLsPdUiLZl6T5eF2Eb3Tw633NjWctqcreRBec5jHgq/BYZ8IqXPUgwArXBixAk77Ija
         xXXr6crR+YelrfyyRoJiz43XY2hJiFSZYFDsYXS/HVMw5kNZ/zKM8yXxao4x3YxAz7nc
         RISQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcIvkmip6zJtYUI3NwDO6ywAmg/0Aw2Chb5HF1VZm9sOC6T0rgMA/W0vb8BPolNGUrNRjwAimnrRYynRrcfmu0bv9xZhYar4Oh
X-Gm-Message-State: AOJu0YyVj0/8fssjZW6IBCsxvQK/HaQjciFsWhZKE6xljk3MCLsh/pW2
	5PgX2NwJEN0BnuAYHy3KK0ca+4wogOJjqFDOGIjyGvPCQk47P34bw6PyHpo/MKo=
X-Google-Smtp-Source: AGHT+IETJd3wpoMeNtTRaVUSO311GACzKRot3UF4l9zMBdSlUcbEIBpRk/TUHcnQPBv8xEZGevomKg==
X-Received: by 2002:a5d:5982:0:b0:343:b9e4:ac2a with SMTP id n2-20020a5d5982000000b00343b9e4ac2amr1633158wri.4.1712740282238;
        Wed, 10 Apr 2024 02:11:22 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b003456c693fa4sm9079086wrx.93.2024.04.10.02.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:11:21 -0700 (PDT)
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
Subject: [PATCH 09/10] RISC-V: KVM: Allow Zcmop extension for Guest/VM
Date: Wed, 10 Apr 2024 11:11:02 +0200
Message-ID: <20240410091106.749233-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410091106.749233-1-cleger@rivosinc.com>
References: <20240410091106.749233-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the KVM ISA extension ONE_REG interface to allow KVM user space
to detect and enable Zcmop extension for Guest/VM.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 57db3fea679f..0366389a0bae 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -172,6 +172,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZCB,
 	KVM_RISCV_ISA_EXT_ZCD,
 	KVM_RISCV_ISA_EXT_ZCF,
+	KVM_RISCV_ISA_EXT_ZCMOP,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 7d47fc910bd9..af4fefa189af 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -52,6 +52,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZCB),
 	KVM_ISA_EXT_ARR(ZCD),
 	KVM_ISA_EXT_ARR(ZCF),
+	KVM_ISA_EXT_ARR(ZCMOP),
 	KVM_ISA_EXT_ARR(ZFA),
 	KVM_ISA_EXT_ARR(ZFH),
 	KVM_ISA_EXT_ARR(ZFHMIN),
@@ -136,6 +137,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZCB:
 	case KVM_RISCV_ISA_EXT_ZCD:
 	case KVM_RISCV_ISA_EXT_ZCF:
+	case KVM_RISCV_ISA_EXT_ZCMOP:
 	case KVM_RISCV_ISA_EXT_ZFA:
 	case KVM_RISCV_ISA_EXT_ZFH:
 	case KVM_RISCV_ISA_EXT_ZFHMIN:
-- 
2.43.0

