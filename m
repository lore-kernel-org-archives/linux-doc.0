Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114349;
	b=Ccl3Xn2TMlGDWwbKBxQ5UX5M4ikIbmMRKPdfslgi6Ozdmzx29qXVBoGKhND6ugoDFk6/
	 VmY+0vqTS/lHILE/tjMTSUetwWP6BVr45oUayj0lIIMJz+xqHmXgTRH9o5c/fXG4xAb2/
	 geihu2XMa5UayE0zdU8/bhCsvphZPZwcgmEpjfhF0djRw+vaN0z1zcH09FV3LM7M8DWXJ
	 3GLGTNbTSg+ps5VGAytK4/mun2fasyvg+qAUhYGVy4RrQnnIK6pz/QroWqbrmwqOzlxJK
	 keyymW3i7OF1zX4r78zxB9Kd5ayhm+lDXqzyjz1oNOBLLzHpQynXZWe2AFWPLgDztxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=csLHF3CBUnlXJTptSifuZSIi+Kvqipz6udOO3q4U2lw=;
	b=wF5ERIcfX63w8CgZ2+my8qERFcRdO4Uo2jpon9pcxi5k6Moco8QF3TOHXfk8xu0LW/lT
	 EvDnObFIQ+6pjT2O0o0q2My5cmjpiTIvBIUmHYcJ02Ug+C3i64BZ+OUJ/f/JHzC2/4QqV
	 LYqapPtGu4o4YIv/fSPXNV1NyO3ZsLYjd8/5V7Gl+RiTsptXhzxDL43QRMTQzvmn8zSpD
	 8fdyZmaA/MRxZAzlM1u0hWqjAXKIA7bgFlwBfcl1urfjCVS4/6zHy4na/8x2ZbfQk5pmV
	 +OgWvKlUs7ZeQqC+JtQOoQ51gk+cStr3Mk4n+fXQjHeKDTMMdvaKle3HTb6sz6EcaKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a2CgE4zS;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C342A606A33F
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 18:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C342A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a2CgE4zS
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-574f8578e48so156313b6e.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 10:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114348; x=1795719148; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csLHF3CBUnlXJTptSifuZSIi+Kvqipz6udOO3q4U2lw=;
        b=a2CgE4zS0wT+jr6scYnrAmt1TOv6r4Tm7HZXYfgazgjbSIx8Gxbyqd4ftr52ZYAbyI
         Zv+w+zNIS/X9tmWITHTHrt1ZQY6wJjfERA7UuCTBrI6KRB47n9V2S3uur3CZD3mX5HyX
         TzisPjjK6dDLBiN9xfcrhL2IrWjm61aVaBAxo4zmY8q4B+legvV/2f3DM4qn78Bizk+u
         mBOtqJYDWDFcGU0GSDiaLi3nsPbO6xJme7/biPSJVih8FTUwyGjPa3mD6b0GrdMmDIyV
         ZIYX/S116XU5Mh2YPEycQS3Avymwml1qcLa8cUJBbyWCvGtECYOwBbuxEQ2sikNZXzYv
         5sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114348; x=1795719148;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csLHF3CBUnlXJTptSifuZSIi+Kvqipz6udOO3q4U2lw=;
        b=dXt05EVRsmB4Fnylyu5AAoeIEvvCs3uubgLJ/0vpJw7vNLHr0qDeYNE9IO99MRwViF
         QIA5CuIMbvtkkU4hdhtaDePfwxQFZZu80qESw1sHf9mYCrUWbDdXBHlOdI5/2VMQx9pZ
         I1lvTsAV6u84q62aHSGtz6pgOZJ86lQVYTpJHxCjLnoA3i0sEnGN1VdYonrZ/knPSkaf
         NxvBzwIgraWiLylud+ZyAgGChBJa+bHknnrHdjjuvN+fgjtjg3j+3aLMDvoWRoANYUuY
         3KPxcNcVWyHxRY0Lf6DNMvqs9a/zE6RXQ6YO7wxtKxCNrZwkuUVH4RAouMS+x20ScnNX
         uBFw==
