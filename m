Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6514437E2E5
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 18:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780597492; cv=pass; b=c/HyOD20wO/BEamN4b6SpaXLS79Fx0VTvg00ABfGto1DWWg7KW0ynDdhtR1v53lGRzrJuYwEY0DnCZKECQpPnC2gaq/KnVziT0bspbjgmwLkTk9O1ObiOHl0dek2o0WtDDMYXuBIUVQAbzPNUoaOYgSe6hozR+ONqrQdSINOj8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780597492; c=relaxed/simple;
	bh=IaO2TGE8HwuhpkugwflrDm8o7rblZGOrQtY6ci7iAnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYCKIJgroTZt2DPWlLG7ZhPuKOv14qVzU91ZOmnzmTWGTQ2UKVcH+bobEv2B5HNKb0JhPkleBI1yqiU8VLMaIWDEyoswOAoUtTw3Jog8WE5rTR9J0EYt2I0xxSccUxYNTqXcB2C9gzAsuI9CIbkFUf5hcvJicJP08OF+Eohaxmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VXfKI9IA; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VXfKI9IA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0b1a48855so21365ad.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 11:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780597490; cv=none;
        d=google.com; s=arc-20240605;
        b=C3NpGqorzlMezabD89Yg806oEy/ihJK9U0sI3xUFrt6P9BvetFNRNfxpXjQEJUXDVl
         p7qsV/dpL4yALP0eKeH6nortf8GT1rspWkfgf9ZySryuKboa9C1tJaTHH3OBBz50qGMR
         3t32iXsrTeWdv8zXmvAPAwfFMoA1hMHKPESfgcdZJuIrKXzqRbLVr4ftmL3fd6eZdeVq
         M5n5ufK80vS5YoZEOZ/wPhG4aw+r8KXZiqss1ZwpzrCzPTqCtq6nxMQrvYDQF6DyQ5cu
         W2AXyfKK+GVLQUvQub/Wrjil0UAw0HxagzIs51qFxzLmM7hjProBUWVvIAyKEu4p2ebf
         fKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mz1GvkDFt3r+PPi/7RT2S9SEefp8yaIm3TzzC0PikKw=;
        fh=lQ5O+BKb+H6/FucRbzTDA08ZfvuU0oK9+gC0JpX1shM=;
        b=ciJuH1UbjSy6Nc7G8Xe/JQykm8od8ctOGBWecfoLOKJcByIezncBb9wL6nFC4eM/Wh
         3rJaOqIBLpgr7k0Rwz3YjRi+bX1cljXmNjR1cRjA7F6MiEeXejYPC8Q9lrrzyzRemN4a
         6q/PhFw5ChJwCh/u2O79ZykcpzenoQfzyGiHW1ABGzV0vfsSu1ldeF8Z69PTkwBYLaVr
         TDKgl61lmXMVbKUiEVvUEIcDp4o7qWLlhMHilGRVgX7H53gCy1lVAz6/F8SSzqStD6Df
         Ig+hsVi1icsCW817VC9xqzj15bbC3vmzGH3T/9dFS7Qg/lvhjw+fDxroTj/gs7oEklC1
         KmFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780597490; x=1781202290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mz1GvkDFt3r+PPi/7RT2S9SEefp8yaIm3TzzC0PikKw=;
        b=VXfKI9IAiTTm4serMuM4xpeHsAsOTd4F4JiQj6N45Wc++TnnrEPtrDJ50t+i+N5Fy9
         3zbhgwmi062hB+SnqXqcdk0hkmEsThp4t7HGB8G7QbRUNB6GkxB6eBVc8l4iFXbpoVxR
         p93PKh4nZEUwYwZChGv3tBHuH11WZlsE0bRlMhLR1MPyTX53Xc+9+RCvFTwF6vj29WJz
         PCs0/EoYMta9YNo0sS1YUPQ9b9QfeCtvb6C6p4KueDX3zUPbPsJIMyqsCMetfWw3ftdo
         9AGdscS52ovulp32pX/pAGV2TOEUeFOa53Cfz4nENgkHfpwvuBlGK2NdLUorgI0oFI1F
         z1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780597490; x=1781202290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mz1GvkDFt3r+PPi/7RT2S9SEefp8yaIm3TzzC0PikKw=;
        b=jKGrCpvi7tUyZWZYJki+LFP4mgY3iRxzZ4SY9ILA9lxs2wF4JsPd5KDd8xhuJQUogr
         YvghhsX0vCtBUMLsXkhfiortPSGz2/rIFibob6N7Eayyd34thDIzROJBUuoXyG7iz1vc
         PbfLTxuciqzhbF/gERNp5WkkD9POu1SxjX2lBSrj+GUSyaD2YY0+0L3GjfnAf6zLGBRJ
         3f+FOND5zo/ImM5HBtuGfKaJvuppGHzUxPcOoam/YoAtAgdlVn3y1oWDLS6CbpYedBJZ
         e7v6xxwOmTpcjuUXnHifL2B4IX7aUUM9zgwEzCuf5X0DYcuS2iZD+TtAGnhkSGFPMX7o
         +Blg==
