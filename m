Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AEB33BBC0
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 11:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956569; cv=pass; b=WTfJgrqZee3Ri/Uk6GsTKvkd/qd00Hv3foB4DYrNewDrdphED7yIR9x4vDcr8Y/PJEddxyq/e5wfsrnkhP/Y8lO3VacoxIHBXriiAue3elFL62IN+EeqSSxg7YLZlaw2bIpUV5/ijawSLRBzTcIHM1UzjiB1pZWIEFCqmpl605U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956569; c=relaxed/simple;
	bh=rFk7TLciArdXVmOhSyBT7/Ns+M/k6PPCPRzU7n5m4kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PkNkinneHqASk+0zZ+4tFpPh4gHdvbDtC4zbHcyhyPxSua1iScsrK6wtyO6nTiT34gNV6D7h4C0wse8GZg4rRg+WIhj4rSeAzfNChv1if850LkA9AbpSfu/+uwH5EYXAyyBm4p9Zpv3rl7NIYWaWpL7ALVybviClG7XzKRP99iQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2YQ6riMQ; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2YQ6riMQ"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ee243b98caso269171cf.1
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 03:02:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767956566; cv=none;
        d=google.com; s=arc-20240605;
        b=le2NQRGzK0xFUyEpNU5u63hdhgK9vf8iiot+Gg+0iGx3CYa7N70htdFI0djzcPWAGF
         hPhC5C+FLdhb36gDlSxaLalrFeHISrkhmHqL+hoaG40/i1SOw8v/3GxNIrB2hCxKTwa4
         NU0ZM8Op1EU6eL6Ww2R/gm+A9kW2K+ZnFk6N4tA83nwDK+HDoc4cudqPuVblHK1DX9nU
         +vNvMLwGak5qMhRg6srRMVC76+VnKTUZpGqgtWvczwlDiCycM3HTawFNe0Rr9BFcrcQ9
         RC2Ac4adJEqRMRJ6Tpxrd8IwdtkmgasjBa5CaJAZwCwNhMWO+amwfJjYcQt/FULLthrL
         FIxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jzCiSHIGOYpa7t9zzF/wcFfKhZV6nLFk0KAKRqVw7HA=;
        fh=g+2GVoTnPJUsQO4rm57E1hVTbO5R6BNoI/F3VoDE3B0=;
        b=MgV7WPntwQ9V+OQ6OlK+QwJMHsAAG28AtvLpDa1JNZgn39TV6zV7RRASWTwW1HSEsA
         6DMj76kuchgr/sKfCyJm/D/mnMIL8dtwqa5N8+wh2XdumV5O1rfRcwSKVFvgotUkrbBl
         NoVzmmDOjU+aNxz+Z+v61PJ/aQ9Bt+TjfxRDxEtJwUhuJKNziutB3HAq9DwSTAwg9jS3
         5ciNBgSF51zFhanmSH8upyjfVFInblXdelHEqV47rEi+xQDvKekJyHEeV3n/f7hoN3ho
         /f1AeWM/XPS9Fg6abGjdabrihcITc+E5WVpMa4i1qJs/TtRrf23rPgsdrfpMiAKAo8kn
         ZodA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767956566; x=1768561366; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzCiSHIGOYpa7t9zzF/wcFfKhZV6nLFk0KAKRqVw7HA=;
        b=2YQ6riMQwSurlT6Ik8ArklxCNMoArKWel5qSfrfXltMvkcetL3fggwJEGQNCL/+Ror
         LReNi0+gDAvsiKl/GUxoR7GAQwRaabE4t1hn85ABABBWpksL6D+susKDyqsGT7JMIyKI
         nYHPuV+QP6Ya/BvukGs3Z/KGU8hZSkt4EMZXCGQCTLsT39cNLYMjIumn5qaI1zA123MM
         w9L4IEaHFUmQhszGWz1nLRJeUsvryH27zgs0X0PDCWb2nTIGLPTXLchP++fQO7uVzsU8
         SFqEr1IBMkY5V8RQ409eoVBvTsZt0gBYNxcTTZeTg7/H//l3mGxK0m14lqultmjOocun
         W4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956566; x=1768561366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jzCiSHIGOYpa7t9zzF/wcFfKhZV6nLFk0KAKRqVw7HA=;
        b=bOEbbnjLeVaT2MwM5sFSyGwrrhFzl9tIhiUJDXcDApguKRmqpb65QG8cVbuQaPKQb6
         r6BfCJo0jG8OL+LQhHC28ZfyrPXieTf0Mr8i1jnoHleW6WxMb4mpTE1UqV4NWjiuDlA2
         ziViPYikJ+rWgvuVOsXyFIxiLlFCAS7DV6f37GGe16y3VgLGjVpFdWe0lzmD2qiCEklJ
         gM/Llu87oWpmjSEbMYcnzb3rMXnmIrwTUjDeyJZWwMlhTd+2790GsEweBMisGScYvzZu
         VbwddaygNFcKXWf0yZi+Sv9gSXmVXUCkaguJgAkoTF9wklZ1GIOkOi34lS6vpdHsnREa
         VNpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDHpkknBXezI+/E/cvjIDTEjRJEGHXvzD+d4LT5T6pGM/dXlyCxyXqYFni1Bje2TkYRoAyh5eDcvk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+BYpK/DCW1gdczfR9Zy6GgF96eWjpogQUtayEAJlAbbH6OPoy
	7bCo+No9np/SLsIpCya9ySjRro7wgfXgop9eWV7pHI6/ChK8eu3WUBpR7y6ghp0v9TRR/MbQ6b5
	z0z+iPQoHY4WZ9IkPNGKDzrCB2sijRZNc1dAQvHMU
