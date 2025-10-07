Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030E32E06D2
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 13:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759843025; cv=none; b=JnMrdLAo+/tzw59zj5VNVrAKsVrH839WP8zewvQ7HlUg7kV6HW5OUhK9yBtqpPUOAyOiJ3HqXVsaDpvuXUhmfAJDX91pfMgghhbFb7rqK2lMbAoHh+klh263yJojun1osZcQzCK1e1rGkwsKcncur9gWHJBTlPJpihAt23JuIDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759843025; c=relaxed/simple;
	bh=MFighuuXS4QKwYx1I+/cx6ZSbuJFS6E69cqe5MTzL8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+sZTjacbKVrADAIt4pT1qzFo8HMVkmp1m/Z89bRitIJFQT39NBiWDaXdr/C8Ilfl8epSWO3g5vj4W+C4uZRsVVd+tkUj7qpG6G9kXXD7uyMzqR3ln8zVOo5XuNkS6S/N0LldWLw/vBz2r/oxuMlsOeH1gZr8bqEzo0or2u/9xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=VjCjB/Fp; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="VjCjB/Fp"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4de8bd25183so83848961cf.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 06:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1759843022; x=1760447822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGjQstuXxCbXjkgmEtho3zqtbBjdkL7MGqcvpT6Dbac=;
        b=VjCjB/FpyHbRDXfmNszZ92E5SW0WUp8+bg3G7cxR8sAokXm3pvdeTZQWqnaUKsHoeq
         F5T8yKFocj8vu1kP267vZVRI/Cp41vTk7pakrltfVXOwnlLV+WkUuOxrL5V/SPvgnF8V
         Cl6Cb//m9JrVx9wvBWqvhrzD/KSPAoPy8KTWhNg1RA5KFThVlsApddApjivBcFqMtbtM
         +F0g0i6UvvRgFi1BPb0PrwtEyS3LH4qY6df6BxwIlqcqRt0vhy41khEsITefknvdzNT7
         R8mHV4unuxuKm4xGcXGHjwcPsu88fuULYoS9u/XFGnezpkAb6TinLOrjWl3QiIHVnyb1
         udiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759843022; x=1760447822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGjQstuXxCbXjkgmEtho3zqtbBjdkL7MGqcvpT6Dbac=;
        b=c/yCfPQsoW3AiRvLwj7wVDHrb30RWoHoyYcK361CmrXEZWqlvFg1RVqCc7ykW12ocm
         keah9VaQvNfZGL6fFT42sc0GR5QZoFedJQiC05/m6Kh2F/JEz3Gj4KwpjV+sT6biJKK6
         ehADPO8O8CSUGzKGrAl01fB+bK1HHbBK27BspByS+1avrvhPdrUfq0K4adypqtuFD6j3
         aRXz/RzxlLuZFzxQdr36k2dnacP7VvoJLQCdR3tLpLDDfwFL5WdvrM2t9kA2S9pIWTek
         zMKtj/9H0/zxFmazHUW6QAwY9RX6Q3BKx4Masn5GeJf7NxFq6np5d3JG5Dl/8itc3Aef
         cIOw==
X-Forwarded-Encrypted: i=1; AJvYcCV4fN3WkRhUXBwggLnSwyDIWcFLOQnEYSSxGCZ2gK1F863SKTzJhgO63FUD91/w4LmyJqlQsddemys=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt+VEJ2WPL71V7Pz2lj+xwnpO8moQbeGn7BSDwv5HDQPt3YqVR
	y6t5+wNus0zOAs9o+WbFZMu2LmlAVDDzinCsotMU3HVw8BFFSq2newWF/UaBKQdNdajogPar6yr
	tMAQSEx9iawke81tLLUpujvETHYoyT/ERlYPi5fUmIg==
X-Gm-Gg: ASbGncuy8xhL3gS5zS+TWw1FzlD8f8SqVQ0QQyJd+6mdyI98pQEob2wwhkWjNdQKn2/
	x4X+TD+Wnlt47XHXE8Tsz+sCcSq9Ve1i8kII4cchjWKIWE2iTR0nhs0bFCIRUyP9ScUQGngbbtQ
	Gs5t8kJt8tR8Ho8nqJbanz9ViMx2mRGxZREgE569KKM1X0ha8y3Sa8DXg2q/ebwUov+bes8WEKf
	0Xba5qoqpSdgGrxGoZ6HoD3cEAd
