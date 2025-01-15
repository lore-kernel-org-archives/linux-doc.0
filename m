Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B6A1D5CC7
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 21:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736977589; cv=none; b=OlGYMhuyOOTmdro3yziFgXYXcj4EncHFrG6wqESjrKdcVZV1W/XVyXWMPHZO5l51oJjexiuxUCw4t1ms5j2Em6ICXEUSspwS2Yu364YSBGXDKCLvgV9b+GZzPo9MsclBORsVNsNvtLx39ra6h3wkZj6BZ4aOrE+pp7qEmMB9Qms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736977589; c=relaxed/simple;
	bh=ktxMmPsXmr5l/KzTZZveh4vVL4sy0NRaQjMB5XfObco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQgYmSePtvhGwk2plxgbVnPwO1cW1drQQUq44gG4Uus239hPkw/+7+3UJYfEUI9BvaKlsaREhcPqu4wCvVu4a1x2Gz7M6wHl35xkQ2cF7guU5W4Af5O9IktofDdfGIkjk8kYRAfn501gQcrQymN9nPQI45PemPl6gLVLI4YhqB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OxjelXQG; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OxjelXQG"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4678c9310afso17091cf.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 13:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736977586; x=1737582386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kG/IausjT1eOPJpJpSmaWqXdjNmS2nF45sOMWzC8YfA=;
        b=OxjelXQGVuxa8V5Ew8Pnsrj6oUTFv8PcwBl8Euzb8VHdsB1BtGhj9eO9AalyxcKYaQ
         G5cLLVmdYlzTuslaBPapkvaoB76butCqWHes3ghMYNypYIEP1QdnlEIh9KoyNImA+XI6
         QSwUoJQyMXBfuNSfpW8U9qtAkOJZbXlNhUqiv0XWnIBj5Mi4i8VwpKi6As4AmmDS9aIC
         K1iYkXVSXSGmkNvmnYR7Hd2RKD0kY8wupxJTXkbnCMOXy9mW3zBC+cqZA+TC5HE4MlNl
         HdH62w973khKy52Hqfty0Nw79rocJkNaEbSxO0g2QLB27Z00OSiJFGrp/6nA7tIQv/Pm
         lhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736977586; x=1737582386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kG/IausjT1eOPJpJpSmaWqXdjNmS2nF45sOMWzC8YfA=;
        b=dsNyDg8ySNsaygnuuUrELse1YkRqTQChizlfK/pnmaIZpisc2iOIrszc0YYdfrwv7f
         /ohn4BeRyS7jxbVcqDc25NaKjWdE9Ne4c88ivMnSlunrI6ZGFaCrxvMj0MS3O0xCOQvw
         Ys2fqbmJ0A0QXS46sauqvd/VsCyIbKSzZxmhdMYX9egqzL12Cjz5DU+IARN53q+r9v8+
         QBzvt+KgMN68LaE6Jyay1Mc6FpIVw/5bEY3WXJhRiF1h/MZBe1L9QJtRaCEcUrznw00X
         1jdoYh6kRir5AUicouaVaPFWDgUzlP+T2W4tLri+AcggxQBjIJTDSLDX0CzDh9977Zll
         cDSw==
X-Forwarded-Encrypted: i=1; AJvYcCW/CLdTF9+sdCHSXkzSrIfx8zwfJcwgS0TIZ/NBlRC7v+Jn/OkDyw5QPwsUGlX1VgH9/YZZkEBSqsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXBUd4wX/C0+4OP6qjpPonKIWXUYzFcSbSRRNyzRFg6Ax3j3K/
	ZyQBYKhH5B9jOVdA3yoIP4NlAqIkTbPw4Tk0HEccQA7RXiGaMe/EkZ9pR9UqrmhI1jVH/kOIvfz
	k7glMO2FByAn4sF4PRY/3EFduntMSnHDnu2QL
X-Gm-Gg: ASbGncuxo3VTJVY/Kxaiu8a2miJtlvbcHPbv2mLU858f9D5i40rYMBbQyigiA3IOSrI
	nXjBQEepyR4Vl2jedVCNUzs4OqFjGfZysq6dfdCrKmVaIRiCRtBQu8wFyIvP0YSrsZUg=
X-Google-Smtp-Source: AGHT+IFE1Zown3D3qGPwAAJZHA33xl0d59VJvU2bb7jFRbeQNvKPpdPNS9ZSkNetglibCOVY9W52Aa5UIbolNqm9vkE=
X-Received: by 2002:a05:622a:178b:b0:46d:f29d:4173 with SMTP id
 d75a77b69052e-46e04186a53mr989191cf.16.1736977585910; Wed, 15 Jan 2025
 13:46:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-17-surenb@google.com>
 <20250115022703.hqbqdqawvqgrfgxb@master> <CAJuCfpGShzXxqH8up75WQhdMzkr+Y6eE-h37nEEwVWHC6AN89w@mail.gmail.com>
 <20250115121729.al7sxmpqutmhaxod@master>
