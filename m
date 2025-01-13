Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7857D1B86D5
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 19:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736795497; cv=none; b=V8K8BaVzWV7j6BeqMpyMcrvEMaWasVEaRjk1O0VhJcqq5a+ZB062K1A9YrGj2wYMZx6l12T1pyZwJm2D0GNxmo3iXy/EWZblRHw1I+t86/fcM+Fqx/eRR/DitMXr/Wa8dNJv0FyFNBTTvah8L5aOyRNVHAGYucx+AuwPsVORFTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736795497; c=relaxed/simple;
	bh=ExAoN/DOyiN25RQcWbilD8IM056eZrz22Y3OeCaXK2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUBbcFznEiju6pkjFoZ9mTpWbXyUsFX0PfXyDNRy335RFLB4KpWVX7cwmXKcGfqfNvvS/GHHXNQioDKK1hgVYSxxEIpBEHPgJCTJrZ1XRGDljGKvPbudKL50owgsnqcLlOMAFz0cQdMWasMwGypMcXfCLJjA/l5FxKwQkqfnq9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hVbTCS7b; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hVbTCS7b"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467abce2ef9so27801cf.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 11:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736795494; x=1737400294; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuTiApKgNeAoPlSqxQy/7OF5EuvyPAgcsRi03hQnDgU=;
        b=hVbTCS7b5Q6yGd6pTOs3P7+xBWpAO62ZB/SxSQUSoMLItHVnBeGEw7PN+Orm5li35g
         TIwhilpF3T0XuROl/HUAKctU+vyw9to5lUpZtw5GQ4ACGzh01gtgjZwe+rKU1ZOMq80m
         77MTNw7F8IWEKvw9vsji9WnMnitGo3TdAYCbADaX+mHzHl0zlgmsgczKuWA6nO2hocnB
         RGoO+qq94ZRGZZPfGfJOsAOua6gLV2TnISWA5zCwwyMpMJLxUKRDcLviU4VCxRLup1WK
         dWn/ZIBQwVQOrQw00sYwnWoH/X2yvzaBXj7RSKimGCD674+bdC4GYZNjJdyiaIrkV1zw
         kPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736795494; x=1737400294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uuTiApKgNeAoPlSqxQy/7OF5EuvyPAgcsRi03hQnDgU=;
        b=u9G/r6c1y7TH1wDD1j5VNooRbrIiOvSzCjNMmI9FGcyuyzaDwIqgpHtWYDzJCbSVU7
         yq4dyF+JvSpK1f6Ij3eAW6+Mr5kg0GDSSYKVaiXKRFm8rrV/A1lpL3SmKbVsArp7/qvj
         /tWWM5Nmx6RFFCZJy/oxhTWyPTX3b3KAB6aLMR2Rj2exJm9eBsEyrQhT5f9utY1JFZY6
         VUCGH2/06edq7ck7kV5DlZbwjs2IVgNowqRNHkVMCX/tjwo6PLXA0w5kQDP+wpDmbHYD
         PaoWsRysNEuOuDJIWIs4LFkOa5lYrujUyUb6CxC3X5/5ZIC2sEHGzQlOXAu81yErQ/3M
         G3sg==
X-Forwarded-Encrypted: i=1; AJvYcCWbWdHxTTFDrzUxRl/iTQWX7G3F1DGwInQsoicEOaPpKzYWW2/kejMKjaBmbtkCuXP3/myMJQm+ZRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzfDANLeAneTxMFPgHUOjn8CRwnLGOAbw2bucKuHTK1K83c/rV
	JGuN2rJ+PJQlFSVd0Jmpq6cPelljIv7nCVgotrA1HwEH5G+yx7pZD2jeNe+GRmD4nQ1OiWHHg1l
	tcATYHej+r691mzcqxKM0ydDzDMke6NKDpCLf
X-Gm-Gg: ASbGncuVaRA2Lms39iuK43mITCqwf+qxI/oQQ9bRM5s0TNurci0HrqXIL9Jf7jFEVBt
	ymTzPs5XFiQIA8xSI9Pg2AwrGiifqrW7rqtfgpA==
