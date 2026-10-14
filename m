Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFCD55198F
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 17:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998284; cv=pass; b=c1iKl+/+tNz4H+9INzyZMh71EPuKUt3EWMOeIkt5i1B+V2jlwLkBlMzXHV3rC+to4uQEAfBiJFggWlOvrhEuxVF4HhkX0JHvx/wzLrUexPd98xOBG+SBrhbvdS0DszafscxPDpPDXfbutmR9I9nzjqxZ/iR6GxoyX8OuTe0CZGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998284; c=relaxed/simple;
	bh=6AlnkTkjE6lopU0pv/Z4Z7ogvXCpr+/YMU8OabuGy9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sxHtYcujch162NpGGIMHN6OZMcRqoqyWhoefXb52qGC24Upv3tDRxJP+eEVtGC/HjXf1Cd0NyOhnRYf4IjhJM269tOn07TpvvxtwPwlaz6V5aaKM+Z2cpx8Kb3SQ4dbSHckGAkFulZ/ADIj2C+0j8+ue/DGhYhNK/I5rjflkxq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPCaC9P3; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPCaC9P3"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e62319cfaso134962966b.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 10:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791998279; cv=none;
        d=google.com; s=arc-20260327;
        b=icUmkYB2d0foabDmA/fuxa27Hh5k9UZc90qxZXTK3fGflE8EUzJViqE5hyjkqyULk4
         rJAYhmHWJmgnMqf342hDI/V8Ly3rIN2vVKZ9fUZpLElpLPv6n0UJHiQiN/D0678CJyWy
         H37TADHbl2xdUCc90Zt3S8zcX4z3tLGYskDV1P+UbejK7yA7WI4V3exEo/8Th+bok0U2
         0EKJu7A5OTwRHybfthUF+SfgSgxwk0os/9RupS4sj+WMCVS7CeedU9sfXrKRAjAqRjIz
         ttJ1xmS+xBi0hGHxLUUVjZtfVm/zhNV7sKmDBPGVCK3qktDpKZU/PS87YVIp+KnluFpG
         tjoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6AlnkTkjE6lopU0pv/Z4Z7ogvXCpr+/YMU8OabuGy9c=;
        fh=euOZPNeu3KKWG0DxdLTYYobxGKYRHLKQgJ4pTgIh7os=;
        b=VdMc9jX9EVly2lYF6zsS8CjegI0nL9aYn142bgyF2P2WTUqCf0bIpmeHGQR6vxTZ0I
         YIfp9RQoWOH+534VMWTyksM+6hdFuErq9HXBFs0s/swipr1cEk8Lw5JkqpzYpy0oNe/f
         XM5jCqr4EWVq5dy4C5985uVf2ir4WQLxZ7FvSEITt7PU+PDfIPwNiFIkuW/K8mXZNAQ4
         yO0YJM1R4QtXnqI/EcMXExyARP2MxGuOcSeVb611i031GnWRjS3Y4SD+TRTwbJJa+TEW
         cuzAqDms3y2Wkzb0plzLzrB/lEoVSex8ugAia3PGXm5xBcfeVVdGov7Kp+nQ97Yxs7Q+
         q5Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791998279; x=1792603079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6AlnkTkjE6lopU0pv/Z4Z7ogvXCpr+/YMU8OabuGy9c=;
        b=KPCaC9P3P2y22bkAyLvjKraTjwh1N1vVQTL/iB8fya8NDHdqPNv5ygDFxb4KSATgLD
         LqDIozf4DkloJ218mEYbMFEOzRA2TNIimODtRoVXZiEvwuHV6TIrkaYCvOJwgtBRFrxb
         eRLz+s5pLotbiuiZM83Rr/cUOgGe77W0Wt+r7ft5jQ1jTuqj59RW6+74wtMv6BmpqrqV
         kyk6dnVBiouO1hwbxEXgZ6t5FHHKnsG+kGLzs6mr1UAHLYO4WIjckYsHolsNnBmziipT
         yx5Y2mRB8rYocFaAhPXe5JDM8yNl9qoSCTkZ8OBJuzZVInR2bTbPcbD7UIluF5RoVQI8
         54Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791998279; x=1792603079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6AlnkTkjE6lopU0pv/Z4Z7ogvXCpr+/YMU8OabuGy9c=;
        b=Wj8WEJJqwGDBOreN/5uJuJNyxMaZ3w/QquVTlBoNVGeIjGDQsVdiBGqfhaX+Zwqy+W
         ncvIuFWTl4inJmy/emIORF+o407C7U9Qw9wcsnArcAbN5WaTgFfGeg8N9BlzSmmPmjcw
         qnvGyTsW0TEbyLpvZCDx+Tw8ithKCWIga493sWcMm9XgsmEsmQ3m0lcTesF1dqukogd0
         AXZCU5Wi1OdiAJoJ1tF51uXG+pxymhL5tlZmnGRnfWm+pogNr/KZi53R34H+Bv6Khv3I
         39SK2rVGRHcyBGPmCqPFVqKnheumYklJmmnZhy7Wp19df5PCVAm+OlHUgZtkQeAwv4Vx
         5dZA==