X-Google-Smtp-Source: AGHT+IErTOfhbVekCCdPxxpICEbrbhOaEM1jbyw9u/DzKXn3hm20NW7yY7Ebv6K5iiS95Vkga4m4uus70RCOVSYZKBk=
X-Received: by 2002:a05:622a:5884:b0:4dd:8dcc:17f5 with SMTP id
 d75a77b69052e-4e576a569b0mr225293361cf.28.1759843021454; Tue, 07 Oct 2025
 06:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
 <20250929010321.3462457-4-pasha.tatashin@soleen.com> <mafs0tt0cnevi.fsf@kernel.org>
 <CA+CK2bA2qfLF1Mbyvnat+L9+5KAw6LnhYETXVoYcMGJxwTGahg@mail.gmail.com> <mafs0playoqui.fsf@kernel.org>
In-Reply-To: <mafs0playoqui.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 7 Oct 2025 09:16:24 -0400
X-Gm-Features: AS18NWCRhwYsguwzm1bh0CindcVLAn8z07AreURWfMoXFjhjQmI0qWqW1QxWkf8
Message-ID: <CA+CK2bCFsPZQQQ0JFErnYt=dbzBx=ZJdV+eNXYWyNUE+xk7=yA@mail.gmail.com>
Subject: Re: [PATCH v4 03/30] kho: drop notifiers
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
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, leonro@nvidia.com, 
	witu@nvidia.com, hughd@google.com, skhawaja@google.com, chrisl@kernel.org, 
	steven.sistare@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 8:10=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org>=
 wrote:
>
> On Mon, Oct 06 2025, Pasha Tatashin wrote:
>
> > On Mon, Oct 6, 2025 at 1:01=E2=80=AFPM Pratyush Yadav <pratyush@kernel.=
org> wrote:
> >>
> >> On Mon, Sep 29 2025, Pasha Tatashin wrote:
> >>
> >> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> >> >
> >> > The KHO framework uses a notifier chain as the mechanism for clients=
 to