X-Forwarded-Encrypted: i=1; AL+hErEzvT1aNubPyqCPpRCjHFdi2ZU/27ntHHkATsJPlim90d2pvlrFeqdILxkmiPrMXjGOBQx0PyuEw5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8UKHLoccnBU0mc1n54BJeldRMneK9OmsfSDLI/mpyV7ZgSvhz
	U2ULZseZPxnTuoSnhy0IL4Izy4k842HQAdtjUWOVKlGEO76f1jaUg7ZTTSqdG1mMZD/nXXNU8o7
	M5QFu3WdBz0zgPhETfBifvkw9jQ==
X-Received: from jaaq30.prod.google.com ([2002:a05:6638:c01e:b0:61a:820b:b487])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:14c5:b0:4d6:90d3:e189 with SMTP id 5614622812f47-57a0b750822mr928387b6e.50.1795114347371;
 Thu, 19 Nov 2026 10:52:27 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:54 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-13-coltonlewis@google.com>
Subject: [PATCH v10 12/33] KVM: arm64: Set up FGT for Partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, James Clark <james.clark@linaro.org>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Mingwei Zhang <mizhang@google.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In order to gain the best performance benefit from partitioning the
PMU, utilize fine grain traps (FEAT_FGT and FEAT_FGT2) to avoid
trapping common PMU register accesses by the guest to remove that
overhead.

Untrapped:
- PMCR_EL0
- PMUSERENR_EL0 (outside nested hypervisor context)
- PMSELR_EL0
- PMCCNTR_EL0
- PMCNTEN_EL0
- PMINTEN_EL1
- PMEVCNTRn_EL0

These are safe to untrap because writing MDCR_EL2.HPMN as this series
will do limits the effect of writes to any of these registers to the
partition of counters 0..HPMN-1. Reads from these registers will not
leak information from between guests as all these registers are
context swapped by a later patch in this series. Reads from these
registers also do not leak any information about the host's hardware
beyond what is promised by PMUv3.

Trapped:
- PMOVS_EL0
- PMEVTYPERn_EL0
- PMCCFILTR_EL0
- PMICNTR_EL0
- PMICFILTR_EL0
- PMCEIDn_EL0
- PMMIR_EL1
- PMUSERENR_EL0 (in nested hypervisor context: writes always, reads when
  guest MDCR_EL2.TPM is set)

PMOVS remains trapped so KVM can track overflow IRQs that will need to
be injected into the guest.

PMICNTR and PMICFILTR remain trapped because KVM is not handling them
yet.

PMEVTYPERn remains trapped so KVM can limit which events guests can
count, such as disallowing counting at EL2. PMCCFILTR and PMICFILTR
are special cases of the same.

PMCEIDn and PMMIR remain trapped because they can leak information
specific to the host hardware implementation.

Under nested virtualization, a VHE L1 hypervisor executes both vEL2 and
VHE host EL0 inside is_hyp_ctxt(vcpu) without exiting to L0 across ERET
and SVC transitions. Trap PMUSERENR_EL0 writes via HDFGWTR_EL2 in
is_hyp_ctxt() so L0 can recompute MDCR_EL2 traps whenever L1 enables or
disables EL0 PMU access, and trap PMUSERENR_EL0 reads via HDFGRTR_EL2
when guest MDCR_EL2.TPM is set so MRS PMUSERENR_EL0 from VHE host EL0 is
forwarded to L1.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/config.c | 58 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index adaf26ab93b85..3220ed6fc9453 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1786,12 +1786,64 @@ static void __compute_hfgwtr(struct kvm_vcpu *vcpu)
 		*vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
 }
 
