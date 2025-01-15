Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E4C22F170
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 05:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736920078; cv=none; b=qafIMpsfmOb6E5vAGFRo4UEOQ3bi/7hmFqfJf7cNSRc+icYxytRu2IKgL9wusHWqULF75MhihrUnl6TtF0nEZvQkmqcaBUjcsNuTpGb+MQ5+HJEPb1PO5degHP2e+P0ymFzyrTq3u6Y6Lbs1Zz2QzfaL6wVbA41m9oRN2DB5oFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736920078; c=relaxed/simple;
	bh=bbJihKCYsJClh5qUu7NqmAZc+B8/UbDJ/MC621d2ik4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pkLDO22EaMOZqfc+qtM0Ed+iIZW9XceRv9ubzssh9qbLfzoqYOyPz/aZrart8YnEZuwHY439oCZwH51zI03b8zDhru2SXwqNZz8K6Cxf7XTpDzvwM49Z3bEnJ0vRWo7/aJuFGq+gUbQPBYDcV2NJR43ZaEghXXjtjRgzLChu5kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r2KIbM2t; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r2KIbM2t"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-467abce2ef9so437551cf.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 21:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736920075; x=1737524875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyRkMBpf+VF5ZY0a7Jrk/iHgROVxv7m48lIz/DnP7Tg=;
        b=r2KIbM2tLfu/Lo50ocsg7ZiI33DjCeoUgZonIkCcBLqH+Y700ZV8OfOQGyiVgFpuMo
         w9JYLfJQbOdSIVz+Mlc8FO5YYAzFiIBLwf5SfpSKQv615tZE9CknZAMqqEznwet18qgM
         K4uPXqe2aSsPizGOVmmSzQIgdDmXWIk56Xh8lsP+DQKI9nRfjo21xxBwt7wjFaztiTys
         9ML9Maxrr+TKhIT7iwx/G0dQQHgCdpxyiuZqKvZ9RblpSnyR9L6Subf7QBepNym+heit
         Quwm6hQwpoH8CjmmrV1mggnc78wQmwpa/Xxcm2EngQiyqUjwDdQD6Q/3TbM6Iu0m15UP
         AJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736920075; x=1737524875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YyRkMBpf+VF5ZY0a7Jrk/iHgROVxv7m48lIz/DnP7Tg=;
        b=VRXgOGpJ03GC6QXQXik3SmIsCwGsRKfUuWX29RGvH5ZQIl6ZE5fWoJWtlu8WUrTFnA
         1stIVP8HbvYjOCFm65l3PI3G14mXZluVb6FJW/vlTjf31ugkUhZakIt2Gsm+TVN5Ww2W
         w5m48WaEZusD9cAYhBPqNTDuCdKzjay2DKCz8ymIZgab2IzKPNUCSn5N17DguyP0F21M
         gv967CFwYPwLaeIvqSL35TW40MqdjDhKyokSG02XbN1vgozH3jxSv3J5v/p6NVUpbXI/
         gtsHUSgZ3MlgkvWYJbBPhflKepQkfNeX3LGh9zeOvYSwL+yjxo42Xi7s5HBgW23IPS29
         hTxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBbenKqwnyhxOBtP7fi/m8nD4NHt3fZZRSljya49sQqF2L/4/5lmDVqVAOEYQ+1Th4BbQ4NcDzmPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YziEdes87i4tq367bOWfdVEWly0hqS0Re2/w0Vr8hbsmNkk5SZ8
	HWXo4H5f6qmf4Xt8A9A4CVygyvuGdc27IA9BiDfvrtzmxH/0k/0sKZ4IhAQKB9uNc+XJ8paVoGz
	6uiu2mb5NYxxhouw5hdcwKvEKTMYa67XiVXFk
X-Gm-Gg: ASbGncspAcni45363G5ZMglTkDNYipEQw/CEiVCLmpsuCdtUAoImFA6NMcHuNrlu5zr
	G5QpIMLqdoK0LW0VRnbKMwLXMg8wQmjQAEUsdmg==
