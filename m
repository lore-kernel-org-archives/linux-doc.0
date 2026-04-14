Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D7D262808
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 16:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776184537; cv=pass; b=mChtwof9YWG3vpsxQFQOf4JhzXiu8fxGyAqw9B9zhrYWlkpbdxn2IcCeKoNHCpCw+srEOjQfTDbo0fnbSfcRKsScbFHsqIw/YPxwdHzSeI0hq0VmFLlNmWdC/2E6CQDaQDyNFprqg9iTqu6uue9AvXoJB2UhbuwFccWTMGAuvFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776184537; c=relaxed/simple;
	bh=xYiD8mPQzgv2ojv2b6lBy802NgdOj9ELcJpY/+bSZFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dNmCAk2hkAAgQo4mOnRnurZt0n7A+vEkljyl3VwbrjpysiEot8kgtvsG0g+lPdg3LgZzmWy9oyIMSyGkMSCI9CT6dYIZuUYhBlcVF7hBgduzA87AydUleuwRTeJl6tiQYRVJI8aX8M237v5pDo1t5Ig5h2WpWqUE9Scac0KAMls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRQqD7U/; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRQqD7U/"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d7a5e77b1so1424000f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776184534; cv=none;
        d=google.com; s=arc-20240605;
        b=REo58AcgqpwMNC0ulVwfUHEU0dNc+FR03GpuDxfi1Yl/VnfkJACrIreh93XKomTb1f
         StBSA0Wfya+tcpwMejyLhPxWq/3llXQq87ymISR/hKdMYQvdgSb3t7ClUXLROTLDKEsI
         Ei2AKMjDzrcKBLfjJ9Kq38b5Y5dH2+x/u+4AzGtTTbqYr8VgOGpciMO10+chtdFEK0O/
         yJZn5A6sXMPpWN6HdjyUs2k1d8Nk0RRfZeQms6rYxQTDg+t+ChrdKIX7bhxNtt4fEmpo
         g+2y38NnzaunIbkrNeYUbGMDOAX+h1PfqVJshRhy/Gxyhq2XDqOMhZB35+o54srl5uXh
         n0ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fQleDbjaYYUSGdpynlKDYhzpuJpOjymZUKR/yJ1TCio=;
        fh=EJWOAU1z2dWhxwszAtQ6LAq+uffI29VBBQT0p+aAt6A=;
        b=N0TwU1fJpnNw7IdXKMxoJoOKCxSvZ3Kr2dg3KutsjXDWvQKNDMwucSnVt5cASBbSHH
         gz6C3X6LeBArfNB1YB8wntQQghQnC8UXzvAOOl4/G2eQ0D18Vr+VrrtNCajF+lJgz4f1
         4lj4nXyG55SbncXUPRmbkyfpGmvjCYqiS0n0K+94iG4oSm5GBgFFJIEMeTm7x2b4QjuM
         ZamMfi3jGoKlPJbF3RpSeOxj22F8b4cvme0S8T67Z/waD/nLLXHjch2iRt98Qt/PbFKl
         o/McDaooF0Jp33OMRp5QMYWqohjbRXA1+3YAcR6EWVFkORnn40po6lUsdVSPe5sMtTFw
         FTTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776184534; x=1776789334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQleDbjaYYUSGdpynlKDYhzpuJpOjymZUKR/yJ1TCio=;
        b=iRQqD7U/7sTULcNbGNjYaQDl0Xrs7FNVw60c+DtlpI7ZmQN/fe+64cSQrjShAvZMLl
         YuRde/SR3rZiRKCgscsVSY/3sLiAdY83B/YPTmopOlr3fnw3jfkz/PKZX/xqImPeuBaT
         XaBS5QOarKISOJqVhPsxIfn6QvB7WOWX7jqU4qErzTlJ+4yLnKFd9ieFsJnuIqIHtZax
         p0x26LfT+JWaRSDKsVsyJExbm6zk8UwjZNMoKrlvRIG9fUW25p8jEPoFokZ0Q+CGFns7
         gqCc+v6I1ow7f0DphGWmExphDW/FABGqqdygM52tdN4yMR736CLcr8BULPlreiCShLdx
         NQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776184534; x=1776789334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fQleDbjaYYUSGdpynlKDYhzpuJpOjymZUKR/yJ1TCio=;
        b=snZZ7ixAFHIb0sfsNrkfYL+Mp/e5P0OpNLNYNlZlHMkeIB/XpyhT6iBK+e52BCNKhP
         ZxzHRR2pSKaFIErwypUJaICPYPfA2b5lYAPFwNZJDq9btPqweyxfNt4UxAio4slal81g
         snuxltfR9sA6DeXF4cvHm5cmFyqsNqy5/DSh+VeAtU7eIQIVH9iHcNBJPaKYZMgC8D90
         WZJzYPxp1Wi/2Ansikvf93hRP8sYBX/pDlsWLnFK9FySyz1ctNWcmRfoYVgOfbME2IKj
         3Q28us0k55UaiH4oVXJonRYVx/wxndl6R8rrf23eNuUWyTw/S3qNnZqWFcytQb21ryHM
         DTDg==
