Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2721E23B616
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 15:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210522; cv=none; b=LUiGDG+0AnotQ/fDfyGRyh5fSoGQeMiDozZB8mNj1vF675Hlruu8pF+LDIlfOBL/s+BVTj5pp5glQPJBXXgim9U2E6oeglbTNXQkeuX3dtLtH8iBLv8D6MDTPX8urB1ra4m4kqmnvdTORbEh4hrdsJ58K9RbG9t2gRcoqjOJ9iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210522; c=relaxed/simple;
	bh=3fuPAHF2wqUzCF+Ih+V96s2Pa8BfHBVrf909ozzJYxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iXe0IaSVURIvi4B17lGVddLRKKebGqp5YdfZblnJTdoTn1Chh5PxiKs7hG/9iBXWsu5FgltetAAuPd8kgN9gwx5ua3kFz77d4xSxBAiZYjqtOZs9Uhe0HNP1gTtjOdHKg/M67Zb4DehyDgsQTIVD2CJABQkslyiJt9Rt/c0zwKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eAOavc2C; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eAOavc2C"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-621a3c43df3so507096eaf.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 08:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758210520; x=1758815320; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fuPAHF2wqUzCF+Ih+V96s2Pa8BfHBVrf909ozzJYxs=;
        b=eAOavc2CN3hKS95ih6fHrGk7HQYI14S9OGRboWaVhlIeSO+Siqxx6vtu4Fl75VShUA
         LFUlJB0hQTDvqMb+/ypW9RfbOVQcZ7S+pncqwJ2jtRXaSJOq4a2SIf5XLmgBS2y8+6Kk
         dxiFvkxUZt2A+13w0SonMvcT3N653WVBTXiCV/FHeN4/5ZrKJpSMujE7gFlWJVS3Xxy+
         qOvEnthHP6wMEhDH9I1y2nXWSnFvZb0rlGAE8VBoDEjch1ROO0nbPsNP+dIN5F/86Jox
         lfV2dgUthYT4i3k2/kSAQ338iJ0Lq+E7ZO+ysx+GVp+mALPXS/0U0YhCDCbeJDc7N1UE
         +6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210520; x=1758815320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fuPAHF2wqUzCF+Ih+V96s2Pa8BfHBVrf909ozzJYxs=;
        b=e6ThnPpY5z/zxe1roLrPWhVrzDPtG1rdjdWuD7Duey0fDuxNMuRp03ELaRSVv+32Hz
         U/AoCwl83KKgcVh+XTXtBaG9ps0yCmL3G8yUTNETGzfsOk5PAaQaBvC4Jmr3FmNnhE4E
         o5sLDWf/if9JSwJq7nOXgsnoIADzxRT0spGqOifbRsebVcz2OpJvqpRdKC2BHdQb0w1H
         iyzUebi2av31zyyF8z8MsHpbPa4qKy97oQRNvjocodCEqVu+ccp9uXf0BLt/+QCGRi06
         HDwhllCPpE5FjJ+OioYm9yLBmbo7pqNBg/gRd63mcvQYUBZOawIcb8fV5IYfxNN1B0t1
         im2A==
X-Forwarded-Encrypted: i=1; AJvYcCUJxr3xkd//sHCgC7PthF+EAw4DWuDblrzOQkVxRm+yPtl5EDdiAauoinMP8UUjK0PtIb70AQ9UZAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTzzwvM1nNRwanDjrUM3PgCS4TXBUJfmDIpv1WTzHGEl9/8+6t
	XcVDA6Mcy4wAyVb8UeiO1DyQOXayo0Mwk/UGaaZ1uGU5rghenaA15Pi12qi12ibp6NjC8BldZ5e
	GpmQQKyEQBl23T2xJORj8j7P+JSV78FdiWIGwGnQj
X-Gm-Gg: ASbGnctj3Fd7B1mcPL6aDa5LmKAwAGo6OUgAUdkdXkhTkPrddrb6hXSs8/9okZ/q2Pe
	v214pzCSIrlzTA7Z5KEAY4HgiKM7FyMKRjSYYQTa4+Ekt8l6AqzKPpiOite08BSEAI6m8NbZzMo
	3JDibWcIfPNAU6JWSSrsDO4fFYMGdqJoIhv7WtRRRFoP19cbClAM/KSapTIxNKHtXQCkDQaJASl
	NfpBgKLE4bDWU3q2mhTKq6dejbOlCiDL3+JA7gnUgKq+Ug7tb2Xt/QbyxMDpog=
