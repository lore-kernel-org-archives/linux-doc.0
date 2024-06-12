Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411DD250EC
	for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 17:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718211619; cv=none; b=LINBTLmf/8z5FUOUZ6rVbWT/1/0pDp1aNKrtBhxnjr05yxUFeifSircw/sVZBUZElWOZKbnxVMzUso1cqsinjvykkkqmIWYOAZZCFOO1UU+BNVPvaubnNIzCjCWh4NBk5kQVgfVwdjkCTeAasYwOaEAsPZV+m+CKManYyS/NS8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718211619; c=relaxed/simple;
	bh=lk6GPRb8cDY1Px2newtcG+uxRs8xIZKv4PbSRzkuVfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GltqTn17lb5t+Dafo2HoEKXrAnzjd7QaGiq7yq8yz1lni0fkqXJNvManVZ9idpx0Shd89JoEmSmo28u0u00WWxE5yTrX37RfF4GxuMcB/I/MHNOCKL0EbD2nh7qxQ4xX9EydF2US+Sh2Fcjz527adXsSYmgQfTYfNJCjWboT4ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4EY30YH3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4EY30YH3"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42171fa0a32so2595e9.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 10:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718211617; x=1718816417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsvWeW5eyBF6ROygK9LGppgGGqUZLW2+K1PQvnJ6/gk=;
        b=4EY30YH3vMRNy8JNBgC19o1MYijVjhS3y91omyexhuRd9v713fxMnzQD21weKFy+OB
         ZDdgWjCJrdd/CBGUdppjr3LD1PKuk5SvhCCnwWxvLb0XNMMF4JZRoAICreryLxkiQ/gA
         VQ+KR+hvHb5FdPCDF7sLBTgPoExQUZvt7Fa9R4TzUXFUs5M/xh8I/HZ9jfXOxKTPBrAd
         xTF8rgL76YO96TzdlrWe0BazB+p+1ser4WPU0MC9HjpKXIPuUs2v5EW5ngGe9wdL7ttY
         0UHri19S2EnGuifJGuOYJc6nSLE1tsbkG7QatQ6vr0jgJPcmVk0loA0HWrZ0VSMRK/En
         2Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718211617; x=1718816417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsvWeW5eyBF6ROygK9LGppgGGqUZLW2+K1PQvnJ6/gk=;
        b=p9FcgYjwJv3QQUhNlRwAAEr5C+xMpSvPSCdKr3uXOvOJk5LOFq3cZZ2FqM7biprqqr
         VouFjWQ5Fd3TDuaBo3iMJ50pX2jR9w2Elstc6JcDmEkOgf6PASoWpt7FiHFRvFDLwm3h
         PFRaUNzLrySBDXRF+D7Hz122rJTQQKglGswZqaf1Sl/xkvT4Cef8ftYLf/T1/6Mx6zfi
         XCIwUrep92wsMtBEtrZhKukLwnYtQjPQAOvNl9kLn2lqg4doUXESRBjIc+Plv20+xtBB
         n1KVYxBLUtC+jNSc6s4McIb5VnclPpfMTeyLSOptOgdb2c6qM4AJnFPLjhJd7KSFyi57
         qJ3A==
X-Forwarded-Encrypted: i=1; AJvYcCVglqfVPOLuGa3+2YF7VqlwsPI9xXxDwrAInsQXVCMSkgNz8yx/cPizdVqIxLAVE/QvbRoMa1EvQD7EhLYhKZcsUurY77wcomOR
X-Gm-Message-State: AOJu0Yz3SliWIiudKkoZ7kr1IfXqaXdGnS1GBHAXVY2orx0U0YDk+AQ9
	EljEczIK0E2F8R1ayUt0c+XTG4SgvLmDL+bljAa3sjcThxG6kr7fv/UK21/OHr3MNo9Fcb09avF
	u6XDw3HU4td7gx8t6dXbPtg3IP/yMhxKCOVXB
X-Google-Smtp-Source: AGHT+IGkC8R6gs8FWiWHpUMtbGyq+bA7RbAETq6ID+j0qnlJP6qfOP8ypwWfjR3KUBqpX/w72oFg8by83yIZWemEZcA=
X-Received: by 2002:a05:600c:501e:b0:421:7195:43e with SMTP id
 5b1f17b1804b1-42280dae244mr2301425e9.0.1718211616345; Wed, 12 Jun 2024
 10:00:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611002145.2078921-1-jthoughton@google.com>
 <20240611002145.2078921-9-jthoughton@google.com> <ZmnGlpBR91TyI3Lt@google.com>
In-Reply-To: <ZmnGlpBR91TyI3Lt@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 12 Jun 2024 10:59:38 -0600
Message-ID: <CAOUHufYCmYNngmS=rOSAQRB0N9ai+mA0aDrB9RopBvPHEK42Ng@mail.gmail.com>
Subject: Re: [PATCH v5 8/9] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
To: Sean Christopherson <seanjc@google.com>
Cc: James Houghton <jthoughton@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ankit Agrawal <ankita@nvidia.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shaoqin Huang <shahuang@redhat.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Wei Xu <weixugc@google.com>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 10:02=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Tue, Jun 11, 2024, James Houghton wrote:
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index e8fc5ecb59b2..24a3ff639919 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -870,13 +870,10 @@ static bool folio_referenced_one(struct folio *fo=
lio,
> >                       continue;
> >               }
> >
> > -             if (pvmw.pte) {
> > -                     if (lru_gen_enabled() &&
> > -                         pte_young(ptep_get(pvmw.pte))) {
> > -                             lru_gen_look_around(&pvmw);
> > +             if (lru_gen_enabled() && pvmw.pte) {
> > +                     if (lru_gen_look_around(&pvmw))
> >                               referenced++;
> > -                     }
> > -
> > +             } else if (pvmw.pte) {
> >                       if (ptep_clear_flush_young_notify(vma, address,
> >                                               pvmw.pte))
> >                               referenced++;
>
> Random question not really related to KVM/secondary MMU participation.  A=
FAICT,
> the MGLRU approach doesn't flush TLBs after aging pages.  How does MGLRU =
mitigate
> false negatives on pxx_young() due to the CPU not setting Accessed bits b=
ecause
> of stale TLB entries?

I do think there can be false negatives but we have not been able to
measure their practical impacts since we disabled the flush on some
host MMUs long ago (NOT by MGLRU), e.g., on x86 and ppc,
ptep_clear_flush_young() is just ptep_test_andclear_young(). The
theoretical basis is that, given the TLB coverage trend (Figure 1 in
[1]), when a system is running out of memory, it's unlikely to have
many long-lived entries in its TLB. IOW, if that system had a stable
working set (hot memory) that can fit into its TLB, it wouldn't hit
page reclaim. Again, this is based on the theory (proposition) that
for most systems, their TLB coverages are much smaller than their
memory sizes.

If/when the above proposition doesn't hold, the next step in the page
reclaim path, which is to unmap the PTE, will cause a page fault. The
fault can be minor or major (requires IO), depending on the race
between the reclaiming and accessing threads. In this case, the
tradeoff, in a steady state, is between the PF cost of pages we
shouldn't reclaim and the flush cost of pages we scan. The PF cost is
higher than the flush cost per page. But we scan many pages and only
reclaim a few of them; pages we shouldn't reclaim are a (small)
portion of the latter.

[1] https://www.usenix.org/legacy/events/osdi02/tech/full_papers/navarro/na=
varro.pdf
