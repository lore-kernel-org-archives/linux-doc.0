Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D92414DDE
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 23:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785280692; cv=none; b=akwGp7aDt/itjPepMsFEGek3PRkfACkdSXoQlxo9zQ2ho+ZgWwfS0E2rs1EdFMNBkP+ZvWEE+Q7vQ04KBiDiLbC4KgTrlH5WizIUyUCncFqEywOjIZRsFY5J62F03LxY3bEh/rQpGTA3fyNmTkg9PL/E5kW/+vVA/3V91IGiHSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785280692; c=relaxed/simple;
	bh=+IJupd9m+CLvEhmJ4GqDmfvWjZ3qTqTi6mGL864Pic0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jvmrGrGBxGJZABSzWrpdkNWqXEXOf+drTUoIObjJAuuU8Hi1VidndsQencN8utHTBh+WxJE4Dg+y3uGxQqiPCja0finJzDjZWgkWt4T3j2hUiT+P+Z4/a/PuDzUX0A6r3mcTId97J8O0tWBilzBji/Ckh2YlTtrECa0Jk65e0L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LDgUXepn; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LDgUXepn"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e048a801dso498539b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 16:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785280690; x=1785885490; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ex04CCTVdjetODvdAROex2NhCtrMzXHsD4UUHe0nQXo=;
        b=LDgUXepn+EoAg1oImPY8jLejYxWfJbdtXQ6sYISu4oarEjcpGfDeAp4nTzKICHrLMh
         6HOUqGFHZ8uZWf0rThuwUD5qlkWWIe0cB2fPISHwJLAuPW6tJRpt6yAfnrg34o+vvWrN
         oR37Cnbh8O9iuTFEo+4RDq2SK6VsbEDxFwEBkpHEPOz9p49UJlkWZMqDq0U7ufcwGpKV
         Iv5y3bungwk3KYR2X7FlIMAaILmb/Kb45tB2XKHCkA+OF9uer4U5St4WP6Yf/0btcm/a
         nLBzCCT90qSWylM2FRO0sFYOCTeMFCMR25ADrX4MNxE1YSkd83byTlBNVQhEg2ibexZs
         v3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785280690; x=1785885490;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ex04CCTVdjetODvdAROex2NhCtrMzXHsD4UUHe0nQXo=;
        b=reKZXsTIjukkMjpuoGII2TTPJkZOw5PCt72MBg+Kp0BuWx5IFIu2hWdcrZNZZlXFXm
         Eo9WSrcHhSP2vRKSLfv1Vjv5uYETQIn0jCqZaIK6VdmrZV1MucMeiEOQ3FcIlCx13E+s
         J5Y52HfQKQQP6oT/ezMajs+/daRjiML6obfswu6njzhmkF5LNRUysGKw0PZ7UZ5JN0nd
         cgHVfTlcB30KAWawnJarnSFlDqgpaz8qd7B0S89nyvFZOaaepBAwL8VTKHgzUgpnj0Mn
         1LKzNDwD3VauYRVyIsjms5WM/KLb2R7z4vvtAgWFJEHGG8/q4OWxsngtkPhUVrwQHLiu
         pmug==
X-Forwarded-Encrypted: i=1; AHgh+RqVNaDQoRRfc9q96nhpMmiJ56tIyi2mdOswWubMcLn9sR3ShNNYhrum8Ghdj75SQba4+qnLsFU2EdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMjQPn8FxawGLUMnApvuXvaGmy0X+k9ns9toJtgUrMcnTC0wed
	1uQkXqdo64BVAwGyMx5iHQ7xyFVrFjmwd/fw5pdnnWfIRfGNULNN0f0k5SaoHPXGyynEaeYFExC
	T2imTDQ==
X-Received: from pfbig4.prod.google.com ([2002:a05:6a00:8b84:b0:84b:4480:8b65])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:288e:b0:847:8250:2b2a
 with SMTP id d2e1a72fcca58-84e933f382dmr4685664b3a.60.1785280690057; Tue, 28
 Jul 2026 16:18:10 -0700 (PDT)