X-Forwarded-Encrypted: i=1; AFNElJ9JnwNLVaWea3uRf4Y7VDVk4rxwujEZIWE8N2bfjzzeNB7RZkRr8Vk3uCTKSjj3QUVMBmFbGA1BFFE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6/j7oFok+Zj3m2d0CUM0oFAYfGIWQemXxwp6RnaRmLwds/VYu
	g+LrvgyXfuk7NvwMxhNDF5CzoFnj8+BqH9+GV20d7KmcBahdMVyW7HwC78H0GtEClv9WOPYJsn+
	x2FD2o48yItFOPwBTVgSD56v5D3M4hkih8wBGJLVQ
X-Gm-Gg: Acq92OGQRL9B/k5Ccwtrn9kN06DwiYaNUZSvEzkZlii+xf4gCArN8p8rC7xj1krojGU
	AsGnmWV6GIzQ98tuN8QvXXUgAkXfZ5802c+kxEUIQxip6Uu0GrXSffcSFqhLT6DrrOFv6+JvLok
	PXzeuB80FeYerCMAxa3D4ifCe+foqLWyaOcFTTvoMmQFnTICyyGNigQ+hM4vJzgEhwFa7FlZWHm
	ryTpV3NVoXZoN8VTHqHICuqnwB0bM3h4MPwsS7bHm4kbhNs+QeqGKu6shP2j27uN4990U8z+aam
	5qDvOnVfU0jS2Fda+oxkzVcDc7Za+R9v/TxUilJLWhCACiGe
X-Received: by 2002:a17:903:fb0:b0:2bd:6dad:7ccd with SMTP id
 d9443c01a7336-2c1e3acbc73mr290345ad.25.1780597488867; Thu, 04 Jun 2026
 11:24:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779471082.git.abhishekbapat@google.com>
 <20260522131108.f972659717367c67082f3766@linux-foundation.org>
 <4ae038f0-cc33-4a60-b59b-ae86bb541735@linux.dev> <CAJuCfpFdbq-0SMVg0i5Fg+gQONQEKTL-N7QC4cyCr1e9oVimSg@mail.gmail.com>
In-Reply-To: <CAJuCfpFdbq-0SMVg0i5Fg+gQONQEKTL-N7QC4cyCr1e9oVimSg@mail.gmail.com>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Thu, 4 Jun 2026 11:24:36 -0700
X-Gm-Features: AVHnY4KsU8yEoJgCLNo_jZOZ1ytTBNw47Zvt-iCaZSiHNSip0BLl0JGiQwhbc_w
Message-ID: <CAL41Mv6=cRMnRz5Lqa0nz2H9EGw0mW1GZAByba8sD8kVvCj-3Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
To: Suren Baghdasaryan <surenb@google.com>
Cc: Hao Ge <hao.ge@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 12:51=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Mon, May 25, 2026 at 12:33=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
> >
> > Hi Andrew and Suren
> >
> >
> > On 2026/5/23 04:11, Andrew Morton wrote:
> > > On Fri, 22 May 2026 17:45:32 +0000 Abhishek Bapat <abhishekbapat@goog=
le.com> wrote:
> > >
> > >> Currently, memory allocation profiling data is primarily exposed thr=
ough
> > >> /proc/allocinfo. While useful for manual inspection, this text-based
> > >> interface poses challenges for production monitoring and large-scale
> > >> analysis:
> > >>
> > >> 1. Userspace must parse large amounts of text to extract specific
> > >> fields.
> > >> 2. To find specific tags, userspace must read the entire dataset,
> > >> requiring many context switches and high data copying.
> > >> 3. The kernel currently aggregates per-CPU counters for every alloca=
tion
> > >> size, even those the user intends to filter out immediately.
> > >>
> > >> This series introduces a new IOCTL-based binary interface for alloci=
nfo
> > >> that supports kernel-side filtering. By allowing the user to specify=
 a
