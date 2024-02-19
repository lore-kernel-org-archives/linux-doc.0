Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3755554BFA
	for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 22:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708380416; cv=none; b=t9fwoqf1GrnyJWqXfGJFvQbjG+jV9QrDG0AbNtMYcyr1tRRgneSqM2D8eR1ooFjQqMvd2hdzQNWUaOowZQJ7aRJoBImGgoMoWMAoSmBOMABq3pUCoTo5Axa09P2fmHnHsdrRJsZrkQ4ZZofpkO6N/iOsUvx6aiX7O1MoZOmlXyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708380416; c=relaxed/simple;
	bh=l0HvovpPqMVUQu9B4ZqhpUtqDN71UcjNp3KMDMRYNP8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A9C/QhBDyTKnoTplk6TxljXBESW7bai5vlYon3LqGdwonevhBN++DlhVqc7suD+YVITjQ/p7YFBoz4bGoY+ougIDRZSQSMIBNBp5Nhq67GElDUI7uB/ddCAunKMV5ypoDjSof3H4NrfNgGEqQVV8h30XBFKwQ/p48DRBUUZksek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oGP+GQB6; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oGP+GQB6"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc6ade10cb8so9811505276.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 14:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708380414; x=1708985214; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mpOEZIVxoohE3GrUqHhwdrDwGh8LEXRlOdsMaQjdYhc=;
        b=oGP+GQB6s2Je7VhzfpYJba2+bM5S9z+eV4RJaJFUN5dWI8Tivumk/t0sg/aOroXc7r
         29vAAfGLHIWGzvb1+A/6TUuFoyXKyYmnorE/tru2PjJoTGHHQW+J3+0EENgOM1U0Fk74
         OzzIPNe4OWGIvlDgGSxJW1dpRYaaqylFAy3Ee5wizVqs/rsoCecfT1JfUy3cz53STMix
         EfEtLuUpTEFjV60iB8pztpvkhV8TApvaXGeNUFktmzrvu56LMgoCIaC8+fyyDC8oU2Tp
         7KCrtwNqDVrWj24E6lQ/IQ+wWWA7APUXSPwLNZsba9cAWMgAewtpOLK8jUrINYc7YZu3
         Krow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708380414; x=1708985214;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mpOEZIVxoohE3GrUqHhwdrDwGh8LEXRlOdsMaQjdYhc=;
        b=cPqHx2pS96tmklM4zeppjv9PAwC+tdBI54XLZp2noBQr6PnRP74FV/XkAkZReQ6b6j
         Vl2u/tizg7cJiwHNCLKn5IOfYJgnpu6AH/puLnxtZPDGK1hVVBkr5e/JJ6egF7/2vSlC
         8QNcmrT7aIia3DKozISgoTVsEmBN2UyWz1/8h5jlScnhfe7CKX/mpUd818oOdmIw/4wi
         E2SbXZFvJ6PF6rp3v0URPZDPPNgO1TMNZyoV8yAF+eOn64XTZq+SXb5Zmirz+76++x9I
         F0bx3XYh4S+Qf25LJZ+MEFyI/wiOwHejdNXli9AhW1WMpSUS8txFPbkh9zfRU82YLATc
         DGaw==
X-Forwarded-Encrypted: i=1; AJvYcCV3Vgi2QkYNYazzLLyDsrk+uVDhUF18v/K5rmEHch9D+NRVxSVWDmbDMvr3gLGzIu9f5ntW55yBkn5uWzeYX5EzVANSGBbkwIgo
X-Gm-Message-State: AOJu0YwCuIeMN84CCDaiMcYFO/tQ3bdiMjAi3s3Lvtuvxr8l2Uq028xw
	z3pGEORuE9/CA7P5bHoYltNKvAaIKBzSh2LEhlb2wRQbSdldk31+ldBmRVyNx0Ujo0UF2w/1v4O
	meg==