Date: Tue, 28 Jul 2026 16:18:09 -0700
In-Reply-To: <20260728144954.355376-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org>
Message-ID: <amk4sX57FwapIp9B@google.com>
Subject: Re: [PATCH v7 00/36] Cleaning up the KVM clock mess
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 28, 2026, David Woodhouse wrote:
> This is v7 of the series to clean up the KVM clock, rebased onto
> kvm-x86/next (patch 1 of v6 is already merged there as commit
> 710b3a30f407).

FYI, I'm going to rebase that commit again, to put all of this in a dedicated
topic branch.  But I'll also take care of updating references in commit messages.
More below.

> David Woodhouse (33):
>       KVM: x86: Improve accuracy of KVM clock when TSC scaling is in force
>       KVM: x86: Explicitly disable TSC scaling without CONSTANT_TSC
>       KVM: x86: Activate master clock immediately on vCPU creation
>       KVM: x86: Avoid NTP frequency skew for KVM clock on 32-bit host
>       KVM: x86: Fold __get_kvmclock() into get_kvmclock()
>       KVM: x86: Drop CPU pinning in get_kvmclock()
>       KVM: x86: Restructure get_kvmclock()
>       KVM: x86: Fix KVM clock precision in get_kvmclock() with TSC scaling
>       KVM: x86: Use get_kvmclock() in kvm_get_wall_clock_epoch()
>       KVM: x86: Fix compute_guest_tsc() to handle negative time deltas
>       KVM: x86: Restructure kvm_guest_time_update() for TSC upscaling
>       KVM: x86: Simplify and comment kvm_get_time_scale()

I'll post a new version up through here, get it applied soon-ish, and then get
back to chipping away at the rest of the series.  It'd obviously be nice to get
all the cleanups (and the tests) into 7.3, but I suspect the rest will take a
bit of back and worth (with Sashiko, if not me :-D).

I may punt on "Restructure kvm_guest_time_update() for TSC upscaling" if I have
trouble sorting through Sashiko's feedback, but I'll give it a shot.  I need to
page that all back in anyways.

>       KVM: x86: Remove implicit rdtsc() from kvm_compute_l1_tsc_offset()
>       KVM: x86: Improve synchronization in kvm_synchronize_tsc()
>       KVM: x86: Kill last_tsc_{nsec,write,offset} fields
>       KVM: x86: Replace nr_vcpus_matched_tsc count with all_vcpus_matched_tsc bool
>       KVM: x86: Allow KVM master clock mode when TSCs are offset from each other
>       KVM: x86: Factor out kvm_use_master_clock()
>       KVM: x86: Avoid gratuitous global clock updates
>       KVM: x86/xen: Prevent runstate times from becoming negative
>       KVM: x86: Avoid redundant masterclock updates from multiple vCPUs
>       KVM: x86: Remove runtime Xen TSC frequency CPUID update
>       KVM: x86: Re-synchronize TSC after KVM_SET_TSC_KHZ
>       KVM: x86: Use ktime_get_snapshot_id() for master clock
>       KVM: x86: Compute kvmclock base without pvclock_gtod_data
>       KVM: x86: Cache host vclock_mode for masterclock eligibility checks
>       KVM: x86: Remove pvclock_gtod_data and private timekeeping code
>       KVM: x86: Activate master clock from kvm_arch_init_vm()
>       KVM: selftests: Use UAPI pvclock-abi.h in xen_shinfo_test
>       KVM: x86: Add KVM_VCPU_TSC_SCALE and fix the documentation on TSC migration
>       KVM: selftests: Add master clock offset test
>       KVM: selftests: Add Xen/generic CPUID timing leaf test
>       KVM: selftests: Add Xen runstate migration test
> 
> Jack Allister (3):
>       UAPI: x86: Move pvclock-abi to UAPI for x86 platforms
>       KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for accurate KVM clock migration
>       KVM: selftests: Add KVM/PV clock selftest to prove timer correction
