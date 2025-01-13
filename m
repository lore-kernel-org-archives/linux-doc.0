Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705991C3039
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 17:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736790815; cv=none; b=cYb2Xu5DbzBYZ6HTb3ul3pwx65oYZ8w2ciU6OERZQgfE+3UlovrBnViN7lYbjEaOCRCaOA7sjvPtMFiEziXfZGY6smY4KqXtV7dlG1QUPxu4hufqtM9jPLE1fF5bcXtMWEbCMMId/PrxWbFN/3ALPRN44++Llj0/wtDuz23yt7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736790815; c=relaxed/simple;
	bh=X9XnBEIRu5TUTMmgl5GlimF/h8A3x5LBzxs/DBiK18A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nGMcJHXb6DcshgruU1v2yLXBlmV/6h5q8Hvo2NFwyMV3uzV1NwDJJAyPZ5cxr+9+lGp/oHqBeAkWSyetWRASUSxtST2mx9e3FRh4R5MS/q6YcIXvh4M8fxRXc/DBiIQqLP2UEA2Ikcrpyf/WPa2XgxXsAmnnYH+RH4Y6bNm7pH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vo8ApShS; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vo8ApShS"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4679b5c66d0so426271cf.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 09:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736790812; x=1737395612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpKLo8I+x2NMmVMaXpT3x4XbSRmSmku74RXCgUimyzo=;
        b=vo8ApShSyOYohwnAtoDfrlhBOX88K/CjLxpPP24F+qFwz5EGgv5yZvL13V/NQXiFD3
         Oqf7qtWOvmIv5sOU2SwPHBjKXfSmopL9Rkq5rSooZS2rVPgNjQ1Up4HQABlZL8hOMmND
         UN2vMqF4iGhBiuJxqnEkYI1n7631S7LC3I2kmMPdUQpLCdy0i9OOiQgKRKJwbPJXI2Jd
         9ESyoAfpFw9WKDc9Kxq9t7fV0jNNDMYL9mT7/sl98A99eAyKLoS+uASrsq0m5JHedm76
         OqXT796kgO+4wCBxgO/UJGrrdAvC+OCOiYeL0G7ndiSrmehXB93AQygNvtQbeIeb7f8Z
         hLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736790812; x=1737395612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpKLo8I+x2NMmVMaXpT3x4XbSRmSmku74RXCgUimyzo=;
        b=TMa3J6mBvhmonyXzn5aSh5AOVmDE7xSGzQ40Bsv2StZbnRQ3dppRSoQtQUUbXuRQH3
         xvPCEWHTNVuGQ5m/y3qTZd3KbuHJOYrS3D+mF+bYguq46WsHQhM+08AT3J0SxrOwlPRt
         TRV88U5no9yX27LIZ+QA+K9a79JWuUHKGwTtPAlRNwNTctdDlwD/2MPjc0Gl8TnXRybY
         M2Kebts4CRQCQbp7A5m+SIC69ZiTVV60ehkBQIcEdYQvmLeSgNLvOu2tiu4uHyzsFL6C
         3BfYnum9eeo7lLVX8rc+KCpdFoaDALOHK6D7bD6MlaPTa2R4HAP/zQm2Qyz/+HpuULdZ
         avOA==
X-Forwarded-Encrypted: i=1; AJvYcCXETSjJcYvbAU86XIW2flV+GTOuER/Oqpwywu7lsiyL4y+ewrfQBwNf7Let0mK9yP7Xw2RxOjRllEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnS1apuHQQ4JN4D048D2DtldTmoEv7FhNIJzzSq5XqWznOAObK
	Rpgq7dIshK4DiZMA8xNcMNPVrXDZGmowwy9J2Ziia8aL5lmzrGkFKgN/kL6WQPCveew423RqoJc
	A0zuxfIrJp5vSeylk6jxMnqWiOTXIOhlsdQ73
X-Gm-Gg: ASbGncu5JR2IeotjqKApENIai1+V6LJyil7IAsO4oL1bs86TfDdCVgN+xIpgQr8a9iJ
	1uF8sOj8gxHhLyMPPbg2pWBYCyLBVK7a4wU4LmA==
X-Google-Smtp-Source: AGHT+IE9bvQsLLb+uRt43rih0ZWtO0dvnxOVozNdIDXNbbVchkDaW0+lHeKJScBz/NRraVQozMNx+L2DJN2XAa5jZzk=
X-Received: by 2002:ac8:7e8e:0:b0:46c:7cf2:d7b2 with SMTP id
 d75a77b69052e-46c87f3c1d4mr12959201cf.18.1736790811921; Mon, 13 Jan 2025
 09:53:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-9-surenb@google.com>
 <ab3d690e-4850-4c7b-a19f-093b78bb2ca4@lucifer.local>
In-Reply-To: <ab3d690e-4850-4c7b-a19f-093b78bb2ca4@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jan 2025 09:53:21 -0800
X-Gm-Features: AbW1kvbPHzqR-A2uBg-PFCUGff_wGAZVqmOcd3vz6WT6gl-V0Z2NiuC_dffkKe4
Message-ID: <CAJuCfpF921P+0Zvi+nugpcdojtsP79O2GwTiedY1n4V7OFFC9Q@mail.gmail.com>
Subject: Re: [PATCH v9 08/17] mm: move mmap_init_lock() out of the header file
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 7:27=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Fri, Jan 10, 2025 at 08:25:55PM -0800, Suren Baghdasaryan wrote:
> > mmap_init_lock() is used only from mm_init() in fork.c, therefore it do=
es
> > not have to reside in the header file. This move lets us avoid includin=
g
> > additional headers in mmap_lock.h later, when mmap_init_lock() needs to
> > initialize rcuwait object.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>
> Aside from nit below, LGTM:
>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> > ---
> >  include/linux/mmap_lock.h | 6 ------
> >  kernel/fork.c             | 6 ++++++
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> > index 45a21faa3ff6..4706c6769902 100644
> > --- a/include/linux/mmap_lock.h
> > +++ b/include/linux/mmap_lock.h
> > @@ -122,12 +122,6 @@ static inline bool mmap_lock_speculate_retry(struc=
t mm_struct *mm, unsigned int
> >
> >  #endif /* CONFIG_PER_VMA_LOCK */
> >
> > -static inline void mmap_init_lock(struct mm_struct *mm)
> > -{
> > -     init_rwsem(&mm->mmap_lock);
> > -     mm_lock_seqcount_init(mm);
> > -}
> > -
> >  static inline void mmap_write_lock(struct mm_struct *mm)
> >  {
> >       __mmap_lock_trace_start_locking(mm, true);
> > diff --git a/kernel/fork.c b/kernel/fork.c
> > index f2f9e7b427ad..d4c75428ccaf 100644
> > --- a/kernel/fork.c
> > +++ b/kernel/fork.c
> > @@ -1219,6 +1219,12 @@ static void mm_init_uprobes_state(struct mm_stru=
ct *mm)
> >  #endif
> >  }
> >
> > +static inline void mmap_init_lock(struct mm_struct *mm)
>
> we don't need inline here, please drop it.

Ack.

>
> > +{
> > +     init_rwsem(&mm->mmap_lock);
> > +     mm_lock_seqcount_init(mm);
> > +}
> > +
> >  static struct mm_struct *mm_init(struct mm_struct *mm, struct task_str=
uct *p,
> >       struct user_namespace *user_ns)
> >  {
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
> >
