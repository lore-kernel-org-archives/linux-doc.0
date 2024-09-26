Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAF416F858
	for <linux-doc@vger.kernel.org>; Thu, 26 Sep 2024 01:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727315746; cv=none; b=Vu8oE3CpS9ZR8zUw//y+c7Ay4tqnImouPnDXCOjcsNPqeq/btGvuRq8IYrNBtqrtGM4Ffs19wFAZlEW4ytK8JEKq66/+y+OKBSuDEIrr3wFYyyeTfpFl+M/DoOLWjO+acK5/8Rk/BzfD1IlwMa9xYDAX/S7b/bON5XR9qQfqMVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727315746; c=relaxed/simple;
	bh=AvOeu1aCuavSpf/Qxzj/pTTNG2WKfA/2mpgDnn4nCwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pfaa1eE5Xyeokeo/Pc+ArqbqRE0cmgSZwKWn5mO8Cd930brWBVaqIx2DRCUQf6e1kwOo/ZofZ/YKwfZian80GmV9G4zn4eYuWO+JAaVUz9KbuhNhYs0NER/y8nPSrV76gdvcPY0k592XzI8s7L3APaOhp7rlzAtPAHf/cLF7YJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C4/tDrCr; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C4/tDrCr"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6db67400db4so5825147b3.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 18:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727315744; x=1727920544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvOeu1aCuavSpf/Qxzj/pTTNG2WKfA/2mpgDnn4nCwk=;
        b=C4/tDrCrv1Fh5YPVT97pj7co+Y+hsVvZo15FVQuHqnwNMW7iIN/yJQrg14wn1xmeO+
         FBPMSOqNVmRKB5+VsnAtqONysg3ATzWxFHcpQXlPVE07wHMsBEsvZS3mwdGmZz+wABBd
         R817wHk019Uo8HxWfzFJ+GvW8iM05pvLPdyfh43L4VBnIa7S+cgb6UbCSZ0HGFcV9CaX
         IaGOCYyub4UPbj6QHUaqqcxi3EzJ2+QMnEQetJdyNz2nI+29eOEteWfkoMe0cafWQ8id
         CYzg6oeak7LhhZXhfp3oRpshj+S0fFoI5E4n8zHfaX+Mmf7CZqwNtpG5gSqYvPL6g2s5
         CQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727315744; x=1727920544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AvOeu1aCuavSpf/Qxzj/pTTNG2WKfA/2mpgDnn4nCwk=;
        b=mXkXugVLEp8HqP1o0ouPWZG8niyQs2d0SThv5xYAWxqctn1vg7JBh25elnahifRq/A
         3YToAcbDu1ESMgvyWAPH4aDUsO0BjnRcjJMY11LxXAfNaL5Kf3FY3DNuII+6iKXglGom
         WpICSIY2ClzD3I4Q8m8hX7os+k1l+vXFsN6D+TEEjdGvVWt+TKOWBP6Sz5cX6JoLGz/h
         E3L7wasrlUR7ftzamhm2r/TcTk67YZH02mWHc07u7QnN6uvdssGsJr8Ys2RlJ1iBIn/s
         xHTKuKwCSIH0VZlQ9WoMrN28JeOGX1wxepSXCFDv+PUB1ZS0SlsJQAc/zwJtmyJWu9+G
         n1DA==
X-Forwarded-Encrypted: i=1; AJvYcCUPm72h2mPycauTH0UKnSrRoD7z3dqd8zxjZPR2OgPNn4/eJT+FUkTyjX2Oo3EvvHl/VDGoFUu/tw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrqAlpiI2rF/mt6bAERXtMKhrXY+QIFx71Y9QF9iDjwhkjpn/v
	42JCeJZa9DAsh93vd3wzfmbnd5sapKDQw6LbVfA/dLXf4INhSA4rm73mIK+NGSJG0YQMe/RL+XO
	hgqFDWMHHGnlen2eBJy+EYOoehzu6t3GNOVry
X-Google-Smtp-Source: AGHT+IFii9QgwJ7X6I4kq0clALv2ZlfTWM+Ez0PZcdvnVsO0zqwYPfgk8ziwPN23MIImR0+NDVcsRZ7OngewarYkwr4=
X-Received: by 2002:a05:690c:368f:b0:6db:e03f:7c39 with SMTP id
 00721157ae682-6e21d833401mr46817427b3.16.1727315743978; Wed, 25 Sep 2024
 18:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926013506.860253-1-jthoughton@google.com> <20240926013506.860253-5-jthoughton@google.com>
In-Reply-To: <20240926013506.860253-5-jthoughton@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 25 Sep 2024 18:55:07 -0700
Message-ID: <CADrL8HXZttWQcsUBPYBuctEP4BWhGwSoTNvT7eeknsGJkgbGig@mail.gmail.com>
Subject: Re: [PATCH v7 04/18] KVM: x86/mmu: Relax locking for kvm_test_age_gfn
 and kvm_age_gfn
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, Wei Xu <weixugc@google.com>, 
	Yu Zhao <yuzhao@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 6:35=E2=80=AFPM James Houghton <jthoughton@google.c=
om> wrote:
>
> Walk the TDP MMU in an RCU read-side critical section without holding
> mmu_lock when harvesting and potentially updating age information on
> sptes. This requires a way to do RCU-safe walking of the tdp_mmu_roots;
> do this with a new macro. The PTE modifications are now done atomically,
> and kvm_tdp_mmu_spte_need_atomic_write() has been updated to account for
> the fact that kvm_age_gfn can now lockless update the accessed bit and
> the W/R/X bits).
>
> If the cmpxchg for marking the spte for access tracking fails, leave it
> as is and treat it as if it were young, as if the spte is being actively
> modified, it is most likely young.
>
> Harvesting age information from the shadow MMU is still done while
> holding the MMU write lock.
>
> Suggested-by: Yu Zhao <yuzhao@google.com>
> Signed-off-by: James Houghton <jthoughton@google.com>

Oh no! I have left off David Matlack's Reviewed-bys[1, 2] from this
patch and from patch 2[3], and I failed to apply his comment
suggestion on this patch like I said I would. Sorry David, I have
fixed up my tree now.

[1]: https://lore.kernel.org/linux-mm/ZqJ_xANKf3bNcaHM@google.com/
[2]: https://lore.kernel.org/linux-mm/ZqKUefN3HgBQQkuA@google.com/
[3]: https://lore.kernel.org/kvm/20240926013506.860253-3-jthoughton@google.=
com/
