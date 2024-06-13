Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E415E093
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 02:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718247499; cv=none; b=TePSMXIqKP0DQuHdMbGqcuTLN3cNBafWrTCZM/Pu2Ie+3rcX6GM9d+cXKSi+/Tfqb5kJepLoprbKbsDkmV/xY7ztKQC2LnQFqQEVlJaQUiP9GQl1Y8ceNBJnrM7cli5TJc6yIWZ1jjyuhf0bCxrqvbn2MZhkZuSMlflCbym1z1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718247499; c=relaxed/simple;
	bh=cudCwVPFY8gj3Xql79RT0/yQoQxsiwHECqig9oVJ5Ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yek2JZ6d+vGHpaIESll47pHb9HtCMuP+nj4DyuVkpG4dv1nS2XufBKicM3O0eeenQDQEyjugxBmnrVm8T9sfmXk3/eiO1/0oldOx9+rxdAMPKi4x9zOC0zuSo2pO6fOE90xDRWgD2WkIMAdNqC2XlQFGtQnrsf2M4N2FTt3ikuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l6fMNDli; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l6fMNDli"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6f09eaf420so53678266b.3
        for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 19:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718247496; x=1718852296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYlALMaSt5bKOLPpkzaQGZT0pfqD9pv8OI0qHYxUheA=;
        b=l6fMNDliM0xtpewAV1oA3nGowb9jWtg018U2Sgsq5VA8Gt3qu4efvmFiUcT2PBBapM
         Tq8xS0T3BkgiPPCc+adYOvQ+H+/+cqvqkJlTzyPgT6r7cdd2cbf/Orboq921QiOio6HQ
         kYMTpBjS1V7Z60/07G7b3YHus6lp1J7qyslVQiI9vqqjlALnKG/eSitVJnztZ5xbkOuf
         nCemvfWonqDse0N9G+yCe/Sxmu+6cYW6P0bLxv43jp5w18hjsHqxNoWCtPvwlonSRsAi
         pUTnqK3gF18n1+ukT9P+8LEgNQk1shZkfZZAXU1jdrIUA7WT/82pE4QIL3xizO4J1MOF
         9+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247496; x=1718852296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYlALMaSt5bKOLPpkzaQGZT0pfqD9pv8OI0qHYxUheA=;
        b=KlJjgV8u/HNSy5Bv+CQtZ+fPDshyubjpT3F1NktZKjEJlqLFfb+PbAHUM9C/PQpIaB
         gmW3eEkf53FJr/icAcG3jc/xXS6/PKgwCauSuRPzrFI2lx4J+lDnBRYPTf4rs5Yu1Z7f
         3PmiObnmqOqPgDft/Y5vxet5JluLyAFkE2RcXvxCX+qZPVL5exAmVoHBJCvzux0tnm5Z
         Qj1HMxJYunTvQYQQh+V8vx2g4EJ4FMrfhLdR/AG83yyn5Nv8d/KSvHjwPNhbcrxBQKJ5
         GhsfeUHurGpwDG3B9ifRN5z7LtvszXNbPKN8s2/euyQxjHnyTYh+WXzM9sXSFqUYMG/R
         cekg==
X-Forwarded-Encrypted: i=1; AJvYcCWuQ0nOpj91NLh7WMfRftET05vhl/pLdjKQio47umWDlLvoY3KUpXDxKfqriMvhfxvcrjIQg9+NYHcKeTxxuLxAMhBQ7TFfpcSS
X-Gm-Message-State: AOJu0Yw2CEul9piSqWQ8aIh3cVql5Z8JAjdBats6ScvUBeVjMgHDXSid
	noeb3jYJy08+YSJFJltez+0Pt4a1VSBYYBKI3toL+UBH2sIdcFOaALXisLisrwCGjbju+wqNQxQ
	GBeprrefmQYBQuXos3jz9wsD9mf+Dfi6vMqQm
