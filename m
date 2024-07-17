Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AFDED8
	for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 18:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721239548; cv=none; b=URjHMpDZvWAX148E/WQU/9ZYRkDavrE7L+jbSl3IHyr4hLktamwzrsQ8ZLGKNiJK2TLUrMe/eqt6HSHUE9sRyVjXVGWSrYg4OF+OEqGwMlyBPqAWMlmPAQybSo199RDThkw6q76C/veZ5QMTMOXMiYqbqYC8c1jXVpuh1vybSRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721239548; c=relaxed/simple;
	bh=EcbaqaLncNt5/+ldvNun3H3cqM4FhEED9qsUEKX0xf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXm2IXxj+wsL+5o8v5Ur6FQ/opKSctx8Be0jSnl9rhqu4XSJ8YfkUA1RymHuW3yOO+oYGoUwglSe7k9u0LRh3PpdTQDUFna3IGTvfWIXEJYeu0+b1frV5Gng4GjoM2yOAAf154MMJqNWQipyM3dg1+wpFWd2PUtgzZcy6skiFvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AluEkjKR; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AluEkjKR"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eecd2c6432so846151fa.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 11:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721239545; x=1721844345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcbaqaLncNt5/+ldvNun3H3cqM4FhEED9qsUEKX0xf8=;
        b=AluEkjKRyBp9OBpRnAu7adluTpuIbylOMPvcHsJALuXuJou0MfT3Dls7+xg1yTJIrZ
         +j4suVjjMdNeLFIFNbFCDNz4Yt337buSfpbA3a4alLFZXEqKsV/CIl/0B7RcuWv6qdg6
         76K9Z93c76YoX318syjkwcgrwg3bICRtk7Lw2gtkakbdwEax0eD/GHxiWWI4PJ+arquH
         nvAl2qYhSAC+WvFwUcmMKJpupna/GLIuufIdrBTP3aTND8XWd6cl+Gbc1Ign0zbwXdtq
         9apdkQ7/ZMi5TN+DL5hhU+V2am2B9GqL/K1eDl3IlXH7Vmq+lWalc0u1jk+H9HbG5BCi
         PC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721239545; x=1721844345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcbaqaLncNt5/+ldvNun3H3cqM4FhEED9qsUEKX0xf8=;
        b=pHWgvgMVXiq5siPQcDxkove79eegZfBcyagJRylZOcm58tpH2fBcLBnChmRUoHqlJj
         eqMaekY6/k+vO825HpwG8iCXU4Rtn2Ms73pXUyiMYGHJImVq8ALheDczMVr8qzE3tkmT
         zjK3mQGVNOZfmGELcnvwG8liuvKH191469KxKEGbudynAo7VB5lC7JpkihurHl1ahrDG
         2F53A8622Se+voFR713ce7SszMGPUTp3NXMeHbaa4I+cIrIUCpM3uZc1+qWsX7fObXQD
         i+reLXanfoG5h/kB2Jf/x0LbJhYWpG/PIHlAWGCxdq2vhtOHHuIVYr9tR2XPDhGDPBIl
         d1oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIPkSfy9HWE8b1XdG3Qu7jebSZ846Dq/g6fTaIyR0Rfors8dbcGMbK5OwD8X2Su5BGtOBK7u4lO2H9inALlFsaO0hbAzBDtCfa
X-Gm-Message-State: AOJu0Yy3b0xu+cAYkSZi3bMEu04FJ4UpIq70VpyzaoBGZYXfBZW37AEb
	dDoI8lo1TqswZRwYpUxFYcvEuk9Dy7jJxJdj6YeNyNZk9td8gyfGB3UEM1XF41aEMAcbV3ulea3
	JhunIM1lBNN+WU9RSFFG5d/vOo5Bto1yL5v+L
X-Google-Smtp-Source: AGHT+IHmEPpkW9BMRf7R+mnkbP964r6rm53YMQ2kLWJrWHw4ELd3YcPcVXt2ZFtW89ezovDBD1g4Tm5CJK5P3Fnz80o=
X-Received: by 2002:a2e:9a87:0:b0:2ee:8566:32cb with SMTP id
 38308e7fff4ca-2ef05c73758mr1514341fa.16.1721239544904; Wed, 17 Jul 2024
 11:05:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240706022523.1104080-1-flintglass@gmail.com>
 <CAKEwX=NL1gOe9k5+JB8Q-UAoZ4ie8SBGg7XTjaqM7j4-hiHv=A@mail.gmail.com>
 <CAPpoddefXD1RAjyW2+X_ankGYNpQgY0Y0+xd1yOFgCc_egaX8A@mail.gmail.com>
 <CAJD7tkYnBw-QiGXTb4BPScuS1VePBkuRx1qG8p92zN9TeD+gKg@mail.gmail.com> <CAKEwX=OPDkwnSno-8r9AsOpmzkZ90SzeX02xz0eDTqbL2_QL2g@mail.gmail.com>
