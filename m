Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDE81B6524
	for <linux-doc@vger.kernel.org>; Fri, 30 Aug 2024 17:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725037774; cv=none; b=Fry7LMHJnLQJInRI+Aek/QeZvh+WCfkkwe/rZQzjRDM03NYGjoBuypDTR6IiHMwrGB5Xh58puUcZo2BO9AfiONfjR2lqYJyPLZkRBKofmFXZV1qJiWuKu7ZFDLS3yAKmYrfIfZZ7YP70Z61/go94Jhyp4kE/C0CYAPkkEWq/vTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725037774; c=relaxed/simple;
	bh=CU346vDOqsSTaU3Zni7xFPxbjTXZB+6lE4+IxGvIin4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GfQJCeW63RcdrZw92SEVtFTiRA4zDzT3nLJekeRri2jf7RbttDouBsN5jgbytuZklSNQYx9nbxb0788ZI2yxEuDBzsbdHJurlsL3D3jlPSoo8o7rmxhGMc75STngHZks7I8wL7MiQFzX+iSWh3qE5gUrRl3cMNMHULbk/H449YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D/63zj5w; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D/63zj5w"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7141d43582cso2128206b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 30 Aug 2024 10:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725037773; x=1725642573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/DqUd03uLisJ+lBV6coVazHA/8Mv1E9hChZqzhDQx4=;
        b=D/63zj5wPjlolrfCsivNV3IWEtLug/VbFwPjgd4Grl18gAGH3T2yFT23KhktRRXjk9
         JNObrTVBsWDh3K4fZwVuVBXouFNXdEmpf7bcZ9eaxH4OVVxB3fWwwnqmUedwTpxlPG1L
         jbCN2F7z8ucVzrTmBUs6VbheAYNk1JTLRsppP9oBB/pG1y/BhlcD1SRUPeUaKGM2zvHo
         U6+BSkUsl3B5IH4+V5z43Kr9VfNu930FEiMp8jaM+9r1vvYpPMcmUHhsNpBwSY5rpleV
         6cHYGfjLB8bCH30xmM4MYmwHq4UswAPNM+y9d01owjKSF3bCkVVl3HUibHjRd3qimz8U
         QvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725037773; x=1725642573;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U/DqUd03uLisJ+lBV6coVazHA/8Mv1E9hChZqzhDQx4=;
        b=h11I97YxyHFdCR5BLcj44MrJYWM1bLV7PxU9T6eyv0DwYKYENuZl7Okpjy0I/BGer4
         FbSMvT9a+5+h754eZmgX/ScUvadJKp+uVet6HCK/vhg3StM904HSLsTFHWNZDZyeqoKC
         EwgwdQiKh9rv/sIRmgca1KPISDgJeF7NjoklJDGOSYr7eqaefLu/90tKomJltLQLVmLr
         /D83fP5rSun79j9cnNCBfwuOkeCvmywIGw3cXcqVW1OnEDueuLdv0gLFyJ+BXlR3oAVT
         ZK/xh6Dh01i7JeM/hNIEXu/05iZXndhdhcx6OboWlsqna75LmHqKeZM6XrkjKdIXkqEz
         /WMw==
X-Forwarded-Encrypted: i=1; AJvYcCWLKDCjWB9Ng4stKLwPd25rKxE4hXIWOTCjGTfrrghLbBaKK25XfJEp9Cz1o706Jp0xNlJAaukW4qo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQKVJg2oXkyPpv5vhv5XLGckhQFOVPgwh3t/RF39QMRITnGLh1
	vCjmUeNC+dBItl8FCzKhEOko8ABleoT2nOGSkhb+15gveJF6S/e/6MGpL0sx+b+U/xGVsriLyMP
	Exw==
X-Google-Smtp-Source: AGHT+IFFKP/thrpWlcd7MMBTCnnTgAMVFprrx6gPBFzwzuc79yk0sgtRNBZcK7vPcXyz945EdY+xAc0UhR8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:9467:b0:714:24bf:eaf5 with SMTP id
 d2e1a72fcca58-717307852dcmr5463b3a.5.1725037772263; Fri, 30 Aug 2024 10:09:32
 -0700 (PDT)
Date: Fri, 30 Aug 2024 10:09:30 -0700
In-Reply-To: <20240830124720.GX3468552@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240724011037.3671523-1-jthoughton@google.com>
 <20240724011037.3671523-3-jthoughton@google.com> <Zr_3Vohvzt0KmFiN@google.com>
 <CADrL8HWQqVm5VbNnR6iMEZF17+nuO_Y25m6uuScCBVSE_YCTdg@mail.gmail.com>
 <ZtFA79zreVt4GBri@google.com> <20240830124720.GX3468552@ziepe.ca>
Message-ID: <ZtH8yv5AabMEpBoj@google.com>
Subject: Re: [PATCH v6 02/11] KVM: x86: Relax locking for kvm_test_age_gfn and kvm_age_gfn
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: James Houghton <jthoughton@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ankit Agrawal <ankita@nvidia.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shaoqin Huang <shahuang@redhat.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Wei Xu <weixugc@google.com>, 
	Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024, Jason Gunthorpe wrote:
> On Thu, Aug 29, 2024 at 08:47:59PM -0700, Sean Christopherson wrote:
> > On Thu, Aug 29, 2024, James Houghton wrote:
> > > On Fri, Aug 16, 2024 at 6:05=E2=80=AFPM Sean Christopherson <seanjc@g=
oogle.com> wrote:
> > > > > +static __always_inline bool kvm_tdp_mmu_handle_gfn_lockless(
> > > > > +             struct kvm *kvm,
> > > > > +             struct kvm_gfn_range *range,
> > > > > +             tdp_handler_t handler)
> > > >
> > > > Please burn all the Google3 from your brain, and code ;-)
> > >=20
> > > I indented this way to avoid going past the 80 character limit. I've
> > > adjusted it to be more like the other functions in this file.
> > >=20
> > > Perhaps I should put `static __always_inline bool` on its own line?
> >=20
> > Noooo. Do not wrap before the function name.  Linus has a nice explanat=
ion/rant
> > on this[1].
>=20
> IMHO, run clang-format on your stuff and just be happy with 99% of
> what it spits out. Saves *so much time* and usually arguing..

Heh, nope, not bending on this one.  The time I spend far hunting for imple=
mentations
because of wraps before the function name far exceeds the time it takes me =
to
push back on these warts in review.
