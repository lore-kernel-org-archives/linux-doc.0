Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114358;
	b=TO3UqJAGbff7EK2G9F4LOGLOBv2gqKvdNlUfNAFS8MFBB2igZgIsWV7ObJ+2KaxY7wCk
	 xZ1DuF9NLlssOcVn+zSLRP7zTI8mbm6Fx2Y7IFCtEJLUDd2hxzEjD9r8L5MY24JdyehpL
	 qN2FidDy+RKNENATTUUHC/u2CeM+AHWOuMEXEe1rvPus3JsjrCsDp0J0WNeP9nRdLyd3f
	 ttPQOQg8mPqm2VBengsjZwLWhs/lV4vNoJD6hgTXLrF8oR8kmk5Iohzd6X05hXhk9EZTd
	 EgF17Eh8sXPjSiwCteAkQNlA+Ybfm9kpNa81bV2nik0FiljPNFGLjBqEzGNL+j2IZIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ZrQiJeW1/ZGAZNj9EqpY+oYKcoF1CcN9MBzVSNJZPxc=;
	b=F76VOmTfvUn4W8Sc8GrBMtAB7mRJz6zc0lN1NxwZu97F6T5KEoDhOsSO08aQgYNXtDB5
	 dklcy0vgU78D7ewlFZ56sIYFvfItxnOIUognB+rfapskuTsqcLyViIeogLPM2T4Cgn/Pj
	 T4qbdxOERA8jPBEb1Risr5E4GSpP/A7tr5PmMoWl5QReXbI8yIh1nxCGyuvdP7K7aLrOx
	 dmLh09hoUjjWKYgSxp7YDkm2Jr1eyGwjiwAG3IXw9LvaVNYLwVCsJZyNCP5V/neKB0mgS
	 3rYg4luGmj5D0jDSxoSGUiMzhlu+P6HDaW75pwTty+SQfGV2reJ9QkmCzrVqBpQaU+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=djTQwvGo;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0006606E8C9
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 18:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0006606E8C9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=djTQwvGo
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4e937c5bd4fso121173b6e.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 10:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114357; x=1795719157; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZrQiJeW1/ZGAZNj9EqpY+oYKcoF1CcN9MBzVSNJZPxc=;
        b=djTQwvGouuLjxkWqR3c9bPKwN/fycxEJsz46gazrcL55seCy00j+IlwKtjdnHf423Q
         nDqhlPtjai7dC7ZgHo5qWbK5qUAefvDOdgQ63QdA4Yngef/ylXyu9KPSipd6OdWGf6oN
         6qdA2OSrq2S5LuamR8CrJ4IgvL3krCF9KruFSWJed3J5qHLxH15nreaOEc2auIvqb4+w
         R8mav+ERdQ2k2IcsqRDdXiicDyPX0bz0Nn56HIhrS5jMhVxVjzFcOuFB8maAUzMBjDwR
         /3w0OAvtg6Ey+mYrIIB7CtSMGY6zwpkOXXemuz3r1IWrr7q90Sbkye6vss/SyHrSO7Lr
         EWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114357; x=1795719157;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrQiJeW1/ZGAZNj9EqpY+oYKcoF1CcN9MBzVSNJZPxc=;
        b=LvNwHf5JkpAiAjxvG89LJdlHJTCGUZ2T18EJCWGWhKpcjhhjmMRTCpugtO1iuuj2wK
         1EzZopw4HuBYYfzNMQCECaWkZXrhqnDt0pRGNfhVkEE2/OhtZxdaxstAdmPBCSZBN861
         ekvNARhSoi5VQdhp03Yhvaybb78dEigV57thD0TV/GAemZ2iORwWxy/pK/YInQqEkBG4
         jVHX5zOOf53Bw3AXHapRM0dTj8XBUt35QE9RGrp/C0Drwv+a+vqaj53AfChPvUmjZzEK
         EtAK3hDN9+4tYGkqbJobutcauN2MCoHlY6DChc3263mrJSAtm7h7tO+Z7A6ldmpUi8Gn
         b93w==
X-Forwarded-Encrypted: i=1; AL+hErG23FejpMKQPkhP2FLOmLQ3tqB9/ClwHZL1M0HddvcyIgjNnycBgBagrt/3ngrwSyaiKCnCoMPZDMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z99xmVQkz5eaLlZ3vW1fPBQwErHfqqilruRSUF4vLqeTNymTEvM
	/orV5hXYQWDEhqGWixqjdO2EoM7RVMup6HPJTIxefPFOihMGf9QdKDle0A/H6Dz/zIj5YfUwxNa
	wQpwgA+aKNgngRmSCvBE41RAAzQ==
X-Received: from iof12.prod.google.com ([2002:a5d:9c4c:0:b0:9c4:b80b:7605])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1384:b0:4ce:a4fc:a848 with SMTP id 5614622812f47-57a06a0da3amr989109b6e.6.1795114356571;
 Thu, 19 Nov 2026 10:52:36 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:03 +0000
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
Message-ID: <20261119185215.632334-22-coltonlewis@google.com>
Subject: [PATCH v10 21/33] KVM: arm64: Allow kvm_vcpu_pmu_resync_el0() to
 resync filters in process context
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

Previously, kvm_vcpu_pmu_resync_el0() only scheduled
KVM_REQ_RESYNC_PMU_EL0 when called from interrupt context (such as an
IPI reprogramming host perf events). When perf_pmu_resched_update() is
invoked synchronously from process context during vCPU load/put to
reschedule host events around guest-reserved counters,
armv8pmu_enable_event() calls kvm_set_pmu_events() and
kvm_vcpu_pmu_resync_el0() in process context.

Update kvm_vcpu_pmu_resync_el0() to call kvm_vcpu_pmu_restore_guest()
directly when not in interrupt context so that newly rescheduled host
perf events have their EL0 exclusion filters applied immediately.

Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index dbbe219ac874f..d3fd438a57b09 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -213,14 +213,17 @@ void kvm_vcpu_pmu_resync_el0(void)
 {
 	struct kvm_vcpu *vcpu;
 
-	if (!has_vhe() || !in_interrupt())
+	if (!has_vhe())
 		return;
 
 	vcpu = kvm_get_running_vcpu();
 	if (!vcpu)
 		return;
 
-	kvm_make_request(KVM_REQ_RESYNC_PMU_EL0, vcpu);
+	if (in_interrupt())
+		kvm_make_request(KVM_REQ_RESYNC_PMU_EL0, vcpu);
+	else
+		kvm_vcpu_pmu_restore_guest(vcpu);
 }
 
 void kvm_host_pmu_init(struct arm_pmu *pmu)
-- 
2.56.1.708.g77570a6a1d-goog

