Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519A228982A
	for <linux-doc@vger.kernel.org>; Fri,  6 Jun 2025 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227011; cv=none; b=dEUPgqvRH0Wk26QlkAFEUSMc71e8WxTzVcRiBf3yRcjA0E67RWLpEAgcysCV/boBN2p5qxqn3etTYlNEOmdfohWjEAPSoAuXphESsi6E7J6ZLVNsWZKJNBNhnQttxVbeNdwmeqBy3Tt9XohAIKHH3uamxojZbOT49/beNDRhnqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227011; c=relaxed/simple;
	bh=g0LVpQxipeOCOXuAtAJhs14mbqA3NiYPX4nhcwbpzZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjzNVhRlH19ukdUqSz7xI9mec3uOesRtxqN2m1T1Mg1qeFRFRyO2lH+LH+WDHwJ3Yr4mjvUO/7S3QUnsqNLBLVeXppP/zTwye/5IsXZnu9E+WUHJDDo3TZfbPnLuAyPPpbSs59YWGHkwVt6fJ8PdD7Q2PWLWG1g8sqEqoopJBLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=oQfDrnf1; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="oQfDrnf1"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a589b7dd5fso37719981cf.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Jun 2025 09:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749227008; x=1749831808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFpeqJEhDacu967h49T3bcYqqSd1cDscEpckxmXpo1A=;
        b=oQfDrnf1GHhy/Yfm+t50dRTNVkCkE+yZVcatrecWiCe8q37aUIjfNYV5GXxTN06KyJ
         5/9ldkHF70sTN7w5sklsNmXQRJBn4VKA9j3pfxpOUVprJUCIqKbgILwlndgGEZ2SsMyg
         K8B3oZflr0jCgfSEFukr31lOT4lRSUmpSRU8WWWYUfrUOTJo4oaUs1k5PBTRInGGzY7g
         TbeyEDHASgFdyVeo0wLEzDa2V/3Objfqgb+re2QSod7CHS1Z8+QVx6mok/q7JffePFlh
         nMK5kKCzQEkL3Lqm98b+/yKgwnz+18Bz8RUXH/dZ07CRKEX1eiTeLI8FTOlcqpBr8yTz
         JtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749227008; x=1749831808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFpeqJEhDacu967h49T3bcYqqSd1cDscEpckxmXpo1A=;
        b=pWGdP3pIi+TK65dtW0FRgkAmf6BR+pmv0g3QrKJpgvNjWJy9KqPvROO7sMQgkC7K10
         zQRcegFTeJl4ko9CXoOkrzUvxdliMNHSoAugSAno/RG5pJ0tPyaToq48cV5jA6o4UoBX
         p2NrFYyymU+9tWP/eklthhUFMGX5r46FjFqtRqI70nteoDi3o6TGI2FLLyeeUoFA/g3I
         lWd9CAA/ZR/HkVG1ZcTNT7vL6Yb6/x6l/5ObqqpdVqT5+g0os1FtMqfeS7MgMgEry+XZ
         hFL+O3JiHDZ8mI6HJq/OnT1lMwFWZoEflb3ZAT8ZyWDd600w2IAFyfQwl42j64dvbwpR
         1WvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE5cjS6ZJeuSI75j98jgy9QbRWOem/HS0rZ8GG4YjsDvXigl5mUys44PMHUrUs2NLW2SxuZw5i7WQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF52AIDPsWKuVkBElLxEPVTleCAfZx8jJuONLqLIGwG2UhgCR/
	7r/f4Amj6/7Z8ldjzM2HMKZH3PNNHjtJDKohD9X4chpGipiNlfszlrWffJAzpsyboSxqhVgVLwm
	q4E+WZRmF0DY9Xy/dJJxoYkqys6lHWxoISObSwiS8qg==
X-Gm-Gg: ASbGncvJXN1LCZhyWupZdSwxtuiOeITWgVX5xpGgSHbwsJ86L0oekLFVRcUPQbqv0M6
	RTJNdrl3bBOhIYZONauWq2NSWBk+0kM8XM95JrFdxFn9lwu61G6VHR0ys3LL4Nop/j0pxID7OAr
	39AuZeTxFYoYNaN/96ElPregMQgRv96y2KjgR3dqci
