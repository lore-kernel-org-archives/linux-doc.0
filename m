Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C121FCD1F
	for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 17:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748453424; cv=none; b=Ylye3j2kMKQwiNO775cyEVT1LqG+G3EQKBE/XTA3f42Y82zmz0dR8vPL9adUpgb/BWPm/0G+60vqBoPWeruOWQAV/XRSdTJ/NxpF4KPmWjSSOUEWkN9H/BtblXElVYDpm+GYd/gaq5gGBCjRkADd1qn2gm2lWJpRr4nnEG2/9L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748453424; c=relaxed/simple;
	bh=ARY8CwNgeEkx4xeewofft7OOZG05/4+sLW6rStZljR4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CTUhRXYJR0MmUsOl6cmNjVIt5qSu4j40YlZucSPy9SBn3n9LZj7miKyLbpQETSCuoxmUGsKkMmnG5+6fR1z5d4AauY1lE2hoCGjOk5LcxESXuOeI5pzowQaPYv7TNOCA5SeQqcCfC+jmu3Awp+8EGg784aHOsXDkdX0T4uNUH/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0vHEnPRv; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0vHEnPRv"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-311e98ee3fcso799830a91.0
        for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748453421; x=1749058221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5lk3aR+RzRKEkMTxOWzVHzMD+THYlxrp/Tixh3xiWc=;
        b=0vHEnPRvxl8OZy/Y7wTTc11pqfjzRERfZHMbTLrG+0UHdiRO08+rT9acCaXYZzXHvu
         AYAGz/8VNERpC1goEnKBJZZt9lYQF3QlOUm/3T555gduuaV5Yg1edrv8bDx3MFV/izJs
         GGGB+5VjPH+0MJBsLYGMLkRg56dglb55mO1XGbj7GnRj33Bg+0NuPYu5iiPZzI9lvmeF
         FF2+PC/P6x5Qk9vHwVLR8RZvyRVK4BE+hu/QkTJiTX754RsdzIHsGuLgdw44iRxHnjwT
         5VkM6uKhUZsOVjd/C6k4rKYBlhGyNUsW8aj/KbuNEezB0wQggbxvuK6lJt0LHtRVnHVs
         t22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748453421; x=1749058221;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X5lk3aR+RzRKEkMTxOWzVHzMD+THYlxrp/Tixh3xiWc=;
        b=sL8v3JTsSzBqPhhm8kepzHWwQ8tzo1MseEBiX3qWG2+6Vcbodn4mGIEHGw2SqXCWUE
         rL2m4mX1xQHCCceU8llkjq08c45cQVd4ake+O4XNGXcvdYCB72xIe20kHugQVJ7NRIIm
         G7Ggee8p7zMk1ksfTcdRfaHLc0M4yW1ED+8OzhHNhJVmIfOY8fIbIDhluuB+VKa0Sy+C
         dDN38L6sUUGpxS/sEaSeqVHo4cTK34pI8RIbGRVgfb/+G5x98/0DrYwHFF+dgOzRUj+8
         Rp9qQb8htRtmwdo+S8rY0x7IB6V6rCCDGIYs1V5f4IeHwRziLyysNpGVd+CZNkIs1k37
         VDVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/4bxKds1iVA6ymDsdPTLHQL36/g3VO7jSIvf0DsiI1hUH1N8XdL9jRBWbfd+PN5MU3RF3wIUks4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNbTLk5UJHk/QL2/IlOcfcyinkDAfVm4e57oGuGJOaKBXgriWo
	SLfdMPXvdJI7cJhN3/zL6NbWoHU5jtu/Z9vdgicBmZG+DwToWGkPznr0VbaeVSi4CmnFo0Uyi+C
	jf4GYqw==
X-Google-Smtp-Source: AGHT+IEsnEf7VuMExZRw8wVJdfyr2XCnHx5H/B/LOCvx+d5raumWeIsp3ExyZi0ZxIt7xWBlYTiCNvkn+ag=
X-Received: from pjbpx18.prod.google.com ([2002:a17:90b:2712:b0:311:8076:14f1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3848:b0:311:be43:f09a
 with SMTP id 98e67ed59e1d1-31214e6e01dmr517950a91.9.1748453421388; Wed, 28
 May 2025 10:30:21 -0700 (PDT)
Date: Wed, 28 May 2025 10:30:20 -0700
In-Reply-To: <CADrL8HXS7zvJZjOxTxPKH0dAGoMXnFrrxCW7J7CXRtaeV6izjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
 <20250109204929.1106563-7-jthoughton@google.com> <aBqkINKO9PUAzZeS@google.com>
 <CADrL8HXDDRC6Ey5HYWvtzQzjcM2RNX7c7ngGyjUsD3WiBF3VYA@mail.gmail.com> <CADrL8HXS7zvJZjOxTxPKH0dAGoMXnFrrxCW7J7CXRtaeV6izjQ@mail.gmail.com>
Message-ID: <aDdILHOu9g-m5hSm@google.com>
Subject: Re: [PATCH v2 06/13] KVM: arm64: Add support for KVM_MEM_USERFAULT
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025, James Houghton wrote:
> On Wed, May 28, 2025 at 11:09=E2=80=AFAM James Houghton <jthoughton@googl=
e.com> wrote:
> >
> > On Tue, May 6, 2025 at 8:06=E2=80=AFPM Sean Christopherson <seanjc@goog=
le.com> wrote:
> > >
> > > On Thu, Jan 09, 2025, James Houghton wrote:
> > > > @@ -2073,6 +2080,23 @@ void kvm_arch_commit_memory_region(struct kv=
m *kvm,
> > > >                                  enum kvm_mr_change change)
> > > >  {
> > > >       bool log_dirty_pages =3D new && new->flags & KVM_MEM_LOG_DIRT=
Y_PAGES;
> > > > +     u32 new_flags =3D new ? new->flags : 0;
> > > > +     u32 changed_flags =3D (new_flags) ^ (old ? old->flags : 0);
> > >
> > > This is a bit hard to read, and there's only one use of log_dirty_pag=
es.  With
> > > zapping handled in common KVM, just do:
> >
> > Thanks, Sean. Yeah what you have below looks a lot better, thanks for
> > applying it for me. I'll post a new version soon. One note below.
> >
> > >
> > > @@ -2127,14 +2131,19 @@ void kvm_arch_commit_memory_region(struct kvm=
 *kvm,
> > >                                    const struct kvm_memory_slot *new,
> > >                                    enum kvm_mr_change change)
> > >  {
> > > -       bool log_dirty_pages =3D new && new->flags & KVM_MEM_LOG_DIRT=
Y_PAGES;
> > > +       u32 old_flags =3D old ? old->flags : 0;
> > > +       u32 new_flags =3D new ? new->flags : 0;
> > > +
> > > +       /* Nothing to do if not toggling dirty logging. */
> > > +       if (!((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES))
> > > +               return;
> >
> > This is my bug, not yours, but I think this condition must also check
> > that `change =3D=3D KVM_MR_FLAGS_ONLY` for it to be correct. This, for
> > example, will break the case where we are deleting a memslot that
> > still has KVM_MEM_LOG_DIRTY_PAGES enabled. Will fix in the next
> > version.
>=20
> Ah it wouldn't break that example, as `new` would be NULL. But I think
> it would break the case where we are moving a memslot that keeps
> `KVM_MEM_LOG_DIRTY_PAGES`.

Can you elaborate?  Maybe with the full snippet of the final code that's br=
oken.
I'm not entirely following what's path you're referring to.
