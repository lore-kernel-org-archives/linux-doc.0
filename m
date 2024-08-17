Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1607D1361
	for <linux-doc@vger.kernel.org>; Sat, 17 Aug 2024 01:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723856454; cv=none; b=FmrL5Lt9e3ziMRFa9TI0dNDa4WaBSgR+n77ArFBlIb7EjP6HjB+RJI7BiKUW+NfhXZx/5UwdYyjIByAAE2XkoZqI05ZNJRASv7w1jypaOWnKRJlEdd2/Yqg2Jb6obvNvPQK820HLkIvnAoFoxybfxXqNfBvwkkI6ABTof2NCL78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723856454; c=relaxed/simple;
	bh=xME3BnPckt7E13btYdrc63u8unf/OOEIYZuvPJ+UGKE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZSxuT/s7jlM24xXuCrMKNRKsSUIS4gUJEPQhQJ6zK3s6TS5xWnjMv3JdJmI0Ys5xahvDPqCpPzs0+wiI1ubVcZHm74/ZIonacHE+MiLOnri59haUlGcy6bPrQtngEVU0wRYje1NHDgSKqhznlUU4wTlgRWumRmK7YAo3EWI5oZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V3Dt8QVY; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V3Dt8QVY"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7a994e332a8so2047236a12.3
        for <linux-doc@vger.kernel.org>; Fri, 16 Aug 2024 18:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723856452; x=1724461252; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DHurR+fx7zf8gF+fH8OqsanlwZHSvsgIt3z0suTHGLw=;
        b=V3Dt8QVYNYP1rGEjPwFGBXgHTd3TBzf1yG7uwWxRMaLtNcOfpHUX+8pLnlz4t9g69q
         C5cHPe5bWGKDY871aAS9VUIu+MQNcLW1j0+37hwaE2p/Igc++Mc1tLDbDV2lG22UYkI8
         9X6O1R6sXI4X5Luk5Wd1OUrAompEejk/jV6N7xE/FlBt8KAOBz6ldM6qq7RDYLJSkt4o
         ajYnb/Ta3Ko79fj1mlL2j4voqN9B33EMv3qlGO5ImSWV64p1P/1IdAHP978MR+/3o1i7
         /fQ4FaYAqB3xZD2RifaNLqPiMAD2/zBD7RCKJsMypOBbfMD56grNHk/xU7Nkq1mzFn7f
         1ySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723856452; x=1724461252;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DHurR+fx7zf8gF+fH8OqsanlwZHSvsgIt3z0suTHGLw=;
        b=TjHFj3IML63p59+X31s4UUvKuVO/cdud0uL8pUMWzGJupP00rSuM1mLkFbMUzDkfMA
         Q3PHS4I9ejZu7kwiK4VWVns6+bG7TEiWMZOHrDgl0NnCuldwOI+yBDZGaSKtoRG5bcxW
         Ba8ar83S5fv4ONnPXdLWPxUO5vExA5kWkSfzqdx3DIFWasmYZRkMQBjIQX4UCQSDGPd1
         1a/fcl94jgDEJxWFKhWNJv3NymxLcTfsFN2D4n+LLKiTm51SilGoPUEL6PHk5e0pHr4F
         N0S27GgiZdK7qOzOb9wwhjmRdWfwD5ZC9SZaYh50qASgIjKtWTauF+gIbeGw9mHrQtyp
         18xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwXIVFpqUC0p14VfpQgkWU+iMbBdaWS+6gCA1jxl5JKxpNuePmBMXHK7jzNlbniY05fF7LJjs1Fu2hRWZe8ksNf+isP9SNF2lX
X-Gm-Message-State: AOJu0YxRrQF4Pp3XynNlYjKwMGztF3tTSnWwP5YJnd6YeY65HMEUNah+
	QyGGD6PkOCnb0K9qDfK5l4JIjkqkWa/25lSQKgTEeqh2JTm5kBQiXkPTQKWXvPdlcJ9rauZKGQa
	oug==
X-Google-Smtp-Source: AGHT+IGgQ5L96WEtrOF85LpPpxMbEdlboogX890StOgCMUdrhDjVb+vU60wuE1WwXFLKi0Z3aJ4DtITuwPA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:4a3:b0:75f:3d6e:6461 with SMTP id
 41be03b00d2f7-7c97af56e6bmr10481a12.6.1723856452244; Fri, 16 Aug 2024
 18:00:52 -0700 (PDT)
Date: Fri, 16 Aug 2024 18:00:50 -0700
In-Reply-To: <ZqKWxfqRoJzUWroG@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240724011037.3671523-1-jthoughton@google.com>
 <20240724011037.3671523-9-jthoughton@google.com> <ZqKWxfqRoJzUWroG@google.com>
Message-ID: <Zr_2Qhflx5xBhFCY@google.com>
Subject: Re: [PATCH v6 08/11] KVM: x86: Optimize kvm_{test_,}age_gfn a little bit
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: James Houghton <jthoughton@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ankit Agrawal <ankita@nvidia.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Rientjes <rientjes@google.com>, James Morse <james.morse@arm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shaoqin Huang <shahuang@redhat.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Wei Xu <weixugc@google.com>, 
	Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jul 25, 2024, David Matlack wrote:
> On 2024-07-24 01:10 AM, James Houghton wrote:
> > Optimize both kvm_age_gfn and kvm_test_age_gfn's interaction with the
> 
> nit: Use () when referring to functions.
> 
> > shadow MMU by, rather than checking if our memslot has rmaps, check if
> > there are any indirect_shadow_pages at all.
> 
> What is optimized by checking indirect_shadow_pages instead of
> have_rmaps and what's the benefit? Smells like a premature optimization.

Checking indirect_shadow_pages avoids taking mmu_lock for write when KVM doesn't
currently have shadow MMU pages, but did at some point in the past, whereas
kvm_memslots_have_rmaps() is sticky and will return true forever.

> > Also, for kvm_test_age_gfn, reorder the TDP MMU check to be first. If we
> > find that the range is young, we do not need to check the shadow MMU.
> 
> This should be a separate commit since it's a logically distinct change
> and no dependency on the other change in this commit (other than both
> touch the same function).
> 
> Splitting the commits up will also make it easier to write more specific
> short logs (instead of "optimize a little bit" :)

+1.  Especially code movement and refactoring, e.g. factoring out
tdp_mmu_clear_spte_bits_atomic() would ideally be in a standalone patch that's
dead simple to review.
