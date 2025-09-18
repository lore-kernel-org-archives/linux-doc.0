Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3226E2F5333
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 21:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758230123; cv=none; b=fuX37+20jRF9OxTyewUcqOlkU4ZtEov8DyAc5nHCziMmASmKlxHe9Ywgbb2Zd+w8P8ecvSVWfOA62yQPZk6zmxnDK7/S1RkOc19a3L/WHvzeHqbu0jdp3AU+IP26wQkJu7HbZS4vlKu6bc3xuVbAkimoD3XZWjaLZRYMD2LTezs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758230123; c=relaxed/simple;
	bh=RaI2L9RdbXMIdZ8my9qE4bHZaQCWyJPQv2GrnjvFkWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOYP8GNJAlxY93Ggyds4tUstdm2yyVh703Lcik/80wl+3eL38KMCWuXpV/bOlDMlpexf8fXuDg5O7dTZ+Rp6yBnB8bGKvWjzhnd8ko9/DqCpLY7T0XX6DWiGeToFfRfurwE5/nS5Omi1rL9CaiAAN0THIiOjNbUnxrvddxHGHyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htnoOXQt; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htnoOXQt"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b34a3a6f64so13971921cf.3
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 14:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758230121; x=1758834921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cM+YHWLgcfrX2pJyuserQevvZDQvGGhtYKBReggAxHU=;
        b=htnoOXQtYmuqdyiYU7ti2Rs+MtwRA3Sw7j9Nn5GVuP5IgBEkfnwTErvbzWU0e9EaY5
         u+bFDapIJaOW3tkjYeAYFEqCuZ1mxNj5AKaZ4xJZDnmDv0w2KyNpOmj9QilbOFe+VRpc
         8iBku0an2PzWRdOt/bBD3R7hxnGThfnsEYY6sWLAVAOkxgO4H6RQ6mqkSpdmR6wl1PX6
         KkFkD+4tBVsIb9RV/JfOtVjWJmK9e4WnLki6a7u0AXSIMIkoNOe+5KhkT2KebhbA+Co+
         y78+sDQix4i//h044mzOenelutI0YnCSiFsQrpWbRsPYH7YiShhiQptvIvyGEqw6QV1x
         5KHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758230121; x=1758834921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cM+YHWLgcfrX2pJyuserQevvZDQvGGhtYKBReggAxHU=;
        b=lPhbjJtP0gZrrN7JQf2mcy5C1mKZPOjq5WjvDm3L7PVLA/rAdQGf/s9+QlEgpXcxjN
         LWwo4u2jf1A2WhlMsOUvRqqA6/np9DtwWxMZu2WV7qUdTfR9jhiE0PZeoYUn/jM5BlDa
         dr99nvtQdvFQd0SKIg11abvDBInvtkkxAF5jBE5A+VgSIk/eKmiuLCr6k25ZUIL7nIdG
         HautSwZStQbMm3O17L/XtWNoYKen3qsElH0K3ylziZJCdLgcRkSrJ68YK5SBDIxhr81p
         BTKjeMQJveKBXmdHDYKvEobza/4Z7gvPLju9C2m41d8kairbiCvGS+RW35XTPes32/t3
         GIEw==
X-Forwarded-Encrypted: i=1; AJvYcCXBEIoUi17++zMZoUnsNLQ0E+5XHGvD8Ws+df4avIN+YyWUPP2UE333cryMP1JJplGCiEHOZLI3gR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHANLaX1QAqzbdKePRlRNjpVnwqJ8buNTYo5m3P5AqphYdSzif
	d4Cpo/S8I9HMH3z9b12/qMHk+L3O27BP9czEUMu6Msr9QYuIEklPw85meIbETxH8SYgsj2lNWfv
	ZEZtjECxc4F8EE+fjKn2dGKiH6gL+Hn0=
X-Gm-Gg: ASbGncuDQfpabhGo2khtnv9HV1R2nu6peIxFPu3Lhp6QuIr5Ohew1ShUmA7xkA8/Qe1
	qWoQUKpMJpN3u96IoXBoIwrNgH6gnlBC+q+zrrD6MJxRaJAej0ZFssXTMhuItQTVGorRgHth+TI
	WPSP8jyAyS3hPWnci9eW0HvMI6GDosIYEkrG0h0KEJXS2xm75QvX+dtcS5QaoB7nVa8YkLFfupR
	CMvZysLwR4eFEoXlNUIdnUTczybnIXrWKyjbFnCb4zQiLgxbcmC2IBv3ls=
X-Google-Smtp-Source: AGHT+IENnJnb3dOErqnQxPgYvvOMddbQUomvAJmVK+/jzuciOpfm2bNbgO9KFGmfHctVnC6IAniWk5k5xhaWY0DXQaM=
X-Received: by 2002:a05:622a:148b:b0:4b7:94b9:fe1b with SMTP id
 d75a77b69052e-4c0718f62fbmr9962571cf.48.1758230120820; Thu, 18 Sep 2025
 14:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916234425.1274735-1-joannelkoong@gmail.com>
 <68ca71bd.050a0220.2ff435.04fc.GAE@google.com> <CAJnrk1YKPWkaBXe7D2mftN2DMEBqFow80reUGE=2_U8oVFc1tQ@mail.gmail.com>
 <CANp29Y5Y8iO+UbKHtDEc=0d+76WxbWJK1asLaux++_n+Pr+d5g@mail.gmail.com>