X-Forwarded-Encrypted: i=1; AFNElJ+nUhITuTsGKzAfYfczrs9lJVT53K2CM7zfstEE6EuQQ0ZM/3AfefeJe9QKbMDODyel3TGn6c0MxIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmAORrz1epMRH9b5hLy9lXJdgc5q2G+0zTE3c7eFIh+zudKvme
	IeEF76Zmagme8e+CqeR/lMJdx9Dei6zh3BA8FBNSIGpgsEkBsIYMDk6/9oy6GuIYZSoC7fD3d0/
	KQrADh7bT5BLqkrnwdXR2aglHaZdDHNA=
X-Gm-Gg: AeBDietFBE3CPQL0EZVWb5TnclsArbRrNXLdwc+AYWhgyovZDXdCdd3E+d/CAZgKzJT
	pwwfZPH7IYfm3zdW7aKuC2GYieiryCRQAOS9tJKpJuouqJ/tfJ4QfKLvKv01/h5bNyrqUJ2UqaO
	gzF63quzoIbLJBEH46wcU5EDJ1ZbcddwbnfrwHYHiPUKpYmlH/AX+mOGDO5qn9B97klxG+Xmdmo
	VEVntxtVMDMwzCxHI4iwLmeLKe3dGsGVoiCBTLdpRszy30/2FYa3XUAgq9H8nnrLzxu5kLx9g8H
	QvM32adwNx07nqtQxBtbqelEsTycsWwIjjkHzy4=
X-Received: by 2002:a05:6000:25ed:b0:43c:fac5:d382 with SMTP id
 ffacd0b85a97d-43d5958e3b8mr30561697f8f.12.1776184533792; Tue, 14 Apr 2026
 09:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320192735.748051-1-nphamcs@gmail.com> <acQrQYHJgqof0yx4@yjaykim-PowerEdge-T330>
 <CAKEwX=NnHxpQKp9qBg2=r_euyjgxw2nHXjbgof3MymHTgJmRAQ@mail.gmail.com>
 <ad2rYH9tUPthHFoj@yjaykim-PowerEdge-T330> <CAMgjq7BO6SLZPfNXDh1F-7RAOqDAfqMQ4PM=qjAq1mCsWyD0LQ@mail.gmail.com>
In-Reply-To: <CAMgjq7BO6SLZPfNXDh1F-7RAOqDAfqMQ4PM=qjAq1mCsWyD0LQ@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 14 Apr 2026 09:35:22 -0700
X-Gm-Features: AQROBzD5xGWfOWAJA-1nI1ObWe4VBmguR2Q9Syvbquy-jm8YJp-HL-l7rnLn-Mc
Message-ID: <CAKEwX=NtcGBnDpSuePqfK9G4jACC5gU95-69A4z5JzKkYRq1YA@mail.gmail.com>
Subject: Re: [PATCH v5 00/21] Virtual Swap Space
To: Kairui Song <ryncsn@gmail.com>
Cc: YoungJun Park <youngjun.park@lge.com>, Liam.Howlett@oracle.com, 
	akpm@linux-foundation.org, apopple@nvidia.com, axelrasmussen@google.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, bhe@redhat.com, 
	byungchul@sk.com, cgroups@vger.kernel.org, chengming.zhou@linux.dev, 
	chrisl@kernel.org, corbet@lwn.net, david@kernel.org, dev.jain@arm.com, 
	gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, jannh@google.com, 
	joshua.hahnjy@gmail.com, lance.yang@linux.dev, lenb@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pm@vger.kernel.org, lorenzo.stoakes@oracle.com, matthew.brost@intel.com, 
	mhocko@suse.com, muchun.song@linux.dev, npache@redhat.com, pavel@kernel.org, 
	peterx@redhat.com, peterz@infradead.org, pfalcato@suse.de, rafael@kernel.org, 
	rakie.kim@sk.com, roman.gushchin@linux.dev, rppt@kernel.org, 
	ryan.roberts@arm.com, shakeel.butt@linux.dev, shikemeng@huaweicloud.com, 
	surenb@google.com, tglx@kernel.org, vbabka@suse.cz, weixugc@google.com, 
	ying.huang@linux.alibaba.com, yosry.ahmed@linux.dev, yuanchu@google.com, 
	zhengqi.arch@bytedance.com, ziy@nvidia.com, kernel-team@meta.com, 
	riel@surriel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Tue, Apr 14, 2026 at 11:05=E2=80=AFAM YoungJun Park <youngjun.park@lge=
