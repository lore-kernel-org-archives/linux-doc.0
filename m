Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE9A225D6
	for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 01:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736991703; cv=none; b=Twf+DJI37HDJ8mwxhH3ItKznk+PRu8eN5JVAuTLnZekqBLS66ZPxmDJQjwJW+TjHg5I3Z6ywNVJ73v6RifmXupBtyA3+D9VRu9tQI4CbUtb0amDp9LItEPfymx9XpHxEFOzdi78jms1Nf5as3FaHjueJQQXN603IWL0AWyrHvWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736991703; c=relaxed/simple;
	bh=e08GARVYp9WDbHQJjte0is5RMD6kgcVnc2XW4J3xwa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZnZiAOSBxfSjbHzgn/f6maY1Z2uh6cMeE0yTYyCpmr23GDhmuMODzydtx1iXSZf1EzYRDgyDXPsawsXslvv0N/KA6DZZ7OyKFiB/y8nGedtG/uAvpqqeJoXFVSQCmPfjqO4AYCbcRA1Px5TiWip8rroe0Vg5ImSL1g9A0orI5fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sOtdjDxa; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sOtdjDxa"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4678c9310afso65211cf.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 17:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736991701; x=1737596501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5qp4Kp9mAi9TjlMT6stn4fx5XakFjgS/5BnY6/8sIk=;
        b=sOtdjDxaar64YKGwt64U8/TlFJuhvmAMSCN1hiyGEE9YYYXA85d9lZPjlxLVuY5fYO
         q6XblfxNpLZpRHGaR/lHgb1W1DpwWsyxJPwAN2Gb6+Bh4evFhZcgUma1W7uuTPdCqXMp
         x6KXYHfTOUddClrhh76j16XGNiKgEJPAQKz4Bir1hzr1X3wDuxajRWVEl/r0xbl4oA7o
         pvDkal7Du1ehHMZRatCBbZXjCHNmOsEghI76eUWiRuVhTNecQgAbfZqDvKH+E509K8Aj
         LBXrvf05tkxKFscEpt7wbXDum9whqx+/ZpoxbxkI25By3CxVAW990CtVTiZNRk9q/Exp
         e7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736991701; x=1737596501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5qp4Kp9mAi9TjlMT6stn4fx5XakFjgS/5BnY6/8sIk=;
        b=DqYruJWjMa0PKgACJikzeuWD4SV69SjE1B8QHHAh2N+bQ19PtpZ3Rn0JWg0CWzww2u
         w+EJhOFJnsuuXnuDhkIpKsM28TdRdm6OmecyRNcb+B71NguBKmV8IouASEDVFxLaqTOW
         ygsDi1G3qIJ22e0DioODQqQAZivCmAwkJYehG1BCp7Ftd4fY8+RBICenpCwH6MslOYhZ
         3jfNnMMdUYfU/SW8EY0OPqMzhcjeNr/2pAR07Rt0kxR0IDWR/rw0hvH3IzQnqV8T2kjx
         mAt7ymUNzUt+mZhvDoMZrHpVHjKBQzRt4oaKcXPaNkYLAc4d2Er98Zcd7Nh2GK6VUyPK
         H3AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlwTq33m1y+s8EveRYn8XMIVXD6QV8PdA6N77RWn1gR8HlwrRUXadSffkb/4xFsobV+BP/F8CkHGM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0fEB4QrwBlE9pUh8BoHV8NL7c0ROzxzDTyZpAh27duzHo/AVK
	qm8eupwZ4l8OGIsclUSqVXv5GBaxQyTHSjF6Kdi3Q2KsDSeQa3PCCpK2t//5ItIxOAisnyGdOZi
	DDl9m3lUFB1jk03X+vBaqu9G0t9bwO6HPNinF
X-Gm-Gg: ASbGncs+xSr6eM6blKST2vDzsGeOrXfAhYhDGpn3Glft5LUWZQwZbUl3jAMrcC7/4Nx
	HgOg1VhFB2VqHbTu5JLhbnHfGkxPgIxxFC7Hu1Q==
X-Google-Smtp-Source: AGHT+IHFjbHOfd9g4KoCVXGG8P/NJDkMykdB702IOlnovia7txfoXehQfUQdevoX4JoF6GQMGrRK9R8xH5pWaxkApJY=
X-Received: by 2002:a05:622a:178b:b0:46d:f29d:4173 with SMTP id
 d75a77b69052e-46e04186a53mr1735031cf.16.1736991700645; Wed, 15 Jan 2025
 17:41:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-12-surenb@google.com>
 <20250115025830.pebmoyerkruqtx5y@master> <CAJuCfpEvbCJeQDnMqJK7F9dCLX+4_kx3THuRq5yuf5U9oYoEKQ@mail.gmail.com>
 <20250115120532.mgvjhcrzvmmjasv7@master> <CAJuCfpEboXys9g2sW4Z7vNkkhW2pS0atJZNU6+JX-Fu7Ntvb6Q@mail.gmail.com>
 <20250116013747.akajp2kdwhmbgq5r@master>