In-Reply-To: <20250115121729.al7sxmpqutmhaxod@master>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 15 Jan 2025 13:46:14 -0800
X-Gm-Features: AbW1kva--QFLsx6XOwxGB9xKaHXReW5_CE0WTclZ5S6s_fvXChfK4C4r2avyMvI
Message-ID: <CAJuCfpEwcT7t1B6O2+hTzQJbN5GJhvnx-dT8rQ5d3AQfxa5TNQ@mail.gmail.com>
Subject: Re: [PATCH v9 16/17] mm: make vma cache SLAB_TYPESAFE_BY_RCU
To: Wei Yang <richard.weiyang@gmail.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 4:17=E2=80=AFAM Wei Yang <richard.weiyang@gmail.com=
> wrote:
>
> On Tue, Jan 14, 2025 at 07:15:05PM -0800, Suren Baghdasaryan wrote:
> >On Tue, Jan 14, 2025 at 6:27=E2=80=AFPM Wei Yang <richard.weiyang@gmail.=
com> wrote:
> >>
> >> On Fri, Jan 10, 2025 at 08:26:03PM -0800, Suren Baghdasaryan wrote:
> >>
> >> >diff --git a/kernel/fork.c b/kernel/fork.c
> >> >index 9d9275783cf8..151b40627c14 100644
> >> >--- a/kernel/fork.c
> >> >+++ b/kernel/fork.c
> >> >@@ -449,6 +449,42 @@ struct vm_area_struct *vm_area_alloc(struct mm_s=
truct *mm)
> >> >       return vma;
> >> > }
> >> >
> >> >+static void vm_area_init_from(const struct vm_area_struct *src,
> >> >+                            struct vm_area_struct *dest)
> >> >+{
> >> >+      dest->vm_mm =3D src->vm_mm;
> >> >+      dest->vm_ops =3D src->vm_ops;
> >> >+      dest->vm_start =3D src->vm_start;
> >> >+      dest->vm_end =3D src->vm_end;
> >> >+      dest->anon_vma =3D src->anon_vma;
> >> >+      dest->vm_pgoff =3D src->vm_pgoff;
> >> >+      dest->vm_file =3D src->vm_file;
> >> >+      dest->vm_private_data =3D src->vm_private_data;
> >> >+      vm_flags_init(dest, src->vm_flags);
> >> >+      memcpy(&dest->vm_page_prot, &src->vm_page_prot,
> >> >+             sizeof(dest->vm_page_prot));
> >> >+      /*
> >> >+       * src->shared.rb may be modified concurrently when called fro=
m
> >> >+       * dup_mmap(), but the clone will reinitialize it.
> >> >+       */
> >> >+      data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->sha=
red)));
> >> >+      memcpy(&dest->vm_userfaultfd_ctx, &src->vm_userfaultfd_ctx,
> >> >+             sizeof(dest->vm_userfaultfd_ctx));
> >> >+#ifdef CONFIG_ANON_VMA_NAME
> >> >+      dest->anon_name =3D src->anon_name;
> >> >+#endif
> >> >+#ifdef CONFIG_SWAP
> >> >+      memcpy(&dest->swap_readahead_info, &src->swap_readahead_info,
> >> >+             sizeof(dest->swap_readahead_info));
> >> >+#endif
> >> >+#ifndef CONFIG_MMU
> >> >+      dest->vm_region =3D src->vm_region;
> >> >+#endif
> >> >+#ifdef CONFIG_NUMA
> >> >+      dest->vm_policy =3D src->vm_policy;
> >> >+#endif
> >> >+}
> >>
> >> Would this be difficult to maintain? We should make sure not miss or o=
verwrite
> >> anything.
> >
> >Yeah, it is less maintainable than a simple memcpy() but I did not
> >find a better alternative. I added a warning above the struct
> >vm_area_struct definition to update this function every time we change
> >that structure. Not sure if there is anything else I can do to help
> >with this.
> >
>
> For !PER_VMA_LOCK, maybe we can use memcpy() as usual.
>
> For PER_VMA_LOCK, I just come up the same idea with you:-)

Missed this comment. Yeah, in one of the previous versions I had
different !PER_VMA_LOCK and PER_VMA_LOCK versions of vma_copy() but
David raised a question whether it is worth having two versions. From
performance POV there is no reason for that and it unnecessarily
complicates the code. So, I dropped that in favor of having one
version.

>
> >>
> >> --
> >> Wei Yang
> >> Help you, Help me
>
> --
> Wei Yang
> Help you, Help me
