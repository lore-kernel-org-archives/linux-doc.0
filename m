Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70CB3AE6E4
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 19:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934383; cv=none; b=qG+1vddkCieKY9eb0bBbBAidnnXbr9FCbt4mA8MbNEJab4PLFng+9mxuV9qBAA1UR0r5lOqqarmEnuz+HMmSGqkJZUk3YMZV7avZZ2gYHHJh8tCD8ZRvwsC5ltNiBdTZWlAmaK0wLpS3DkHA6M0Ue3JyAjf7NXcfAm+G6/Jnegk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934383; c=relaxed/simple;
	bh=7ECvDpVYy24rqoUPVQpDZNfw6Aqt7A7i1akOyN+Prss=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NoHQOsS4l3S1fy272U56F4ISQXX6Y/Q1xTAyw0bS3GpEBfM/kz2TYGHFHWxlYN8CETyYRKMlNPOe4GBW9BwU0bS55GNKTGU/lsiumLgibu9XPa236iVD5Tnn3Y9ATKOkcyEwxljzea2Q6zKkEtvAd+VclIB0/LdY2/ck+Dvmm4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CQzCN0AC; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CQzCN0AC"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c9b1b608e2so14566825ad.3
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 12:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934381; x=1783539181; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IHAlzrllQ2SIWnv0fCfBsaTBNv7ymljQujJZvblLIYE=;
        b=CQzCN0ACAaAvmxLn9iO6kp1ucIu/WqLJDOhykicMtxuOouXr9PR/ebiISKMyfORWC0
         5CHZoqSVxkyJOfVbPcE05FrI0g3QCmXj8CX05gJzeFq+RnHmbdtFoTSn2t40rPnl0z4M
         qumURMY0TyqM7kYpox5uXDT74KsdM9vcCKXxLnjahHonTtBqczuEnDCyomANL05UMPq0
         keY+4jq6lQARwFqjwQ0q+xfycGJOGvcqlkbnH2N9b2sx4dzuob/ADc2tAspAu0BYmRj0
         ICALso01B5YaF7ApHwfG6X1LDwLPQcQ7cj3NdknQvQkCbJXdRdN/jriTaOFm83kPbkyJ
         Nk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934381; x=1783539181;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHAlzrllQ2SIWnv0fCfBsaTBNv7ymljQujJZvblLIYE=;
        b=FiZXWZy74Vp52JCKmEtDOFx2I+/7yMOeqjP0eQRlRYjOhdVS5Z3ezC36kZA0i13eSd
         xdi1uxL+5jQ/DKZSPyoYTWBZDTEZ2sA03qUG/0eOwVYakMQA9Pa/Cu3sLdEI0CCtzraW
         RDpjfGUf1+mE7T2QJ2gRGlK2Lf25LgqPjXATV1/HIqF4ulcPQa/34q/sDOu9Ue8aOAk3
         CKvj9NiG/jCKZbe3iGT1mBVtQdlk5TF2fKXh4Np+sWtUFTU+ema6MkGe3YUvQtz4RhON
         ZoEuygrElyVFQcYuchQAhYjA4WV7XVKsuGdC3MZThqoA43bCiIYI95ZyJUuwODcLSHa7
         HsMA==
X-Forwarded-Encrypted: i=1; AHgh+RpXPp4Y34cu40JvmxufCoZnIuEQzGpz6rlXBKRLyQiHgOTNnPogj3Muh+mL4VEXWzll+OWOV+vhZhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJAieI/5Icps3ij+f5E0fpv+wiezJN1xy92lyDc8FM9aJTkSHJ
	OPMWYtGWHrQTBaazSJbz5fTD2HLV+D488dLmdGW1WwdirT4Ulm+PwmfXoxaQ5+201Zlm0dgCDyk
	VOZjVag==
X-Received: from plblk15.prod.google.com ([2002:a17:903:8cf:b0:2c7:f338:5690])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:41c7:b0:2ca:de3:15e2
 with SMTP id d9443c01a7336-2ca7e561189mr31594705ad.0.1782934380474; Wed, 01
 Jul 2026 12:33:00 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:49 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-29-seanjc@google.com>
Subject: [PATCH v5 28/51] x86/kvmclock: Setup kvmclock for secondary CPUs iff CONFIG_SMP=y
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

Gate kvmclock's secondary CPU code on CONFIG_SMP, not CONFIG_X86_LOCAL_APIC.
Originally, kvmclock piggybacked PV APIC ops to setup secondary CPUs.
When that wart was fixed by commit df156f90a0f9 ("x86: Introduce
x86_cpuinit.early_percpu_clock_init hook"), the dependency on a local APIC
got carried forward unnecessarily.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 2e7ab54cb9dc..b0c871ba8232 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -208,7 +208,7 @@ static void kvm_restore_sched_clock_state(void)
 	kvm_register_clock("primary cpu clock, resume");
 }
 
-#ifdef CONFIG_X86_LOCAL_APIC
+#ifdef CONFIG_SMP
 static void kvm_setup_secondary_clock(void)
 {
 	kvm_register_clock("secondary cpu clock");
@@ -348,7 +348,7 @@ void __init kvmclock_init(bool prefer_tsc)
 		x86_init.hyper.get_cpu_khz = kvmclock_get_tsc_khz;
 	x86_platform.get_wallclock = kvm_get_wallclock;
 	x86_platform.set_wallclock = kvm_set_wallclock;
-#ifdef CONFIG_X86_LOCAL_APIC
+#ifdef CONFIG_SMP
 	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
 #endif
 	x86_platform.save_sched_clock_state = kvm_save_sched_clock_state;
-- 
2.55.0.rc0.799.gd6f94ed593-goog

