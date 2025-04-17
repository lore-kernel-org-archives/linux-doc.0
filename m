Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE1F24EA95
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 12:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892756; cv=none; b=k1hnA23mRvoRQ0vnQGjjxKnMOEzTuUoPIaUvXfNJy+OMA7GNyOjmTnXIRqaY3L5EcJ+han+7pztkh2ax5zF3XX7XNyWRsCzeFumVrI5EEzHn2W/IwbYUK2oZihCvyonis/2fioJhE7siT9hu0tBcKACpnpOUkrHuwp7rZbFxhRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892756; c=relaxed/simple;
	bh=vAB4aFxNwvgoT5WAIs3E1c62CtpY3OCKOBlBcYmIQ+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SmF60AwG7wwzSI9doHNlFpspc9R/LispWRAfEMSpXhXS+msS+Uc7wPTCrw4wGl/4p3yjGyzI2hDB94/JOdJSxJQSkhGxKadkdIbPbth6iqqw2ng23BQx8WjICHGrUxgs06RzcNJTUF/952jFrm8RSj0KkW03ZZn7wAaMp/mWvzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=OyH1UzX4; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="OyH1UzX4"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227d6b530d8so7159735ad.3
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 05:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892754; x=1745497554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTkrNhYYE9bdipW/NOK/ur2NyEJBzn07+HWKIkSphrw=;
        b=OyH1UzX4sg8geFbiac98bC0cr9Lb7Jv0zTM9hMmVz7fLrDjIpaOLWZIy1MXScxZ6r6
         +k4VREuV3ncP6pCsEmCli/Ks2qfWidQJgPGPzZZuH16KdW9z5IbEZeOG1XiJ/Vh9WbU8
         r44iKvXansh5L8Jo8XAagGuhAm6EQxZcpqSTgagaiDpFTKjeH24ehcGonUlFO/+6GXg2
         oz5IW+9PsUlKOSscJJxgpxnxlhtbYjL1feAPMSJOH7HgSPD1uabVhweoOHVNIVS/M81F
         7a6Y1s5J+mJ8fnFM89DgJo9nYVyr6IXjPqhKUrf/mLDmIRVmkju+uE5ZY/JZaY5Z8oaz
         ZqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892754; x=1745497554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTkrNhYYE9bdipW/NOK/ur2NyEJBzn07+HWKIkSphrw=;
        b=hv1x99cA0wZVplvUnDc3BHZGilpOmx+eFjafpQtdyb2zdkVzBsIkPeTRV2SSe8VxQO
         6aiHA0EegSJfQw+Z4SlDz8x18tsdPEtWmWh63+EYvpOrXARyf3WlurhqVEDzNKVw6Nvc
         3kt5IiOFWEWOowRhldzEjS9KfMMOopHGWgcPod4rsr4gR22PIvxKyEH2olzRdNfRLGis
         y861kRmGVh+d37X28wT+eyEzj89bEgReLqLt9JAtMvY9HD+Nx94A85zvIlbFTYJXvQCe
         grNgXG2OKFUCF9HBMAMMmuvZTue0WldOMXrLGhDnnem9HnkgBLgmwgQQzmFLAeiBNGfv
         AbKA==
X-Forwarded-Encrypted: i=1; AJvYcCUCYF/FCRWAxvjF9mWzWyJnAymjE1vgtem+rLf1O7QnG4mB6dEr4AXjVqAPJ6AbGFug8lI0XIN8XTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMQhcNoW5vU+8HQd+Jflsyy0gj411QdRbeEoIX8UqoYQXto+Ku
	FMs67CDgqDGBOMHohXGHJAIkwievRCjme+NYyC0O0B0UyHSBbDgnlXLd/vmwJ+4=