X-Gm-Gg: AY/fxX6OPq6I7zJVWuHYDX1ESoyUA1JgeNtRq38/OnnhHmXbV/Z753md1bRB2k0OJtZ
	trK1fnjYGePa9WAU9KElV6ouXsxTYWzd9Gqm07Gd4lZORdSSLt7hUNhjulRSo0jLKiD54FEMXsB
	0Xk2jaoiSVqKqyEYY0KDy1mGgioXnC9H/sQ8v15Zs0EUAAcZ9ix9e7r2Qx6YNhrJup5iN1P3DkE
	ozcHciK8DZ3P4nO2x0gH5a1niq0Y73GqH/Rx9r1YDzNxDbSwfn3IQ++MiA6No71zYEaglasNKXI
	Wrgp462980yBectFxOmk3e8SIUXBgxxyyl9atsOn
X-Received: by 2002:ac8:5d8d:0:b0:4ed:70d6:6618 with SMTP id
 d75a77b69052e-4ffca3899e0mr9525541cf.10.1767956565345; Fri, 09 Jan 2026
 03:02:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106162200.2223655-1-smostafa@google.com> <20260106162200.2223655-4-smostafa@google.com>
 <aV56BWisUQTMK2Gk@google.com> <aV-PvBqQ0Ktiha8e@google.com>
 <CAFgf54o4Ja7jQwxo6XyW+JaT+aUuj3O2dvLqOTb+YSVCKTdvyQ@mail.gmail.com>
 <d6236413-7385-45c5-94ad-8b0f2007f1ac@linux.intel.com> <aWCviSCK7IBddLTn@google.com>
In-Reply-To: <aWCviSCK7IBddLTn@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Fri, 9 Jan 2026 11:02:33 +0000
X-Gm-Features: AQt7F2oqTpF_L8hxvj3t4iE4ZAXrurkscrS9S6zaVPP7N-l_qQbRFrZajZBoJoU
Message-ID: <CAFgf54quzFPtfXN0Tw5qO2HU0YExN3FBHK3uG2yiLxkNybfHfA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] iommu: debug-pagealloc: Track IOMMU pages
To: Pranjal Shrivastava <praan@google.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, linux-mm@kvack.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, 
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
	xiaqinxin@huawei.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 7:34=E2=80=AFAM Pranjal Shrivastava <praan@google.co=
m> wrote:
>
> On Fri, Jan 09, 2026 at 11:28:32AM +0800, Baolu Lu wrote:
> > On 1/8/26 19:33, Mostafa Saleh wrote:
> > > I have this, it should have the same effect + a WARN, I will include
> > > it in the new version
> > >
> > > diff --git a/drivers/iommu/iommu-debug-pagealloc.c
> > > b/drivers/iommu/iommu-debug-pagealloc.c
> > > index 5353417e64f9..64ec0795fe4c 100644
> > > --- a/drivers/iommu/iommu-debug-pagealloc.c
> > > +++ b/drivers/iommu/iommu-debug-pagealloc.c
> > > @@ -146,16 +146,12 @@ void __iommu_debug_unmap_end(struct iommu_domai=
n *domain,
> > >          if (unmapped =3D=3D size)
> > >                  return;
> > >
> > > -       /*
> > > -        * If unmap failed, re-increment the refcount, but if it unma=
pped
> > > -        * larger size, decrement the extra part.
> > > -        */
> > > +       /* If unmap failed, re-increment the refcount. */
> > >          if (unmapped < size)
> > >                  __iommu_debug_update_iova(domain, iova + unmapped,
> > >                                            size - unmapped, true);
> > >          else
> > > -               __iommu_debug_update_iova(domain, iova + size,
> > > -                                         unmapped - size, false);
> > > +               WARN_ONCE(1, "iommu: unmap larger than requested is
> > > not supported in debug_pagealloc\n");
> > >   }
> > >
> > >   void iommu_debug_init(void)
> >
> > How aobut
> >
> >       if ((unmapped =3D=3D size) || WARN_ON_ONCE(unmapped > size))
> >               return;
> >
> >       /* If unmap failed, re-increment the refcount. */
> >       __iommu_debug_update_iova(domain, iova + unmapped, size - unmappe=
d, true);
> >
> > ?
> >
>
> That's nice, We could also print the message as Mostafa mentioned, like:
>
>         if ((unmapped =3D=3D size) || WARN_ON_ONCE(unmapped > size,
>         "iommu: unmap larger than requested is not supported in
>         debug_pagealloc\n"))
>
> An explicit "This is unsupported" warning makes it clear IMHO.
> If a driver triggers this, at least we know the sanitizer state isn't
> supported.
>

I guess both are fine, the WARN points to the line which should be
simple to deduce the cause anyway.

Thanks,
Mostafa

> Thanks,
> Praan
