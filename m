Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0A6184E
	for <linux-doc@vger.kernel.org>; Fri, 14 Jun 2024 00:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718326141; cv=none; b=DEy9+jkrenR1iBA/vQR4M1CsJxmjBgDl2zPmyy+RXuVVszyg9q6e9eS/sJfrGn8/WrJ8+dHgnAnoxaFrHMGF94roZ3SszNIzRHlAg8/Jpqj6kIJ/EKl/c6xOiyAfqe8gBgi9PXbYXRj1aKDo2PlQcu5Yh8wf+SpVP6qY1Q4xbAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718326141; c=relaxed/simple;
	bh=EzpkdrF+lhKU70e/G955Esb8W0Pby1fF9pS1lclAB+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtzPJ/DlIxp973YODyd38NGpWeh07z3UK+4U6c04zYc4q7Q0i0dWrgAH8ijCJogoYC+Bht+gnPuVXQahHJ2O+nDp1HNAcI9/4atuQ35Nxo7T3WZyDqTW8XQxE1uMr+KT6Lg9Nw0wIgCFhh7Ng9OY/XTO7YK5E3WoOHFLj11QVs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dtrXvUsG; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dtrXvUsG"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f70fdc9645so52765ad.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 17:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718326139; x=1718930939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cs3I7xb2JkPfyVWwhfDDItDBDpUbWjmYdCsu/iDXVRE=;
        b=dtrXvUsGBzM1zr29vh5hOYKxdIP6P+az+QDjYj+sTaJISBKwtwTBtLAaSW0OmGlF/Z
         EQwiVPrASgXAUNZ/Zn4NrHLj4zZPIQDEhEZCW7lOePlu+P6BsECJWwVWkQQjHNoy4LFB
         09iHDkeUqcqg3O3mTZLt+MpPvnmo38wmcLDhOezFRdBPWz3pJFkOYpFNd0IpBZ6GTi1o
         AXlKf5kAHprVLwYwzFpOz2LbPDTUJKISjGugc2fmVKP7CQTH7vrN3RNJ2klO6j7FsVFC
         4UotxyN4r+/4trESUfUfFS8rUxCVU65xmMUAViiz0EM342z6iHz4I6WW/0W20Tk1oCbU
         4Q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718326139; x=1718930939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cs3I7xb2JkPfyVWwhfDDItDBDpUbWjmYdCsu/iDXVRE=;
        b=pKkgMPXNi2RkGczSRnqrSQFbV98EEUjDvPv9VNi3m1cF/Aut2PdhupCWKnX25nBw+0
         ptJOiZhONw19dgt2fjbhQIX1n3dN7EJXMy7iUyy8x+Hr1RjUSGQFYMUrlyeNkf6uktyH
         1I1pckw5PiojmOCswtmTuqtawIV1edsmyF+rJYv6ARQxva/QpJQZJoMsyrFcD6ehULVm
         I+hr9TPn6uwPhQFgQBrQlyImu0hrGMhjwQPjVFFPqsUif3wa1/rQC0Z1Zy8ASkt9xq1p
         deyywZ2ydaYdL8uj8f6NrH3m1jg8jKxCyrzkUdE3CgxEAMw1PJRHwkAqym7+Ws9r9nAx
         lgFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnkxsIHI/y2rbqhJ2ORjhOEhlaIR31WyNe0AXYd60pPEY+5cV76DB1UWYwQ9X2LJDr+upfsZ7ALHtkD1IJBzKF0rT+2bGzhGy3
X-Gm-Message-State: AOJu0Yz5Ol9wzHumJB3JVUETaH3yeVqx+HFOh7E9tCsAFlJPIHpryzIv
	I+r7Z6uXuS/ksmuaW0kLDwReSNvdWeTtYJw4KZmHFM4eHvkrwwBtLgsiR3J31TNC7iP6EXZ8jPs
	cXSUOjtSJy47NEgBEBTAfqWDrnIiWQhj9iN8X
X-Google-Smtp-Source: AGHT+IG4rh9cysMLIjJvQTQbAGIfEWjp8FbFtGimlgyhxAwv6QoKwTYp7w2DNRBP89lE6kBTdOWPtAittybnD94st7Y=
X-Received: by 2002:a17:902:b782:b0:1e4:35b9:cce0 with SMTP id
 d9443c01a7336-1f86777297bmr804415ad.9.1718326138884; Thu, 13 Jun 2024
 17:48:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611002145.2078921-1-jthoughton@google.com>
 <20240611002145.2078921-5-jthoughton@google.com> <CAOUHufYGqbd45shZkGCpqeTV9wcBDUoo3iw1SKiDeFLmrP0+=w@mail.gmail.com>
 <CADrL8HVHcKSW3hiHzKTit07gzo36jtCZCnM9ZpueyifgNdGggw@mail.gmail.com>
 <ZmidYAWKU1HANKU6@linux.dev> <ZmiqXUwMXtUGanQc@google.com> <ZmqXRhFSoE38foh6@linux.dev>
In-Reply-To: <ZmqXRhFSoE38foh6@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Thu, 13 Jun 2024 17:48:22 -0700
Message-ID: <CADrL8HXhGFWwHt728Bg15x1YxJmS=WD8z=KJc_Koaah=OvHDwg@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] mm: Add test_clear_young_fast_only MMU notifier
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Sean Christopherson <seanjc@google.com>, Yu Zhao <yuzhao@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ankit Agrawal <ankita@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Wei Xu <weixugc@google.com>, Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 11:53=E2=80=AFPM Oliver Upton <oliver.upton@linux.d=
ev> wrote:
>
> On Tue, Jun 11, 2024 at 12:49:49PM -0700, Sean Christopherson wrote:
> > On Tue, Jun 11, 2024, Oliver Upton wrote:
> > > On Tue, Jun 11, 2024 at 09:49:59AM -0700, James Houghton wrote:
> > > > I think consolidating the callbacks is cleanest, like you had it in
> > > > v2. I really wasn't sure about this change honestly, but it was my
> > > > attempt to incorporate feedback like this[3] from v4. I'll consolid=
ate
> > > > the callbacks like you had in v2.
> > >
> > > My strong preference is to have the callers expectations of the
> > > secondary MMU be explicit. Having ->${BLAH}_fast_only() makes this
> > > abundantly clear both at the callsite and in the implementation.
> >
> > Partially agreed.  We don't need a dedicated mmu_notifier API to achiev=
e that
> > for the callsites, e.g. ptep_clear_young_notify() passes fast_only=3Dfa=
lse, and a
> > new ptep_clear_young_notify_fast_only() does the obvious.
> >
> > On the back end, odds are very good KVM is going to squish the "fast" a=
nd "slow"
> > paths back into a common helper, so IMO having dedicated fast_only() AP=
Is for the
> > mmu_notifier hooks doesn't add much value in the end.
> >
> > I'm not opposed to dedicated hooks, but I after poking around a bit, I =
suspect
> > that passing a fast_only flag will end up being less cleaner for all pa=
rties.
>
> Yeah, I think I'm headed in the same direction after actually reading
> the MM side of this, heh.

Yeah, I agree. What I have now for v6 is that the test_young() and
clear_young() notifiers themselves now take a `bool fast_only`. When
called with the existing helpers (e.g. `mmu_notifier_test_young()`,
`fast_only` is false, and I have new helpers (e.g.
`mmu_notifier_test_young_fast_only()`) that will set `fast_only` to
true. Seems clean to me. Thanks!