X-Google-Smtp-Source: AGHT+IF9CciRYK/S+Ij1+KuSCnynD6lav8vXAPrkXMbU5iqPDXNWqrABMnPq8TuNELzKnGWLPQ19ZjeHQ37ywUEgQSE=
X-Received: by 2002:a17:906:c149:b0:a6f:4d38:f40c with SMTP id
 a640c23a62f3a-a6f4d391d2amr193732366b.62.1718247495476; Wed, 12 Jun 2024
 19:58:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240608155316.451600-1-flintglass@gmail.com> <20240608155316.451600-2-flintglass@gmail.com>
 <CAKEwX=P1Ojb71AEJ2gzQTrfWidFPcJZmoNxEwji7TceBN-szCg@mail.gmail.com>
 <CAPpoddeigM44jhTA8Ua=+J4MC1MikouBZVoPrCW2LZF+9r5YeA@mail.gmail.com>
 <CAJD7tkYp3GbuXV9G5bAZ1DetMmepV5ynciA+ukae7CKuxpXDJQ@mail.gmail.com>
 <CAPpoddfj1EdfXfTUT8bLaNxat0hYiE4X9=qG38gPgRgmmVOjcw@mail.gmail.com>
 <CAJD7tkZTSGz1bpo-pMNP_=11O-7RrhubWonqhUJwrt+TB=Ougg@mail.gmail.com> <CAPpoddcp9rVvg77WapsuiMdMzFrV0UioJ+VbQuJbKNY7-=nvVw@mail.gmail.com>
In-Reply-To: <CAPpoddcp9rVvg77WapsuiMdMzFrV0UioJ+VbQuJbKNY7-=nvVw@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 12 Jun 2024 19:57:37 -0700
Message-ID: <CAJD7tkY0=0yKSmEz=E5dL7GLRsO8r6ESWyzF+HdgK0wnMpzLKg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] mm: zswap: fix global shrinker memcg iteration
To: Takero Funaki <flintglass@gmail.com>
Cc: Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 7:36=E2=80=AFPM Takero Funaki <flintglass@gmail.com=
> wrote:
>
> 2024=E5=B9=B46=E6=9C=8813=E6=97=A5(=E6=9C=A8) 11:18 Yosry Ahmed <yosryahm=
ed@google.com>:
>
> > > The corrected version of the cleaner should be:
> > > ```c
> > > void zswap_memcg_offline_cleanup(struct mem_cgroup *memcg)
> > > {
> > >         /* lock out zswap shrinker walking memcg tree */
> > >         spin_lock(&zswap_shrink_lock);
> > >         if (zswap_next_shrink =3D=3D memcg) {
> > >                 do {
> > >                         zswap_next_shrink =3D mem_cgroup_iter(NULL,
> > >                                         zswap_next_shrink, NULL);
> > >                         spin_unlock(&zswap_shrink_lock);
> > >                         spin_lock(&zswap_shrink_lock);
> > >                         if (!zswap_next_shrink)
> > >                                 break;
> > >                 } while (!mem_cgroup_online(zswap_next_shrink));
> > >         }
> > >         spin_unlock(&zswap_shrink_lock);
> > > }
> > > ```
> >
> > Is the idea here to avoid moving the iterator to another offline memcg
> > that zswap_memcg_offline_cleanup() was already called for, to avoid
> > holding a ref on that memcg until the next run of zswap shrinking?
> >
> > If yes, I think it's probably worth doing. But why do we need to
> > release and reacquire the lock in the loop above?
>
> Yes, the existing cleaner might leave the offline, already-cleaned memcg.
>
> The reacquiring lock is to not loop inside the critical section.
> In shrink_worker of v0 patch, the loop was restarted on offline memcg
> without releasing the lock. Nhat pointed out that we should drop the
> lock after every mem_cgroup_iter() call. v1 was changed to reacquire
> once per iteration like the cleaner code above.

I am not sure how often we'll run into a situation where we'll be
holding the lock for too long tbh. It should be unlikely to keep
encountering offline memcgs for a long time.

Nhat, do you think this could cause a problem in practice?
