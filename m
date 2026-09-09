Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B153583AD7
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 16:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788972124; cv=pass; b=WJihsNVDk/pBrBKF5v3JPp9SMmITxxzE/3MaWkYm7efmY6D471u9tjnddiMSIanb9xXkuKMrh/auMGXXzNyFSftPE/sza5CKOuKVG9BYOYuYj+zgY57UL02YeD6aO51d1TdQ0VCEsfFy+esnFOLwyLsJRClLKKs3GBPY581Xa4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788972124; c=relaxed/simple;
	bh=/PVQoRJaxnOVHklysY+eFPRn0PjfeKzNOqRGrKxgA1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TxS+lSpZym3RoUt3AgEWx0QH4q6ctoi3xszW69RbLLbFyo7PZ3LPj6ExTI/ibH0xT2rYDYLFVhdN8Vzeqk5bLd2qzeP8/AO6fuA3HycijtMziXKlsG+DLB/fZwH0f1OwB0rBskX5q70rECZepCvipjUyDkc6tjYRgr0KyRnUdqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMdV5HJZ; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMdV5HJZ"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a49d2b18d5so7098251fa.3
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 09:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788972120; cv=none;
        d=google.com; s=arc-20260327;
        b=aa/E9Lgh8dCo0ml0SPtxplBaz6sbHSLDd6oWXm7FBPx2B9ywLjlOG7i1DoaGosqdWK
         2qjUfaMITXJd5rTdeDVOrKcDVYhZwJxrIHNpMzeOq1eCzuEGFVNvx6EDN2H97pv804bD
         iqImJnvQTKLNoiHobA93hFW0bKsaOQUeNOujeXY2htbECeqpjYovFTwa7KQlfBVYCUSY
         HIkWro6RNdv2sN0eJa37RLAEQQ7DXa5CkL++vOwZ+v026mi4t/J/nP7yKvTVx3usYpG/
         /dvGiOuBnDJlkGIL4UGfhghWlx/SXlfEM+2p/KFnZXySILwO6Vp51g0Dw52blk41FKLO
         HCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/PVQoRJaxnOVHklysY+eFPRn0PjfeKzNOqRGrKxgA1Q=;
        fh=/foQmHBlIFHJ1NrDKM+AhoF6Ax0PVAbC616rZ4xPIPQ=;
        b=j9rctw9TDg0qXhKMdQt+qjDhywsXtAefQoTbQ+IE0H1qXhjPx/L8wO8Azv4b8lXeFv
         hqiSHR8RY9EQ+ITOACo9dCAHBXEdWPeQNbpRsxWeSc41aWoxYomavPVDBUwtiVo7vDef
         wSIuK6b/uHwqdo4W7BRhsBfg2TmBGdIdbLa2+lA+9pug/re6UbMG5r+z9ANZCuQAXP37
         GCb+ynfRxAzxCbn1ByIkSmyB4eErz10nVxEKIljUSrfi/X/4gMON66aMCYBhyz+VD235
         qL6Ms9C0v1xM6ai0qnLWF6BuZOhZ2xpuxCCELOiy1tNHwXWqLw5Ofkf78lfiF4B9/PcU
         4SSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788972120; x=1789576920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/PVQoRJaxnOVHklysY+eFPRn0PjfeKzNOqRGrKxgA1Q=;
        b=KMdV5HJZLLIGtdTClDxjzcAuheXnvNce1P1lhEryWKx2i8eALdZs63zfXF+uUbfM2C
         XToTkhlCI+ek3ljZF0Cew7UDx038xg1rJ3x+oJshyqwgORB8iiCvpAOjAv4LgcFBxBJa
         g0qiswT5jPVitQmJvPqLoRjKT359Nz4buKHHuksAgwUQnVp9GwHZ1DS5xI8+WcmpNGgK
         7Nu91E2WjY9yxcUSlcC/sFq2usp1DBmdr8iaGTJzbgoOJ06J8ibkvpSJlIZgL3VeJvqG
         ozrJJwvMMjy9d7XW0YzsoAW/Q2ZEFuXct7MHPiPDKLgizH/BUTkNWGrbndLP+Kum1SJc
         +JLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788972120; x=1789576920;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PVQoRJaxnOVHklysY+eFPRn0PjfeKzNOqRGrKxgA1Q=;
        b=Ul0XaCPq1obTH1Ai1UxE3Wv150xV6NO5foJnp7EHWvgO/YmpqJKgIXxVMX5Db9Wgjf
         BnmKJgw3PCBe8v3L/S7GwlCZNvue3DnHFX/44yWA5pKFEJ8Qq1tgFIKzs2SyPktoloSE
         M1fBP9CwfSl9u9ZyL4nWlVuxV0gkLcPu22LMD+DFxNtJTt2mAvMlr1rHBNcMp7mpeR4Y
         p6DhSll/WEfJ2Hn1JdnI73Ba2ZKxygnuFrZm0fPBLmuWfjHgmVoYtxcwZ8qh2CkEZr2b
         zcG2TehluGLnubXgxHFW37K/tWxQMhnMjX2Ko5hYWTE7lMGkWvq3bnJZn35Ms8WdF4sy
         bTZA==
