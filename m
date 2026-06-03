Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61E739A4BA
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 19:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780516277; cv=pass; b=DwJ2aL4T1x3jUzv5/cKgf9uLk8RX2zDBy7uejrDftZnNAqE3/h4QP3v4WdeyfhKmLSbAo1wEcwXEdSic/OkOC/IXXarPhUrKuhm1UzuHnRWLZBZgbkExgN8TPgoHObdHFNBdwG41wQN0sKE+b7DwyKqMCIgGPXcqHg8Ti+s4BIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780516277; c=relaxed/simple;
	bh=UcN5X/USPXkHHtZhuzfxuas4q5dcjvBTYKdiRAV3yCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PQFmBH/EWGAdgBsDQF1oWCbwYjge3t1+k5IT+iZYKCbA2Vhp3baQyeDz1cmpIih4zJG5F/s68o4P/wvmJKASxahl5IasxRIwqnBQVfo8r8QguWqCi98gDf9kXlmOejE9xJoSUA8BmGTeyEghwrgqp+3RRSH2gjVJ7X7jEqt5zKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q7mrHEHi; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q7mrHEHi"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51765531803so150671cf.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 12:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780516274; cv=none;
        d=google.com; s=arc-20240605;
        b=KzbcMFjxxsDz65AkQ0TM3BoxTLmUxmeXWy6DtfPufYDAURMlph2ph4WmzjWOFwKQAk
         QowmaU2EhHMcUb48tAtS4SzEuq4x712KcX1O6xRPiB34ePq2yGFtnBSV5GdiG5IC8FJz
         VIqndn5RuPCeofbYQTf+pM4OPeiCELszgvonoONM6gbtI3Dm0gaI5qxeIkrgq30rPIKI
         Gny28VVPGzfs6e9tZFJDklFco/QKO6r6pFDjg3BRVn/WrSQvCZG7OiRdBKzSBd6YluDK
         1QDcijPmDrjqUOmJMETL/HHUgitJ6g+ece9mrRHh7ksx8LVx6lQuNxwO3K55FZmN4Yu/
         yhCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mydSJ6eCREv5J83WgrREA+4y0Y5cOb58d9V1q4tnNnw=;
        fh=71W4LnvrsyCisOW3m6kVPVx3SsjOmUwZo6HQ9tFw5xo=;
        b=JslOt/fL3tYn/jIhoNty59B8uBSZqRKZSipc6AyWYoP5XYo6eTXDMCMCUkGZrzjAyX
         Z7YxNku/91EV1v9y3ZGetkBO0/yp6KeYdDO5oPH2yoKCK2D+U5zNaYaNDGJb329W5wsJ
         kjruvKLYj7M1mhCauG9ooXnZflDfOrtV9HHab2wzCT03MhtCt68xdDqVVQlYTu/2HYg3
         nbfrKaWQDUyiq2elD2U3JZjnyejoKzBVPlMiv/bnHxB7kkIyXsvMlMqjtrBbcf5kNSlp
         rbWGuqeDALWkPZIYQU+rlAXHH7ZnSVCaaQrIlWI5zMA9OPdLqrBPNh/gUp1PqDtNDcTU
         fIWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780516274; x=1781121074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mydSJ6eCREv5J83WgrREA+4y0Y5cOb58d9V1q4tnNnw=;
        b=Q7mrHEHiBkvDJ/hcO2IJlmLGzTFI2+kDuXV/vU70GCtvCFj0GYU2OPzrmyBL/1Fo4e
         xR3cGfGbZE3cXuQOT+SH3pKTK4qohazBZRH0Gx4toSoPe44l9PHn21WJO//mFQawIEVG
         MW12plllxWyl61Dx1n1T6ptkYuHMVN74HpLL4mqDFhfqR4KilEs6C4Wq4dVVr+s+YdNu
         7mS5Rm8Zq/g05LR7NBqrDfs70wbDDbT4m1JnaDbVZP3ilKocsvJLXh0tqpRghzPF6VSD
         rbirc/pmncTaBWzXDJ01JxQUzozKIm/MMzUpfVWMDGHLJXDN3cM8i8KrKqD4qpBAGmVA
         879Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780516274; x=1781121074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mydSJ6eCREv5J83WgrREA+4y0Y5cOb58d9V1q4tnNnw=;
        b=XxpNKMdO9kXbcNyDINs8Y5kKeWUjWUHMrfZqeb7jxIKSrRriPAJodZO+lqE0TTVKHr
         Kvqc4PQ8j23EfhKoceTIPFyr+7I3Xf8fbPnovv5UlvkzSThOCIs1ObxklO7eXaMdJ3ZF
         784cpgFBYQuPKobpfPa1wBhkACdG/bQB1GP8g9i6lKVfL6YO9ONvIbL3VRH1PvxQ7KAR
         lb+g4ZQSuYGSl0oHEAJ6lCu5MNROC4Y8sWdtxXIYaCQMjXa/FN5wQRoFLl9bT5QOepwP
         VQ/aiydSvX4O4BMm92hhaAvwt+NMzrK+cxBrokebhPOO1t12RGU+ZeoO924XBgdafU87
         S8gg==
