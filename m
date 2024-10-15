Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E9F191
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 00:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728950876; cv=none; b=E/a/aES9G/6oLLI96Zt8F7bxKtHC1kbpTEnvPL1olyEb7JFkMBFh3p6QSzZExR8Ubzn1tgUyPeTpYL5mRkdHlSf5ZY0V3YR7qS2evEzQKtDvjIeKRJ7jCzQ9NoyPg2/kdjHEhXchcYyVGOl1ZTLfJJFiWfLA1GTnXZnIKJgG7w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728950876; c=relaxed/simple;
	bh=tF/wdh6eCNGHJyuFiF0zNCWlQfBb7gnQY3rCskvzGus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=COgOOjJBLpPthdxMFuxaLrCJ5PnmTjmPcEIr6Z9iBDkrIlJ8WFVJl9t7kc1SIXEPT7tcQ5hfZs+9BYIX3srRdC3d2Dl1uaz4koG2G7gV26yf32YVUOElzTitUzBx+beuyb2cxERC/dkZM75L/MoiNtOV/uNlImoP0m+FAvGc/Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mY8qu9Al; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mY8qu9Al"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e29327636f3so1995071276.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 17:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728950874; x=1729555674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0k5ziZv+luz4h4U9vFxjQyLKnmTaKDBU/6xsRlEbTbw=;
        b=mY8qu9AloVYPABAXlBL4ADR5EujVh12wuWKzua94khC+WdJCw0GelAgqOfBhNjCBcm
         Kd/SqhrvHaBcMjTneWR/sHvpWusln8GJFoIKPdFGYiEU7bpi3CakCZgZVENasU1eQnq0
         ihCRUv7nJgQ/yqoKyPcNAd87cyC62gJt3KAwtom3hpS/dixOnBPrfsG5twv23OMfCCWn
         JAKOwym5yXvTZCSL9wgGivKO3x3vndCUdKZQcM1JB0u1sMr1q/IFZwwQUcK+E3NY6P6f
         vSiI9GWL0t5wPJXXua83s7vwgTsDT2ELV6vpPvURj3kb6C/AARSOgMz2PQseIQuybF3N
         hqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728950874; x=1729555674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0k5ziZv+luz4h4U9vFxjQyLKnmTaKDBU/6xsRlEbTbw=;
        b=TzpQWdk0cDDGzJX3Wxe855nmqPtNZ4AckJZXARAqacVnP5D/x6D9fyXTIEDxlnVQC9
         rViHiOV/F8Pzu5vQ0FxP2ArAxyYvW4Ecpw26vmH2UQ4r4xB80Vfv0TJjtaffb3ck4D5u
         wP9JZZIR6O9jeaD3ayje6TLVzyHDn0hzbt+am6UtYTw26u/jYpMciM3/Dt57WgjuAfxH
         GDFqy0eSNIA7vjRfKEy7QOdzF0Oa22u03WiwWwX9KBBo7JBjofE4BlWAMHGCzjBzVicv
         dxlUsK307duQdfdaDGjzan5vPy+J3y5T3bDN3Ub1lWhTCKp0fR17nu4M6uzDnEOSC+om
         c+qA==
X-Forwarded-Encrypted: i=1; AJvYcCU7bcr7O9JXcpKYNm06pknZfu6jRPEuwXJxCGBPA/9g0XzozR8w19bw6NmMkq1o/oiJDE76m6cKXjg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8zD/JBoQejlw3vE1wg7LuQyjpdETBHmOp5WEP2wr5X37iIlMP
	PACmwLUY2aIju4q2wGDYho20snW4DXHN0tKg6W1LLH9eruPIX0nR2gvqu2FqD/bZHyWQROmELen
	qEGE4z3oGqS38/KLEwiGPSDI7UjVSvb97Lke+
X-Google-Smtp-Source: AGHT+IGPIi5KCS6+nJghaiqqBaIDBteS+Nw+yIW3S78bDe3HfZ8DlWRHR3b0JckOrBruI74JpMNZzOH6luJE20JY9vk=
X-Received: by 2002:a05:6902:c07:b0:e29:29b0:2b2a with SMTP id
 3f1490d57ef6-e2931deb4c6mr7548470276.51.1728950873598; Mon, 14 Oct 2024
 17:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926013506.860253-1-jthoughton@google.com> <Zw2no4OGDVK7m8QR@google.com>
In-Reply-To: <Zw2no4OGDVK7m8QR@google.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 14 Oct 2024 17:07:17 -0700
Message-ID: <CADrL8HUP1=eXE5QpVrKjgQGpusr_Raejr1sY2LLW1uSigpptOw@mail.gmail.com>
Subject: Re: [PATCH v7 00/18] mm: multi-gen LRU: Walk secondary MMU page
 tables while aging
To: Sean Christopherson <seanjc@google.com>, Yu Zhao <yuzhao@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Wei Xu <weixugc@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	David Stevens <stevensd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 4:22=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, Sep 26, 2024, James Houghton wrote:
> > This patchset makes it possible for MGLRU to consult secondary MMUs
> > while doing aging, not just during eviction. This allows for more
> > accurate reclaim decisions, which is especially important for proactive
> > reclaim.
>
> ...
>
> > James Houghton (14):
> >   KVM: Remove kvm_handle_hva_range helper functions
> >   KVM: Add lockless memslot walk to KVM
> >   KVM: x86/mmu: Factor out spte atomic bit clearing routine
> >   KVM: x86/mmu: Relax locking for kvm_test_age_gfn and kvm_age_gfn
> >   KVM: x86/mmu: Rearrange kvm_{test_,}age_gfn
> >   KVM: x86/mmu: Only check gfn age in shadow MMU if
> >     indirect_shadow_pages > 0
> >   mm: Add missing mmu_notifier_clear_young for !MMU_NOTIFIER
> >   mm: Add has_fast_aging to struct mmu_notifier
> >   mm: Add fast_only bool to test_young and clear_young MMU notifiers
>
> Per offline discussions, there's a non-zero chance that fast_only won't b=
e needed,
> because it may be preferable to incorporate secondary MMUs into MGLRU, ev=
en if
> they don't support "fast" aging.
>
> What's the status on that front?  Even if the status is "TBD", it'd be ve=
ry helpful
> to let others know, so that they don't spend time reviewing code that mig=
ht be
> completely thrown away.

The fast_only MMU notifier changes will probably be removed in v8.

ChromeOS folks found that the way MGLRU *currently* interacts with KVM
is problematic. That is, today, with the MM_WALK MGLRU capability
enabled, normal PTEs have their Accessed bits cleared via a page table
scan and then during an rmap walk upon attempted eviction, whereas,
KVM SPTEs only have their Accessed bits cleared via the rmap walk at
eviction time. So KVM SPTEs have their Accessed bits cleared less
frequently than normal PTEs, and therefore they appear younger than
they should.

It turns out that this causes tab open latency regressions on ChromeOS
where a significant amount of memory is being used by a VM. IIUC, the
fix for this is to have MGLRU age SPTEs as often as it ages normal
PTEs; i.e., it should call the correct MMU notifiers each time it
clears A bits on PTEs. The final patch in this series sort of does
this, but instead of calling the new fast_only notifier, we need to
call the normal test/clear_young() notifiers regardless of how fast
they are.

This also means that the MGLRU changes no longer depend on the KVM
optimizations, as they can motivated independently.

Yu, have I gotten anything wrong here? Do you have any more details to shar=
e?
