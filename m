Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CACF22A4FC
	for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 10:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995788; cv=none; b=HGJILTqkwN5ADGM7ZoszHdBMb4DxjljRny1YNs8AfwJpLD2RDAPTFiV0CoKEQboJta4y0zd9donWhBE6kFolhyVTi9hWXTg0R7ADUIimvDdQR5DDtmoE9dz8tv0bWxaHBJkQBrNcDVtv/w2LzfJolFOtwmBhvXchqMxejIKwEu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995788; c=relaxed/simple;
	bh=e9Zv6MyOruJNuSW+pX4lrxjbHhF9mFEMsBWjimF3ZhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mXx4qyDseulD5zjWG3rWmJRGEqCkpGY3cWWxbfLw2VUdgYztmn6cig7B4x7b8BLOoP+mvAVdrAwhgUa+GjSNIgb+NdKcnnzKeXB1ZVw108klpg8dX1R9YdkwTNuOwuVxGRjgWAXflY5B/fb8nOq9b9q1DNaiTSJI5EFmX3JgXmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=CcEbbbNh; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CcEbbbNh"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-742af848148so5435628b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 03:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995785; x=1748600585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jL4iC9TbsUd0FaNofW/nJkV1WGoug0A9XRZElPbt0BQ=;
        b=CcEbbbNhQGus+iKvllfw3GK8En6ZEWuRu55e/YIyBKPXS24kKr3xODUWbPA8mziPUQ
         pCBM0Fq/B3ZY+OtvPZbPoZ89q9vd+32U3DkTpai0gT3XzaoY0UgCQswJgULjOokz4+t9
         01YWLDvldc9TaVkfp/7Mjp7Be7TCWjXW5a2AHRsWLt2SaPPOp4l72n1n/XDJfBk1eERt
         vX7byG29q1Skn2LFm0Zi1MfKezDnKYWEGrD6DaEYtFVpXWLAOk6uXo8VBhZmsdZHYBv3
         W3PVaPEpmTWaRRViJCRi+lO3cuJMgFXJpDAA8WIiDc6vdKn0VT95UZgiTKxSoTOTi/a9
         NDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995785; x=1748600585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jL4iC9TbsUd0FaNofW/nJkV1WGoug0A9XRZElPbt0BQ=;
        b=kqPTzRgOWRxfB+XG2shqL1GgTxXZXcOLmcWShr/vqZSLG9SD5Kpc7Ozl270oo24SJj
         ImX8FM+x7FhAoZQkWv4s7lZvJg2uk0UJshVBnd/PY+qs6we/vQsV6Ar664t8m9hLj8HX
         aWymuVwgGmXaOSq0ixsa5VAs3nAzlrkqORbG4tAzaYrxM3pWMt46dzE80GatBqs8Bu+W
         G37/M6IBzeDIdRktRGlV/lWGB0dRUHRHcB8ac7URr4JkH+Uif58+Gg46yBLMereiqdYH
         T7pPOJ82Ol67/5UPPweXEDRepYxhRqAWQWCFIDSOiTI5dV6Bvxbda13wBer/r4jMPOX9
         h0rA==
X-Forwarded-Encrypted: i=1; AJvYcCXCBbnGksX2n3nMkLF5n8I6eUw0grnJOJn2BhcchxYJ9085NfwQk44a7qrAkfUHb2dTZDMkAE5dekU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywar61vESow5Na3vldsaGUQrX2Z56kiBAuxThzEECqjNtqlU4gA
	sKyqru0NBmN1ZfL54gnpWm1XBBuOlF3TIUBst/kvkQOMvF8OvcDNLU/TLPHE8N7qbXI=
X-Gm-Gg: ASbGncvyLJMxcx9a0mD7/3hnKcsDRPbXmq55Fopa4M724AlBflqev3ZDXjtCCf27glX
	6YwqnpjGG5Qzi940BktywpfQB4+QO5DQ3225YeSlxy2gjncPI2FURVGeNaZFfaDcF1UXjXDHcx1
	L+Z071hjjg5Imjy1dZuoN9GXfTkrrmKEQy8bpU2kVzR49YKmBHjeaeAaUHbXg+3HYveE08jbIOu
	kfLjBL37aYml2Fe6ybkCy9T4YyyyqeIexc+Ox6vmjltq9grarEj+7wM6KoBu9TsOnEuI8f25wa4
	zidR9KqMoPKMPBMcbphuHYA9/VB58849xGwV7NaquC/lMJZyjZSO
X-Google-Smtp-Source: AGHT+IEbv4B8UCIzN6nDmsaNwoV85BuQ6Mp+F2TMaxmDctRPfjMepLlOopoKzZHjGeALummtngi9+Q==
X-Received: by 2002:a05:6a00:98d:b0:736:34a2:8a23 with SMTP id d2e1a72fcca58-745ed8f5d5bmr3385811b3a.15.1747995785079;
        Fri, 23 May 2025 03:23:05 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:23:04 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 14/14] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
Date: Fri, 23 May 2025 12:19:31 +0200
Message-ID: <20250523101932.1594077-15-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
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
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 41 ++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index b0f66c7bf010..6770c043bbcb 100644
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
@@ -68,7 +70,46 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
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
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
+
+	if (value == 1) {
+		cfg->hedeleg |= MIS_DELEG;
+		csr_set(CSR_HEDELEG, MIS_DELEG);
+	} else if (value == 0) {
+		cfg->hedeleg &= ~MIS_DELEG;
+		csr_clear(CSR_HEDELEG, MIS_DELEG);
+	} else {
+		return SBI_ERR_INVALID_PARAM;
+	}
+
+	return SBI_SUCCESS;
+}
+
+static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
+					struct kvm_sbi_fwft_config *conf,
+					unsigned long *value)
+{
+	*value = (csr_read(CSR_HEDELEG) & MIS_DELEG) == MIS_DELEG;
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