> > >> filter mask, we significantly reduce the work performed in-kernel an=
d
> > >> the amount of data transferred to userspace.
> > >>
> > >> Performance measurements were conducted on an Intel Xeon Platinum 84=
81C
> > >> (224 CPUs) with caches dropped before each run.
> > >>
> > >> The IOCTL mechanism shows a ~20x performance improvement for
> > >> filtered queries. The kernel avoids the expensive per-CPU counter
> > >> aggregation (alloc_tag_read) for any tags that fail the initial stri=
ng
> > >> or location filters.
> > >>
> > >> Scenario 1: Specific File Filtering (arch/x86/events/rapl.c)
> > >> 1. Traditional (cat /proc/allocinfo | grep): 22ms (sys)
> > >> 2. IOCTL Interface: 1ms (sys)
> > >>
> > >> Scenario 2: Compound Filtering (Filename + Size)
> > >> 1. Traditional: (cat ... | grep | awk): 21ms (sys)
> > >> 2. IOCTL Interface: 1ms (sys)
> > >>
> > >> Scenario 3: Size-Based Filtering (min_size =3D 1MB)
> > >> 1. Traditional: (cat ... | awk): 21ms (sys)
> > >> 2. IOCTL Interface: 14ms (sys)
> > > Yup, textual interfaces aren't fast.
> > >
> > > And ioctl-baed interfaces aren't popular.  One would prefer to see an
> > > interface which uses read()/lseek(), pread(), etc.  It would be
> > > appropriate for this [0/N] to have a discussion of why that approach
> > > was not chosen.
> > >
> > >>   .../userspace-api/ioctl/ioctl-number.rst      |   2 +
> > >>   MAINTAINERS                                   |   2 +
> > >>   include/linux/codetag.h                       |   1 +
> > >>   include/uapi/linux/alloc_tag.h                |  87 +++
> > >>   lib/alloc_tag.c                               | 303 ++++++++++-
> > >>   lib/codetag.c                                 |  11 +
> > >>   tools/testing/selftests/alloc_tag/Makefile    |   9 +
> > >>   .../alloc_tag/allocinfo_ioctl_test.c          | 505 ++++++++++++++=
++++
> > >>   8 files changed, 918 insertions(+), 2 deletions(-)
> > >>   create mode 100644 include/uapi/linux/alloc_tag.h
> > >>   create mode 100644 tools/testing/selftests/alloc_tag/Makefile
> > >>   create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioc=
tl_test.c
> > > At some point this should grow user-facing documentation, please.
> > >
> > > And the right time for that is now, because such documentation is
> > > useful for code review - it makes that review both easier and more
> > > useful.
> > >
> > > Sashiko had a few things to say:
> > >
> > >       https://sashiko.dev/#/patchset/cover.1779471082.git.abhishekbap=
at@google.com
> >
> > I notice that Sashiko has reported a pre-existing issue, as described b=
elow:
> >
> >
> >  >  static void *allocinfo_start(struct seq_file *m, loff_t *pos)
> > This is a pre-existing issue, but can resuming a sequential read on
> > /proc/allocinfo cause a use-after-free if a kernel module is unloaded
> > between read() system calls?
> > The seq_file read operation updates priv->iter.ct during allocinfo_next=
(),
> > stops iteration, and returns to userspace. If the module containing
> > priv->iter.ct is unloaded while the lock is dropped, the module's codet=
ag
> > memory is freed.
> > On the next read() system call, allocinfo_start() with pos > 0 reacquir=
es
> > the lock but returns priv without validating if priv->iter.ct still bel=
ongs
> > to a valid module. Does allocinfo_show() then dereference this dangling
> > pointer?
> > [ ... ]
> >
> > This issue is unrelated to the current patch series and can be resolved
> >
> > by reverting commit 9f44df50fee4.
> >
> > Therefore, I have submitted a separate patch addressing this issue,
> >
> > which is available at the link below:
> >
> > https://lore.kernel.org/all/20260525072117.112779-1-hao.ge@linux.dev/
>
> Thanks Hao! I commented on your patch, please take a look. I think
> there is a better fix.
>
> >
> > Thanks
> >
> > Best Regards
> >
> > Hao
> >

All, just wanted to acknowledge that I've gone through the comments
and will be sending out a v3 patchset addressing them. Thanks for the
reviews!
