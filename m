Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7B8492196
	for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 18:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790014330; cv=pass; b=d7UnRTG4NYPsBG/J1L7HcMYffo0PKUoLU1Qgfb4vYPdFEYoK9tF64uHk4wsk4xWk//8+dm5fUSrXqrgSeHAw/EbR1kp7HsHxkCglKBsNh1z1zA27MBtX0AMLN2nYL1gud1FG/2K0K8WBJxOZQP+p41t4VZ6kgGJhgVqy3v4kbsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790014330; c=relaxed/simple;
	bh=s7z4RmLia4wMbWvFwnfm+OWXtPZGEK8vNiGT4euHNkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eOGX7SEpnbtyA5AquYQLdLkmb5RphlC0t7/J0/afdB5EPIXVYtSy6TqNv8xgI6h2ReJD74S4S3XuB8pcKuKT9EPlEpE1F7IkzP31jvFc5cErFL8z0HLcRnVDcIPDE16jMiCndfPhiXFlPhBEvr8HgLf5Z8Tu4jMd2f/idT2VWso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=le4d39BO; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="le4d39BO"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so22939635e9.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 11:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790014327; cv=none;
        d=google.com; s=arc-20260327;
        b=W3S8YrrqLk97JBlboz9Ts7+i1La09ZycPJb83RrO058vtQt0SjkHAHXXV228TSFOAt
         zxi7IJWzdFDPOsQf7CL9nbyPPFlEAJ2hjhnhS9mKcneLK0jOanj7GFzozpmXEDDurjTF
         OQWEWvFf/roShj5NV1D8E4xoog5x3Zkj5on74E40R71NItd1HG+52Og65L+M89TOmbe8
         /37s6YXeY/Ie6yqqwjwY0HadUTnY/jTvAVuXzBBgd0NFaJuYgFUz1aGHWIEZXM45MlQb
         RZBbWG4Mvq8zSYPy4ucdubOd/dFhPpYBcxnGMbQbhrD0l6R6/SvdQUeeSC3XwffrPI/x
         qZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EWAiYwSilURWtvvGZAcBEX6+14GRC4unGK9hsZPrKEw=;
        fh=CaO2aur2L/dNIeU4+hQgH+L0pc0+N2S08c+i+APF4Pk=;
        b=e8FRB+1xNwo44kRJrJlhAc8cZ3y4F4svYHK+jhcsb+iayOgO3DDK/JbL0ttl6aMRzy
         3R4Por9MTeCCDR85EFvHnv4ocjgoNzB3PLw5LjPGz549Ra95015Kf3tYIIxn9Kj+VnDD
         eM0iF0yMpgeBSX9wqBNkxgdYtWHJysPK7AdwtHVNGE4G65h57zN0EAXp4VxEQyd6ADl5
         XoFMgmuzjbQ69BaAQ5UgO7daMuHGFPMePCxRAS8ybZiOTdBifVBAtnK0mOGs6Ib9DkT3
         w30ncs7mr+38jv99uK4mfToCzp0c8tn9E+ogWWH22Rv3bbvNY0tRJ8URX/6aX90tlWiP
         j5rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790014327; x=1790619127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EWAiYwSilURWtvvGZAcBEX6+14GRC4unGK9hsZPrKEw=;
        b=le4d39BO5qRc3A26veZ5xOeZ0p/oorlAM/2uSwipweX+GS3mZUStwCvz4aGYJwUUE6
         cqJTjpLCBMXJbUVIiiVNolrgmz0Z3XXpQDf52oXBCA2cGxhaxmDGWj7PnvcV2G4jyhsW
         ltjMbRdLWlL8Ciq6ybvpmynOeM7eWVjKUNygegPgPESCTM6gpQLLXbTBWu37q18AWwZY
         aPFoIU1yMYsDg0or9bGXv0SSzKwPVNtCq/XoDeEP0RTM5vmVQ9tZ286BkCR0BRcHVSgJ
         47lY7GU6XzPebTi8sWv26LstO1k5kGMgkc0R6otDDKrjYmbvmNBCDdPDtHFDq8j5WCxC
         9hCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790014327; x=1790619127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWAiYwSilURWtvvGZAcBEX6+14GRC4unGK9hsZPrKEw=;
        b=Sn1GmidDhkyeAvqAvRPJMyz63BkLgpuq9t6yy6LU8NIYh5TJ7P4HauqQ1smRRW9cuC
         9+34P7NiaUpmvM+BTNo2ebjOYfGXJW2mwDgxT1sbkOg3RMZJ21gALz2Y4M6K6lEiNU/z
         j317kRUHKoXBQovoD2HMPnS6P6ujmGpZJG1L9KXwytnBozh+j/oPosYxXQspiFZ+Xzfl
         zqOZeKlIWq94bWJihs0E7Peu+A6X4K6iVjKXyznTcYf0PNLrMdD5ecgOZ1Iudy7JLZvG
         jUmWNrLGVnH0ftmrhgYgrmI785FEZRUaut0b7Qeihlwe9w0g2fOsVOFExzCgSYAQlidW
         5vNA==
