Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9DE43AAE
	for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 16:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718124640; cv=none; b=X9eDaukhXSiF7SgcRIEEnaY/Xu7iNnQ7JFmB8dtcKB884UAx5ukaY2ad7AU9Gln/NiuTvABM3H3SbsTF0ME4yx2gSIraSc8twqk8tRap8ATYGGTXzxPRCg3IXPpN2dPYxVl/XXFh5vLUP/XbYY2z+jaosenEJ8xe51KH49TR5Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718124640; c=relaxed/simple;
	bh=ud1eQBnt2jG1UKvvjxzK8+sntVYqlePqwphUbWfbcqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0LKS+YJXAPb83cv7To+4LSO4TLrdzWdXUC0J0YP5U12yZ1/KvToQJupHpo3oUUECcWTDh2QyBJlILDvJxsDH1ornDcEmMYVvCF9VXx5CoUXkHpnCnPaubkXjSS2jUCdGx2EDe2reWfthRJIriolIrR25pXnAJWPkwxgVfbKDps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YNu+MZQc; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YNu+MZQc"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4400cc0dad1so1111cf.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 09:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718124637; x=1718729437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ud1eQBnt2jG1UKvvjxzK8+sntVYqlePqwphUbWfbcqQ=;
        b=YNu+MZQcgIrm0zCG3Jv14XK1IEdrEhrZAZ0xQyOSVwkVruaIvgvxITwe1gzMr+h3bq
         tAIkglRY9ZZSywqkFFzpyWYAOd+6JiY4bFTKwIq4MDjscU7mn9ldDtva2JYzK6f3G0s6
         dbCKw29LXoB0f1WiHSXwOPE0pY+7fzC2jiUfg782JRh12i+azV8VwlyFIWDLivBcYwb3
         XT3YueKhACKth9Lz6eCmUpw282X99EaVRmhDOi3ROQDx8F9EloquYpeM9Yc0bVOBJeRG
         WZTrKOEAq/f0xsQI3aHud0FP5nhz2i02aGuoI62i0HK1K/ii1jMkDCmdInIIJhqlg0Ws
         AncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718124637; x=1718729437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ud1eQBnt2jG1UKvvjxzK8+sntVYqlePqwphUbWfbcqQ=;
        b=ijTKN7evqBEywRtZ2EBFKIl++pTd/X5Mg4AxFCTWE2fEXuMlj8qlyW7J5BROgQOdpu
         DQMCYCHF6FPmdoCOxW0rOrJ6RHcSXxN79qI69BJuHqOwh+lrEJuk2XQs6xDIZay0UB80
         Ianfi9JoO8w7TK+Jw9qpnLY9PaQuiu780U+2nreJ7w/KLdX4x5vaSRxJqxPTYmeAJt/T
         wJIzXbMmiV8rla/4uI+1ZppzjkPgfiLt7nFtAUfWy7vAhnKfwxDaK0XGoJu22t6Wm4E1
         UbVuVObGNyZZ6VLRG0JwgZ9tAELvO7JyxLNsWYKYe3p39AHEvb3r7keDmPxyVaVEAfOG
         OdVg==
X-Forwarded-Encrypted: i=1; AJvYcCUIODPNonUjsSMhBwTVkzHIvuQ0e+sF75qVi3DHy/SMyGJ6afKFgpX/66XSKialObx6MhZ/FKowMHR62k2kVSlBROOoL1USw7Zd
X-Gm-Message-State: AOJu0Ywanp7OaQz+LROEfLQjyE5FPGNm+E0zkWj0TYMf7J6/mqZQrXaZ
	oek1aZUx+HdIiZf6oOzSNCUrEUVxmTuZPkvoEWyFHiKEJOfcANFYCfbtWM9p5Cq+5IfgZmlTz0Q
	0Ci3GHG9YLxs8MWSy21PbyonSJPNpE4K42K19