X-Forwarded-Encrypted: i=1; AKwUvBzg6i0vsq4eK2FwUeJwwsm5MmTE8N4T2y4Qpdk1eUzJIWTgFd0meoVKpt3gwFGnLZAIUVRe8ppcRVM=@vger.kernel.org
X-Gm-Message-State: AFuF++kCM/0Wtpj4uGBO48auqTzyFgZ/lMW5fhhv7UQt0uQSiooORlNV
	e7eBMdwMEbxek6QdCe1J1pp6aXRCV0KoSDF+nAg75DzYu83o3ZjVPQorTonhjTO8z4Xcg4Mu4Sd
	mkVhFMDqnit4c/6fngPN/XViQylXsC2E=
X-Gm-Gg: AYBFou0mfcfPiP3Mp3uwYSYZPospRUswkIPHNkMfGL/5/NHyo1VV4LvLZ2PdJ1NQXJh
	b88mEk9LX/m+UhlI7u1/hxuVK1sGIuEfBorNDBB5zuJTf0Ttcw4n17x65pacKZEZKeMbuicnhy6
	MFG33Dav7YBb8HKkgKm+e2Dz8G5P+zpk+PcEp1ZzM1qGfSMCdERAK9GwC+KHoaAobAYDDQR8u1X
	pfKJGNjn9OQO5qVvSfFoPzGvNviw55VM3pMjhSr6GTCntWnFN6/nGq0vVjZGymTrKvamz6z0byJ
	9qHVDb50XgMPV8tD+ZKuygH8vLRPDGpbU6qMCGLnA9ScB5XfZ8WuiwuoQeEdZaaNDgnXUEN9zU6
	gmCQNDDSfjXs=
X-Received: by 2002:a05:651c:221f:b0:3a3:2585:3bc5 with SMTP id
 38308e7fff4ca-3a371a898d4mr40270231fa.3.1788972119897; Wed, 09 Sep 2026
 09:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com> <aqBT_35E-eSoN_zj@cmpxchg.org>
In-Reply-To: <aqBT_35E-eSoN_zj@cmpxchg.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 9 Sep 2026 09:41:46 -0700
X-Gm-Features: AcwNN1VWXPWfi4oFELOf49OQVDIrkZtLFgj_RbpHarRwRGht_40BlAv3JxkMu4E
Message-ID: <CAKEwX=N4aaq_oD2agTUNrUNXhaYGeQ9vxu+dywFvEFgWFi4uQg@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Kairui Song <ryncsn@gmail.com>, Chris Li <chrisl@kernel.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 11:30=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Mon, Sep 07, 2026 at 01:51:31PM +0800, Kairui Song wrote:
> > Where I've ended up is that unbounded growth is a real concern. On a
> > host with no memcg limit (root cgroup, and most desktop and embedded
> > setups), an unlimited pool means usage can keep growing, with no
> > admin visible ceiling at all. I'm not attached to xswap's percent of RA=
M
> > knob specifically, but I do think some kind of bound makes sense.
>
> Swap space is just process virtual address space, no?
>
> Swap entries already have one or more page table entries pointing to
> them, which in turn are managed by trees of vm_area_structs. That
> means rlimits apply, overcommit protection applies, and OOM killer
> attribution works as well (oom_badness()).

I tested this theory. I spinned up a process, and let it spam 0-filled
memory + swap these pages out continually.

As you predicted, oom-killer picked it up eventually. The host was
(and is) intact otherwise :)