In-Reply-To: <CANp29Y5Y8iO+UbKHtDEc=0d+76WxbWJK1asLaux++_n+Pr+d5g@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 18 Sep 2025 14:15:09 -0700
X-Gm-Features: AS18NWAE3sS7zFPUslchx1UJiBdBhfRC3MEiRx5b3wVMklQfkVIIsy4mxxEA2dA
Message-ID: <CAJnrk1Z1vApTkcBzKwCJ3Q6K4Uh6ugOXN8CDSRrXsLE7L3nBHw@mail.gmail.com>
Subject: Re: [syzbot ci] Re: fuse: use iomap for buffered reads + readahead
To: Aleksandr Nogikh <nogikh@google.com>
Cc: syzbot ci <syzbot+ci9b5a486340e6bcdf@syzkaller.appspotmail.com>, 
	syzbot <syzkaller@googlegroups.com>, brauner@kernel.org, djwong@kernel.org, 
	gfs2@lists.linux.dev, hch@infradead.org, hch@lst.de, 
	hsiangkao@linux.alibaba.com, kernel-team@meta.com, 
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org, miklos@szeredi.hu, 
	syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 8:48=E2=80=AFAM Aleksandr Nogikh <nogikh@google.com=
> wrote:
>
> Hi Joanne,
>
> On Wed, Sep 17, 2025 at 9:59=E2=80=AFPM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > On Wed, Sep 17, 2025 at 1:37=E2=80=AFAM syzbot ci
> > <syzbot+ci9b5a486340e6bcdf@syzkaller.appspotmail.com> wrote:
> > >
> > > syzbot ci has tested the following series
> > >
> > > [v3] fuse: use iomap for buffered reads + readahead
> > > https://lore.kernel.org/all/20250916234425.1274735-1-joannelkoong@gma=
il.com
> > > * [PATCH v3 01/15] iomap: move bio read logic into helper function
> > > * [PATCH v3 02/15] iomap: move read/readahead bio submission logic in=
to helper function
> > > * [PATCH v3 03/15] iomap: store read/readahead bio generically
> > > * [PATCH v3 04/15] iomap: iterate over entire folio in iomap_readpage=
_iter()
> > > * [PATCH v3 05/15] iomap: rename iomap_readpage_iter() to iomap_read_=
folio_iter()
> > > * [PATCH v3 06/15] iomap: rename iomap_readpage_ctx struct to iomap_r=
ead_folio_ctx
> > > * [PATCH v3 07/15] iomap: track read/readahead folio ownership intern=
ally
> > > * [PATCH v3 08/15] iomap: add public start/finish folio read helpers
> > > * [PATCH v3 09/15] iomap: add caller-provided callbacks for read and =
readahead
> > > * [PATCH v3 10/15] iomap: add bias for async read requests
> > > * [PATCH v3 11/15] iomap: move buffered io bio logic into new file
> > > * [PATCH v3 12/15] iomap: make iomap_read_folio() a void return
> > > * [PATCH v3 13/15] fuse: use iomap for read_folio
> > > * [PATCH v3 14/15] fuse: use iomap for readahead
> > > * [PATCH v3 15/15] fuse: remove fc->blkbits workaround for partial wr=
ites
> > >
> > > and found the following issues:
> > > * WARNING in iomap_iter_advance
> > > * WARNING in iomap_readahead
> > > * kernel BUG in folio_end_read
> > >
> > > Full report is available here:
> > > https://ci.syzbot.org/series/6845596a-1ec9-4396-b9c4-48bddc606bef
> > >
> > > ***
> > >
> > Thanks. Do you get run on every patchset that is sent upstream or is
> > it random? Trying to figure out if this means v2 is right and i just
> > messed up v3 or if you just didn't run on v2.
>
> The intent is to run on every patchset, but since the system is
> currently still in the experimental state, some of the series are
> skipped due to various reasons. E.g. syzbot tried to process v2, but
> failed to find the kernel tree to which the series applies without
> problems: https://ci.syzbot.org/series/7085b21e-ae1e-4bf9-b486-24a82ea9b3=
7d
>
> In the original email, there are links to the C reproducers, so these
> can be used locally to determine if v1/v2 were affected.

Thanks, I was able to repro it using the syz-executor.

It turns out the bug is in the upstream code. It's because
iomap_adjust_read_range() assumes the position and length passed in
are always block-aligned, so uptodate blocks get skipped by block-size
granularity, but in the case of non-block-aligned positions and
lengths, this can underflow the returned length and "overflow" the
returned position (return a position that's beyond the size of the
folio).

The warning never showed up upstream because the underflowed plen and
overflowed pos offset each other in the calculation:
   length =3D pos - iter->pos + plen;
   return iomap_iter_advance(iter, &length);

but now in this patchset, iter gets advanced first by "pos -
iter->pos" and then by "plen", which surfaces the warning.

I'll submit a fix for this separately and then resend this fuse iomap
patchset rebased on top of that.


Thanks,
Joanne

>
> --
> Aleksandr
>
> >
> > Thanks,
> > Joanne
> >