X-Google-Smtp-Source: AGHT+IGZQIGtkvyQ7wUbXbPktQnaEGHmteV66ZUVON5NljKX83ZF9JtYWo+pN7TerpN49zbUut8goBymhFyWExBBTaQ=
X-Received: by 2002:a05:6820:c006:b0:624:abae:b650 with SMTP id
 006d021491bc7-624abaeb894mr2040726eaf.0.1758210519920; Thu, 18 Sep 2025
 08:48:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916234425.1274735-1-joannelkoong@gmail.com>
 <68ca71bd.050a0220.2ff435.04fc.GAE@google.com> <CAJnrk1YKPWkaBXe7D2mftN2DMEBqFow80reUGE=2_U8oVFc1tQ@mail.gmail.com>
In-Reply-To: <CAJnrk1YKPWkaBXe7D2mftN2DMEBqFow80reUGE=2_U8oVFc1tQ@mail.gmail.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 18 Sep 2025 17:48:28 +0200
X-Gm-Features: AS18NWAU9uKKLdv_CQUnITI5tezk67S_wzRhWyVluYMjy37dGuE_05c1-3Y9NYc
Message-ID: <CANp29Y5Y8iO+UbKHtDEc=0d+76WxbWJK1asLaux++_n+Pr+d5g@mail.gmail.com>
Subject: Re: [syzbot ci] Re: fuse: use iomap for buffered reads + readahead
To: Joanne Koong <joannelkoong@gmail.com>
Cc: syzbot ci <syzbot+ci9b5a486340e6bcdf@syzkaller.appspotmail.com>, 
	syzbot <syzkaller@googlegroups.com>, brauner@kernel.org, djwong@kernel.org, 
	gfs2@lists.linux.dev, hch@infradead.org, hch@lst.de, 
	hsiangkao@linux.alibaba.com, kernel-team@meta.com, 
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org, miklos@szeredi.hu, 
	syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joanne,

On Wed, Sep 17, 2025 at 9:59=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Wed, Sep 17, 2025 at 1:37=E2=80=AFAM syzbot ci
> <syzbot+ci9b5a486340e6bcdf@syzkaller.appspotmail.com> wrote:
> >
> > syzbot ci has tested the following series
> >
> > [v3] fuse: use iomap for buffered reads + readahead
> > https://lore.kernel.org/all/20250916234425.1274735-1-joannelkoong@gmail=
.com
> > * [PATCH v3 01/15] iomap: move bio read logic into helper function
> > * [PATCH v3 02/15] iomap: move read/readahead bio submission logic into=
 helper function
> > * [PATCH v3 03/15] iomap: store read/readahead bio generically
> > * [PATCH v3 04/15] iomap: iterate over entire folio in iomap_readpage_i=
ter()
> > * [PATCH v3 05/15] iomap: rename iomap_readpage_iter() to iomap_read_fo=
lio_iter()
> > * [PATCH v3 06/15] iomap: rename iomap_readpage_ctx struct to iomap_rea=
d_folio_ctx
> > * [PATCH v3 07/15] iomap: track read/readahead folio ownership internal=
ly
> > * [PATCH v3 08/15] iomap: add public start/finish folio read helpers
> > * [PATCH v3 09/15] iomap: add caller-provided callbacks for read and re=
adahead
> > * [PATCH v3 10/15] iomap: add bias for async read requests
> > * [PATCH v3 11/15] iomap: move buffered io bio logic into new file
> > * [PATCH v3 12/15] iomap: make iomap_read_folio() a void return
> > * [PATCH v3 13/15] fuse: use iomap for read_folio
> > * [PATCH v3 14/15] fuse: use iomap for readahead
> > * [PATCH v3 15/15] fuse: remove fc->blkbits workaround for partial writ=
es
> >
> > and found the following issues:
> > * WARNING in iomap_iter_advance
> > * WARNING in iomap_readahead
> > * kernel BUG in folio_end_read
> >
> > Full report is available here:
> > https://ci.syzbot.org/series/6845596a-1ec9-4396-b9c4-48bddc606bef
> >
> > ***
> >
> Thanks. Do you get run on every patchset that is sent upstream or is
> it random? Trying to figure out if this means v2 is right and i just
> messed up v3 or if you just didn't run on v2.

The intent is to run on every patchset, but since the system is
currently still in the experimental state, some of the series are
skipped due to various reasons. E.g. syzbot tried to process v2, but
failed to find the kernel tree to which the series applies without
problems: https://ci.syzbot.org/series/7085b21e-ae1e-4bf9-b486-24a82ea9b37d

In the original email, there are links to the C reproducers, so these
can be used locally to determine if v1/v2 were affected.

--=20
Aleksandr

>
> Thanks,
> Joanne
>