X-Forwarded-Encrypted: i=1; AKwUvBzUjqVEmWZyX3s/zKotAeGzzjMXD3HvTnW8vgUcYSvmJ5/65L4qnH/psMUyYM8CBX/HU8+YHj0egwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ3flXbl8qIfLQOkf370ilOdchgB3AgZ+G1DJGunLxthTjKahE
	6Z2iliKBj0djOAuEb6PtzXtFyoiY11AYTx+0TivOLDw7sQiRMRi0KGu6pnU+2pN6B75q3zlmQ6S
	NasW+1RCcFR+Rn2EcTIkQbchj43w+9gc=
X-Gm-Gg: AYBFou3oZVv6Rd3vedOaCG6VNqyqrXnIQDUmdGDcSVx50R9iQgjsCpnok2RaHEaTwDn
	AVaVN7NbD87jzX5HR64BB9VgQImdOr2Wj3SQycMioSvm5DY99bEPcqd/N4AxV9kk1xEslgOdnKA
	08l1WQFtAN+bqItos8GEjntrXcRu6MeXMO1aXH/9aVIkRyA4/IA5YIZVto2/PckXRu9EgTW8kkl
	V0G9pepLfF/+KeH7seRCe1VRNGzwFDHujIdNvISTf1zsKFdBYNPtHIavyXsyZw9HUPRvDe2Pixs
	I+92OX1A3jgZWyuFVHf3dIIieBlhitom0WyaGHxJD5xeRhqAXHpvW0jHipo4oqH+DHPzLPLCDfH
	0/rzEi4WM0mKtHEigLH/n1wE=
X-Received: by 2002:a17:907:9449:b0:c29:3821:ae6c with SMTP id
 a640c23a62f3a-c31aa09a358mr1693259966b.37.1791998279045; Wed, 14 Oct 2026
 10:17:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org> <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora> <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org> <CACePvbVTnCOh51jvEpkDJ32idvCubgN1eHBps6vESjhVC8E_aQ@mail.gmail.com>
In-Reply-To: <CACePvbVTnCOh51jvEpkDJ32idvCubgN1eHBps6vESjhVC8E_aQ@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 15 Oct 2026 01:17:21 +0800
X-Gm-Features: AclHuK-maXeDqE6RBGOs7KQg41zXWuvLhO_tf3Hmyu48dJ37MpyAz42TW_3WsI8
Message-ID: <CAMgjq7D_=_4ZsCWJYywpZhPtg+YeH8o=ymRrV3sQ_58G6rs0sg@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Chris Li <chrisl@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nhat Pham <nphamcs@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
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

On Tue, Oct 13, 2026 at 1:27=E2=80=AFPM Chris Li <chrisl@kernel.org> wrote:
>
> On Mon, Oct 5, 2026 at 5:19=E2=80=AFAM David Hildenbrand (Arm) <david@ker=
nel.org> wrote:
> >
> > On 9/22/26 15:38, Chris Li wrote:
> > > On Mon, Sep 21, 2026 at 8:56=E2=80=AFAM Nhat Pham <nphamcs@gmail.com>=
 wrote:
