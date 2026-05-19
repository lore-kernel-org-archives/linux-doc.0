Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BA74657EE
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 09:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183806; cv=pass; b=BgEWoqFdY/4bza35YQlr+ZPRCHQVkbQWhI1YL3hTJxI8Zpoeh+GPXOtcPfe5cQBkkpSQvtE2cvOYgoF52WSqtmx9TT6ELtf5F4y/3tqCY2HRGbSWJy313sbQl2jaS2+2Z3nOETzEs17desjlESZVSLFdwcV9quAvqQ0I6EYq6nQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183806; c=relaxed/simple;
	bh=vupX0NJyQoj+YpsPS+mWEYXWTs2EEV9LxivCpOIjPNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hcTlWp6VK05UoVagW2BFxiJfjAFlV0uuj5TYadZ27Q0NLye9IQ11iuBUxT5rx8LtzvLu5DCx+BxdOo0zbKTQVGxp3bDBr3WCV9Kie3usHRO8FihI6MorHHb/0ezbWI72C8Y5p1JIA1pUsgnrIHSsidnvtL6kFXfKzzjw79hzqgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iZhG2y9+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KPqn1IrL; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iZhG2y9+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KPqn1IrL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779183804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5x571feKyCrxAyf039bp6xhn3Td73dplWB4PHAo5Mng=;
	b=iZhG2y9+wu8b/e0I5IpLu5SNWT76zLpYYY0bS5jKkcVsIlRC2nO1sXNYh/XS6S8C+CkXoq
	2QOGbXrvxdSfK/z7u+pRm6RTRJgIC/gDXjhX86r7cu4RDFxBClvaMyAxPR/FrTqCzdD6GL
	Q/0j5h4HrgPC4ypOEfI/OFA8OYIPKqs=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-KuePJ0dvMoeBHqekKxlWJw-1; Tue, 19 May 2026 05:43:20 -0400
X-MC-Unique: KuePJ0dvMoeBHqekKxlWJw-1
X-Mimecast-MFC-AGG-ID: KuePJ0dvMoeBHqekKxlWJw_1779183799
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-65d8659ae23so9369279d50.1
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 02:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779183799; cv=none;
        d=google.com; s=arc-20240605;
        b=KcuXs9xZyPpB9fCANfBVAhWpjL8RB3oeRRznF42Lhe5Xyx8vuzLYrWSwokAQ9Ta1Mt
         Ci+syFtlly8w3zQ5dq97zlOhi4dWxup0+Eq2dNj1+/7m7HEd4EnkH1AX7r5NvTRViwES
         wP8B0gc39bdevZALNkOaiPpmvtALmS5JI//LsNsp5gho/UjkKZxrxkweQb8YOIoHR6Ci
         c1N4uV7x2SfmxnFaZOZrlKPRbDXXOCC1Wd3FaX7Pd7eOWS0BPuw5jGw8eOdAQqsm+eTl
         m3IPxJNULOUVAmqYRx7EWRweSgYScAuO3B8SKK69+Dk6rQnjajybCi3M4ixFEDSwPpLE
         a8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5x571feKyCrxAyf039bp6xhn3Td73dplWB4PHAo5Mng=;
        fh=PEH6YmkVx+/hp99S8mEkJf2Nr4Q4ki8RAoJ48ydik/g=;
        b=SeFYAKfXShGk8HV15GP4thDF3XQgItUh5niEWdLxe/WYYWS3b/GnL5gBESXLg2za2P
         ctW72JiaVeI/aJqHgLwfnzP8ruA6MzKCW5akm/SUU7ATU8QprZSnVorxLSA6Jugi38DN
         1gwV9jAN7T4BApe2UvYl7oFDxa/BUMLF/pYkLnJKMsAezpGJcgzz8lyuz4S7D++n4gv8
         JfnBJbLQNsGMFWnLhO+BDTGiMYPoVb5P/1Cl+tHOz0fQw3Dirizp+38H9HsYZoPGPavK
         tyKpJXLcdF4ubDSiOQP18Pc98MlAviuoemzzMO79F/pv9tdno8FQDPF1gNIDIwE7q4S0
         D8tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779183799; x=1779788599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5x571feKyCrxAyf039bp6xhn3Td73dplWB4PHAo5Mng=;
        b=KPqn1IrLOVpiT+kXRx1cIJ/wy0pmC8vIciCxnXaSVniK793kZf9uSDYqJSuTyq4+Vo
         OCOcJDVLp9dLU1aOfW91FAWCNMT4qHX+zhTVBluntj/iGMA7ZVyt9Z5fi7Lew+tUu7ku
         9j6ITpTCdxLhUI99sWiydZmA0jsbdc6nZcTgUez2egzACU3Ib79/E7ng+XiuDOQ+Fe/W
         TopIi2ZMUKYOzpb6fJELqgfefKHR38gF6UMySaCkix6C9FWBChjVsNwmkS6osJsq+HoC
         XIrxaQ4ELApiNy7TGCCBCrh51OJengTn6qb+ftJxbLkB0t8K3VNXyeY1TGxwkf0Z/eYF
         II2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779183799; x=1779788599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5x571feKyCrxAyf039bp6xhn3Td73dplWB4PHAo5Mng=;
        b=nYeCsOSTzruF6Ha9fSivEhzLSYPrr/6S47O1JhVIqG2UA0ncQoK+NL/kCA7CdE7bek
         OPJ9NIX2ixy8yEYoO0RxuM4/Ic8vzpm53Czr4LwQSuKReJzhYIWY++24rQFOkLctbhpD
         o6roQDX/RD/BSyLlP3b2buqO7tKxa+VUxLab5CX3rk2kfSN1bgvRtT1rG0+A/e878AVD
         bvStGeEg6EzoQaUdBTAnS1/HkX1ECr1+PaqMC4QaNkzOT/Fp2ZJICwJdUDhPFk1SkVxN
         a7djz0mGx/0asw7MJMM+eh0KnTBqnMWstKiy8sLTclO5LLgJJ04wacYivSnN/6y4tDMh
         9+7A==
