Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68631560AC6
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996101; cv=pass; b=X/AW+oxLIlXA/WE+W767onbTdIVLfRQKRpLI7ouDSdH0yFQcJN7KqSQHQJBpQ2quy/q8hxEgPyK9ugChrqkBmFy+Z8HoPXr/SrF+dpVWyr008xjCU8a84UG1R2dPXslMDtRmpM11Ob4JH989m4aehSHYuBYFzANnH2xFdqsUWiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996101; c=relaxed/simple;
	bh=3mwSDPTFjJGkaatL1Lo6Mh8o6JdUk3CgZRH07sGguXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5lta3BKxoD45/kdQhjnfNzBF079UCz3i5kQw2R9bnvBNvKtoRinI84Le0IuKOlXJHQuCmOBTG+MpUiWKSI2bnDRzvkQCr6H2E9ebpxEF1L3c/FFKOClD1FARVglSRnXMwgqBp0VNxd/1VxFdElWe6gnNBeEm5j11dRS8W6L3ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PSHV793O; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PSHV793O"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-533202fe429so1288891cf.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 09:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996098; cv=none;
        d=google.com; s=arc-20260327;
        b=fryrNyFenjV7RnJ1nopOwl4GjIqrfTXHVj+g2Urnzio+gaFvOmA1zbkZ6jtjmGDzFq
         TNkhZP4Lzff6o6vloMEU5JOl1c7arUDVcIgmELFwkqn78HYG6hT1Vm1kS0AmyRp9qMHZ
         HWnW3Jie0IQG9VFgdde2m4C6Y2Ye8GsN9v1RGq44ZTtRJopHSYFt4pdYRVDoxh9/CeNc
         Odt50FQV1QUfWe23Ibw40tfioZk/oUxm0SytdZUch1RkVGU5ZHjpT0Bsy1dJOBpsYwCZ
         dQ8fT3NwrvFHWd295WSHyeu3quEjlkoIV8quE66fsfGJZN7srSpN+yubfA8CqT0yAjb6
         8j8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NIItl0pCQ/aBq2U1h8kgQBz3yZb99mdO46VMaoMNnUw=;
        fh=AVB3qr8Y6hcTjlisgPlW0UuLgPkHQSez81fFWaSeWN0=;
        b=CsFZPliJEcdw1jyFT/3+4FH20dTlUziNob+rrohpIxBbM+Nejkb+leGmqk7dsseUv5
         1jLILRzpeDx4zcTRgQdCiqjtOtlPT2/1PPG2OcRzNyxK/cq8sR/b+AfnD1MMjWOSz6Hu
         LS6bkeqpVSvueAzuaf0XYirPFBXlk8h8gelb7cyhDHLkwYtRm9fjBL+uv0n+M0+tN8o5
         qbSoajCnqSVVOCebpP4PHG1Jyl7MeTiPmS1cLxONYVIJ1q6XEYTNoTaZT/GwE8dTPIfF
         TKuefm3rs8Qw8QbxQchOqfw2so65WnUw1iqsGUZyaXK5lJzKrkLJIDEUkZx0d58PHMvo
         6zsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791996098; x=1792600898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NIItl0pCQ/aBq2U1h8kgQBz3yZb99mdO46VMaoMNnUw=;
        b=PSHV793O39//GSS5VtLaFYRrP0SGllChdzMcn6ZGcDyfZ85ESv9NC8wIeCl/dvte/B
         dACE9DAz46lhiOh3K4PgqRYjBoyujnaqj0SJuXq9MCwdaPNnp90m6KVWLbODsv7i4ZYr
         yFwFt6qr3namaz5gqvVnzSO0GsNnRQ0Gft/WEhYzn74CabNzDwt4mRqcA+DpejTUraFe
         5aElp6XMeYVuzhWachsTF+v4P39+XqDFPKsQpnofV9TWkL+dZ9x3Xv15S5VHyWP74hk+
         fUmrxBEg51fkCKz8184kICpKtFLDn908ULKD9tL8rqzKD+xoFKnzUH0iorhDJNfxtpkB
         uPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996098; x=1792600898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIItl0pCQ/aBq2U1h8kgQBz3yZb99mdO46VMaoMNnUw=;
        b=ciAXSqZvJzrIuQADb0q0BS0IM4cMnnxB3zUnot3CkFb+JtfC4HO8ZYPOGa7+TGByp2
         EB9lOuji9wJkFMLwpHhW2APXvQ4/HuUwaiTlRKQFZ87n1pTBcC52maYAvozhD44LvUyQ
         otCTzoCLXcgEf7OYjbxM6Suw+IuNkrn2Li5zVp8LJIDP643q6yb97w9Fuy5HEuEt8u4M
         /r38ZtAl5hDmgZMOImkisOFSrltuDb89PZhtnRSfzg0K0TW2xecmLnnamVz+5pjkXYCC
         /ri58OETMoEz0HRZsPy9Y+ONqvGkFJMNt/fpNV9npfk8bjo0MGvKhim3i5gGlSevvumz
         /LhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxn74ZiP/o2gAI7WSKI4KWKFM2C9NQ/N+kjXHKyKqiJZ/eccunCwdo4w7lQaOnc9Z3ohyBsxNCXbgk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUCutpegGzMm1ROiJd5TbY1wZ1BxQp3GE7O52miuCDb+Q/j7C8
	9/vaTH5Y4s2h7GI3eccE3HeLZgG1i3uId+pQFrYe9W5OTHP5gk5fqoiaQqHRCWxxAb+IrOkgUzT
	IWR0DiUtwJ9WH261fTeUjF4xaOfa/HepS4uT2r1wR