X-Gm-Gg: ASbGncsFdBWAlpGQS7Nz7btcSMLEPCeKnivyU7HDQiQ0/eer23qLkGatIMaXgTeivqv
	uxc6zZG/ltoijhblWH1dNlnRnH5ZNJb4P9wIEbI2Wrp3TTkPqtuSIBLvelefWHfiwLw1GSqwrsR
	uGbX9rS4tg8tEt30El32f+C6YxP5krB4JIoOmU5DG54GRLqe9Ny4Vmb+qKRGXKnkyrTEQEHkhlg
	meoibqdtrygNXq299sO0Itu86vu4TadfAK5b3va7qWnLorTwbYUvrNZB64hI6N9l/MmadT2DH3W
	uM1Dg5gWw21ZbxBQA5f+EgWIBB31BqUxpkwMZqLajw==
X-Google-Smtp-Source: AGHT+IGDgb05pPnIfmQYcdZnqSyk1iwUEfpKUkpi5EKOyqIovfUBARsBsLViyCfGV2qgdXRRvN3wqQ==
X-Received: by 2002:a17:902:e806:b0:223:5e6a:57ab with SMTP id d9443c01a7336-22c3597ee39mr83719155ad.39.1744892753939;
        Thu, 17 Apr 2025 05:25:53 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:25:53 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v5 13/13] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
Date: Thu, 17 Apr 2025 14:20:00 +0200
Message-ID: <20250417122337.547969-14-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SBI_FWFT_MISALIGNED_DELEG needs hedeleg to be modified to delegate
misaligned load/store exceptions. Save and restore it during CPU
load/put.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c          |  3 +++
 arch/riscv/kvm/vcpu_sbi_fwft.c | 36 ++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 542747e2c7f5..d98e379945c3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -646,6 +646,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 {
 	void *nsh;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
 	vcpu->cpu = -1;
 
@@ -671,6 +672,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 		csr->vstval = nacl_csr_read(nsh, CSR_VSTVAL);
 		csr->hvip = nacl_csr_read(nsh, CSR_HVIP);
 		csr->vsatp = nacl_csr_read(nsh, CSR_VSATP);
+		cfg->hedeleg = nacl_csr_read(nsh, CSR_HEDELEG);
 	} else {
 		csr->vsstatus = csr_read(CSR_VSSTATUS);
 		csr->vsie = csr_read(CSR_VSIE);
@@ -681,6 +683,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 		csr->vstval = csr_read(CSR_VSTVAL);
 		csr->hvip = csr_read(CSR_HVIP);
 		csr->vsatp = csr_read(CSR_VSATP);
+		cfg->hedeleg = csr_read(CSR_HEDELEG);
 	}
 }
 
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index b0f66c7bf010..237edaefa267 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -14,6 +14,8 @@
 #include <asm/kvm_vcpu_sbi.h>
 #include <asm/kvm_vcpu_sbi_fwft.h>
 
+#define MIS_DELEG (BIT_ULL(EXC_LOAD_MISALIGNED) | BIT_ULL(EXC_STORE_MISALIGNED))
+
 struct kvm_sbi_fwft_feature {
 	/**
 	 * @id: Feature ID
@@ -68,7 +70,41 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
 	return false;
 }
 
+static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu *vcpu)
+{
+	return misaligned_traps_can_delegate();
+}
+
+static long kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu,
+					struct kvm_sbi_fwft_config *conf,
+					unsigned long value)
+{
+	if (value == 1)
+		csr_set(CSR_HEDELEG, MIS_DELEG);
+	else if (value == 0)
+		csr_clear(CSR_HEDELEG, MIS_DELEG);
+	else
+		return SBI_ERR_INVALID_PARAM;
+
+	return SBI_SUCCESS;
+}
+
+static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
+					struct kvm_sbi_fwft_config *conf,
+					unsigned long *value)
+{
+	*value = (csr_read(CSR_HEDELEG) & MIS_DELEG) != 0;
+
+	return SBI_SUCCESS;
+}
+
 static const struct kvm_sbi_fwft_feature features[] = {
+	{
+		.id = SBI_FWFT_MISALIGNED_EXC_DELEG,
+		.supported = kvm_sbi_fwft_misaligned_delegation_supported,
+		.set = kvm_sbi_fwft_set_misaligned_delegation,
+		.get = kvm_sbi_fwft_get_misaligned_delegation,
+	},
 };
 
 static struct kvm_sbi_fwft_config *
-- 
2.49.0