X-Google-Smtp-Source: AGHT+IH39rxE+HIg7iWunfoObbWmhsvFlQQ6YVPiaVsk2qkNC5oGIOBJilRSOezyMfEkWhk0j/jQGPY1tEZ8Iyd1GDI=
X-Received: by 2002:a05:622a:352:b0:46d:d8be:d2bb with SMTP id
 d75a77b69052e-46df6fca5cbmr1347211cf.11.1736920075216; Tue, 14 Jan 2025
 21:47:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-17-surenb@google.com>
 <20250115022703.hqbqdqawvqgrfgxb@master> <CAJuCfpGShzXxqH8up75WQhdMzkr+Y6eE-h37nEEwVWHC6AN89w@mail.gmail.com>
 <CAGudoHH9-h68S-YV4TObYMRDFe99xAO7Nu3tXF8h_Kds2-MWCw@mail.gmail.com>
In-Reply-To: <CAGudoHH9-h68S-YV4TObYMRDFe99xAO7Nu3tXF8h_Kds2-MWCw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 14 Jan 2025 21:47:44 -0800
X-Gm-Features: AbW1kvbRyuqEWAoHEEaclzqjL7Eez2dSEUM866eoGNf_R_aXbtwxNqbHW3B1z30
Message-ID: <CAJuCfpEDfjyfPjck_3VO5vV4RX0K1UYvHe_R8pSv+6iXN=3wsg@mail.gmail.com>
Subject: Re: [PATCH v9 16/17] mm: make vma cache SLAB_TYPESAFE_BY_RCU
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org, 
	peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 8:00=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> w=
rote:
>
> On Wed, Jan 15, 2025 at 4:15=E2=80=AFAM Suren Baghdasaryan <surenb@google=
.com> wrote:
> >
> > On Tue, Jan 14, 2025 at 6:27=E2=80=AFPM Wei Yang <richard.weiyang@gmail=
.com> wrote:
> > >
> > > On Fri, Jan 10, 2025 at 08:26:03PM -0800, Suren Baghdasaryan wrote:
> > >
> > > >diff --git a/kernel/fork.c b/kernel/fork.c
> > > >index 9d9275783cf8..151b40627c14 100644
> > > >--- a/kernel/fork.c
> > > >+++ b/kernel/fork.c
> > > >@@ -449,6 +449,42 @@ struct vm_area_struct *vm_area_alloc(struct mm_=
struct *mm)
> > > >       return vma;
> > > > }
> > > >
> > > >+static void vm_area_init_from(const struct vm_area_struct *src,
> > > >+                            struct vm_area_struct *dest)
> > > >+{
> [snip]
> > > Would this be difficult to maintain? We should make sure not miss or =
overwrite
> > > anything.
> >
> > Yeah, it is less maintainable than a simple memcpy() but I did not
> > find a better alternative. I added a warning above the struct
> > vm_area_struct definition to update this function every time we change
> > that structure. Not sure if there is anything else I can do to help
> > with this.
> >
>
> Bare minimum this could have a BUILD_BUG_ON in below the func for the
> known-covered size. But it would have to be conditional on arch and
> some macros, somewhat nasty.
>
> KASAN or KMSAN (I don't remember which) can be used to find missing
> copies. To that end the target struct could be marked as fully
> uninitialized before copy and have a full read performed from it
> afterwards -- guaranteed to trip over any field which any field not
> explicitly covered (including padding though). I don't know what magic
> macros can be used to do in Linux, I am saying the support to get this
> result is there. I understand most people don't use this, but this
> still should be enough to trip over buggy patches in -next.

If my previous suggestion does not fly I'll start digging into KASAN
to see how we can use it. Thanks for the tip.

>
> Finally, the struct could have macros delimiting copy/non-copy
> sections (with macros expanding to field names), for illustrative
> purposes:
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 332cee285662..25063a3970c8 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -677,6 +677,7 @@ struct vma_numab_state {
>   * getting a stable reference.
>   */
>  struct vm_area_struct {
> +#define vma_start_copy0 vm_rcu
>         /* The first cache line has the info for VMA tree walking. */
>
>         union {
> @@ -731,6 +732,7 @@ struct vm_area_struct {
>         /* Unstable RCU readers are allowed to read this. */
>         struct vma_lock *vm_lock;
>  #endif
> +#define vma_end_copy1 vm_lock
>
>         /*
>          * For areas with an address space and backing store,
>
> then you would do everything with a series of calls

I'm not sure... My proposed approach with offsetof() I think is a bit
cleaner than adding macros to denote copy sections. WDYT?

>
> however, the __randomize_layout annotation whacks that idea (maybe it
> can be retired?)
>
> --
> Mateusz Guzik <mjguzik gmail.com>