X-Forwarded-Encrypted: i=1; AFNElJ/uv6u/dVNOfzOjDHGdgkcfCgRBF/Ads8FOOvu2iC4X5NTJckvBWbPijmlZRlVcvYAi4R5quRlLgyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwH4mf+ztNGBEjPQMXEoA+ZQc4ogKnh5jo6FnvNs1CdNXrfDvL
	+tZbk2Byz2LYR+CPlua6AfU4OFKACVsrRBJDxYng9l68CxB/Kz4jqZ1jGx27ax+DB8/74lffM00
	QAvCX/irCo8CK9YETtY820dPgSDVz7vGNpvS44WDZG9CYBKYBrtmo3jnL
X-Gm-Gg: Acq92OHVAZj02e51AJSxpKeC+kgNCPGxTswQYEfxkfkg6oWiHskXaR/sbacNE8Dgjt6
	5TlNrUz4xsSFjngkxqdUr/U7ErTsD0PfoVPFu7mnOtaof/EpyuY7kthc0Uekodu8gn1RwQpnrg5
	Ys6aK6T70wcpYIH+bek6Z7MVSSPirKR1L70WsMMdt5GXD+YWgNBSXx+aD7pz7PQZQt4KzgcEYd7
	zDA/sW31DH1M1PzC3Xi9Rqh94MuqqHlJ32RbJ8yPCzNYCQyrxLytlwq558Bk5YVsqCxxXo4i6Aj
	MVTkU9KRkXku0g5vs6MzyfP2Kd+he0AC+vzzwqdruWeeiQ4V
X-Received: by 2002:a05:622a:1911:b0:50d:edb1:6bd1 with SMTP id
 d75a77b69052e-51787a7423cmr531751cf.13.1780516273058; Wed, 03 Jun 2026
 12:51:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779471082.git.abhishekbapat@google.com>
 <20260522131108.f972659717367c67082f3766@linux-foundation.org> <4ae038f0-cc33-4a60-b59b-ae86bb541735@linux.dev>