X-Forwarded-Encrypted: i=1; AFNElJ9nEcTxQP70PZ9uPFMZSSgah74IVSvwz8ilxIUQApmNTaVTN2d6zI2DyJ/15Gx6aiHR7Fi8IYc0jT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0cRKo56HLMZnY6pVQYYpVKYVPxBOUy/QvQaz0bUN9ub31k4Rl
	xZm6dNuYq8rje56H4zCTIk8YD5sacOxsOjXD7vsEswK+JD+0oclD+OP2ZW56wOhI08BGSeEBCBO
	2NmKbErz2kw6TXLi83wWZO5s+jFdNR5mGnH0xCJammb6Ww9ZFLgTvVMW0HCvQ9rtwRIKFZFNb/B
	eKh/ur+M/yVS8MGQBrlmeW6LUA3qZJTaPAxlUW
X-Gm-Gg: Acq92OGK1H0CJ1fAGNbheOFJ4jbSFn1dkWGX+IVFdy19rLe5nhaFZCmz4bZMc5YBcj2
	VG/NZUvBBC2UdbiOTGWgJ1D5zD8OzOS/HRBlQH9AV0cpPoOg7sbBITCzK53gPiWPzFCZAA2OYIZ
	eX55MZHU3EdGnpfGVw2GU+d5cOVgoeweyHI2iLWVt2G2V4RCuO6ybcN1j+Mo4jLAGJGjIdx4JB2
	GX1WQ==
X-Received: by 2002:a05:690c:6e81:b0:7bd:a63d:fe69 with SMTP id 00721157ae682-7c7e6586abemr212584647b3.9.1779183799585;
        Tue, 19 May 2026 02:43:19 -0700 (PDT)
X-Received: by 2002:a05:690c:6e81:b0:7bd:a63d:fe69 with SMTP id
 00721157ae682-7c7e6586abemr212584217b3.9.1779183799106; Tue, 19 May 2026
 02:43:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com>
 <CAGsJ_4xfznffbjOaNKwnN6oZk_H6pqOzYqd1zx4Q9XrocdzV8A@mail.gmail.com>
 <CADSE00LjJcL8P5M-UPEpzZijU70uEmUirnin29N8YR5W5D-oFg@mail.gmail.com> <CAGsJ_4xwJ7SAhKPJyRtMTw6psTO7H1EcFFpDw0po1W8PX4FE8g@mail.gmail.com>
