Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A19A1FF1C7
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 22:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787957546; cv=pass; b=rPRFsHzjIbgYyoCIUxFG6GyN4x57o4cBIjqCam5AyBpWqY0d2ddUO7QoiYswx5km0rZzCbrd+f6NETq8uVh1afOlI00iiqAMNLuXmcaLt6EsNLs46zQhhrhibuCnsq/nGw6v0FOVVoU3HpDno7JJOKyD7Kgn89eE6lbM/XGCzgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787957546; c=relaxed/simple;
	bh=WrsvomBoIOTykSZbu/ot0FOcIRpwAK7V3umLl1yq6rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEGLvxKSitdw/xnMS/zacnd4m4HY7SJ6hj8iKtQF+FWk9QyQ8M7zQjgbEKQEL61341k8FnuevwOtEQE4xb91WZGT9j82HdWi5KTrJ5TW8q7UFf/1jXiI2QxGVb+avst+5x+U6YDeitYuhD7OvjP/+qSwsuxI7K9oT5Znn5CTbbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dXknUyG9; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dXknUyG9"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-52fac937235so44751cf.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 15:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787957544; cv=none;
        d=google.com; s=arc-20260327;
        b=IK7u8h6UhdliH1Knac8NkCsC1MSovYNpvQr/3SeqaXHk04pCCmCmZTPVxm0+o/4YGX
         zz9qh5nbXQh8CwQ878QD6mBLQ1ijnB8Iwwdt3fMk/DHqgnlyVFQ+a0OTboYQL7zyxvpv
         I9MG7dWdCtSuI3oVXAErVng5yVMsoLa3HlqSWByBTy8ksB7a7G8YC9Ue/M17A/NBg2P/
         WEcM+cyJMg7yvdKjLx7NUiUIY8frofIHNHeQJ5Xhnkbms0pB+MGO8iNc2GjYmklf+GmX
         1kUdTsyFwO0J1pNjnC8fVGLk0ErjtiJf7lY73YF0O7JWfPydB8yQYUAmV1ehmQzSmwOA
         HOUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Awwf+UFW2ONQrXT/1UuPyCRQCWHRON77Fg6o5pZxO10=;
        fh=Ys2iMKoJlu6MkCaFYZ1hdDr/D/1OrlE/Cpd9L/E3Z1s=;
        b=ge6CU+BGYRqIpnmvFNuPvmVRDxKPoSJas0M9IiK2UVBv6xeknAh05NxSqbCN+KwWpK
         MUxuv4sIZVUPxpPPwePtY7kUH1hrrJxWrUMqVsbROmEh7UX8dLyNRoit/wUuYleQA155
         CDvVhzM0RdlQteI+AWGwI1rN0cpOvMNtVGUlxFCJ0eteMEjAjrPL0hHrZDTyrL5U9AfL
         x/pP/ibpQG+CeYSM/fZXlUf6zvrYba/nZbAR5zr2Cl2QbjtfFeVYNiU2Nwb0YiatIChj
         3ZB873/UUQh3w7xTbhF3eDfXl1OBwGAMwRCCD7RgvIRT0nF9UHa6Jg9LFdsmg/FDEPD5
         iqJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787957544; x=1788562344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Awwf+UFW2ONQrXT/1UuPyCRQCWHRON77Fg6o5pZxO10=;
        b=dXknUyG91mtcfBGaWwFNQ5riozqqkSfZCg6+5WAdFl1bWRmMCszAN9PzJVDYz0326D
         dOrC0TKZQ/8C6nLA1pAMY7U6FWhP1WSa6ipJP1MaTtd2crYDLY+GoHUezzRMGyHaloZa
         5GHvkk5q1pGD7rysF78hRGA08fM7KfExoKVOjhIfqpVnEqzWGQ58iaA7GNYOwwK6CtHN
         CWwlYoY+QAn2NSOpLZba2Y3Y/zgV6EeGe32cyYzvYWcbeE8dYHQVzj5e1DNsz7lRhvG6
         F+rLm+EaCohm30vRM9+Q1g43hfVKdZ3kXOOr+j6PQ+VuLAzEX1gDYDZJz6b4sUVIVucb
         VPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787957544; x=1788562344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Awwf+UFW2ONQrXT/1UuPyCRQCWHRON77Fg6o5pZxO10=;
        b=lrHGgtnt/kZh1AKkbV7qUk3H8IguVYSWQF8eO2kt5gMucDdYvj6EpmMw0yS8AgH91q
         wnMakF/c9wQ8A/PX4rmCmCtpc1/70u6Flz0Ngs3zkWMl5TgDDqvUHpHA+bf76aZ/BZLQ
         uKNZ6ZOEroFPhqZX9QVKsI+39xbHe3Cfkq3ofoFKUuCnJ/9GdgfACD3H3RGCEhI1HbOW
         RmcY3TDjizPBsTzev2kCtLn2jEB1K1Iu0U2zyRa1bawQrfKUmbie9f/Gn91bEAjXgRGQ
         sw6RopiOGyCyy8rQzh3/uxZdXpIhYibwGs//1NHm1YFavXl+6TrxyJpWzkMGab48XJg8
         Pxzw==