> > >>
> > >> On Fri, Sep 18, 2026 at 11:50=E2=80=AFPM Chris Li <chrisl@kernel.org=
> wrote:
> > >>> No that time slot is too late for Asia developers. I don't think we
> > >>> should use that time slot for swap alignment.
> > >>>
> > >>> We should find a time slot more friendly to Asia.
> > >>
> > >> Any time slot would have that kind of problem. We're spread out acro=
ss
> > >> the globe.
> > >>
> > >> Let's just use a standardized time slot we have for MM alignment ses=
sions.
> > >
> > > There are more swap maintainers in Asia than in the US + Europe, at
> > > least based on the maintainer file. Please be more inclusive. If the
> > > alignment is done without key stakeholders, it miss the point.
> > >
> > > Sigh, we can't even align on a time slot.
> > >
> > > In that case, let's keep discussing on the mailing list. At least it
> > > is accessible to every one.
> >
> > Looking at the mailing list, that approach doesn't seem to work.
> >
> > Finding a time slot that makes US, Europe and Asia happy is ... tricky.
> >
> > 1 AM is certainly unpleasant.
> >
> > US vs. Asia is also tricky, but doable.
> >
> > China 8AM vs. US West Coast 5PM?
> >
> > China 9AM vs. US West Coast 6PM?
>
> Hi David,
>
> Thanks for organizing this. Time slot that works for Baoquan and
> Kairui should also work for me.

Let's see Baoquan and other's suggestion, both slot are fine to me as well.

>
> Hi Kairui,
>
> I understand that you have some face-to-face discussions at the
> conference. Do we have a list of what has been aligned and what is
> pending to discuss? We should have an agenda to avoid repeating
> already aligned items.

Right, from my perspective, here are the following key points we can
discuss further in the incoming meeting (most of them are not fully
concluded yet):

1. A limitation for the logical size: from my side, there are real
usages for a global non-memcg limitation of the non-physical swap
space: e.g. thin VMs as containers/pods with no cgroup limitations
inside but which need in-VM memory compression and a proper limitation
to avoid thrashing; or low-end devices/desktops that want global
(root) limitations. And also, Android have a limitation on the ZRAM
size (well for this one I'm not from Android team though so that's
just my personal development experience with Android, enlarging the
ZRAM size on several Phone swill cause serious junky of Apps due to
over compression).

Nhat is concerned that exposing the sizing allows users to tune it and
potentially misconfigure the system. However, I think a user with root
permission should be fully aware of what they are doing or they can
easily mess up the system in many ways and swap limitation is a very
minor concern to me.

I think the requirement for a logical non-cgroup limitation is strong,
but the discussion hasn't concluded on the implementation method.
Perhaps something like a Kconfig combined with an interface or command
line? More ideas are welcome.

2. Charging: If you consider memory.swap is physical only then indeed
we should not charge it, however, user are already doing that for
years so this is a behavior change and we are also pushing memsw into
memcgv2 as a interface to limit the logical memory usage of a
container. So charging of the logical space is useful, how to handle
that is tricky though.

From our usage, this should at least not block adding memsw or
anything similar for memcgv2, even if you want more customized cgroup
accounting, we need to charge it into some counter (a page counter,
not just a statistic) in some way.

3. Swapoff: This was discussed again too, as vswap was trying to
remove it. I think the concern is mostly about maintenance,
performance, and practicality. From my perspective it's a critical
component both for preventing minor or major faults before predictable
high traffic arrives, or for operations/debugging, and for releasing
the swap metadata to rule out any potential swap / page fault effect.
There are concerns about maintenance or suggestions to use MADV, while
I'll be happy to explore and improve the current in-kernel
implementation of swapoff later if needed but removing it is a really
bad idea in my view.

4. Writeback: No doubt we all agree that we definitely should have
writeback support, Nhat's concern is that we should handle the case
where some cgroup doesn't need zswap/compression and ensure that works
well.

5. Interface: Given the issues above, what should the interface look
like (swapfile, sysfs, /proc, etc.) and how should multiple
(non-physical) swapfiles be used? Nothing much is discussed about this
part though. I've heard users mention the use case of multiple
compression swap spaces, but I don't have a use case for that myself,
so I don't have many comments.

6. The one part that I think we can and should agree on it shat the
implement approach: at this point I think VM_SPARSE is the right
direction, Nhat is concerned about the testing on it, and I think we
can have more data for that, and collabration is highly encouraged. I
previously conducted many tests on everything posted from both sides,
will try to post more on this too.

That's a lot of problems already. I think we can discuss these points
further in the meeting.