+static void __compute_hdfgrtr(struct kvm_vcpu *vcpu)
+{
+	__compute_fgt(vcpu, HDFGRTR_EL2);
+
+	if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+		u64 set = HDFGRTR_EL2_PMOVS |
+			  HDFGRTR_EL2_PMCCFILTR_EL0 |
+			  HDFGRTR_EL2_PMEVTYPERn_EL0 |
+			  HDFGRTR_EL2_PMCEIDn_EL0 |
+			  HDFGRTR_EL2_PMMIR_EL1;
+
+		if (is_hyp_ctxt(vcpu) &&
+		    (__vcpu_sys_reg(vcpu, MDCR_EL2) & MDCR_EL2_TPM))
+			set |= HDFGRTR_EL2_PMUSERENR_EL0;
+
+		*vcpu_fgt(vcpu, HDFGRTR_EL2) |= set & ~hdfgrtr_masks.res0;
+	}
+}
+
 static void __compute_hdfgwtr(struct kvm_vcpu *vcpu)
 {
 	__compute_fgt(vcpu, HDFGWTR_EL2);
 
 	if (is_hyp_ctxt(vcpu))
 		*vcpu_fgt(vcpu, HDFGWTR_EL2) |= HDFGWTR_EL2_MDSCR_EL1;
+
+	if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+		u64 set = HDFGWTR_EL2_PMOVS |
+			  HDFGWTR_EL2_PMCCFILTR_EL0 |
+			  HDFGWTR_EL2_PMEVTYPERn_EL0;
+
+		if (is_hyp_ctxt(vcpu))
+			set |= HDFGWTR_EL2_PMUSERENR_EL0;
+
+		*vcpu_fgt(vcpu, HDFGWTR_EL2) |= set & ~hdfgwtr_masks.res0;
+	}
+}
+
+static void __compute_hdfgrtr2(struct kvm_vcpu *vcpu)
+{
+	__compute_fgt(vcpu, HDFGRTR2_EL2);
+
+	if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+		*vcpu_fgt(vcpu, HDFGRTR2_EL2) &=
+			~(HDFGRTR2_EL2_nPMICFILTR_EL0 |
+			  HDFGRTR2_EL2_nPMICNTR_EL0) | hdfgrtr2_masks.res1;
+	}
+}
+
+static void __compute_hdfgwtr2(struct kvm_vcpu *vcpu)
+{
+	__compute_fgt(vcpu, HDFGWTR2_EL2);
+
+	if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+		*vcpu_fgt(vcpu, HDFGWTR2_EL2) &=
+			~(HDFGWTR2_EL2_nPMICFILTR_EL0 |
+			  HDFGWTR2_EL2_nPMICNTR_EL0) | hdfgwtr2_masks.res1;
+	}
 }
 
 static void __compute_ich_hfgrtr(struct kvm_vcpu *vcpu)
@@ -1828,7 +1880,7 @@ void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu)
 	__compute_fgt(vcpu, HFGRTR_EL2);
 	__compute_hfgwtr(vcpu);
 	__compute_fgt(vcpu, HFGITR_EL2);
-	__compute_fgt(vcpu, HDFGRTR_EL2);
+	__compute_hdfgrtr(vcpu);
 	__compute_hdfgwtr(vcpu);
 	__compute_fgt(vcpu, HAFGRTR_EL2);
 
@@ -1836,8 +1888,8 @@ void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu)
 		__compute_fgt(vcpu, HFGRTR2_EL2);
 		__compute_fgt(vcpu, HFGWTR2_EL2);
 		__compute_fgt(vcpu, HFGITR2_EL2);
-		__compute_fgt(vcpu, HDFGRTR2_EL2);
-		__compute_fgt(vcpu, HDFGWTR2_EL2);
+		__compute_hdfgrtr2(vcpu);
+		__compute_hdfgwtr2(vcpu);
 	}
 
 	if (cpus_have_final_cap(ARM64_HAS_GICV5_CPUIF)) {
-- 
2.56.1.708.g77570a6a1d-goog