X-Forwarded-Encrypted: i=1; AHgh+RoZS8be3GeIETEfq5eyBOnAOdZqj2SVV030H7uwfAJcchpnxgJxu3G14r8JWx/okkioHn6jM5oSMgw=@vger.kernel.org
X-Gm-Message-State: AFuF++lUyPiYzSr7wnCwefGWdTdToYtxIVbNWjrzeGHTbE+Ef3YIGwTU
	iG47OG9xzhVUxYvOJ7zhkLOAIsnGArjugcsSQKOdnt70k+ohQvLaKKGnPbCfzvtsBDN0NzDH4fo
	6RryB7ubSsAMYbM39aQIgthY9uFTYOz9TVYlU+XNx
X-Gm-Gg: AR+sD10FJ7+SIGsMs1YGUSfBf9A0wbnefKiU5I0NyPdXW9CYHt/0Vq6fi6GH0rQYZT7
	ssK76QARDXUgI7vgb/55fCvmTNtqPGW1+1PC80mPS8L93Ua6YnKh+ZYyA9hIcui3Xvy+62s+gtL
	PxkkP2uzhyIq8F5w1bS6uOYDkHS6MST6BVajRaNBErzNAcv8B3Kz9mZNER/p2+lPz/b9SOzoue3
	zw0RzTH/JgeSgax5A3dm8stzqxSZ9YNR3mIxGVNKkWenrN31LDG4qpXCVLuIQqnoZTSSenV+KaA
	Pnj5syH0emJ+CRbnQ2cuCeMrlA3T1PUUsXgd249Ht2YE/dmz+NqdByZPQJ5RB+13PcNS06VYF8v
	Ftm5Si+kx4w==
X-Received: by 2002:ac8:6109:0:b0:52f:9ed4:8d74 with SMTP id
 d75a77b69052e-52ff710cdc4mr4682421cf.14.1787957543079; Fri, 28 Aug 2026
 15:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com>
 <20260806020850.1221381-8-rick.p.edgecombe@intel.com> <CAGtprH8XJ+SbxQLTowch3DR6N1NSMUKyVnGf0hv5N+iKWT3q7A@mail.gmail.com>
 <74bc9f2695959f335f2f502ded1ae7c944fae13a.camel@intel.com>
In-Reply-To: <74bc9f2695959f335f2f502ded1ae7c944fae13a.camel@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 15:52:12 -0700
X-Gm-Features: AcwNN1XH7bepxRkIbUoAM3EdldcwR19TvPyf1EHxlXjEwu1TNfCd8rn9aVcKinM
Message-ID: <CAGtprH-WL9MioyJUwJf7XK8O+UM6d1hUwWMtPj0AWC4FdBxScg@mail.gmail.com>
Subject: Re: [PATCH v9 07/11] x86/tdx: Add APIs to support Dynamic PAMT ops
 from KVM's fault path
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Huang, Kai" <kai.huang@intel.com>, 
	"Hansen, Dave" <dave.hansen@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>, 
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>, "Wu, Binbin" <binbin.wu@intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"hongyu.ning@linux.intel.com" <hongyu.ning@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "Mehta, Sohil" <sohil.mehta@intel.com>, 
	"Gao, Chao" <chao.gao@intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 3:40=E2=80=AFPM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Fri, 2026-08-28 at 15:18 -0700, Vishal Annapurve wrote:
> > > +
> > > +static int alloc_pamt_array(struct page **pamt_pages, struct tdx_pam=
t_cache
> > > *cache)
> > >   {
> > >          int i, j;
> > >
> > >          for (i =3D 0; i < TDX_DPAMT_ENTRY_PAGE_CNT; i++) {
> > > -               pamt_pages[i] =3D alloc_page(GFP_KERNEL_ACCOUNT);
> > > +               pamt_pages[i] =3D alloc_dpamt_page(cache);
> > >                  if (!pamt_pages[i])
> > >                          goto err;
> > >          }
> >
> > If the alloc_dpamt_page() was able to allocate a single page (not
> > two), should the partial allocation in the "err" handling return the
> > allocated page back to the cache?
>
> I think no? In the case of the cache not having sufficient pages, it is a=
 bug.
> And if things go wrong, I don't see a risk of big security issue. So opti=
mizing
> for more efficiently handling bug doesn't seem worth it.

Sounds good.

There is another allocation in tdx_pamt_get() that consumes the pages
from the dpamt page cache but returns memory back to the buddy
allocator. I think it's not particularly harmful, as the default
top-up should cover the maximum spt's in the fault path. But do you
have any additional thoughts on that?

>
> >
> > We observed similar failures internally with a slightly customized
> > setup which had retries for pamt cache allocations in the fault path
> > due to SEMCALL failures with older TDX module functionality.
>
> The best course of action is of course to fix the TDX module bug. I assum=
e this
> already happened. This is the default upstream approach for that kind of =
thing
> across both subsystems. But it sounds like this case is even more special=
,
> because handling the specific bug would involve other code that is missin=
g.
>
> That said, this code can definitely grow in the future if we seem some us=
er
> value for something. But can we please just call this basic version good =
enough,
> and build on it later?

Sounds reasonable.
