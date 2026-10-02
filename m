Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8B9352C28
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 11:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790941128; cv=none; b=scfhzM3hI/sZ1jvl2xRnj+275A7e6/cx5+8CdcfYBFGnTmbaGMuCGzOayKodaezu8BFtDFT6Ok/vnnuZK4My1rM/Zx1HviWu67Q5Bb8f5RzDuJR37+Wo4R8hoZAMAIWHWNOYNaCpcYVzqFgQfk+HQ/VfUTye8tbWYvHAT9vEcgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790941128; c=relaxed/simple;
	bh=f9oplO5WC58bhFJzOVFaqIm9gWgGw58xMvElkvBM7LE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1rF5277xONxxKoFDTOwoMI3+rqbym6SwkAm3JlrbTJI6cmHiHVX3UNrzsW0seoVPM8A4oUM9Ooom5NYfSvi1ZM7aXzCTUjeKAa/3YBf4O5iBSjMMFONk9H4X6lCvA9rP1lvYhyhdvzOEhOwCwjZ+MhES55QQkWCKkAEwEqxSro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f38.google.com with SMTP id 71dfb90a1353d-5da475a08ceso301514e0c.2
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 04:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790941126; x=1791545926;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=20l5MGKYIkk3dxTQvp40s490//vZekkNtR3rks2T+EI=;
        b=K9QUzM5c3kkRdXfkQPCAnuYkXC9DAAhsVXCQA+cDuBfVEGX6NSpzPnl9Tp2Lj3NAXN
         9x13GhTV6fkP05n51H4dyw0pvbD60RwgvZIoZBdEph1dTz6CIALvNUfVWFasEo81P8Ul
         1XcPuvYSSWYXbnBQLfPX3XJPj3SDGWyYS8+xCGTf0PZSODa8V1Upq9K5B/21ksucm6AV
         vXJu3uS7m0k8KEUYoZJU3UT+DX4Zj93dcIQL+RNV8bVNgY8kOk2K+YGsReKlKkX39eaQ
         2uEnZkjGXdPEFkxtrzpHsy9me8G1fjb6rLtafk+Q/wN7Di6EW+VYqxNg5YarnUS14JhR
         O/AQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/mn8czNnvasPtA9eCTCUbwSw9xWpOOb3RtAiDVoloAAdiZdwvdNDVrQvb0htNy3zPbyUoup3hHFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFvgK+QnPy9bFTfhJuXGnpNge5sVBe84rrM+KyljvUTg+qn53/
	dhB66a0yD9LMwfwgGEuQE1NbyDYvwv7kDvP7K4TrqcFDe4U7opqqjUo+ycyO5YsT
X-Gm-Gg: AYBFou07xFDAQgiLz41OWZm0FbbA6q/dg42hKJQ0ZBMNgCe1t52t2WlkIk87Pet3HOH
	/ttcuHzZUKmtrIMJXu8MDunkSHA8QtHqXB/5f/nxEAFbkdcjCScOrsmaR2bsIoQDQQdr+QGTt1d
	mP9ZV7On/IrC4RYYIvHh3YVYPrl4cXMgBWvMQJuuCAQz26b2sXd+wSR1q69FjRHK04lYvrr/n1L
	wEh+m2fVUcwC4eRbmqotmD/JuNjXhmYwEcnktqYLYm+Frwzl6eupffZfju+1TyzrnMkO2wXiBG/
	JYbBAq+qnbdwHDmTJPyul3MVUP80Cu63Am9XS0+lWiV2Xd+64uIRkCdCRedTuy4AHeNf/c4u+rq
	voFhgjFNtcZkMqg/isEyT/OX5WqyXt25CzlGeMDsARVM0PV2VBhlrMCtAA9NeRMJp0wPKuKTn0G
	yxv+QiIJ50i3kgSJ7blWYmD2OtV76fvuZ2pCRjx3mjGhgurAe9bF5kjXBTOC0wKToDq0qzBG8nl
	pKww+MroAAHCLW6VSI8A0xbUrxOfRe+v57e
