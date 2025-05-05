Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A0726A0F2
	for <linux-doc@vger.kernel.org>; Mon,  5 May 2025 16:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746461660; cv=none; b=udItBYqeV9piPVw+TynrZDcxMxFagiVBUW8dgq2sbVMrMSpRFVrB1J0IM3i8HJJYBo/Fl1l20cxjMm7OR3oiFaVXDQ3bH4lL7UiE8ny60oCHZm1wgX2EEwzzephRmEyfKikbRzyA63GrbUKKmGg7VfFW9vz8oo8+fR5r+d5S+h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746461660; c=relaxed/simple;
	bh=tP/Dy38GceNJDf3Zr30G5oxFd5DNpiB2roiPdOIJcEM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ykp7ZFznIFBgxPZwg1KKvBXJ9iH5ZmZ7NqHtlxYc0IM22+Es3QmEtZ57Da+epNwr4W/ZApjfauHrmHWFyzpaUI+ETiGdEAGtqJOLfQrgm9Ae15o58DOXc3BaUneGbbo1Yv8Hr2V6p8QCaQMwuvG1n+uq3EVVhg/S0WIkfnaG1tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dq1de9w4; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dq1de9w4"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b1f8d149911so4209647a12.0
        for <linux-doc@vger.kernel.org>; Mon, 05 May 2025 09:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746461658; x=1747066458; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OJagTHHNdVxyDzkTZrB+wizm+z9g6erBUIGhulC+0c0=;
        b=Dq1de9w4Pg5IEbVQ7AXzJAaX/hESIaPjg90O5SF3l8pDliiJs8rWe/u6tsuAracit+
         enRAQfE9EORFZ42ebCyZa/bC3BkD3qJd1OLRJbfQsGNX1Lf2jsi37yU9tsRg0uYDDV9g
         x11w5UrCq29k3EZSL14EV5gjIXw6SNj5/ORvLunUPHvhVR/ATPCRVnKOPUJmbOioPwSi
         t594DaLU7cHR6EtgdIP8I3gfqiNQB61vXIR6jmEMrJT45xYeTEZEH+CaaQ7TPClYXqgp
         lCkuzopDk+YmuIpvS5M/GSSIGAvjIvQbOAkWflbB7G9WX7fbXnytQmFBnALrXvkj11Md
         WxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461658; x=1747066458;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OJagTHHNdVxyDzkTZrB+wizm+z9g6erBUIGhulC+0c0=;
        b=quVg/Syq+uafY5INJvMfRtzZfoCPkSDcVoYDKRA9XtIW3hJgbomj9DdmTYLfpi8nxm
         WHE8Z4GVdKYNlpNRodP2vRbOsRD8pNM0QiP978DdLysCwGb0zbFcb6jE6+lSuC9pn+/S
         Y91FnNxPVnvQeIQz3aBFpyKDeowhdI/xdprsNt9JRqWD7w5k+tlSoZTbNHVUUuyBz5gv
         8YsJZZk9Lx08FXgHhduRIWIKAGGKl3bmGSq1DG88Klrsm+1WAOjDmMqMjPXG5n1aNYex
         wsRzYHZJyVrsx0kbswYFrXsQMUSzodrtyFeENkrx+I2y5P9ppvA7LgRHhs9MtXoC7Z56
         E2XA==
X-Forwarded-Encrypted: i=1; AJvYcCUI50h5yzrjXQARKCedO9VubnPCTBvbmHyZNrFF2NkkFu/Iw0zJuYEqDtFM9Ia4AjrdkvQxOSyaMvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJlw+YJePbfnB/d711y+QfJNVuI6Uyg069X0sphLnUxDDvUsx7
	x5XsTtMH/Ig1Vbpms+RRcq8qtnVsTSV1fQDHzNcma5f1wFhkQWks5CkD6Msb9Lig1eG58sip/TV
	pz0EK6U1g1g==
X-Google-Smtp-Source: AGHT+IHmeuVYVihs7sQ36TEo2hNXWZbWh14KISXEiA150JU3zbOiiYwpdjNYy9bWt46liO2U4UYaoHnwxcbrZQ==
X-Received: from pjbpw4.prod.google.com ([2002:a17:90b:2784:b0:2f8:49ad:406c])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d883:b0:309:eb54:9ea2 with SMTP id 98e67ed59e1d1-30a5ae3f34cmr13505195a91.20.1746461658457;
 Mon, 05 May 2025 09:14:18 -0700 (PDT)
Date: Mon,  5 May 2025 16:14:08 +0000
In-Reply-To: <20250505161412.1926643-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505161412.1926643-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505161412.1926643-3-jiaqiyan@google.com>
Subject: [PATCH v1 2/6] KVM: arm64: Set FnV for VCPU when FAR_EL2 is invalid
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	duenwen@google.com, rananta@google.com, jthoughton@google.com, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Certain microarchitectures (e.g. Neoverse V2) do not keep track of
the faulting address for a memory load that consumes poisoned data
and results in a synchronous external abort (SEA). This means the
faulting guest physical address is unavailable when KVM handles such
SEA in EL2, and FAR_EL2 just holds a garbage value.

In case VMM later asks KVM to synchronously inject a SEA into the
guest, KVM should set FnV bit
- in VCPU's ESR_EL1 to let guest kernel know that FAR_EL1 is invalid
  and holds garbage value
- in VCPU's ESR_EL2 to let nested virtualization know that FAR_EL2
  is invalid and holds garbage value

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 arch/arm64/kvm/inject_fault.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index a640e839848e6..b4f9a09952ead 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -81,6 +81,9 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr
 	if (!is_iabt)
 		esr |= ESR_ELx_EC_DABT_LOW << ESR_ELx_EC_SHIFT;
 
+	if (!kvm_vcpu_sea_far_valid(vcpu))
+		esr |= ESR_ELx_FnV;
+
 	esr |= ESR_ELx_FSC_EXTABT;
 
 	if (match_target_el(vcpu, unpack_vcpu_flag(EXCEPT_AA64_EL1_SYNC))) {
-- 
2.49.0.967.g6a0df3ecc3-goog

