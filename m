Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B41C29209B
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 08:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297441; cv=none; b=YzHqyb2xNxYWseHtkeRbbhu3HGGgeL8hNHOtfOKEsUFdZ/BvgBH+SDYhQUvQYU671QwBd3fv805TJYs/UCSFc8IyzDgivc7gWJmhA5C6kJnoLm5X0wWZZIDuI/BkZzuzu3hzTwL3+80VhPtuNuSFllYK0YdtkK6Qk3EK9YEhHB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297441; c=relaxed/simple;
	bh=3+zyVKqir6lmor6lBqgW/Ph3RSN0Yf9mQOjdau7kAZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d8yjEVl4ENpOnlpjREBBGu2GWR3taHkBLrOcc6dZadm1vOGKo3Ane5cQK9UO42u6iSK0GuKsAl45auIji4tu+y72IBFR5BrDD0tprYnWxPSShpE6Yq3/896FX9tkL2W0UBZM59W4MnYpH2lAcLarr6U5GOQF5O5TDn5U7gezVrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ssrxfhF5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ssrxfhF5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-441ab63a415so6636825e9.3
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 01:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297437; x=1747902237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Pxqge87zPhTrwo0PySrFAhV25ryh/dqXEpJhdjy2V4=;
        b=ssrxfhF5ah6odZizln5pR782/IP2X3nIaWIUcvsyzukTT7hE5f/y6QQth10LGsSxBY
         JMMPtpq+IfUjwKyv1WWSYckPnboQqTiD3Ocp+I6MFR0joJblcVjNfhyapXNvax5Udwpq
         yTgigFxm0INxHB3mqaWMZ6PBNdafhW8FDlXuPTfXF0h54d/QcnEc+NgkAZTYBXAX7n4O
         Feba0HG/rq5+Wc38OwL+FAuTOBD8f7LIObaSccW0adjlfoNiAHc4dq7GwT6HQyYzIKV4
         O5yrlF+mVOQ0GmEDqOp5Nn9ssSNwLOVOFrkG+y4TuVVcLr/UkZ46Eo3v1JMFzb/dSqEZ
         MCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297437; x=1747902237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Pxqge87zPhTrwo0PySrFAhV25ryh/dqXEpJhdjy2V4=;
        b=K4DRWapugik16k535V393Gv/3omo3ilCd7ksgpdfxqplvNfqH1j7x7lb1Hf2qYDH02
         lc66+wanjUDbBIJACTAFptlHv5u6J3OOL4cF6Kv1ddfS8R5RGh8ooJLvcxhW6nirK2lG
         9JO/nEcmIngmD4k0KVEoe5wNm5Ty8DufPmB5rF/aFr+CivHa2KZUV4WK0FTUlq47qNDZ
         3NM1zK3XCYTEZMGgxoSyxLLSQj43i/pPlhYYXj5rYPuNyeLL3fRJRa5r3JoOAo9zQ/AV
         a8aoGF7mI6vDHRR7XZQWgdZYrJdK964GSEh8YPZpltwxiTBy867hHgYcc9OfmKj4ERim
         Ydww==
X-Forwarded-Encrypted: i=1; AJvYcCVGy43/jAJPdHKPqMM8Zhfi/bBYYRObUMBBUZxAnfeVdKlKKHLPV68l94Z2XIDwdAH3FUg2EaMQxR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMHM1y9DiW4rikqq6Up9AmGU1m1XAfZmnVQPaXj+tKVBtVpree
	wg4gj9AZEqYi+YU6hGBLaaZHAZu0Cq+yHHmPi0Athws5Q/Y88a38LV7fPnJvic0=
X-Gm-Gg: ASbGncsWB6b4lZIUyxytlEBiDFvlobZkirRHkKnTM1Ca22YOP1VeTCoAyaixJrVpAhj
	jUYCbMToU3JKRYB3euD2yGEjo1aYbiEHgzpiPKEDOjagdCfgY2JwZzIi0fLvbb0ar7IuJ76VNbx
	DBUknGu1TrogtJy+Mxu698ZUzHRnNKOejlrRIeEVltv9FqoO6tPC3fCRsJrp4xHq+oN0RV5/1Qc
	2f104NCfH/wXdUc0tB+9jAGhLXHtzD5uwWdlH7ItsYALRBGjw3/ylbJ1gyDKKYCk+dbKOed2ppf
	P2gEUFa1N1kkPLrKGH7sQUj+MmMzs7P5QAJgkTMHPXJIXkxfDZW7hkrndf4A5w==
X-Google-Smtp-Source: AGHT+IEupGcBKUaQtXkFnFukO6A8UdisKBYtlExsocwvYgZ1EXZBcCmelFzxOJQp2aJDmAYM6taW7Q==
X-Received: by 2002:a05:600c:4e11:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-442f20baefamr66539545e9.5.1747297436910;
        Thu, 15 May 2025 01:23:56 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:56 -0700 (PDT)
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
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 11/14] RISC-V: KVM: add SBI extension init()/deinit() functions
Date: Thu, 15 May 2025 10:22:12 +0200
Message-ID: <20250515082217.433227-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The FWFT SBI extension will need to dynamically allocate memory and do
init time specific initialization. Add an init/deinit callbacks that
allows to do so.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  9 +++++++++
 arch/riscv/kvm/vcpu.c                 |  2 ++
 arch/riscv/kvm/vcpu_sbi.c             | 26 ++++++++++++++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 4ed6203cdd30..bcb90757b149 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -49,6 +49,14 @@ struct kvm_vcpu_sbi_extension {
 
 	/* Extension specific probe function */
 	unsigned long (*probe)(struct kvm_vcpu *vcpu);
+
+	/*
+	 * Init/deinit function called once during VCPU init/destroy. These
+	 * might be use if the SBI extensions need to allocate or do specific
+	 * init time only configuration.
+	 */
+	int (*init)(struct kvm_vcpu *vcpu);
+	void (*deinit)(struct kvm_vcpu *vcpu);
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
@@ -69,6 +77,7 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
 int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
 				   unsigned long *reg_val);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 02635bac91f1..2259717e3b89 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -187,6 +187,8 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 {
+	kvm_riscv_vcpu_sbi_deinit(vcpu);
+
 	/* Cleanup VCPU AIA context */
 	kvm_riscv_vcpu_aia_deinit(vcpu);
 
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index d1c83a77735e..3139f171c20f 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -508,5 +508,31 @@ void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu)
 		scontext->ext_status[idx] = ext->default_disabled ?
 					KVM_RISCV_SBI_EXT_STATUS_DISABLED :
 					KVM_RISCV_SBI_EXT_STATUS_ENABLED;
+
+		if (ext->init && ext->init(vcpu) != 0)
+			scontext->ext_status[idx] = KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE;
+	}
+}
+
+void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	const struct kvm_riscv_sbi_extension_entry *entry;
+	const struct kvm_vcpu_sbi_extension *ext;
+	int idx, i;
+
+	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
+		entry = &sbi_ext[i];
+		ext = entry->ext_ptr;
+		idx = entry->ext_idx;
+
+		if (idx < 0 || idx >= ARRAY_SIZE(scontext->ext_status))
+			continue;
+
+		if (scontext->ext_status[idx] == KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE ||
+		    !ext->deinit)
+			continue;
+
+		ext->deinit(vcpu);
 	}
 }
-- 
2.49.0

