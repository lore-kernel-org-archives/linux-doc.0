Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB53942642F
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 19:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934397; cv=none; b=EljoNGMEkuBG1ZwwV/nY/8GgfNTCAjB6p9ZjysZT4HxoMS958EsNphuEslIYzds2xNEOcZiPrTkmtymA0VSH9STFOPxG8K36NOv/6QmOYYNOYmuqcZ8sEW4WYtjqJc9KasMXqA+IP8EV6TJ4bH0foMHFPAuN8Gr/+GKff4LgL/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934397; c=relaxed/simple;
	bh=ktUv4JiVG9cTXmS+Hdc614GouDZnZJtPdGZ3jvL606g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XWQOMND+yXcGYWhWDsNComO6D7eJUlcJ9oV8eEWEleZzin7TCJ0x7LazBf1cmzvTSdyse9rZe6P31b844CrwpJ+emFzewXQgPgGlDDul31QtnhssWkHWlnnikSz3W1L2qFfaPgQeYbEQLP2TQN1ZQHlTtwtMpllmzyfMEDtblK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QK087GRy; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QK087GRy"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-847a00bcbd0so1181800b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 12:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934395; x=1783539195; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gy5b+9Ie1Ki1M0iB4wQwCtkzcjH6HRhEeykN2jC/eJ8=;
        b=QK087GRySHGWHH1CjyHzwo6ORVwhgJG7MQXcopzfBiymZ5gp9awwRtHeEJYFB05knL
         SBYHlsAzR73rp85X1vGe+h+q8ZGIgyC4ppzzrDpmpkFVaooJNcgc8Ce0QMDmN0DYvX8u
         QSJcrtndj93Kvv5DasuYR+Fysz5QJ7gkFfjUMfuvJbc0dHZAuQZ7VTf34Syi6q4PvNdC
         uDMxV0gWxQCnRGZJ0XhpbfPT4iOR9IG7VXDl6z+1zipeiR3+6pPLXQqodA1+AarKBEt2
         cPRrE267+hO3EKbK25f9LrQAs4VFxoDWvTB/cs/rUmPSX21uYqHvXAQsyJOP53st1IeW
         sX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934395; x=1783539195;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gy5b+9Ie1Ki1M0iB4wQwCtkzcjH6HRhEeykN2jC/eJ8=;
        b=rWsbtowsXFqU1lctqKnho/jkpyW6lGmID3Kuqb0HJpkAEithRSMyAx7Y4dsuk63E7y
         BPk35KS+pC5GNYphjLQfVuqOHyq/XNOF6eTBbwvTOt1tzNzzrRe7WJg0CsaVblrwl6Mz
         3QQuHpvU6oMp4MQL6ESXAoT921PPhCixppZAo49Qgo9tEFODYRoUhqiYBJPD6Og4ISk9
         8RknJw8fFCJdqeJ4PYvHY9SUpfjZ4VeI1FuPUMvoDHN8Xjm7pje3XRmS77386WwK9OWC
         YTUrgN/VDxh4amey9ONF8hLHlFDqaYva7Z3TZbgJjj8ah/UmT/+ZjngkzHzSqianZJeW
         l4eg==
X-Forwarded-Encrypted: i=1; AHgh+Rqfw4FS94b7Mketlrk/xgDLIm07UyShBMmJHVqixt/gnHphIE3/2Xhxaiv1Z7vY1XAq1WqE7ENB6d4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC/Ktp/ITuZ76kIgBOeP7TxxfYYZnaloxs/a9BK6MzZ+5B9qIy
	WR6dwnbmvXrX7oN3VK7Fp5J6lJqL6ptxZKezUprvkoeN5Sh2f/akry1yU6vOtZV+SAPlNB7YGy9
	UKQJSyg==
X-Received: from pfbbk23.prod.google.com ([2002:aa7:8317:0:b0:846:7503:7350])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3d56:b0:845:36a0:9eb2
 with SMTP id d2e1a72fcca58-847c096d1f0mr2944243b3a.34.1782934394416; Wed, 01
 Jul 2026 12:33:14 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:32:00 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-40-seanjc@google.com>
Subject: [PATCH v5 39/51] x86/pvclock: Mark setup helpers and related various
 as __init/__ro_after_init
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

Now that Xen PV clock and kvmclock explicitly do setup only during init,
tag the common PV clock flags/vsyscall variables and their mutators with
__init.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/pvclock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/pvclock.c b/arch/x86/kernel/pvclock.c
index b3f81379c2fc..a51adce67f92 100644
--- a/arch/x86/kernel/pvclock.c
+++ b/arch/x86/kernel/pvclock.c
@@ -16,10 +16,10 @@
 #include <asm/pvclock.h>
 #include <asm/vgtod.h>
 
-static u8 valid_flags __read_mostly = 0;
-static struct pvclock_vsyscall_time_info *pvti_cpu0_va __read_mostly;
+static u8 valid_flags __ro_after_init = 0;
+static struct pvclock_vsyscall_time_info *pvti_cpu0_va __ro_after_init;
 
-void pvclock_set_flags(u8 flags)
+void __init pvclock_set_flags(u8 flags)
 {
 	valid_flags = flags;
 }
@@ -153,7 +153,7 @@ void pvclock_read_wallclock(struct pvclock_wall_clock *wall_clock,
 	set_normalized_timespec64(ts, now.tv_sec, now.tv_nsec);
 }
 
-void pvclock_set_pvti_cpu0_va(struct pvclock_vsyscall_time_info *pvti)
+void __init pvclock_set_pvti_cpu0_va(struct pvclock_vsyscall_time_info *pvti)
 {
 	WARN_ON(vclock_was_used(VDSO_CLOCKMODE_PVCLOCK));
 	pvti_cpu0_va = pvti;
-- 
2.55.0.rc0.799.gd6f94ed593-goog