X-Forwarded-Encrypted: i=1; AKwUvBxCjJpcFUNVZogfMtX3PS59Q2qYA2xmptRJZdftaB1e62d1b9P2uRpQdWxQ/qV286CHoWvokLzMVUU=@vger.kernel.org
X-Gm-Message-State: AFuF++mxaTe1iJSKfOv4oKw3OhM2+aF1PXi/xJUXehnyEVeZecS67CgQ
	09zf78U0VibZEi30XSuMPi2ffAggaD9TYYYEvWpVMm3U+qeC95lo6MCgBAZEOQug5mZ72UeEI0w
	fl1Gqw2pRv3cpVGs8abT6OdcnL4q7A/w=
X-Gm-Gg: AYBFou052LAlGgg6zeNLBYqzo05rm2nU5Zfc5GV9KTH9oxGflfknVun/cX4FvWlNiRh
	IJISWHWhMemo5U+2ZMEOFZ9x6PgLoUhEznHeraFPPI8h5NY2v7a5ssPuncAog3V+5QKaCboXVKX
	sn4XClzI/CZOD7vZj+fSRSBb8hUo51LGw1AlZqFpqCWV09Dr0230R2GxlbCuLjGqRoLg/iwUVhX
	/chcBiEu7ukvM0edxSvmtJTiHj6OFbsONQ5GBPgC3M7ydjBjJlT69XiANM0mCOS83xdrPzdLJSa
	OC8Dz6r47AIMCdi6F/vQgDPiQl/wCWFz/u0e6aqJ6wNAIJnR2cdRqweAUoumUlR/X2UxYd4TgQV
	po4AB6P4UfRY=
X-Received: by 2002:a05:600c:6296:b0:49e:6fd2:a45 with SMTP id
 5b1f17b1804b1-49fc5737c43mr165327145e9.16.1790014326849; Mon, 21 Sep 2026
 11:12:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <aqJXx2vtbKaRLt3x@fedora> <aqLi6cIjD2wJwk0B@cmpxchg.org> <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
 <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F> <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
 <CAMgjq7CJBHkoZmg9oKNgGA8czL0djyBTCAkPz8ETm-tX=Qci4g@mail.gmail.com>
In-Reply-To: <CAMgjq7CJBHkoZmg9oKNgGA8czL0djyBTCAkPz8ETm-tX=Qci4g@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 21 Sep 2026 11:11:54 -0700
X-Gm-Features: AcwNN1Uk9oPMFkdbwLdN1Bo4F0Jb_Heb2Kp9V2Y7VRGmpknxLqYukpUi7VnpUYU
Message-ID: <CAKEwX=PCvY=5_+rm+g6RGMXh2+WTfZrHtd1qT_fSb8j5hjz=_A@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Kairui Song <ryncsn@gmail.com>
Cc: Chris Li <chrisl@kernel.org>, Gregory Price <gourry@gourry.net>, 
	Johannes Weiner <hannes@cmpxchg.org>, Baoquan He <baoquan.he@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 3:01=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Sat, Sep 19, 2026 at 9:02=E2=80=AFPM Chris Li <chrisl@kernel.org> wrot=
