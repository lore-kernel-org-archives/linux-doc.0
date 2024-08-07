Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008E584A2F
	for <linux-doc@vger.kernel.org>; Wed,  7 Aug 2024 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723042985; cv=none; b=N0Mo/Qc5DzPGnJOI2ps2wPy/fkm9B4o7nnp/5SodIUNE609MLhJrZsTC0FgUzb84gSKGqmsZGJdU6XS4g9/qVCyEhorjW1oBzEoNKewR3hCIS/PdnD1+Okg5HbcAd0XM9VXK9zsSlJRvgVFgBA7ERKULLF1ziLXuwp9wxkrftGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723042985; c=relaxed/simple;
	bh=i+cKN7kvlmSwCbheJAMEk6ZSnnzPsXRqTPu/u16iMjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lz3aV4ttsfkUYtwQoWILGPpVIHFcBzAWEmdxkrh/JXWz2BwrY6a5/ZKUURdrXKf+8AO80/2S8YWkLjEsa4y/HKhvq+xc6a8qcYcmj0orK9MeYMvgOwgDizcBxNspnHgo63wRmTttNyU6uDCZ8LkaGFAWMNxVf/NsR7rjEHSqrYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EG+mZLEb; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EG+mZLEb"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fc4aff530dso545105ad.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Aug 2024 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723042983; x=1723647783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kl+B4ZpfEXlczthXYPnKJxRHMc3GQi5TyNP+ymJuxKA=;
        b=EG+mZLEbaT3VFrKjoBA4rnhDFCsVUYDtbW5eXWP0KEBc+bqXPU/BlUL5JRbzhT4rMS
         Sc4ygkpSSJ0+wt1MAYP1WzpaTFgyGveKsuVs7H9m50NzkjOBtEX1eeWIVqJE8YRGg3wy
         PDbyeSK4obJF60B1USCt4aKkhlCwxSYbXfktUiWP9FF2MqZWbR5mWUzItB1c8eIIaOKL
         R7uVO6cxJSxNDu9DHLCgNuGAZ0FxCx7+W2+xd4XFoTN1HBb55rxuXJPqMtIpEVq5Tv9r
         77jt+iJioUEkz1QvpNlSgf/Fmtpb0d4ZDdE3Db7yXXnClgGg8mCAYzgvI/On2H1/cTYO
         cSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723042983; x=1723647783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kl+B4ZpfEXlczthXYPnKJxRHMc3GQi5TyNP+ymJuxKA=;
        b=GgCAu4iNv/uJQoOzAQrnzlhJhNgJQrtwIx/23Kq86qSqsdQbH+C91aL1A6KJxDH4mi
         CDzmJsG0VdIvSFdWFVkz2xFV0BRYbhcmOvN4jgOVdInG5aXh041hxTU6trqWHBg5/ouA
         y0/h9/CxblqaDRuKO5hn9CilsvJWKyK6nIamjPwwYMDmAGgDRe3jR88j5pnty6b9LcUk
         BE1Y5fvsKTyaL6wMOOJm8vRfZw7ggx2wqZd3BydYg9RxQQnZCSxK/laGGGaGEt+6Yd63
         IYXGk+G9Pie+xqEA+VSuesHz7julO66oC5N0k+Xpq8ZnQxqBenCCWIbr26N1jVbiNk1f
         wx8w==
X-Forwarded-Encrypted: i=1; AJvYcCUtTWTKTWA9ZBUfQxQ5myivjTPI+Tp/09N8f0QJQQ6Tg7A9TQL8inwj6NI1lhsZN8sBLlEJekAeXCnqolDVnAdlXx53Gy9swa4D
X-Gm-Message-State: AOJu0Yzj61KIwdC4mHvS5FGWMxcCR09sdLq763xwovVjNQxMnTs2jGZ5
	sc6NLKrw3LZosptUJ0fxJkfVmqq+WTWOUA6xPhFnSh1UbK5j/H1YQYmYy+3xDTFb5ETgdN1G5ZG
	D0Ks49le2GkaDOG4i/uHySvmWGM80W3psq+jM
X-Google-Smtp-Source: AGHT+IEr49aHCdjCgL7YLIeYK1keo+SAW0FFZJxDENp6M5+q2ZuFNNnSP3R4yjqSv3wfAioC7aVTpFhpJO2Or0Jv1jg=
X-Received: by 2002:a17:902:f547:b0:1fb:563:3c25 with SMTP id
 d9443c01a7336-20083799d8emr3462625ad.18.1723042982895; Wed, 07 Aug 2024
 08:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724011037.3671523-1-jthoughton@google.com>
 <20240724011037.3671523-6-jthoughton@google.com> <37ae59f2-777a-4a58-ae58-4a20066364dd@redhat.com>
 <CADrL8HUmQWDc-75p=Z2KZzHkyWCCh8xnX=+ZXm5MZ-drALjKTA@mail.gmail.com> <20240806172349.GQ676757@ziepe.ca>
In-Reply-To: <20240806172349.GQ676757@ziepe.ca>
From: James Houghton <jthoughton@google.com>
Date: Wed, 7 Aug 2024 08:02:26 -0700
Message-ID: <CADrL8HXFK=1cUS+0Z5k048U4rzpTNL634f57VtJ7TD_umrbNiA@mail.gmail.com>
Subject: Re: [PATCH v6 05/11] mm: Add fast_only bool to test_young and
 clear_young MMU notifiers
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: David Hildenbrand <david@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ankit Agrawal <ankita@nvidia.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Sean Christopherson <seanjc@google.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Wei Xu <weixugc@google.com>, Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 10:23=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Thu, Aug 01, 2024 at 04:13:40PM -0700, James Houghton wrote:
> > --- a/include/linux/mmu_notifier.h
> > +++ b/include/linux/mmu_notifier.h
> > @@ -106,6 +106,18 @@ struct mmu_notifier_ops {
> >          * clear_young is a lightweight version of clear_flush_young. L=
ike the
> >          * latter, it is supposed to test-and-clear the young/accessed =
bitflag
> >          * in the secondary pte, but it may omit flushing the secondary=
 tlb.
> > +        *
> > +        * The fast_only parameter indicates that this call should not =
block,
> > +        * and this function should not cause other MMU notifier calls =
to
> > +        * block. Usually this means that the implementation should be
> > +        * lockless.
> > +        *
> > +        * When called with fast_only, this notifier will be a no-op un=
less
> > +        * has_fast_aging is set on the struct mmu_notifier.
>
> If you add a has_fast_aging I wonder if it is better to introduce new
> ops instead? The semantics are a bit easier to explain that way

v5 implemented these with a new op[1]. *Just* having the new op is
kind of problematic -- we have yet another op to do something very
similar to what already exists. We are left with two options:
consolidate everything into a single notifier[2] or add a new
parameter to test/clear_young()[3]. The latter, implemented in this
v6, is somewhat simpler to implement (fewer LoC, reduces some
duplication in KVM), though it does indeed make the explanation for
test/clear_young() slightly more complex. I don't feel very strongly,
but unless you do, I think I just ought to stick with how the v6 does
it. :)

Thanks Jason!

[1]: https://lore.kernel.org/linux-mm/20240611002145.2078921-5-jthoughton@g=
oogle.com/
[2]: https://lore.kernel.org/linux-mm/CADrL8HVHcKSW3hiHzKTit07gzo36jtCZCnM9=
ZpueyifgNdGggw@mail.gmail.com/
[3]: https://lore.kernel.org/linux-mm/CADrL8HXhGFWwHt728Bg15x1YxJmS=3DWD8z=
=3DKJc_Koaah=3DOvHDwg@mail.gmail.com/