> >> > participate in the finalization process. While this works for a sing=
le,
> >> > central state machine, it is too restrictive for kernel-internal
> >> > components like pstore/reserve_mem or IMA. These components need a
> >> > simpler, direct way to register their state for preservation (e.g.,
> >> > during their initcall) without being part of a complex,
> >> > shutdown-time notifier sequence. The notifier model forces all
> >> > participants into a single finalization flow and makes direct
> >> > preservation from an arbitrary context difficult.
> >> > This patch refactors the client participation model by removing the
> >> > notifier chain and introducing a direct API for managing FDT subtree=
s.
> >> >
> >> > The core kho_finalize() and kho_abort() state machine remains, but
> >> > clients now register their data with KHO beforehand.
> >> >
> >> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> >> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> >> [...]
> >> > diff --git a/mm/memblock.c b/mm/memblock.c
> >> > index e23e16618e9b..c4b2d4e4c715 100644
> >> > --- a/mm/memblock.c
> >> > +++ b/mm/memblock.c
> >> > @@ -2444,53 +2444,18 @@ int reserve_mem_release_by_name(const char *=
name)
> >> >  #define MEMBLOCK_KHO_FDT "memblock"
> >> >  #define MEMBLOCK_KHO_NODE_COMPATIBLE "memblock-v1"
> >> >  #define RESERVE_MEM_KHO_NODE_COMPATIBLE "reserve-mem-v1"
> >> > -static struct page *kho_fdt;
> >> > -
> >> > -static int reserve_mem_kho_finalize(struct kho_serialization *ser)
> >> > -{
> >> > -     int err =3D 0, i;
> >> > -
> >> > -     for (i =3D 0; i < reserved_mem_count; i++) {
> >> > -             struct reserve_mem_table *map =3D &reserved_mem_table[=
i];
> >> > -             struct page *page =3D phys_to_page(map->start);
> >> > -             unsigned int nr_pages =3D map->size >> PAGE_SHIFT;
> >> > -
> >> > -             err |=3D kho_preserve_pages(page, nr_pages);
> >> > -     }
> >> > -
> >> > -     err |=3D kho_preserve_folio(page_folio(kho_fdt));
> >> > -     err |=3D kho_add_subtree(ser, MEMBLOCK_KHO_FDT, page_to_virt(k=
ho_fdt));
> >> > -
> >> > -     return notifier_from_errno(err);
> >> > -}
> >> > -
> >> > -static int reserve_mem_kho_notifier(struct notifier_block *self,
> >> > -                                 unsigned long cmd, void *v)
> >> > -{
> >> > -     switch (cmd) {
> >> > -     case KEXEC_KHO_FINALIZE:
> >> > -             return reserve_mem_kho_finalize((struct kho_serializat=
ion *)v);
> >> > -     case KEXEC_KHO_ABORT:
> >> > -             return NOTIFY_DONE;
> >> > -     default:
> >> > -             return NOTIFY_BAD;
> >> > -     }
> >> > -}
> >> > -
> >> > -static struct notifier_block reserve_mem_kho_nb =3D {
> >> > -     .notifier_call =3D reserve_mem_kho_notifier,
> >> > -};
> >> >
> >> >  static int __init prepare_kho_fdt(void)
> >> >  {
> >> >       int err =3D 0, i;
> >> > +     struct page *fdt_page;
> >> >       void *fdt;
> >> >
> >> > -     kho_fdt =3D alloc_page(GFP_KERNEL);
> >> > -     if (!kho_fdt)
> >> > +     fdt_page =3D alloc_page(GFP_KERNEL);
> >> > +     if (!fdt_page)
> >> >               return -ENOMEM;
> >> >
> >> > -     fdt =3D page_to_virt(kho_fdt);
> >> > +     fdt =3D page_to_virt(fdt_page);
> >> >
> >> >       err |=3D fdt_create(fdt, PAGE_SIZE);
> >> >       err |=3D fdt_finish_reservemap(fdt);
> >> > @@ -2499,7 +2464,10 @@ static int __init prepare_kho_fdt(void)
> >> >       err |=3D fdt_property_string(fdt, "compatible", MEMBLOCK_KHO_N=
ODE_COMPATIBLE);
> >> >       for (i =3D 0; i < reserved_mem_count; i++) {
> >> >               struct reserve_mem_table *map =3D &reserved_mem_table[=
i];
> >> > +             struct page *page =3D phys_to_page(map->start);
> >> > +             unsigned int nr_pages =3D map->size >> PAGE_SHIFT;
> >> >
> >> > +             err |=3D kho_preserve_pages(page, nr_pages);
> >> >               err |=3D fdt_begin_node(fdt, map->name);
> >> >               err |=3D fdt_property_string(fdt, "compatible", RESERV=
E_MEM_KHO_NODE_COMPATIBLE);
> >> >               err |=3D fdt_property(fdt, "start", &map->start, sizeo=
f(map->start));
> >> > @@ -2507,13 +2475,14 @@ static int __init prepare_kho_fdt(void)
> >> >               err |=3D fdt_end_node(fdt);
> >> >       }
> >> >       err |=3D fdt_end_node(fdt);
> >> > -
> >> >       err |=3D fdt_finish(fdt);
> >> >
> >> > +     err |=3D kho_preserve_folio(page_folio(fdt_page));
> >> > +     err |=3D kho_add_subtree(MEMBLOCK_KHO_FDT, fdt);
> >> > +
> >> >       if (err) {
> >> >               pr_err("failed to prepare memblock FDT for KHO: %d\n",=
 err);
> >> > -             put_page(kho_fdt);
> >> > -             kho_fdt =3D NULL;
> >> > +             put_page(fdt_page);
> >>
> >> This adds subtree to KHO even if the FDT might be invalid. And then
> >> leaves a dangling reference in KHO to the FDT in case of an error. I
> >> think you should either do this check after
> >> kho_preserve_folio(page_folio(fdt_page)) and do a clean error check fo=
r
> >> kho_add_subtree(), or call kho_remove_subtree() in the error block.
> >
> > I agree, I do not like these err |=3D stuff, we should be checking
> > errors cleanly, and do proper clean-ups.
>
> Yeah, this is mainly a byproduct of using FDTs. Getting and setting
> simple properties also needs error checking and that can get tedious
> real quick. Which is why this pattern has shown up I suppose.

Exactly. This is also why it's important to replace FDT with something
more sensible for general-purpose live update purposes.

By the way, I forgot to address this comment in the v5 of the KHO
series I sent out yesterday. Could you please take another look? If
everything else is good, I will refresh that series so we can ask
Andrew to take in the KHO patches. That would simplify the LUO series.

Pasha

>
> >
> >> I prefer the former since if kho_add_subtree() is the one that fails,
> >> there is little sense in removing a subtree that was never added.
> >>
> >> >       }
> >> >
> >> >       return err;
> >> > @@ -2529,13 +2498,6 @@ static int __init reserve_mem_init(void)
> >> >       err =3D prepare_kho_fdt();
> >> >       if (err)
> >> >               return err;
> >> > -
> >> > -     err =3D register_kho_notifier(&reserve_mem_kho_nb);
> >> > -     if (err) {
> >> > -             put_page(kho_fdt);
> >> > -             kho_fdt =3D NULL;
> >> > -     }
> >> > -
> >> >       return err;
> >> >  }
> >> >  late_initcall(reserve_mem_init);
> >>
> >> --
> >> Regards,
> >> Pratyush Yadav
>
> --
> Regards,
> Pratyush Yadav
