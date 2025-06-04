Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9223C262FC5
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 05:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749013750; cv=none; b=VgHngWkbSbORxzFwWN7wURylKLpHqfPPFHUqXs6VsyXGtIlFAuYN1LhV2T2oUnjwv7QWayjBl+0Cv/+PyY+WdrkAqj5cbv3GQ/WA+lKlF7gJ3vlyH0e9X+Z0ab44wKrpaC7LNKy7w7yX6lEMuJxoRxS4gEzN+mTOcaJTTAEU2bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749013750; c=relaxed/simple;
	bh=+djBXRGZZ4KS/japPqQxkteXePbiEDHtGk4KYt6B518=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HSFUwFygZZ5qp7OWZQ42FuoB2OlpRSmK0LZfRh+jCxGCfR1vwqJBLQaGMtZolKGa5wsXOPirvjZBeo3KNmIpvePa8xkdHMMwdqNB3GMD6f5qsKoM82PWv1amh2hn6TELodZyOCMPzAt/QC8mFtLMPhd7y17r0cBh9XQwORkNg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aZpsQ2rd; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aZpsQ2rd"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311f4f2e6baso6173989a91.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Jun 2025 22:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749013748; x=1749618548; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HXtiOD32k+3IRpg7Tl5Q1Nm4vKBBcoEeXUHabwSNFEc=;
        b=aZpsQ2rdXY2M/DO5xgroGh9FlkRp3fC+ZRpjKgqF947j0VsAfMZBqP3uIQOwOZ1Akv
         PasdGXbQXE2FC30LGwraR60z1aXE8dU0GDzyjiVPFmt7zlD/mopPE8n1HyzRIMsvz2gR
         fS0B/EG+2wG/M7a8JtoB+bJN3AO1URYgcbasrBMo390CLtcku9iBXbf37Wpz2Y4ado/B
         7JSbPPQ15gvEslhK90i0OTM2j+r8vMpTkiVi4BU/bz5kopezq6tpJZN/Rk7XYE6J1rJQ
         gsdRPKP+lqzULI98zrIu/5k0bGcBdvhPvhbW/70nu25Wkx6LKq/3r/7a4UavUUAFOAmH
         I14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749013748; x=1749618548;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HXtiOD32k+3IRpg7Tl5Q1Nm4vKBBcoEeXUHabwSNFEc=;
        b=RbwQIsJUFKMfzqpLDXRA+RaJs+diXrFCviTWFiSey636O/85WGOwBS9S0XQBD+9udw
         XIEiS6TJZGvefR6iq+mW5jVqO+9uzmub8FMGJNCLSpPutOtHIS/W0HgoO1oXU4huR6md
         8p4SNxQrKmJG9Ui43Ir8bS5L9voz/cmE02dBHfWq8BXQyLbAJl9KR3k/gYKJlbqXZV4w
         ATGL49NYVb6y2ma+K/aGOVL2l+YT2pyO9EZOzbZUpecqmCICa0dx2WtlLp9QMKE+33qx
         P7+PNMA33XIbgxTt6Exrdag7Q1LqexPoQ5vgCusOk6PvAFyBF3E0YKtUJzCMunpmeH8M
         rfiA==
X-Forwarded-Encrypted: i=1; AJvYcCWJkz9JvlAWYnX/P6IGcbx6shWxKfhBTwevDljjYuShVV85xoySI8/LGGQCFM2MUmDR6hW7gzzOxqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXrhCTVYxzY38glwUQhbbUNw2dmuF+MRU/vW+8q/fGOQ1YodP5
	P90k7Vl/YRhd3V0p7TmXFN+KrqjOvAD4YKpU5PTVYryfktokxZXH8o1qERNWa4D2bMAKcXx85L1
	sIFeo3Ad6P0opZQ==
X-Google-Smtp-Source: AGHT+IE0yG+wVldA+Ut+AEkkDvhjuf8f2LJxfg7qHFUSl5PI3nGJnDA82B1khwNucVOGJtMX8A10UmFpgQtpEg==
X-Received: from pjh4.prod.google.com ([2002:a17:90b:3f84:b0:311:9b25:8e87])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:28c7:b0:312:e731:5a6b with SMTP id 98e67ed59e1d1-3130cdfb38dmr1864793a91.32.1749013747721;
 Tue, 03 Jun 2025 22:09:07 -0700 (PDT)
Date: Wed,  4 Jun 2025 05:08:57 +0000
In-Reply-To: <20250604050902.3944054-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250604050902.3944054-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250604050902.3944054-3-jiaqiyan@google.com>
Subject: [PATCH v2 2/6] KVM: arm64: Set FnV for VCPU when FAR_EL2 is invalid
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
and results in a synchronous external abort (SEA). IOW, both
FAR_EL2 register and kvm_vcpu_get_hfar holds a garbage value.

In case VMM later totally relies on KVM to synchronously inject a
SEA into the guest, KVM should set FnV bit in VCPU's
- ESR_EL1 to let guest kernel know FAR_EL1 is invalid
- ESR_EL2 to let nested virtualization know FAR_EL2 is invalid

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
2.49.0.1266.g31b7d2e469-goog

