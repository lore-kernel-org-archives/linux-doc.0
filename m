Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1254DD6C6
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 19:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934370; cv=none; b=oELcaDHgwZtDJcDWoyBfPZ7Vw/fxayPi4R8cw4/gAzkztUZofcG/1By5akhi4amiagWhm1fVkbJKfMQ3JLUePuML4TTyutB6lC+kNV5MzOn6a5s50K0CSZuwSoQX6B1jm68/KxG2Qmxsta9fRkZ0++i6LxRuHZupjwdkEt4pWgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934370; c=relaxed/simple;
	bh=LqpoY1Xy6lWAOBZfOfvu2nbWJoGoJs43yElnN9RLdxU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WAp/fR7/kjyF0M775jQNVIwpSwMaJ4yGTLmahuzt+POWMqrWVQYeq9EAnFB5/nThhEy5l3S7M7MROboaS88CUCrn9a0Lb0KLS0CG/4kK5xSttbu6/avqvjLIY+sH3jaJ/X0dvgIpiVBP2u4oGJfw11nhK2PTZ27186MiMNQk4/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K0U5iG6x; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K0U5iG6x"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-37e17ec1940so1078898a91.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 12:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934368; x=1783539168; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+CBMOnR0NQyGIEx0KnXnLe9zyF/J2rmq2NSzuBA4h88=;
        b=K0U5iG6xtUfwAQW3GFkOMjSUmE6tJeCLAhBkP8QZTEfZ798IQNJFBJk1ZdTcg/zejj
         wGneKOZrAueGTxOwTFXZJV8jRDUzOEgB2U81anaL/0oJvx62N67hGsdCGCkXmqoHGOub
         R4YA4D60/ApQEkzP56E/ylihQC6baFJxrOnLKvD4RUndkwG54HhWqsim2a/KpjKNcVp5
         dKT9JUDKwbQ+np8UM+ScoTt+CSgHi2Px+KllsTv//gd6VAX+4uaACg34ln1sXe7oU9cg
         ex5Ypf2xb4uL+dPGn0b2nYyCHNoML46YSfCWFiVUbliZNg3ilQw32dT2n5RPHd45p+AW
         dsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934368; x=1783539168;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CBMOnR0NQyGIEx0KnXnLe9zyF/J2rmq2NSzuBA4h88=;
        b=GdVgM1b5HD5qWkudYU/2bnNxFQKULkL0C12iiKW0uPlUHfqpBR0l9ytXoBZ5CR3/Gn
         LGFMfRvXKc0KEb2laIOHhylQ86e5mMFoKI65+ui55kywJYQPCHsl7Co8+HPoxgDXsBQO
         ln1ngExZxOdu3llObgQQmnaivDmdXUUpEGvX0ys+ccWCXYarYgVlcFg4KeWdY8UsdZ0g
         SlRQZprFkBcf0rfQA3F/Mtec0YBI5jKQcx1+rfj414HNnK4jP2MBVSj435UG7iV2sZCF
         jJzFA87o5VwnjMXpcYV9rrd958FKEcpFJJiGjrfLZm8S+W1qcIzPziiEgGTUYRuQE2O4
         TKOA==
X-Forwarded-Encrypted: i=1; AHgh+RptovWe4zze2B8KlWb8dDL8S7YbWkTvS1V1T3xyGtJnxe3Mq8Lcv1bjmLhgPNhj2sBRpdupTIszDUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxumwMCSjCkr/tsPPO15uPRoEXWGLgtAmSpjJmnXURbUOQce4nj
	fQMAEahz82jbE9pS1RsiMp4qxqICayrBhZVdc0ARRq61mM18IMNSUewi4EcT5eOuqCqdPXattsd
	6fiPN1g==
X-Received: from pjbca16.prod.google.com ([2002:a17:90a:f310:b0:37c:9369:8b75])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4acb:b0:37f:d6f3:450d
 with SMTP id 98e67ed59e1d1-380aa1313ecmr3162862a91.14.1782934368170; Wed, 01
 Jul 2026 12:32:48 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:39 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-19-seanjc@google.com>
Subject: [PATCH v5 18/51] x86/kvmclock: Rename kvm_get_tsc_khz() to kvmclock_get_tsc_khz()
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Rename kvm_get_tsc_khz() to kvmclock_get_tsc_khz() in anticipation of
adding support for getting TSC info from PV CPUID, i.e. in a KVM specific
way, but without non-kvmclock.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 35a879d33e9e..061a22d31dea 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -136,7 +136,7 @@ static inline void kvm_sched_clock_init(bool stable)
  * poll of guests can be running and trouble each other. So we preset
  * lpj here
  */
-static unsigned int __init kvm_get_tsc_khz(void)
+static unsigned int __init kvmclock_get_tsc_khz(void)
 {
 	return pvclock_tsc_khz(this_cpu_pvti());
 }
@@ -146,7 +146,7 @@ static void __init kvm_get_preset_lpj(void)
 	unsigned long khz;
 	u64 lpj;
 
-	khz = kvm_get_tsc_khz();
+	khz = kvmclock_get_tsc_khz();
 
 	lpj = ((u64)khz * 1000);
 	do_div(lpj, HZ);
@@ -342,8 +342,8 @@ void __init kvmclock_init(void)
 	flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
 	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
 
-	x86_init.hyper.get_tsc_khz = kvm_get_tsc_khz;
-	x86_init.hyper.get_cpu_khz = kvm_get_tsc_khz;
+	x86_init.hyper.get_tsc_khz = kvmclock_get_tsc_khz;
+	x86_init.hyper.get_cpu_khz = kvmclock_get_tsc_khz;
 	x86_platform.get_wallclock = kvm_get_wallclock;
 	x86_platform.set_wallclock = kvm_set_wallclock;
 #ifdef CONFIG_X86_LOCAL_APIC
-- 
2.55.0.rc0.799.gd6f94ed593-goog