X-Google-Smtp-Source: AGHT+IFTRKU/IN2oUvb5h39ozwdgDveDjgoFuty1h8DKtr2zokbWin06W/kJ4wicF03AaijkmKBkMyI8RF9KtoZUsSE=
X-Received: by 2002:a05:622a:6103:b0:43e:3833:c5e3 with SMTP id
 d75a77b69052e-44146f10983mr2981601cf.11.1718124637169; Tue, 11 Jun 2024
 09:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611002145.2078921-1-jthoughton@google.com>
 <20240611002145.2078921-5-jthoughton@google.com> <CAOUHufYGqbd45shZkGCpqeTV9wcBDUoo3iw1SKiDeFLmrP0+=w@mail.gmail.com>
In-Reply-To: <CAOUHufYGqbd45shZkGCpqeTV9wcBDUoo3iw1SKiDeFLmrP0+=w@mail.gmail.com>
From: James Houghton <jthoughton@google.com>
Date: Tue, 11 Jun 2024 09:49:59 -0700
Message-ID: <CADrL8HVHcKSW3hiHzKTit07gzo36jtCZCnM9ZpueyifgNdGggw@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] mm: Add test_clear_young_fast_only MMU notifier
To: Yu Zhao <yuzhao@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ankit Agrawal <ankita@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Shaoqin Huang <shahuang@redhat.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Wei Xu <weixugc@google.com>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 10:34=E2=80=AFPM Yu Zhao <yuzhao@google.com> wrote:
>
> On Mon, Jun 10, 2024 at 6:22=E2=80=AFPM James Houghton <jthoughton@google=
.com> wrote:
> >
> > This new notifier is for multi-gen LRU specifically
>
> Let me call it out before others do: we can't be this self-serving.
>
> > as it wants to be
> > able to get and clear age information from secondary MMUs only if it ca=
n
> > be done "fast".
> >
> > By having this notifier specifically created for MGLRU, what "fast"
> > means comes down to what is "fast" enough to improve MGLRU's ability to
> > reclaim most of the time.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
>
> If we'd like this to pass other MM reviewers, especially the MMU
> notifier maintainers, we'd need to design a generic API that can
> benefit all the *existing* users: idle page tracking [1], DAMON [2]
> and MGLRU.
>
> Also I personally prefer to extend the existing callbacks by adding
> new parameters, and on top of that, I'd try to consolidate the
> existing callbacks -- it'd be less of a hard sell if my changes result
> in less code, not more.
>
> (v2 did all these, btw.)

I think consolidating the callbacks is cleanest, like you had it in
v2. I really wasn't sure about this change honestly, but it was my
attempt to incorporate feedback like this[3] from v4. I'll consolidate
the callbacks like you had in v2.

Instead of the bitmap like you had, I imagine we'll have some kind of
flags argument that has bits like MMU_NOTIFIER_YOUNG_CLEAR,
MMU_NOTIFIER_YOUNG_FAST_ONLY, and other ones as they come up. Does
that sound ok?

Do idle page tracking and DAMON need this new "fast-only" notifier? Or
do they benefit from a generic API in other ways? Sorry if I missed
this from some other mail.

I've got feedback saying that tying the definition of "fast" to MGLRU
specifically is helpful. So instead of MMU_NOTIFIER_YOUNG_FAST_ONLY,
maybe MMU_NOTIFIER_YOUNG_LRU_GEN_FAST to mean "do fast-for-MGLRU
notifier". It sounds like you'd prefer the more generic one.

Thanks for the feedback -- I don't want to keep this series lingering
on the list, so I'll try and get newer versions out sooner rather than
later.

[3]: https://lore.kernel.org/linux-mm/Zl5LqcusZ88QOGQY@google.com/

>
> [1] https://docs.kernel.org/admin-guide/mm/idle_page_tracking.html
> [2] https://www.kernel.org/doc/html/latest/mm/damon/index.html
