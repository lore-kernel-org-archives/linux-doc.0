Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7C023237C
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 15:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741619688; cv=none; b=XrQ4Et9zCFWBuMEo6Z/2Fn1KYBDHPRef5JErwADa36bUlRnVJjzubuS8Gms0APEKgnUeNViHDUZiQL1+pygZUay65dXW8yKS1aH2LztHhXykNSsI+8+iQBqYFV/+uQDqgUhSBTl9Seypwc1YoRW19BJAdphRUI6LrQ2ehQnF324=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741619688; c=relaxed/simple;
	bh=RjDzKYoAvlKNtUWvQ+NXMggJmy91OtoJ6HGr5PDli6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pCGRhpZH3zMCtXYDv8g8yNYzbviQQv41Wa3FKi26IHA1XEMlmTt49en5vU8lHlehvOWR3M8hU9Fpq+tS9AIGUt+0artfER1XNtAzRJf5Sgcvdj8ArZw4X0L+iGVyv6968qTErTRmB0Vd9ON7HztbZhpk1Sxrgv/6JhDQJVWZox8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Ind7pQE/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Ind7pQE/"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223959039f4so86607495ad.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 08:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619685; x=1742224485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YO198dOv/JV7u6RiN4qQUqM3nesMDxD5mvDVMd+k3NU=;
        b=Ind7pQE/WbUNlyQ8d9R9VZr5ciqGoOFgMuRXw1GIkh7lHxrddDKVHsEjvDNnYeiV3j
         1WFPUCs2Zyi+QMdenoulBDEZxrfSTrRyFkVkvOlTEBBVXfCU9GHtxNK/Ulq0WhrvBxZi
         pfmNnsFpdZvIJ1BXV28hSP+SVqLghqLnxCLGWj1bj9JR8mSNIzIEctxTNqaAQAz2r/n0
         7r4GOD8dYLeqnz9DyqI8d9lifUCaT3/tEAOksVUv+IxdRNPmwsOuBaw40egXSkVGRSol
         Kifq3xa+7jRHCIdsxsgZ83YWltTAby5EmBWonSrugE1o6AHpnb3uRIhBAccvlVK/wBX6
         iHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619685; x=1742224485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YO198dOv/JV7u6RiN4qQUqM3nesMDxD5mvDVMd+k3NU=;
        b=QYh1mfemmyRggjWcov59zhtDmdSJ/whKPMff7llo9Y/EYJkhhOjTln5d98mVBwEOJ1
         ib5WxKLd2ar/oh4d99sQ7Z+d3sL/QVx2DBzS8QSoT4yI1LqW7LbvUObLsPsdIm5ianbd
         Ha98uORB/SdPz7sZdo7cMtmiVenk4GLoQ4Rmt3a2KyqETZ2JCOpc+zInRcEeD3geOfnM
         MqAy5zB2kBg3fYMgdZdwIMFxqYF5waeIEK8lMiJLCI6kDLng7JHmcEwGZoIEZIkzp5MK
         aNEJffac8ohQty27HfeUtoZjiQBYJ5PN5IPhoRGdA7UEIGY1nAlOWyywygQQfL/9CkLE
         Dvtw==
X-Forwarded-Encrypted: i=1; AJvYcCV6GsnZf/BqG7h5az4XAnNUg062mL211Hb0JqYAYiCmP+RXD1dbfpi5IAw5FNOb36WDuTEtVNEkjbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEqBODwxN0tXfqbJFyrNANaI0z+xecYQ4Jj1hksUSc1nyVa/tO
	zWlWR2irnq6CUEVkTM5HhEaeZdznIDYhzc90rLzHcdroQ3JCLqVd2x3LIZirLAI=
X-Gm-Gg: ASbGnctFj3oz6nyaYAmPuYYPCOqQTt/iI/FWSAFDLd5S220nWCamnnf67FKm50Q4Wnd
	hfP5Y+s4P0IWX1Tgt7gX8Pw/wy/RC94Us6oB8VmJPeOJQ+3Pz+aQuUJdzYJ3bYGp3jlcUk5ONcT
	mDYz7zxZt+AWbC3ROOJs/3gIAbVAPtDQYp3BIsrRCWIvTY4w8Rx78FAZiGGA3PM44slKQwf27Vx
	GFUbsGsZFnJMer4b4fisyHkG/xlpaZj/5w5rybvbFdjId8pRG5saZzx1HtqNMI76av11RC2M376
	jbPfgxN6cTp411laMaL1CEEzOit5SzIQ5eSPfWU2aswkiw==
X-Google-Smtp-Source: AGHT+IGIS2XxIf4TQa/glKSShb2DPMKV2nM+32P/jFh4qY9T5snUhs8ena+pzkKO/eEMPCMRH58+YA==
X-Received: by 2002:a17:902:eb81:b0:223:5ca1:3b0b with SMTP id d9443c01a7336-22428bd592amr282084395ad.40.1741619685003;
        Mon, 10 Mar 2025 08:14:45 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:14:44 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 14/17] RISC-V: KVM: add SBI extension init()/deinit() functions
Date: Mon, 10 Mar 2025 16:12:21 +0100
Message-ID: <20250310151229.2365992-15-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
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
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  9 +++++++++
 arch/riscv/kvm/vcpu.c                 |  2 ++
 arch/riscv/kvm/vcpu_sbi.c             | 29 +++++++++++++++++++++++++++
 3 files changed, 40 insertions(+)

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
index 60d684c76c58..877bcc85c067 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -185,6 +185,8 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 {
+	kvm_riscv_vcpu_sbi_deinit(vcpu);
+
 	/* Cleanup VCPU AIA context */
 	kvm_riscv_vcpu_aia_deinit(vcpu);
 
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index d1c83a77735e..858ddefd7e7f 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -505,8 +505,37 @@ void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu)
 			continue;
 		}
 
+		if (!ext->default_disabled && ext->init &&
+		    ext->init(vcpu) != 0) {
+			scontext->ext_status[idx] = KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE;
+			continue;
+		}
+
 		scontext->ext_status[idx] = ext->default_disabled ?
 					KVM_RISCV_SBI_EXT_STATUS_DISABLED :
 					KVM_RISCV_SBI_EXT_STATUS_ENABLED;
 	}
 }
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
+	}
+}
-- 
2.47.2