X-Received: by 2002:a05:6122:3d04:b0:5d3:e71a:7341 with SMTP id 71dfb90a1353d-5dab1c40e6amr633641e0c.17.1790941126153;
        Fri, 02 Oct 2026 04:38:46 -0700 (PDT)
Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com. [74.125.227.38])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da61f8fe4bsm3144326e0c.8.2026.10.02.04.38.44
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 04:38:44 -0700 (PDT)
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7c05849c263so503002137.3
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 04:38:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzjC/TzYU1IwKA5svRQBKDWAqwQbSUYLOR4UY94qAYukgp8n8G3Y4NK7yKdrjSE7wUH9Cqv7vtPD9o=@vger.kernel.org
X-Received: by 2002:a05:6102:14aa:b0:7bd:b263:14c8 with SMTP id
 ada2fe7eead31-7c0f60ae056mr564893137.30.1790941124266; Fri, 02 Oct 2026
 04:38:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929235711.2287931-1-thehajime@gmail.com> <20260929235711.2287931-2-thehajime@gmail.com>
 <bda5eeaa-7868-4d4a-9026-9e99347afd7c@kernel.org> <ar4br2vW7yZGd3gt@gremlin>
 <94759bed23f00d2044005e36be6f72f297e092f0.camel@sipsolutions.net>
 <m2se2o3jyc.wl-thehajime@gmail.com> <a65f4431-d225-4535-b921-00319ceeb2a2@kernel.org>
 <ar9ldn036SgT-bq1@gremlin>
In-Reply-To: <ar9ldn036SgT-bq1@gremlin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Oct 2026 13:38:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKcUxHZKhTEF1gwWrU1o8O6jt6N3r90V5hynrLFdwY0A@mail.gmail.com>
X-Gm-Features: AclHuK8oY5W9edeNeZu9OdjhmLKHIkhJXkjnhYM2yOIrkiFEQlBpS9n1EzHgsaE
Message-ID: <CAMuHMdUKcUxHZKhTEF1gwWrU1o8O6jt6N3r90V5hynrLFdwY0A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] selftests: run tests on nommu architecture
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Hajime Tazaki <thehajime@gmail.com>, johannes@sipsolutions.net, 
	linux-mm@kvack.org, liam@infradead.org, rbm@suse.com, 
	akpm@linux-foundation.org, luto@amacapital.net, brendan.jackman@linux.dev, 
	liuhangbin@gmail.com, corbet@lwn.net, kees@kernel.org, broonie@kernel.org, 
	mhocko@suse.com, rppt@kernel.org, shuah@kernel.org, surenb@google.com, 
	vbabka@kernel.org, wad@chromium.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org, 
	daniel@thingy.jp
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Fri, 2 Oct 2026 at 10:10, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> On Fri, Oct 02, 2026 at 08:08:44AM +0200, David Hildenbrand (Arm) wrote:
> > On 10/2/26 04:38, Hajime Tazaki wrote:
> > > On Thu, 01 Oct 2026 19:01:45 +0900,
> > > Johannes Berg wrote:
> > >>>
> > >>> I thought maybe uname could help but our LLM overlords tell me no.
> > >>
> > >> Hajime originally wanted uname to indicate it, but that caused
> > >> regressions elsewhere, so we dropped that commit. I guess we could put
> > >> _something_ back?
> > >
> > > systemd uses uname information and our (old) patch changing the format
> > > triggered the regression.  thus, we dropped it.
> > >
> > >>> It pointed at something though.
> > >>>
> > >>> In fs/proc/meminfo.c:
> > >>>
> > >>> #ifndef CONFIG_MMU
> > >>>   show_val_kb(m, "MmapCopy:       ",
> > >>>               (unsigned long)atomic_long_read(&mmap_pages_allocated));
> > >>> #endif
> > >>>
> > >>> So MmapCopy in /proc/meminfo tells us definitively, weirdly enough.
> > >>
> > >> Hyrum's law and all that, but I guess it's not highly likely to (want
> > >> to) change :)
> > >
> > > a runtime detection is nice.
> > >
> > > scanning /proc/meminfo might be useful. although it requires to mount
> > > procfs (we can actually skip procfs mount as it is optional) so, this
> > > is not 100% portable.
> > >
> > > checking ENOSYS like syscall(SYS_mprotect) might be useful but I
> > > wasn't sure if this is always the case of NOMMU or not.
> > >
> >
> > I assume there are plenty of other mechanisms. Like testing if fork isn't allowed.
>
> Yup that's an obvious candidate!
>
> You actually need to check for both -EINVAL and -ENOSYS since, of course, we are
> inconsistent with this.
>
> Some nommu arches specify __ARCH_WANT_SYS_FORK unconditionally for both
> mmu/nommu variants meaning you get -EINVAL in that case:
>
> https://elixir.bootlin.com/linux/v7.2.8/source/kernel/fork.c#L2830
>
> Otherwise you get -ENOSYS because it's not defined.
>
> But fork() -> -EINVAL or -ENOSYS = nommu, then just have the child quit and
> etc. should do it.

fork() is not strictly an MMU-feature (you can implement fork on nommu
if all memory accesses are done relative to a base address register),
while I think mprotect() is an MMU-feature. Unless it can also be used
to change the protection using the one or two BARs most MCU haves?
Anything else that is a real MMU-feature? Non-identity mmap()?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
