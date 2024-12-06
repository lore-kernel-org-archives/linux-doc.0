Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E05680054
	for <linux-doc@vger.kernel.org>; Fri,  6 Dec 2024 01:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733446975; cv=none; b=sh2JBQo2i2s6mw/PbXaie2ZUvcYA/1mJ4XzkP/9RXW3owDSs0XZKK5pgEKTulElOZBGL6x5LAfegtWpSUDN2S7X/pSF/5ZKaQB7x4Ntl/IcX1YNMR3UX0XDoeNxxdtrCjut5MvZRSCbE3Cge2zqHcHXjTA/FXmFkJSA73cQZWuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733446975; c=relaxed/simple;
	bh=p3ayRHOyJ37cYdE5ih5cbVRLX2IsH/iMc+NXkzKTL5c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ew0B+sv5Y5C7FYwHY9j+s9wL1wedOVMn+Ygyz+8hqDhn9+Qz7u4qIindMf3TjvoNZWT9FYfyX1bqK9+teJebVISJmHR3Jj5/smYVE9fqUa2oTxe1NnR1rn8S0AXySDz2vBu+nxNcbDttSbr4mmH6FfZFzrd3m6Ku8UHlYqALb54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NRA/L3Er; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NRA/L3Er"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ee6900147cso1567121a91.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Dec 2024 17:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733446974; x=1734051774; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=odFeXfqtlca+kvw0AmBBC4wYZf1vb1zFbu4qDCM5v8E=;
        b=NRA/L3Er5i8mGdWywOoxP72zMRsg0DTlEmvuMN4oy35CY2J2kHwKa2zoKyJa/WwhNq
         0J8qrhrk63hhIolLt622xin5AwmOKJuLJ0c81+TrsZMaw2Up9Mfedh8t0JzNvt4mbAbi
         Mske48I8z8EfLpq50VyIYyFYU+7aY0h15qBH0ofYrKayttRz2F7xBNUSNxviP+e3I0tI
         OsLUSe2w4tSK2Xy5MRkWZ5YLpFLYVHYVdqlsdm9cN/Y0jWao9uFr+HqV/CugBI8CJqts
         mGg5u/Q8HG5noOJDB5D/4TLLSEf0l2FVUgsJeJAIVcuTEaVY6bRPN2OE+GE78xuNGj/5
         hA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733446974; x=1734051774;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odFeXfqtlca+kvw0AmBBC4wYZf1vb1zFbu4qDCM5v8E=;
        b=gNMSBWmIps0LCwTH+DM1qJ9CMjuhD18TnOkNtaIMvHdlXSjElmtLULvVK2LFqX97Ga
         odZXHVDx+mgxlRV/ParkDU3iZ1Q+2vf8efDtEWJHcNeF+ZBO9KJxwJMs0h3AMHQypiFh
         c0KBqqjnkkC3iqHvRDhDAFXEXAYiuffPi0ShC1sIwYcbyYUhgme3i4cJ3UKwlMunGu0i
         H7/0IaPGHrY88fO1371MM7vmbH50Z8e4VnjRI9FhKiSi10I4BbAsOHf/3JZwXcYFo0N1
         BJZoAukkyIBAR1fMckQ/XI7Dg8f0HcIQk5P/+AR7Vb+6vNn2QBRUWrRIm6o6URL0ON2T
         XYjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOwGH9sThsmfmM1Yx5SSyV0GkTwWpSkbEY6u64k/mw6F3qPkY0Vx/gcdIFpTfvV6ChE/BtfMs6hrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiigRDdWhF1fzqXt5i06cdhZQFm7u+jeipsLrSD4LMSnkuOTIZ
	xt56dMUpoNfbGs0Z9EMksCF+QwIy+loE2kSrXLblgaSxdhKJpylSx3wRdcBZu6juzmEd4Dx1ypc
	fXJlbnKDPSA==
X-Google-Smtp-Source: AGHT+IG/xsuehHtVKFEvmGgFIgshQ+B4zAUcgF8mwEzljCVlVfmJ7/hjNhV2sOIJea1Ftx1RfhpzvhzzdrXv8Q==
X-Received: from pjbqo11.prod.google.com ([2002:a17:90b:3dcb:b0:2e2:8d64:6213])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4c07:b0:2ee:d024:e4f7 with SMTP id 98e67ed59e1d1-2ef6919952fmr2142759a91.0.1733446973755;
 Thu, 05 Dec 2024 17:02:53 -0800 (PST)
Date: Fri,  6 Dec 2024 01:02:45 +0000
In-Reply-To: <20241206010246.40282-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241206010246.40282-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241206010246.40282-2-jiaqiyan@google.com>
Subject: [RFC PATCH v2 2/3] KVM: arm64: set FnV in vcpu's ESR_ELx when host
 FAR_EL2 is invalid
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, duenwen@google.com, rananta@google.com, 
	jthoughton@google.com, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Certain microarchitectures (e.g. Neoverse V2) do not keep track of
the faulting address for a memory load that consumes poisoned data
and results in a synchronous external abort (SEA). This means the
poisoned guest physical address is unavailable when KVM handles such
SEA in EL2, and FAR_EL2 just holds a garbage value. KVM sends SIGBUS
to interrupt VMM/vCPU but the si_addr will be zero.

In case VMM later asks KVM to synchronously inject a SEA into the
guest, KVM should set FnV bit
- in vcpu's ESR_EL1 to let guest kernel know that FAR_EL1
- in vcpu's ESR_EL2 to let nested virtualization know that FAR_EL2
is also invalid and holds garbage value.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 arch/arm64/kvm/inject_fault.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index a640e839848e6..2b01b331a4879 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -13,6 +13,7 @@
 #include <linux/kvm_host.h>
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_nested.h>
+#include <asm/kvm_ras.h>
 #include <asm/esr.h>
 
 static void pend_sync_exception(struct kvm_vcpu *vcpu)
@@ -81,6 +82,9 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr
 	if (!is_iabt)
 		esr |= ESR_ELx_EC_DABT_LOW << ESR_ELx_EC_SHIFT;
 
+	if (!kvm_vcpu_sea_far_valid(vcpu))
+		esr |= ESR_ELx_FnV;
+
 	esr |= ESR_ELx_FSC_EXTABT;
 
 	if (match_target_el(vcpu, unpack_vcpu_flag(EXCEPT_AA64_EL1_SYNC))) {
-- 
2.47.0.338.g60cca15819-goog

