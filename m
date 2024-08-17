Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5897F3D66
	for <linux-doc@vger.kernel.org>; Sat, 17 Aug 2024 01:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723856648; cv=none; b=nkvf6OAsL1e6nDnEt+4/W+CX2eofOGvDLOwq1z/hBwpLW708YcZ5bnBIvkIaiPOhcBF3EVG4xrBCrWsBRrir81Hajnkroa1hKyGHkXtNFAdxbcdYu2U5ReDsrB+cLY//COMGuERxdWy96FjypdqTeMGsmZrL/TGdFTwKqzNL38k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723856648; c=relaxed/simple;
	bh=WCZrkUgQEbVisIjIvmosSf/ZV8hiR799Km9gEhjpk4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dax4A+phC/T5ap4E1rQaSLiN7Lwq4dJZ+D+mYFEisbGlUIoQ3ZfuuFoxtgGhiBhYj6Frp87FzSSz1L0p/vubLEt7bBwR9Kz73LvujiEPbFwtyT26JH/4e/LyUkc+0S2mnqdijNtVWmhFCzN3Gu6UoIhS4gBtHkgg2Whp6+alcxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4xmK5PRf; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4xmK5PRf"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-842fe71877cso704199241.3
        for <linux-doc@vger.kernel.org>; Fri, 16 Aug 2024 18:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723856646; x=1724461446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZkT/FAH8t+UEeZZlsBiF2qoKJwELVKvUU9sus3nhBA=;
        b=4xmK5PRfQGsNo+nxrwxz8aY1iYGRXPtVlq8baI3aoUD9R3OWg46iBoVhwzvvuIux0v
         QusATmhFV78vsqVrhH1vGOUQ2FreuixmS1jxylHXWPqq4Pl5Lf6c2XDpSAPhCyo2k0gJ
         jVUrv7cs5JvNlp8yEXcj77XjhzbY3IGxeqy6Alz0PpZ7uX+p8E/+VqnGbzsrDVPdYCbZ
         LeRwvVrOViZ1AJSjGraWjr8yJ9xz9XKVfhy/IKdNxhC8HqUh+eAqqAZC3c4pyk8I7jVK
         Q/5glxwLFTPOVZ+kZtfGp2S0cnYhB5ayWx3LcgTYK4aKYNxdvjdYHivRtAPLGmPyx7HG
         H7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723856646; x=1724461446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZkT/FAH8t+UEeZZlsBiF2qoKJwELVKvUU9sus3nhBA=;
        b=hxruNzJIw/JKklMeq7D9hPYdwBUt1R5zNJduW5XN+7iV527UFm3dt9SrYVMF6PY19I
         8AjRCpKMgPIiFd8m3rr1ioqBE1GLXjBHtlWTVCSpRgmAg06xNxfxdJSPok9TbqecDiZJ
         XXJ/z1Y5cZZav5FQpflRJiBOK1UDZ3uIPydKC1Au0pC/D/ULozodspnrvjO4JU3HIv13
         aFCGx0dbSTtEnBPrvUzoVcA6eXl9QF50wlwWNxNgeDkfr0d3XQ81ssfakpD02xNb1Its
         t9zw7KFIfuzHz2vZ1XBzv9+tI9oaRjZTZAWHbPKJq85SVr1v9WU9IwoLX30MBkG8CU/J
         i9Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUfFadanw7aGVILmmg0ZA9EG+Xn6LRZKEXpTwIGk1KyMrzswKWQWbBp6O+zp4/s+53erbOyDl4qP7CDBm1BT0vc7DyiLyzYCp+h
X-Gm-Message-State: AOJu0Yx10iuntYIfxKp4QN5bDtO8VKuWSM1+cVV5qjy3Rm1GKCvmaxEZ
	YpCR9ORxQH2cVXxgm+Bxv0BYpKs1Ro/5rAnj62Nt7f2PL5U63XSN7yKfMKb1XXscd3BC1FVQ6qC
	5TgFRRN8O3ooJ1gad0CsZaxo480Wzsg8rwhVJ
X-Google-Smtp-Source: AGHT+IH+z/yVUCGn/kvsFe3FWe5Y4PrsBx6c3aNhHuqGExQKF6hhvvYIWba1m2Vl5PvAw0UlZYeqJffhxIB+o44gihE=
X-Received: by 2002:a05:6102:3e85:b0:48f:e7c2:1faf with SMTP id
 ada2fe7eead31-497799a0eb9mr6016565137.28.1723856645893; Fri, 16 Aug 2024
 18:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724011037.3671523-1-jthoughton@google.com>
 <20240724011037.3671523-4-jthoughton@google.com> <CADrL8HV5M-n72KDseDKWpGrUVMjC147Jqz98PxyG2ZeRVbFu8g@mail.gmail.com>
 <Zr_y7Fn63hdowfYM@google.com>
In-Reply-To: <Zr_y7Fn63hdowfYM@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Fri, 16 Aug 2024 19:03:27 -0600
Message-ID: <CAOUHufYc3hr-+fp14jgEkDN++v6t-z-PRf1yQdKtnje6SgLiiA@mail.gmail.com>
Subject: Re: [PATCH v6 03/11] KVM: arm64: Relax locking for kvm_test_age_gfn
 and kvm_age_gfn
To: Sean Christopherson <seanjc@google.com>
Cc: James Houghton <jthoughton@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ankit Agrawal <ankita@nvidia.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	James Morse <james.morse@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Wei Xu <weixugc@google.com>, Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 6:46=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, Jul 25, 2024, James Houghton wrote:
> > On Tue, Jul 23, 2024 at 6:11=E2=80=AFPM James Houghton <jthoughton@goog=
le.com> wrote:
> > >
> > > Replace the MMU write locks (taken in the memslot iteration loop) for
> > > read locks.
> > >
> > > Grabbing the read lock instead of the write lock is safe because the
> > > only requirement we have is that the stage-2 page tables do not get
> > > deallocated while we are walking them. The stage2_age_walker() callba=
ck
> > > is safe to race with itself; update the comment to reflect the
> > > synchronization change.
> > >
> > > Signed-off-by: James Houghton <jthoughton@google.com>
> > > ---
> >
> > Here is some data to show that this patch at least *can* be helpful:
> >
> > # arm64 patched to do aging (i.e., set HAVE_KVM_MMU_NOTIFIER_YOUNG_FAST=
_ONLY)
> > # The test is faulting memory in while doing aging as fast as possible.
> > # taskset -c 0-32 ./access_tracking_perf_test -l -r /dev/cgroup/memory
> > -p -v 32 -m 3
> >
> > # Write lock
> > vcpu wall time                : 3.039207157s
> > lru_gen avg pass duration     : 1.660541541s, (passes:2, total:3.321083=
083s)
> >
> > # Read lock
> > vcpu wall time                : 3.010848445s
> > lru_gen avg pass duration     : 0.306623698s, (passes:11, total:3.37286=
0688s)
> >
> > Aging is able to run significantly faster, but vCPU runtime isn't
> > affected much (in this test).
>
> Were you expecting vCPU runtime to improve (more)?  If so, lack of moveme=
nt could
> be due to KVM arm64 taking mmap_lock for read when handling faults:
>
> https://lore.kernel.org/all/Zr0ZbPQHVNzmvwa6@google.com

For the above test, I don't think it's mmap_lock -- the reclaim path,
e.g., when zswapping guest memory, has two stages: aging (scanning
PTEs) and eviction (unmapping PTEs). Only testing the former isn't
realistic at all. IOW, for a r/w lock use case, only testing the read
lock path would be bad coverage.
