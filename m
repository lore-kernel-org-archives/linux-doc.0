Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AE41C9EAE
	for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 21:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717019999; cv=none; b=C28JXBmmsUR35DziJMyuvcWkK1OHD8hR0AFtBI6p7pHDe53dxx7xorfM6RYjG0Luo/b7rh0Ii4Bk246wC/1EdqhpY04GrPCBVpkoLfVf3CSm4C8SOlYeWkbmYUFPTY31n8IyVo/t3hXNGOQJjc8IOvi6S8JWjL9yIN8qltiAtvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717019999; c=relaxed/simple;
	bh=VygQSYtgJkxGCNbSiB1TmlrjiVcPo9FASZn5iwrGyKo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XmulC1OppKJsjE7neqWbiKGLT8K1zgFSG6gQHmuLUtbZ6rxHRVozUcNurLXyM8MeQIY1ELoPkCNg/VXJwnFcUGMoI8asCXj4t7OdS1ev7lsLsQzoqRN4s6KjyWvfZy7BQFFzJS2PX2EIoLbM0/uZwDNkwW5Z9jo0eFKlLbyOD7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iRZQPHI6; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iRZQPHI6"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-6fb22ecd976so146542b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 14:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717019998; x=1717624798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VygQSYtgJkxGCNbSiB1TmlrjiVcPo9FASZn5iwrGyKo=;
        b=iRZQPHI6jTuItUl/VtuhiCWiIJdg7vo/obhR+QThwSwOzsy4EmVdb/wVKR2U+Gmq4T
         M8srSh4JdM0kBHZVhgK3Q9+g3K6Yzd3p2KTfhSiykmToIRrSkuDYdfD+TMCeReaXS83o
         WXMbEEb/yS/7blzWWHRm6H/W5Utgbs1tbjjPCj96nRJJnaYkrsqEF3svYeo8Q8WFX88L
         eydehI6iicI8Jbq6r4OIODSID43eJfOf8hwxIuPbS0SDmwaV2m+rbx22ihKMB4bsDM72
         yDvV8tDG703s1D3+WuYZy2vrKUKClNGnL9KQXKuOKJXSZ98Nq6Sy0n6nJUSiPW4w9t/s
         ZSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717019998; x=1717624798;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VygQSYtgJkxGCNbSiB1TmlrjiVcPo9FASZn5iwrGyKo=;
        b=rwN9LLwwmIiiTvfiBidoTGsqwySUyTJCqZf85fAMoofzxELYC5D713mrBx+8mm1klz
         WUZ62hbn0nOMA3/aOpKuZi4etNjpwkDLzs7e7yGHw5ub4Mug5KQJ4QB/EnPz9cfNg+dJ
         VuSzo/fD3kCWpncv3h3ZpbeXUwpOtd2DkyaqQkWGHr49WhK0mj2+6SE25XjQRsD9u1M/
         3if+ufWwLSDyJi4pWrUDsPj8bID08FJQDfMwcr9aowpu67TKsSU62ixiF3Ia65zQ/oH3
         IGZSrXf82qDTPgrVJme4N/CvlcIJTQblCYIUGSXh3tbqSrcM0/Px9+B1RySRpDj//Omz
         6+yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoO/kbwMIVRYbIgB85GOLISNvq5V8VBOvXLhye1h59ePK2Dci5MOCH1v2tsID/6KViksMS1wgZRA2ImmYfuDwnp4595QS3oIUN
X-Gm-Message-State: AOJu0YwEDGEaQVEkR12qQsJlpyg38fx4Kb2f2uPlINinl+5jC58eGW+J
	WRTeLqR740/ELaJwk+A4h2Vepm8OcKnfiH6LvneTOlz7hGIvQBtBirdpSWOAnMDvhnQwPkZlrdi
	7yQ==
X-Google-Smtp-Source: AGHT+IErfD3/6U7Yg0vFWmN+JznLDOE9vgR2lO1JhTGk52Ll6iOJE5uAx2O1dqENYjCcQTLMPcB8oRdC9wY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8607:b0:702:1e25:a47c with SMTP id
 d2e1a72fcca58-70231a8676amr343b3a.1.1717019996755; Wed, 29 May 2024 14:59:56
 -0700 (PDT)
Date: Wed, 29 May 2024 14:59:55 -0700
In-Reply-To: <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
Message-ID: <ZlelW93_T6P-ZuSZ@google.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
From: Sean Christopherson <seanjc@google.com>
To: Yu Zhao <yuzhao@google.com>
Cc: James Houghton <jthoughton@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ankit Agrawal <ankita@nvidia.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Bibo Mao <maobibo@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024, Yu Zhao wrote:
> On Wed, May 29, 2024 at 12:05=E2=80=AFPM James Houghton <jthoughton@googl=
e.com> wrote:
> >
> > Secondary MMUs are currently consulted for access/age information at
> > eviction time, but before then, we don't get accurate age information.
> > That is, pages that are mostly accessed through a secondary MMU (like
> > guest memory, used by KVM) will always just proceed down to the oldest
> > generation, and then at eviction time, if KVM reports the page to be
> > young, the page will be activated/promoted back to the youngest
> > generation.
>=20
> Correct, and as I explained offline, this is the only reasonable
> behavior if we can't locklessly walk secondary MMUs.
>=20
> Just for the record, the (crude) analogy I used was:
> Imagine a large room with many bills ($1, $5, $10, ...) on the floor,
> but you are only allowed to pick up 10 of them (and put them in your
> pocket). A smart move would be to survey the room *first and then*
> pick up the largest ones. But if you are carrying a 500 lbs backpack,
> you would just want to pick up whichever that's in front of you rather
> than walk the entire room.
>=20
> MGLRU should only scan (or lookaround) secondary MMUs if it can be
> done lockless. Otherwise, it should just fall back to the existing
> approach, which existed in previous versions but is removed in this
> version.

IIUC, by "existing approach" you mean completely ignore secondary MMUs that=
 don't
implement a lockless walk?
