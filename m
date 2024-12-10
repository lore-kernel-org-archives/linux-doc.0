Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5B823DEAD
	for <linux-doc@vger.kernel.org>; Tue, 10 Dec 2024 16:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733848142; cv=none; b=J7tEtyrmw6vfJ5EC0iBjjlu1ZqnK5ZtrcK8P1IAk1/xWE521SayOV/ftsFGVg6qr6TQxDrO6EBvTZjbgdpHJGrncCGPL2/15ei8KXlYg3NAqZX8r5xYKaVUc4FWOT+WDMkPCkl3lu0YL7MNe3SyDbK3A8JeQo9daRdIuN2N/0Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733848142; c=relaxed/simple;
	bh=PRLGTeyT4rAFWC+3ZXsSREFqzUV+VFnIPCu1JMOFk3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyQPC1jq5nOVJiPOgYvOzDkjFoueEjA2zpded5CHCH5OsxExvIlVnTbsawMBAOe143Y0/0Gbu9XxDxmxooXypwRZ+Us048nByONVUE8mLwDQBOb0yb3z7smnJF1ZsSQxMLkBaSeR14feFxVwvesV+3qWInpWyPhTrnne7d7fBQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HqBPElGm; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HqBPElGm"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4674a47b7e4so277241cf.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Dec 2024 08:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733848139; x=1734452939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bf5h9unDEvxY9TWD5u6hoRQPAOn47cfu9U+YnF+nEzs=;
        b=HqBPElGm947tcZT66lxp/gCAVvRVdWWczfwY7rZno2rqEr7SlLgoXHiClCsUzQbUdb
         DkItlYxMf+EMw6ngDSGTMNROW56Jslf+HvLbT9BBvXDhGN3FVD54fm8+URlQ9u5ZMXDv
         JYqCKj0bmFL+xFZt1dVJyFP8U7GIeliz/v5tPzieV+esSahu1danUfG5kYIsV/ZdKynU
         7UJt1KajaCvoA3AB4HPqqZIYIOM84hTgqJPjv4aPcBp+FaQtBvmKpcO2+H9vrpwC6JnQ
         Tw640aWCRoQOQJOMLPT9BkI2HKePJ9uGWcRHFnbde8TsJSGmK6YKZmHB38Q4S0vxI9nI
         I5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733848139; x=1734452939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bf5h9unDEvxY9TWD5u6hoRQPAOn47cfu9U+YnF+nEzs=;
        b=fxETqQ7pmwBLMCA6unQqg7vxmE9L3AMsnQr+hItNPu+/GvISa4RF4mvfhgIgiIZxlc
         VJ2iyaXEPLfJXjFrkggIcfwZRMMeha1I2HEC35BoeFPLGWmxoIzHqGE6JSLFnhfrlxUy
         OQl6PiuZV2VW160vjVNa/mbafyYa+BN20DmrSL0xCs3LOpQgYK8u/Tg48gbPIqtScSau
         8ZhPcIUUver20O/DJoOHzn74bR79GIjGQ9cmgNM0BOYMEkHgv/ZbVOSvk7+e+YMOkw+B
         P0sqRfQwUySwBxUmgXq+dsFSMwOkdnElfYLWb9kCAy3HIg8tX9yYh3aDp8uIgg85pFEH
         LJqA==
X-Forwarded-Encrypted: i=1; AJvYcCUZwbr010VsCgcc5BQ0Yopr/+o4PmHa/p+a0nhT+8tC1IytySU5cjFXGupXTuI1GDL8+OXQWqoY3PE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRuStpCKoDa6Jd6C6bYduu7gs/oMD8VcLX3trMBryncjQPNNUe
	LuLkSogapNRjgaRXw0q1TJXTIlKfPaVWRUyb7DeSkGJai69OzO4FJsms7o9DQjvqYMCOmiJVcZ9
	kv9JqTPopfVI1njDBacajvyo3IxH8wxdJ942k
X-Gm-Gg: ASbGncuo5a4k/YS2pyKxX+Um3EELnRq75bouWn8qX5/C//fs2ThIXlffv1f6NJX/yVm
	R0qEdJ+PHFM8sw0OWNdIzr1Eq7vabpaeDUeh+vojmHtzTAKo3FU6hVExQx0r05CXtFQ==
X-Google-Smtp-Source: AGHT+IG18A1lS1fdcxb1YBnBEyBoavuVqg9A2/HQxThNRPuA8ZJGfzBBwB6pD1Bx1UZCGAdfo+5l5/Vg84fvlmkLzCc=
X-Received: by 2002:a05:622a:5510:b0:467:82de:d949 with SMTP id
 d75a77b69052e-46782dedc53mr2054901cf.12.1733848139314; Tue, 10 Dec 2024
 08:28:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206225204.4008261-1-surenb@google.com> <20241206225204.4008261-4-surenb@google.com>
 <aafe0538-0c56-469e-b23b-3f22cb8186a0@suse.cz>
In-Reply-To: <aafe0538-0c56-469e-b23b-3f22cb8186a0@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 10 Dec 2024 08:28:48 -0800
Message-ID: <CAJuCfpHVj+iVBd1O3wPFFSxanxk_b+Ym=qf4QE0U2HaJGbNdgg@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] mm: mark vma as detached until it's added into vma tree
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, hannes@cmpxchg.org, 
	mjguzik@gmail.com, oliver.sang@intel.com, mgorman@techsingularity.net, 
	david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, 
	paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, 
	hughd@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 3:36=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 12/6/24 23:52, Suren Baghdasaryan wrote:
> > Current implementation does not set detached flag when a VMA is first
> > allocated. This does not represent the real state of the VMA, which is
> > detached until it is added into mm's VMA tree. Fix this by marking new
> > VMAs as detached and resetting detached flag only after VMA is added
> > into a tree.
> > Introduce vma_mark_attached() to make the API more readable and to
> > simplify possible future cleanup when vma->vm_mm might be used to
> > indicate detached vma and vma_mark_attached() will need an additional
> > mm parameter.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> > diff --git a/kernel/fork.c b/kernel/fork.c
> > index 21660a9ad97a..71990f46aa4e 100644
> > --- a/kernel/fork.c
> > +++ b/kernel/fork.c
> > @@ -465,6 +465,10 @@ struct vm_area_struct *vm_area_dup(struct vm_area_=
struct *orig)
> >       data_race(memcpy(new, orig, sizeof(*new)));
> >       vma_lock_init(new);
> >       INIT_LIST_HEAD(&new->anon_vma_chain);
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +     /* vma is not locked, can't use vma_mark_detached() */
> > +     new->detached =3D true;
> > +#endif
>
> It occured me we could probably move the detached setting to vma_lock_ini=
t()
> to avoid the #ifdef (also in the ctor in next patch)?

Yes but setting vma->detached inside vma_lock_init() does not seem
logical. I went back and forth on this and in the end decided to keep
it this way. If the #ifdef-ery is too ugly I can introduce
vma_init_detached() or something like that.

>
> >       vma_numab_state_init(new);
> >       dup_anon_vma_name(orig, new);
> >
