Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D76A22FF35
	for <linux-doc@vger.kernel.org>; Mon,  2 Jun 2025 19:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748892554; cv=none; b=Ezwyq1seBunWHzw/53wu6vX6ruUUPZS6CQmJy5+X1cJ0S+idr01BmiK3ykR4e4xz+d97XLzj/wxO9pjsVuLYTsa2SLLPW5KEIA+gDMG4zONItx6l4slfZbs67DMCF5GEJoRZJTDJ1z/Wcteu9LsyvJekaDyG8xcPy3jyb2hZPJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748892554; c=relaxed/simple;
	bh=RyYQY6ZWwMFc6nT32sVnu5XE9OeBNCLMJOkY/XJHt/w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PHp30Zw47acYmNwgE1CztksGyIDIwFP5AQ93q0s/6OOp3yNQsnN4QYFMdcTSiUN+5jD7gXkblU5HnhVEuWB1TFlHbJTw4RIgfvZnCkSKace9z5qa65ZpRqbeVCnDYYTbkteqpjpiUwF8E/bCjfxcBPaS6MmocTWMemSXhcLheA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=khYSWuyw; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="khYSWuyw"
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3dd759fd518so53100775ab.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Jun 2025 12:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892549; x=1749497349; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hkgTT4wWRbZ1NUmf838c82NeTMr3HJQoA5BVqQ/v/iI=;
        b=khYSWuyw9HzV9FkBarCb6oz8b1yjArseGBHZtLRrStnwQdQn5DF7MhufpBb4NfxvMh
         OsjXzTjjP4fHMuk2FezGNy4xf8Vty7S0uKtNFnVTs3FVlKh8tcMdDmg7cb+chMpfpedE
         4iXCuvd/VHgOvSFl8Sr6jFeYLGEOEWAhfi2kVgRAvJccjempLfqyxXSNQwImUoNJvR4B
         UMcydgI1kYJM50OKNt0pjsuU3FkMow6Se1gQew4QboHe8wMBU0haeSd5Ss3N1239N/6O
         QTUxs1sEhSgYbXEPeFqxFt29fCGhu9N7n1WeEYzUfOYmC76AZ5r9yDz4ToRBYHS5JwAW
         ompw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892549; x=1749497349;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkgTT4wWRbZ1NUmf838c82NeTMr3HJQoA5BVqQ/v/iI=;
        b=KNAUMuHf5FKyuPMq7Mhqy/nThgMINHkRiNs/OHmTvFLQrrZt+KZmS/BAaH31R9EE9Y
         sP5V+6AuyBEYVNqJLQOmdTPBTOG3d1wzyAVRvunw3VU/gr+jBI0nNEGdzlplYWnogPy9
         so4haTyZbLbkAcxy2Hcx1cBXevnL7elZURcjL4Ynk2pZ5NnQp447lU3UXF487Bei8lVi
         UF/YnYi3ISNTNYz9Ig1k+8U6mIUcDC3gvAzn3CQdWNLWM78rkDRm+9+598L7QWPzKX6E
         HYNWOOfbvKdNg+pm+vudzUg6NsTiapF0PVIPwaQuF6nYfZQDwEOapp8MVCf0lgT6D53C
         w8jw==
X-Forwarded-Encrypted: i=1; AJvYcCXbqBGedSymBXi2c/YW4sZ48kp6noWCWMRp0wPHckld35lEcFo/tXfEOtMHnQQ6HqaDFEI88FlDdIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYxZfkfM85SdcDj9aqWBLp72yJWQR/5tQdVKMNE0ziagMj/sEB
	LrO9DZ+tWqaBYvSiChNXCqpLO9jAlD9zs/f2Dw9E1O5jXlGDcY2vf+KpJ4byrGE7vtqzMSyYMde
	GXU3jk+aqKEZpFkrCBEuXN475Hg==
X-Google-Smtp-Source: AGHT+IH/msiP+hJPT5a6q/xsva/w/itdMQOY/9ZqIFVxoo9pak9WnZnc3ACatvAhfPGVJEVfjUEYVcYY8x4wERvcsQ==
X-Received: from ilbbl7.prod.google.com ([2002:a05:6e02:32c7:b0:3dc:7303:c8cf])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1fec:b0:3dc:8b57:b76c with SMTP id e9e14a558f8ab-3dd99be4926mr150059925ab.9.1748892549700;
 Mon, 02 Jun 2025 12:29:09 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:26:57 +0000
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-13-coltonlewis@google.com>
Subject: [PATCH 12/17] KVM: arm64: Writethrough trapped PMOVS register
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

With FGT in place, the remaining trapped registers need to be written
through to the underlying physical registers as well as the virtual
ones. Failing to do this means delaying when guest writes take effect.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h | 10 ++++++++++
 arch/arm64/kvm/sys_regs.c          | 17 ++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 8eee8cb218ea..5d01ed25c4ef 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -142,6 +142,16 @@ static inline u64 read_pmicfiltr(void)
 	return read_sysreg_s(SYS_PMICFILTR_EL0);
 }
 
+static inline void write_pmovsset(u64 val)
+{
+	write_sysreg(val, pmovsset_el0);
+}
+
+static inline u64 read_pmovsset(void)
+{
+	return read_sysreg(pmovsset_el0);
+}
+
 static inline void write_pmovsclr(u64 val)
 {
 	write_sysreg(val, pmovsclr_el0);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 377fa7867152..81a4ba7e6038 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1169,6 +1169,19 @@ static bool access_pminten(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	return true;
 }
 
+static void writethrough_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p, bool set)
+{
+	u64 mask = kvm_pmu_accessible_counter_mask(vcpu);
+
+	if (set) {
+		__vcpu_sys_reg(vcpu, PMOVSSET_EL0) |= (p->regval & mask);
+		write_pmovsset(p->regval & mask);
+	} else {
+		__vcpu_sys_reg(vcpu, PMOVSSET_EL0) &= ~(p->regval & mask);
+		write_pmovsclr(~(p->regval & mask));
+	}
+}
+
 static bool access_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			 const struct sys_reg_desc *r)
 {
@@ -1177,7 +1190,9 @@ static bool access_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	if (pmu_access_el0_disabled(vcpu))
 		return false;
 
-	if (p->is_write) {
+	if (kvm_vcpu_pmu_is_partitioned(vcpu) && p->is_write) {
+		writethrough_pmovs(vcpu, p, r->CRm & 0x2);
+	} else if (p->is_write) {
 		if (r->CRm & 0x2)
 			/* accessing PMOVSSET_EL0 */
 			__vcpu_sys_reg(vcpu, PMOVSSET_EL0) |= (p->regval & mask);
-- 
2.49.0.1204.g71687c7c1d-goog