.com> wrote:
> >
>
> Hi All,
>
> > On Sat, Apr 11, 2026 at 06:40:44PM -0700, Nhat Pham wrote:
> > > > 1. Modularization
> > > >
> > > > You removed CONFIG_* and went with a unified approach. I recall
> > > > you were also considering a module-based structure at some point.
> > > > What are your thoughts on that direction?
> > > >
> > >
> > > The CONFIG-based approach was a huge mess. It makes me not want to
> > > look at the code, and I'm the author :)
> > >
> > > > If we take that approach, we could extend the recent swap ops
> > > > patchset (https://lore.kernel.org/linux-mm/20260302104016.163542-1-=
bhe@redhat.com/)
> > > > as follows:
> > > > - Make vswap a swap module
> > > > - Have cluster allocation functions reside in swapops
> > > > - Enable vswap through swapon
> > >
> > > Hmmmmm.
> >
> > I think this would be a happy world, but I wonder what others think.
> > Anyway, I'm looking forward to the future direction.
> >
>
> Yeah, I agree with this.
>
> And I do think swapoff of the virtual space itself is also necessary,
> we really need a failsafe, e.g. a clean way to drop the swap
> cache and data, kind of like drop_caches or shrinker fs are
> commonly used.
>
> > > > 2. Flash-friendly swap integration (for my use case)
> > > >
> > > > I've been thinking about the flash-friendly swap concept that
> > > > I mentioned before and recently proposed:
> > > > (https://lore.kernel.org/linux-mm/aZW0voL4MmnMQlaR@yjaykim-PowerEdg=
e-T330/)
> > > >
> > > > One of its core functions requires buffering RAM-swapped pages
> > > > and writing them sequentially at an appropriate time -- not
> > > > immediately, but in proper block-sized units, sequentially.
> > > >
> > > > This means allocated offsets must essentially be virtual, and
> > > > physical offsets need to be managed separately at the actual
> > > > write time.
> > > >
> > > > If we integrate this into the current vswap, we would either
> > > > need vswap itself to handle the sequential writes (bypassing
> > > > the physical device and receiving pages directly), or swapon
> > > > a swap device and have vswap obtain physical offsets from it.
> > > > But since those offsets cannot be used directly (due to
> > > > buffering and sequential write requirements), they become
> > > > virtual too, resulting in:
> > > >
> > > >   virtual -> virtual -> physical
> > > >
> > > > This triple indirection is not ideal.
> > > >
> > > > However, if the modularization from point 1 is achieved and
> > > > vswap acts as a swap device itself, then we can cleanly
> > > > establish a:
> > > >
> > > >   virtual -> physical
> > >
> > > I read that thread sometimes ago. Some remarks:
> > >
> > > 1. I think Christoph has a point. Seems like some of your ideas ( are
> > > broadly applicable to swap in general. Maybe fixing swap infra
> > > generally would make a lot of sense?
> >
> > Broadly speaking, there are two main ideas:
> > 1. Swap I/O buffering (which is also tied to cluster management issues)
> > 2. Deduplication
> >
> > Are you leaning towards the view that these two should be placed in a
> > higher layer?
>
> IMHO the swap infra should be doing less, not more, so we can have
> more flexible design, and different backends can implement their own
> way to manage the data and layer. e.g. Having one backend being
> flash friendly and it can do this without caring or affecting other devic=
es
> or backends.

I think that's what Youngjun already has, unless I misunderstand his
descriptions.

>
> > If it goes into ZSWAP, there would definitely be a clear advantage of
> > seeing dedup benefits across all swap devices. It's a technically
> > interesting area, and I'd like to discuss it in a separate thread if
> > I have more ideas or thoughts.
>
> Just branstorm... Why don't we just merge these identical pages like
> KSM? Maybe at least zero folios might benefit a lot if we keep them
> mapped as RO instead of recording them in swap, seems better in the
> long term?

That's our preferred approach too. We just didn't manage to get that
to work (yet). :)