In-Reply-To: <4ae038f0-cc33-4a60-b59b-ae86bb541735@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 3 Jun 2026 12:51:01 -0700
X-Gm-Features: AVHnY4IYfNFfNCUBiZmze5PFD-G7KhptyH4lRMaqQ5BQm2joDQxcOESI7al8bZY
Message-ID: <CAJuCfpFdbq-0SMVg0i5Fg+gQONQEKTL-N7QC4cyCr1e9oVimSg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
To: Hao Ge <hao.ge@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 12:33=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Andrew and Suren
>
>
> On 2026/5/23 04:11, Andrew Morton wrote:
> > On Fri, 22 May 2026 17:45:32 +0000 Abhishek Bapat <abhishekbapat@google=
.com> wrote:
> >
> >> Currently, memory allocation profiling data is primarily exposed throu=
gh
> >> /proc/allocinfo. While useful for manual inspection, this text-based
> >> interface poses challenges for production monitoring and large-scale
> >> analysis:
> >>
> >> 1. Userspace must parse large amounts of text to extract specific
> >> fields.
> >> 2. To find specific tags, userspace must read the entire dataset,
> >> requiring many context switches and high data copying.
> >> 3. The kernel currently aggregates per-CPU counters for every allocati=
on
> >> size, even those the user intends to filter out immediately.
> >>
> >> This series introduces a new IOCTL-based binary interface for allocinf=
o
> >> that supports kernel-side filtering. By allowing the user to specify a
> >> filter mask, we significantly reduce the work performed in-kernel and
> >> the amount of data transferred to userspace.
> >>
> >> Performance measurements were conducted on an Intel Xeon Platinum 8481=
C
> >> (224 CPUs) with caches dropped before each run.
> >>
> >> The IOCTL mechanism shows a ~20x performance improvement for
> >> filtered queries. The kernel avoids the expensive per-CPU counter
> >> aggregation (alloc_tag_read) for any tags that fail the initial string
> >> or location filters.
> >>
> >> Scenario 1: Specific File Filtering (arch/x86/events/rapl.c)
> >> 1. Traditional (cat /proc/allocinfo | grep): 22ms (sys)
> >> 2. IOCTL Interface: 1ms (sys)
> >>
> >> Scenario 2: Compound Filtering (Filename + Size)
> >> 1. Traditional: (cat ... | grep | awk): 21ms (sys)
> >> 2. IOCTL Interface: 1ms (sys)
> >>
> >> Scenario 3: Size-Based Filtering (min_size =3D 1MB)
> >> 1. Traditional: (cat ... | awk): 21ms (sys)
> >> 2. IOCTL Interface: 14ms (sys)
> > Yup, textual interfaces aren't fast.
> >
> > And ioctl-baed interfaces aren't popular.  One would prefer to see an
> > interface which uses read()/lseek(), pread(), etc.  It would be
> > appropriate for this [0/N] to have a discussion of why that approach
> > was not chosen.
> >
> >>   .../userspace-api/ioctl/ioctl-number.rst      |   2 +
> >>   MAINTAINERS                                   |   2 +
> >>   include/linux/codetag.h                       |   1 +
> >>   include/uapi/linux/alloc_tag.h                |  87 +++
> >>   lib/alloc_tag.c                               | 303 ++++++++++-
> >>   lib/codetag.c                                 |  11 +
> >>   tools/testing/selftests/alloc_tag/Makefile    |   9 +
> >>   .../alloc_tag/allocinfo_ioctl_test.c          | 505 ++++++++++++++++=
++
> >>   8 files changed, 918 insertions(+), 2 deletions(-)
> >>   create mode 100644 include/uapi/linux/alloc_tag.h
> >>   create mode 100644 tools/testing/selftests/alloc_tag/Makefile
> >>   create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl=
_test.c
> > At some point this should grow user-facing documentation, please.
> >
> > And the right time for that is now, because such documentation is
> > useful for code review - it makes that review both easier and more
> > useful.
> >
> > Sashiko had a few things to say:
> >
> >       https://sashiko.dev/#/patchset/cover.1779471082.git.abhishekbapat=
@google.com
>
> I notice that Sashiko has reported a pre-existing issue, as described bel=
ow:
>
>
>  >  static void *allocinfo_start(struct seq_file *m, loff_t *pos)
> This is a pre-existing issue, but can resuming a sequential read on
> /proc/allocinfo cause a use-after-free if a kernel module is unloaded
> between read() system calls?
> The seq_file read operation updates priv->iter.ct during allocinfo_next()=
,
> stops iteration, and returns to userspace. If the module containing
> priv->iter.ct is unloaded while the lock is dropped, the module's codetag
> memory is freed.
> On the next read() system call, allocinfo_start() with pos > 0 reacquires
> the lock but returns priv without validating if priv->iter.ct still belon=
gs
> to a valid module. Does allocinfo_show() then dereference this dangling
> pointer?
> [ ... ]
>
> This issue is unrelated to the current patch series and can be resolved
>
> by reverting commit 9f44df50fee4.
>
> Therefore, I have submitted a separate patch addressing this issue,
>
> which is available at the link below:
>
> https://lore.kernel.org/all/20260525072117.112779-1-hao.ge@linux.dev/

Thanks Hao! I commented on your patch, please take a look. I think
there is a better fix.

>
> Thanks
>
> Best Regards
>
> Hao
>
