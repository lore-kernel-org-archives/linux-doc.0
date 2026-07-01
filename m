Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD714D2ED2
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 19:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934392; cv=none; b=sNIpo0k+T0bhvf698unNsjuU4O2JeQnFmpgEyXGe+46+Uyz4QA1DCHeVpojpa/PrKbIHzruKauToeKAFW4F1JKsCFpPBDsvvGoVEf8W5WqnyI+kKqj9O3NmaXT/jFSju8VC1hOaQ/ZnRw9klYsTsdyjqOOKqP17bF4T0Kw5uels=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934392; c=relaxed/simple;
	bh=FUN+trAftQTY8ZpFI1i4Es/NPmL9miMwKLy7njqUDaY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lv0x8uug8KZrf9rs8FYLXORB899jnOuYJ5WcRlLtLT5HUQGNMQFLFovIW6QWWVssF0ib2spJ3BDDg/exGVPwBbHtphVugKBPhIGdvzqdLAS4U5W0xDhjGZ91DrmzKOkAML8SqqxQlpIQymBcXFZUUEITkcj6Kh2nGRp+e2vfEzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XzbIpABP; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XzbIpABP"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c6bbd0afffso21227805ad.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 12:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934389; x=1783539189; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Vvd9sO5KFA4UCvVy/DPb0p6l2OFovCFuh6GrZNkoHew=;
        b=XzbIpABPzw891bJ2j3KkuzX2l3LjFAQaXXwR4xqL22Z56A8jjOV2yE0WC9Yq3hbJ6t
         mBLuHsU1JcRrXsX9A26ekw1xXHi8kqSBwIhWS2Gmjo7CPQx+KZSFj30oNvfdCgsXeIux
         hbovSJbfXEjvjTJuSe8/fzS5+Ht0yEn5MjrGNtAQCweBe/6IN3fjmhmdTohZrkDWTQKW
         PVEADBSLuVZ9sObXGxT3nAH4FZETN0h1gvWaQJDMPAwcTUNzCsPpitm53Gj5zfZpHzzt
         KtcS+DwLFjkIiXkGVyi9/eIT/dQLjn3L+E4GnHqSNnUoot9kZgEJNjOx38Psd+Qk0JC6
         q99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934389; x=1783539189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vvd9sO5KFA4UCvVy/DPb0p6l2OFovCFuh6GrZNkoHew=;
        b=gLNsYnBWYrQGRExprvrZyp3pXnyH1Eie1asQNNv93V2e5/rC/PIFXH2gIc20qbyV5h
         dJYo4rE/KAXCHjtHRo1B8oFnkaEm6z0RNRf/nRWc82+ra5zErzoq3opJZo3+CLtlvtrm
         cdty1mhd34/PkC1G6h7HoWm/AvgojLJ98ULybHmDFbBXDc9RpVPlYK5llEm541ubu1Zq
         5ooMdfFcu1wL8y1Dl28laiVSrOJYa8RzRwGVTXHNjoosiZBnXcWM83ksFNGoV+XAktr3
         FYLtEOvhKSxB3t7fOFdHIhFfnlc4+xl/I0JOet1LuShEvrz8tCCm0Bq/pDvlRHHo+HMK
         nIHg==
X-Forwarded-Encrypted: i=1; AFNElJ+FE0+BNNQM5a8sQbyJtU134hDHF2t/nBGVNVFtVxk/X9kArIOoz5/dSqGBi/LRqOe8utcqkwOab6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRxNKgF2qNjiOSmMFqxYf+JFrX5NjzTXlgqYoUcBZ06PpBvPZp
	wfj4lempihAdT89J42k1AQDO/nuN/rK8ZZvHqLSNaoq5318LnoLWB3lMY2wVnVjOnFSTqt0DavN
	yQJ3Kig==
X-Received: from plho13.prod.google.com ([2002:a17:903:23cd:b0:2bf:1274:c8f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:41c7:b0:2c9:c46b:129b
 with SMTP id d9443c01a7336-2ca7e67c028mr32017335ad.5.1782934388785; Wed, 01
 Jul 2026 12:33:08 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:55 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-35-seanjc@google.com>
Subject: [PATCH v5 34/51] x86/vmware: NOP-ify save/restore hooks when using
 VMware's sched_clock
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

NOP-ify the sched_clock save/restore hooks when using VMware's version of
sched_clock.  This will allow extending paravirt_set_sched_clock() to set
the save/restore hooks, without having to simultaneously change the
behavior of VMware guests.

Note, it's not at all obvious that it's safe/correct for VMware guests to
do nothing on suspend/resume, but that's a pre-existing problem.  Leave it
for a VMware expert to sort out.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/vmware.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 0a3bd90576d4..5c1ccaf4a25e 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -347,8 +347,11 @@ static void __init vmware_paravirt_ops_setup(void)
 
 	vmware_cyc2ns_setup();
 
-	if (vmw_sched_clock)
+	if (vmw_sched_clock) {
 		paravirt_set_sched_clock(vmware_sched_clock);
+		x86_platform.save_sched_clock_state = x86_init_noop;
+		x86_platform.restore_sched_clock_state = x86_init_noop;
+	}
 
 	if (vmware_is_stealclock_available()) {
 		has_steal_clock = true;
-- 
2.55.0.rc0.799.gd6f94ed593-goog