In-Reply-To: <20250116013747.akajp2kdwhmbgq5r@master>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 15 Jan 2025 17:41:27 -0800
X-Gm-Features: AbW1kvaNN7I5SxVgl-wVj0Cuhtdomh1AvTxEkeyb7hxD46ZxXpRTqujEDsqVhdM
Message-ID: <CAJuCfpHHt7aF6VOCWyrYrT6ws2X9Kcbr+jT7+L+r+=gbyXQmBg@mail.gmail.com>
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
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

On Wed, Jan 15, 2025 at 5:37=E2=80=AFPM Wei Yang <richard.weiyang@gmail.com=
> wrote:
>
> On Wed, Jan 15, 2025 at 07:01:56AM -0800, Suren Baghdasaryan wrote:
> >On Wed, Jan 15, 2025 at 4:05=E2=80=AFAM Wei Yang <richard.weiyang@gmail.=
com> wrote:
> >>
> >> On Tue, Jan 14, 2025 at 07:12:20PM -0800, Suren Baghdasaryan wrote:
> >> >On Tue, Jan 14, 2025 at 6:58=E2=80=AFPM Wei Yang <richard.weiyang@gma=
il.com> wrote:
> >> >>
> >> >> On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
> >> >> >@@ -6354,7 +6422,6 @@ struct vm_area_struct *lock_vma_under_rcu(st=
ruct mm_struct *mm,
> >> >> >       struct vm_area_struct *vma;
> >> >> >
> >> >> >       rcu_read_lock();
> >> >> >-retry:
> >> >> >       vma =3D mas_walk(&mas);
> >> >> >       if (!vma)
> >> >> >               goto inval;
> >> >> >@@ -6362,13 +6429,6 @@ struct vm_area_struct *lock_vma_under_rcu(s=
truct mm_struct *mm,
> >> >> >       if (!vma_start_read(vma))
> >> >> >               goto inval;
> >> >> >
> >> >> >-      /* Check if the VMA got isolated after we found it */
> >> >> >-      if (is_vma_detached(vma)) {
> >> >> >-              vma_end_read(vma);
> >> >> >-              count_vm_vma_lock_event(VMA_LOCK_MISS);
> >> >> >-              /* The area was replaced with another one */
> >> >> >-              goto retry;
> >> >> >-      }
> >> >>
> >> >> We have a little behavior change here.
> >> >>
> >> >> Originally, if we found an detached vma, we may retry. But now, we =
would go to
> >> >> the slow path directly.
> >> >
> >> >Hmm. Good point. I think the easiest way to keep the same
> >> >functionality is to make vma_start_read() return vm_area_struct* on
> >> >success, NULL on locking failure and EAGAIN if vma was detached
> >> >(vm_refcnt=3D=3D0). Then the same retry with VMA_LOCK_MISS can be don=
e in
> >> >the case of EAGAIN.
> >> >
> >>
> >> Looks good to me.
> >>
> >> >>
> >> >> Maybe we can compare the event VMA_LOCK_MISS and VMA_LOCK_ABORT
> >> >> to see the percentage of this case. If it shows this is a too rare
> >> >> case to impact performance, we can ignore it.
> >> >>
> >> >> Also the event VMA_LOCK_MISS recording is removed, but the definiti=
on is
> >> >> there. We may record it in the vma_start_read() when oldcnt is 0.
> >> >>
> >> >> BTW, the name of VMA_LOCK_SUCCESS confuse me a little. I thought it=
 indicates
> >> >> lock_vma_under_rcu() successfully get a valid vma. But seems not. S=
ounds we
> >> >> don't have an overall success/failure statistic in vmstat.
> >> >
> >> >Are you referring to the fact that we do not increment
> >> >VMA_LOCK_SUCCESS if we successfully locked a vma but have to retry th=
e
> >>
> >> Something like this. I thought we would increase VMA_LOCK_SUCCESS on s=
uccess.
> >>
> >> >page fault (in which we increment VMA_LOCK_RETRY instead)?
> >> >
> >>
> >> I don't follow this.
> >
> >Sorry, I meant to say "in which case we increment VMA_LOCK_RETRY
> >instead". IOW, when we successfully lock the vma but have to retry the
> >pagefault, we increment VMA_LOCK_RETRY without incrementing
> >VMA_LOCK_SUCCESS.
> >
>
> Yes, this makes me confused about what VMA_LOCK_SUCCESS represents.

I'll need to look into the history of why we account it this way but
this is out of scope for this patchset.

>
> >>
> >> >>
> >> >> >       /*
> >> >> >        * At this point, we have a stable reference to a VMA: The =
VMA is
> >> >> >        * locked and we know it hasn't already been isolated.
> >> >>
> >> >> --
> >> >> Wei Yang
> >> >> Help you, Help me
> >>
> >> --
> >> Wei Yang
> >> Help you, Help me
>
> --
> Wei Yang
> Help you, Help me