e:
> >
> > On Sat, Sep 19, 2026 at 6:08=E2=80=AFAM Gregory Price <gourry@gourry.ne=
t> wrote:
> > >
> > > On Sat, Sep 19, 2026 at 03:45:03AM -0500, Chris Li wrote:
> > > >
> > > > I found this new concept of "compression space" very confusing to m=
e.
> > > > Can you explain the swap behavior and problem using only normal mem=
ory
> > > > usage reduction and latency without introducing a new term or new
> > > > metrics?
> > > >
> > > > The normal user doesn't even know what compression space is, let al=
one
> > > > what makes it transparent.
> > > >
> > >
> > > Sure they do - it's the amount of memory consumed by compressed data,
> > > including the metadata associated with it.
> > >
> > > converting Johannes statement to diagram:
> > >
> > > >> Compression space is not a separate resource. It's page tables,
> > > >> backing pages, and swap descriptors. It's just MEMORY.
> > >
> > >                           Page Data (PD)
> > >   [page tables][                uncompressed page                  ]
> > >
> > >
> > >                         Compressed Data (CD)
> > >   [      recovered space     ][pte][swap meta data][compressed page]
> > >                               |                                    |
> > >                               |---------compression space----------|
> > >
> > >
> > >                         Memory Pre-Compression
> > >  |[  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ]|
> > >
> > >
> > >                         Memory Post-Compression
> > >  |[CD][CD][CD][CD][CD][CD][CD][CD]-------- free space ------------|
> > >    ^----------------------------^
> > >          Compression Space
> >
> > Thanks for the explanation. So the compression space is just the
> > actual data store backing the zswap/xswap/zram.
> >
> > > It's actually really confusing to represent this space as a tradition=
al
> > > swap device - built on the assumption of a pre-defined size limit - w=
hen
> > > that size limit has already been defined (the memory itself).
> >
> > First of all, the traditional swap counter has a very well-defined
> > meaning. It is the size of the memory that, when accessed, requires a
> > page fault. A page fault adds significant latency to memory access
>
> Yeah I agree on this. Swap just about makes resources not directly
> accessible by the CPU act as RAM, whether that is storage on disk,
> compressed memory, or a network resource, all accessed through a page
> fault. I hope we won't make this fuzzy in the future by introducing
> too many magics.

memcg folks should chime in, but IMHO the cgroup swap limits are there
because we want to provide proper isolation and fair distribution of a
limited, static resource among co-tenants. And without vswap, this is
true with all swap backend and all swap usage, because they all occupy
that limited resource. So charging makes sense in the old setup.

This is not the case with vswap. The vswap slot by itself does not
consume any meaningfully limited resource with the vswap device. When
it acquires a backend, we still gate the resource that backend is
occupying for fairness and isolation (swap.max, zswap.max, the latter
of which arguably is unneeded/harmful outside of 0/max).

Charging vswap arbitrarily towards swap.current opens up new avenue of
contention that is farcical. For instance, a workload's disk swap
usage contends with its zswap usage. Or if a cgroup's zswap usage can
potentially contend with another cgroup's disk swap usage, even though
actually contend with no physical resource. It makes no sense.

If we're talking about confusion, I would argue that the current
design *is* more confusing. We have to answer to users constantly why
zswap is occupying swap even if there is no IO/disk involved. And, we
have a boot parameter - if you turn that on, then you get new
behavior. We can add more documentation, but I don't think we need
more machinery for that.