In-Reply-To: <CAGsJ_4xwJ7SAhKPJyRtMTw6psTO7H1EcFFpDw0po1W8PX4FE8g@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 19 May 2026 11:43:06 +0200
X-Gm-Features: AVHnY4K6WRueJTIRx5g-aAlFuFoKaIp0iRf0U18smAauuYj52IGoBPbNpAKamXc
Message-ID: <CADSE00L00D7yi_DevNsZ8_=VXBVD2eO5FbcM+sv1ZdwgjaiRmg@mail.gmail.com>
Subject: Re: [PATCH RFC 2/5] dma-heap: charge dma-buf memory via explicit memcg
To: Barry Song <baohua@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian Brauner <brauner@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, mripard@kernel.org, 
	echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 12:43=E2=80=AFAM Barry Song <baohua@kernel.org> wro=
te:
>
> On Mon, May 18, 2026 at 8:16=E2=80=AFPM Albert Esteve <aesteve@redhat.com=
> wrote:
> >
> > On Sat, May 16, 2026 at 9:37=E2=80=AFAM Barry Song <baohua@kernel.org> =
wrote:
> > >
> > > On Tue, May 12, 2026 at 5:18=E2=80=AFPM Albert Esteve <aesteve@redhat=
.com> wrote:
> > > >
> > > > On embedded platforms a central process often allocates dma-buf
> > > > memory on behalf of client applications. Without a way to
> > > > attribute the charge to the requesting client's cgroup, the
> > > > cost lands on the allocator, making per-cgroup memory limits
> > > > ineffective for the actual consumers.
> > > >
> > > > Add charge_pid_fd to struct dma_heap_allocation_data. When set to
> > > > a valid pidfd, DMA_HEAP_IOCTL_ALLOC resolves the target task's
> > > > memcg and charges the buffer there via mem_cgroup_charge_dmabuf()
> > > > inside dma_heap_buffer_alloc(). Without charge_pid_fd, and with
> > > > the mem_accounting module parameter enabled, the buffer is charged
> > > > to the allocator's own cgroup.
> > > >
> > > > Additionally, commit 3c227be90659 ("dma-buf: system_heap: account f=
or
> > > > system heap allocation in memcg") adds __GFP_ACCOUNT to system-heap
> > > > page allocations. Keeping __GFP_ACCOUNT would charge the same pages
> > > > twice (once to kmem, once to MEMCG_DMABUF), thus remove it and rout=
e
> > > > all accounting through a single MEMCG_DMABUF path.
> > > >
> > > [...]
> > >
> > > > -               if (mem_accounting)
> > > > -                       flags |=3D __GFP_ACCOUNT;
> > >
> > > Hi Albert,
> > >
> > > would it be better to move this and its description to patch 1? It
> > > looks like patch 1 already introduces the double accounting changes,
> > > and patch 2 is mainly just supporting remote charging.
> >
> > Hi Barry,
> >
> > Thanks for looking into this series! Yes, in my head I was trying to
> > keep patch 1, which was taken from a previous, different series, and
> > then diverge from it starting with patch 2. This would clarify the
> > difference between the two. But I can see it just added some confusion
> > (for example, patch 1 charges on dma_buf_export() and then it is moved
> > to dma_heap_buffer_alloc() in patch 2). I will reorganize it better
> > for the next version, including your suggestion.
>
> Yep, I understand the situation now. I also understand
> that you were referring to T.J.'s patch, which caused
> some back-and-forth confusion for readers when reading
> patches 1 and 2.
>
> >
> > >
> > > Also, mem_accounting is only used by system_heap.c; has this patchset
> > > also eliminated its need?
> >
> > No, mem_accounting is still handled in this patch for the general case
> > where no `charge_pid_fd` is used. See dma_heap_buffer_alloc() code:
> >
> > +       if (memcg)
> > +               css_get(&memcg->css);
> > +       else if (mem_accounting)
> > +               memcg =3D get_mem_cgroup_from_mm(current->mm);
>
> I see. What feels a bit odd to me is that mem_accounting
> could either be dropped (with unconditional charging), or
> it should cover both remote and local charge cases.

Good point. If I understand correctly, looking at patch [1] that
introduced the flag, the shared buffer caveats mentioned there are not
yet covered by this approach, so the flag should stay. I will make it
consistent and cover both remote and local charge cases.

[1] https://lore.kernel.org/all/20260116-dmabuf-heap-system-memcg-v3-1-ecc6=
b62cc446@redhat.com/

>
> I don=E2=80=99t have a strong opinion here=E2=80=94it just feels a bit
> strange, since its description is quite generic for memcg:
>
> "Enable cgroup-based memory accounting for dma-buf heap
> allocations (default=3Dfalse)."
>
> Best Regards
> Barry
>