In-Reply-To: <CAKEwX=OPDkwnSno-8r9AsOpmzkZ90SzeX02xz0eDTqbL2_QL2g@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 17 Jul 2024 11:05:06 -0700
Message-ID: <CAJD7tkapE+qSmjFXnLBNamMvn3Lxbx=yvDF3gXW_qba45WU1tA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] mm: zswap: global shrinker fix and proactive shrink
To: Nhat Pham <nphamcs@gmail.com>
Cc: Takero Funaki <flintglass@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 10:49=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Tue, Jul 16, 2024 at 7:53=E2=80=AFPM Yosry Ahmed <yosryahmed@google.co=
m> wrote:
> >
> > [..]
> > >
> > > > My concern is that we are knowingly (and perhaps unnecessarily)
> > > > creating an LRU inversion here - preferring swapping out the reject=
ed
> > > > pages over the colder pages in the zswap pool. Shouldn't it be the
> > > > other way around? For instance, can we spiral into the following
> > > > scenario:
> > > >
> > > > 1. zswap pool becomes full.
> > > > 2. Memory is still tight, so anonymous memory will be reclaimed. zs=
wap
> > > > keeps rejecting incoming pages, and putting a hold on the global
> > > > shrinker.
> > > > 3. The pages that are swapped out are warmer than the ones stored i=
n
> > > > the zswap pool, so they will be more likely to be swapped in (which=
,
> > > > IIUC, will also further delay the global shrinker).
> > > >
> > > > and the cycle keeps going on and on?
> > >
> > > I agree this does not follow LRU, but I think the LRU priority
> > > inversion is unavoidable once the pool limit is hit.
> > > The accept_thr_percent should be lowered to reduce the probability of
> > > LRU inversion if it matters. (it is why I implemented proactive
> > > shrinker.)
> >
> > Why?
> >
> > Let's take a step back. You are suggesting that we throttle zswap
> > writeback to allow reclaim to swapout warmer pages to swap device. As
> > Nhat said, we are proliferating LRU inversion instead of fixing it.
> >
> > I think I had a similar discussion with Johannes about this before,
> > and we discussed that if zswap becomes full, we should instead
> > throttle reclaim and allow zswap writeback to proceed (i.e. the
> > opposite of what this series is doing). This would be similar to how
> > we throttle reclaim today to wait for dirty pages to be written back.
> >
>
> I completely agree with this analysis and proposal - it's somewhat
> similar to what I have in mind, but more fleshed out :)
>
> > This should reduce/fix the LRU inversion instead of proliferating it,
> > and it should reduce the total amout of IO as colder pages should go
> > to disk while warmer pages go to zswap. I am wondering if we can reuse
> > the reclaim_throttle() mechanism here.
> >
> > One concern I have is that we will also throttle file pages if we use
> > reclaim_throttle(), since I don't see per-type throttling there. This
> > could be fine, since we similarly throttle zswap reclaim if there are
> > too many dirty file pages. I am not super familiar with reclaim
> > throttling, so maybe I missed something obvious or there is a better
> > way, but I believe that from a high level this should be the right way
> > to go.
>
> I don't think we have any infrastructure for anon-only throttling in
> vmscan logic, but it sounds trivial to implement if necessary :)
>
> >
> > I actually think if we do this properly, and throttle reclaim when
> > zswap becomes full, we may be able to drop the acceptance hysteresis
> > and rely on the throttling mechanism to make sure we stop reclaim
> > until we free up enough space in zswap to avoid consistently hitting
> > the limit, but this could be a future extension.
>
> Agree - this hysteresis heuristics needs to die.
>
> IMHO, I think we should still have the proactive global shrinking
> action that Takero is proposing in patch 3. The throttling is nice,
> but it'd be even nicer if we can get ahead of that :)

I have always thought that the shrinker should play this role in one
way or another. Instead of an arbitrary watermark and asynchronous
work, it incrementally pushes the zswap LRU toward disk as reclaim
activity increases.

Is the point behind proactive shrinking is to reduce the latency in
the reclaim path?