X-Google-Smtp-Source: AGHT+IGPsHSaGwXVvY8YZpTqOE2qMLkHKMqQkhbImGTUUVVWXZpV4mBeVtnt3fOpZqXUHctLEMLr/kgfyV+cty9EU04=
X-Received: by 2002:a05:622a:a044:b0:4a2:719b:1231 with SMTP id
 d75a77b69052e-4a5b9d96135mr48575531cf.35.1749227008164; Fri, 06 Jun 2025
 09:23:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-4-pasha.tatashin@soleen.com> <mafs05xhbv9fd.fsf@kernel.org>
In-Reply-To: <mafs05xhbv9fd.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 6 Jun 2025 12:22:51 -0400
X-Gm-Features: AX0GCFutlDyG92JoXPnUdMDlv9OT8nRqcidR71SxEcHa0BYzPpqGY1tjEjK24Po
Message-ID: <CA+CK2bAZY7L20CwkHMKwThYj9nK8S4jHm-NXx-EhXpXntnv6Jw@mail.gmail.com>
Subject: Re: [RFC v2 03/16] kho: add kho_unpreserve_folio/phys
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	rppt@kernel.org, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 11:00=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Thu, May 15 2025, Pasha Tatashin wrote:
>
> > From: Changyuan Lyu <changyuanl@google.com>
> >
> > Allow users of KHO to cancel the previous preservation by adding the
> > necessary interfaces to unpreserve folio.
> >
> > Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> > Co-developed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  include/linux/kexec_handover.h | 12 +++++
> >  kernel/kexec_handover.c        | 84 ++++++++++++++++++++++++++++------
> >  2 files changed, 83 insertions(+), 13 deletions(-)
> >
> [...]
> > diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
> > index 8ff561e36a87..eb305e7e6129 100644
> > --- a/kernel/kexec_handover.c
> > +++ b/kernel/kexec_handover.c
> > @@ -101,26 +101,33 @@ static void *xa_load_or_alloc(struct xarray *xa, =
unsigned long index, size_t sz)
> >       return elm;
> >  }
> >
> > -static void __kho_unpreserve(struct kho_mem_track *track, unsigned lon=
g pfn,
> > -                          unsigned long end_pfn)
> > +static void __kho_unpreserve_order(struct kho_mem_track *track, unsign=
ed long pfn,
> > +                                unsigned int order)
> >  {
> >       struct kho_mem_phys_bits *bits;
> >       struct kho_mem_phys *physxa;
> > +     const unsigned long pfn_high =3D pfn >> order;
> >
> > -     while (pfn < end_pfn) {
> > -             const unsigned int order =3D
> > -                     min(count_trailing_zeros(pfn), ilog2(end_pfn - pf=
n));
> > -             const unsigned long pfn_high =3D pfn >> order;
> > +     physxa =3D xa_load(&track->orders, order);
> > +     if (!physxa)
> > +             return;
> >
> > -             physxa =3D xa_load(&track->orders, order);
> > -             if (!physxa)
> > -                     continue;
> > +     bits =3D xa_load(&physxa->phys_bits, pfn_high / PRESERVE_BITS);
> > +     if (!bits)
> > +             return;
> >
> > -             bits =3D xa_load(&physxa->phys_bits, pfn_high / PRESERVE_=
BITS);
> > -             if (!bits)
> > -                     continue;
> > +     clear_bit(pfn_high % PRESERVE_BITS, bits->preserve);
> > +}
> >
> > -             clear_bit(pfn_high % PRESERVE_BITS, bits->preserve);
> > +static void __kho_unpreserve(struct kho_mem_track *track, unsigned lon=
g pfn,
> > +                          unsigned long end_pfn)
> > +{
> > +     unsigned int order;
> > +
> > +     while (pfn < end_pfn) {
> > +             order =3D min(count_trailing_zeros(pfn), ilog2(end_pfn - =
pfn));
>
> This is fragile. If the preserve call spans say 4 PFNs, then it gets
> preserved as a order 2 allocation, but if the PFNs are unpreserved
> one-by-one, __kho_unpreserve_order() will unpreserve from the order 0
> xarray, which will end up doing nothing, leaking those pages.
>
> It should either look through all orders to find the PFN, or at least
> have a requirement in the API that the same phys and size combination as
> the preserve call must be given to unpreserve.

Thank you Pratyush, this is an excellent point. I will add to the
comments of these functions, that it is a requirement to unpreserve
exactly the memory that was preserved, and subsections are not
allowed. I do not think this is needed, but in the future, if a use
case arises, we can relax this requirement.

Pasha