X-Google-Smtp-Source: AGHT+IGRqD5MJLHGgiuZ4aiPpWZMq+YddUVmGLFXTlIV3IDh3/IjNrlEjd6bMLCvEt6hO0XIgEvR5LwUl4c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:120a:b0:dc7:7655:46ce with SMTP id
 s10-20020a056902120a00b00dc7765546cemr4267897ybu.2.1708380414286; Mon, 19 Feb
 2024 14:06:54 -0800 (PST)
Date: Mon, 19 Feb 2024 14:06:52 -0800
In-Reply-To: <20240215152916.1158-1-paul@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240215152916.1158-1-paul@xen.org>
Message-ID: <ZdPQ_AcbTYMtArFJ@google.com>
Subject: Re: [PATCH v13 00/21] KVM: xen: update shared_info and vcpu_info handling
From: Sean Christopherson <seanjc@google.com>
To: Paul Durrant <paul@xen.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Feb 15, 2024, Paul Durrant wrote:
> David Woodhouse (1):
>   KVM: pfncache: rework __kvm_gpc_refresh() to fix locking issues
> 
> Paul Durrant (19):
>   KVM: pfncache: Add a map helper function
>   KVM: pfncache: remove unnecessary exports
>   KVM: x86/xen: mark guest pages dirty with the pfncache lock held
>   KVM: pfncache: add a mark-dirty helper
>   KVM: pfncache: remove KVM_GUEST_USES_PFN usage
>   KVM: pfncache: stop open-coding offset_in_page()
>   KVM: pfncache: include page offset in uhva and use it consistently
>   KVM: pfncache: allow a cache to be activated with a fixed (userspace)
>     HVA
>   KVM: x86/xen: separate initialization of shared_info cache and content
>   KVM: x86/xen: re-initialize shared_info if guest (32/64-bit) mode is
>     set
>   KVM: x86/xen: allow shared_info to be mapped by fixed HVA
>   KVM: x86/xen: allow vcpu_info to be mapped by fixed HVA
>   KVM: selftests: map Xen's shared_info page using HVA rather than GFN
>   KVM: selftests: re-map Xen's vcpu_info using HVA rather than GPA
>   KVM: x86/xen: advertize the KVM_XEN_HVM_CONFIG_SHARED_INFO_HVA
>     capability
>   KVM: x86/xen: split up kvm_xen_set_evtchn_fast()
>   KVM: x86/xen: don't block on pfncache locks in
>     kvm_xen_set_evtchn_fast()
>   KVM: pfncache: check the need for invalidation under read lock first
>   KVM: x86/xen: allow vcpu_info content to be 'safely' copied
> 
> Sean Christopherson (1):
>   KVM: s390: Refactor kvm_is_error_gpa() into kvm_is_gpa_in_memslot()
> 
>  Documentation/virt/kvm/api.rst                |  53 ++-
>  arch/s390/kvm/diag.c                          |   2 +-
>  arch/s390/kvm/gaccess.c                       |  14 +-
>  arch/s390/kvm/kvm-s390.c                      |   4 +-
>  arch/s390/kvm/priv.c                          |   4 +-
>  arch/s390/kvm/sigp.c                          |   2 +-
>  arch/x86/kvm/x86.c                            |   7 +-
>  arch/x86/kvm/xen.c                            | 361 +++++++++++------
>  include/linux/kvm_host.h                      |  49 ++-
>  include/linux/kvm_types.h                     |   8 -
>  include/uapi/linux/kvm.h                      |   9 +-
>  .../selftests/kvm/x86_64/xen_shinfo_test.c    |  59 ++-
>  virt/kvm/pfncache.c                           | 382 ++++++++++--------
>  13 files changed, 591 insertions(+), 363 deletions(-)

Except for the read_trylock() patch, just a few nits that I can fixup when
applying, though I'll defeinitely want your eyeballs on the end result as they
tweaks aren't _that_ trivial.

Running tests now, if all goes well I'll push to kvm-x86 within the hour. 