X-Gm-Gg: AYBFou1QAxcs7Hic4MoHRuuvh5aDfGptaEpHWkpGUZZgcETWWZ7uoVv6FyFj8g1kK6O
	4ZkOSKcXh8qWEN+h3qnwgIesyRkx7wAsC+KOtoQdOKL/jFMZwC5HZYxbZ0KUBFNmrR+xct2Sg1p
	3vtJAjVyxyjHMAghs6stwriRGgquSKPBuTjXzUvxJCUDAnk/hZIU1jZ6fOie9Hvq8OTN/dNPYjO
	urXNc2+g0llu01uYWBxvGhsOOlx3eWP+ttyQlEZP2vBhr7uic16KE9lkfOS1LGATodK+JxMe1P9
	9IC8EBk7UE7UcdIRd9XfUfUJuPmcAM99IcYCJtO/d+TOIohHUkEPDajtWmaj4sD71YS7htgdN4L
	TKOfydPCPpA==
X-Received: by 2002:a05:622a:1108:b0:533:9746:9a86 with SMTP id
 d75a77b69052e-5360573c96fmr14813151cf.5.1791996097367; Wed, 14 Oct 2026
 09:41:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <2026101425-why-boring-4f2d@gregkh>
 <202610140932.5F9CFCE5@keescook>
In-Reply-To: <202610140932.5F9CFCE5@keescook>
From: Ian Rogers <irogers@google.com>
Date: Wed, 14 Oct 2026 09:41:25 -0700
X-Gm-Features: AclHuK8_g-YOJgMR77fEpf5RTsveF4u_ERdXz6lvoN6wh_uF7KP8ZsaUSV1ti8A
Message-ID: <CAP-5=fVLWh4uay2HGy6DOpZmtTr5WAd-TehAkN+P-pQgq_BZhg@mail.gmail.com>
Subject: Re: [PATCH 00/11] kobject: Require explicit initialization of struct kobj_type::release
To: Kees Cook <kees@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 9:37=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Oct 14, 2026 at 07:36:41AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Oct 13, 2026 at 03:39:35PM -0700, Ian Rogers wrote:
> > > Clang supports the 'require_explicit_initialization' attribute on str=
uct
> > > fields to enforce that the field is explicitly initialized when an
> > > aggregate object is constructed, emitting -Wuninitialized-explicit-in=
it
> > > (enabled by default) if the field is omitted.
> > >
> > > Following discussion at the Linux Plumbers Conference [1], this serie=
s
> > > introduces __require_explicit_initialization in
> > > include/linux/compiler_attributes.h and applies it to
> > > struct kobj_type::release.
> >
> > Cool, sorry I missed that talk.
>
> Yeah, I'm really liking these compile-time checks. :)
>
> >
> > > As Documentation/core-api/kobject.rst notes:
> > >   "One important point cannot be overstated: every kobject must have =
a
> > >   release() method, and the kobject must persist (in a consistent sta=
te)
> > >   until that method is called. If these constraints are not met, the =
code
> > >   is flawed."
> > >
> > > Annotating struct kobj_type::release caught 30 struct kobj_type
> > > definitions across the tree that omitted .release:
> > > - Patches 2-10 fix 10 struct kobj_type definitions where dynamically
> > >   allocated kobjects, ksets, or enclosing structures were either leak=
ed on
> > >   kobject_put() or freed prematurely before kobject release (risking =
a
> > >   use-after-free when CONFIG_DEBUG_KOBJECT_RELEASE=3Dy).
> > > - Patch 11 annotates struct kobj_type::release with
> > >   __require_explicit_initialization and explicitly sets .release =3D =
NULL
> > >   (with explanatory comments) on the remaining legacy struct kobj_typ=
e
> > >   definitions whose kobjects are static, per-CPU, or embedded in devm=
- or
> > >   parent-managed structures.
> >
> > Sounds great, but let's fix up the users before adding the attribute.
> > Looks like some of these need another version so it might take a bit of
> > time to get them all merged.
>
> I'd really like to have the attribute available, and I've got at least
> one user I can apply today that don't require fix-ups (seq_file), so
> if Miguel is okay with it, I'd like to snag patch 1 and send it with
> my seq_file "first user" for this coming merge window so it's available
> starting with v7.4-rc1, and we don't end up needing to wait 10 weeks for
> other subsystems to be able to use it. And the kobj fixups can continue
> in parallel. Does that sounds okay?

I'm happy with that. I'm working to address/incorporate the other
feedback for a v2 of this series, but I can drop individual patches
that have already been merged. Thanks, everyone, for the positive
reception in getting this landed, I plan to follow up with patch
series for the other uses I found.

Thanks!
Ian

> --
> Kees Cook