X-Google-Smtp-Source: AGHT+IEl3tvIPBl9VN/bb2o/e0KFoqEglK+YdaEcFzM5ZAds1GxfqEMXPxSfHRaZPnYl7EaaVHNgRx7XqCLclqSf9lA=
X-Received: by 2002:ac8:5983:0:b0:466:9af1:5a35 with SMTP id
 d75a77b69052e-46de96c4a0emr228141cf.10.1736795494207; Mon, 13 Jan 2025
 11:11:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-6-surenb@google.com>
 <5d46531b-570b-4f81-90f3-2fb157664f87@lucifer.local> <CAJuCfpGJu88XgJUJ45aSPQNfUw4UuBRtGzB4HSybiP8xzyUTPQ@mail.gmail.com>
 <15720844-b970-4b37-b475-bf6e7c72113e@lucifer.local>
In-Reply-To: <15720844-b970-4b37-b475-bf6e7c72113e@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jan 2025 11:11:23 -0800
X-Gm-Features: AbW1kvaSfrRFKtX_BqiCnTXazP_AmesM5No-G1nEpKAxDMSOB0ueRnNAuJ0pxCg
Message-ID: <CAJuCfpEYOJayU7xcpw2VgSYRwB4sNSdxFE28j9GKu_5OvPL6VQ@mail.gmail.com>
Subject: Re: [PATCH v9 05/17] mm: mark vmas detached upon exit
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

On Mon, Jan 13, 2025 at 9:13=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Mon, Jan 13, 2025 at 09:02:50AM -0800, Suren Baghdasaryan wrote:
> > On Mon, Jan 13, 2025 at 4:05=E2=80=AFAM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > >
> > > On Fri, Jan 10, 2025 at 08:25:52PM -0800, Suren Baghdasaryan wrote:
> > > > When exit_mmap() removes vmas belonging to an exiting task, it does=
 not
> > > > mark them as detached since they can't be reached by other tasks an=
d they
> > > > will be freed shortly. Once we introduce vma reuse, all vmas will h=
ave to
> > > > be in detached state before they are freed to ensure vma when reuse=
d is
> > > > in a consistent state. Add missing vma_mark_detached() before freei=
ng the
> > > > vma.
> > >
> > > Hmm this really makes me worry that we'll see bugs from this detached
> > > stuff, do we make this assumption anywhere else I wonder?
> >
> > This is the only place which does not currently detach the vma before
> > freeing it. If someone tries adding a case like that in the future,
> > they will be met with vma_assert_detached() inside vm_area_free().
>
> OK good to know!
>
> Again, I wonder if we should make these assertions stronger as commented
> elsewhere, because if we see them in production isn't that worth an actua=
l
> non-debug WARN_ON_ONCE()?

Sure. I'll change vma_assert_attached()/vma_assert_detached() to use
WARN_ON_ONCE() and to return a bool (see also my reply in the patch
[0/17]).

>
> >
> > >
> > > >
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> > >
> > > But regardless, prima facie, this looks fine, so:
> > >
> > > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > >
> > > > ---
> > > >  mm/vma.c | 6 ++++--
> > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/mm/vma.c b/mm/vma.c
> > > > index b9cf552e120c..93ff42ac2002 100644
> > > > --- a/mm/vma.c
> > > > +++ b/mm/vma.c
> > > > @@ -413,10 +413,12 @@ void remove_vma(struct vm_area_struct *vma, b=
ool unreachable)
> > > >       if (vma->vm_file)
> > > >               fput(vma->vm_file);
> > > >       mpol_put(vma_policy(vma));
> > > > -     if (unreachable)
> > > > +     if (unreachable) {
> > > > +             vma_mark_detached(vma);
> > > >               __vm_area_free(vma);
> > > > -     else
> > > > +     } else {
> > > >               vm_area_free(vma);
> > > > +     }
> > > >  }
> > > >
> > > >  /*
> > > > --
> > > > 2.47.1.613.gc27f4b7a9f-goog
> > > >
