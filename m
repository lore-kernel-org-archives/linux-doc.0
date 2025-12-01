Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3C421CC4F
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 07:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764575173; cv=none; b=QXpc0mY6N4nDkJ7I0DcbtgvtHX8SZQT4p+xPu4SNbevJLlu0dh2m62oJd/fMe1TljlB6Nik2rqJ1Jfg09Amn6bg/5Ixoj/rwoq/WQMWAfOJbyWJvC+QHjgu7RfeCW8u+quI9achihICmEXLEzbYNLVKkLgytRdIXWAt8OS/79T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764575173; c=relaxed/simple;
	bh=z4Qw6ZF6paQoikv3RZy9LGWvCIQPhP/iHQ9t+6I6x7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+gvOhkN8gDaP07ZM8CFfWTn4MbYm/JFK3GPZMXheIC7yGWBT+bzF86rMjsKd36ZOhih4LfA1nKqeIUMb++pe2FEboAVvD+49ygBy4nfNRdyn0nwtWTKk2ePIXTUZYn/21cBnop1WI6X3X6RwLjlmyltRH+twjTx+Dx/IVipbPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsRv4+lp; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsRv4+lp"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b22624bcdaso464752785a.3
        for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 23:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764575167; x=1765179967; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41z4A7AA8zEfkiS9IW0UMmWvbzqrd+DDt90+p653r9c=;
        b=NsRv4+lp77+z3U6TMrUsoFsPGroPM9ZlsdR784Xbib/mHMPP3hmYwA2MuA+CL5V4MA
         2BGQP/TtN2v8fZ1WewITfIrj0d8t7IfpR7E3UPuNX77lWKcnyue+2aIytXjq5DBdMqcO
         miXVa4Fzf4y4BYNns01nN/3AlgFy2IjL1b8a+ieLAE/c0yVqnqg1I+KCUYq69f3diSQI
         Q+MRyMmbaCI9tR/J+rcQWNXy5RI3EvjLCd9Xj+A4V5PnuZ7fztOlk2yOpOclX5QO29mh
         voVtus7aEBQIkbQUL2ezxchNdmJL1GdSosmfHdeXJq2NWDaaYsJSeuIu/+3NR0SpQQHe
         BUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764575167; x=1765179967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=41z4A7AA8zEfkiS9IW0UMmWvbzqrd+DDt90+p653r9c=;
        b=IbogeYJWsQnZDJyBI5d3fv2JbIiiosDZT4TGoioN2SBPrZRWjIaofZ65EdDdgBVRFc
         kgxe1HVllIWZzcxAMKmf7jmr6iNSrxwct3+vRhGRJlROPEsTRuQUvTUYRVy3wNggRn4Q
         l60AIc+7Ey9CHvDNneCM2cRrnuQ2laczK/3Snu0FKJq4lYCVZzpf23ykg3zjHOX73X79
         nlhfOPBbv+Wk6Dyg8YhfPweyni2+f90+Zje81jMeN7ex4DVBOPER3fxmqObrAowukgJ9
         6uxPaFT7xSS9+qE/Rhqkh8YpiAxdMdEu6L4VgdZIn/qOlsqQZcjBskO3ufVp5iVV5X8q
         kxFg==
X-Forwarded-Encrypted: i=1; AJvYcCUWTvdp5UP/SXqYZh6Dw/uPYHDjia3d5+bHszZu7HXsTcmojVPbyApS/tFwAUCbIkdjYz4T0X3H6Ns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxab7Vn7oaDkjTRSnz/ZO6sBhG3td2Mca7smEeCKdRe26vujneE
	NwgDDJ0In6BivfteXwOaio5eih3TRaEHNqTbmxDa9CtmeA9KbXf9QazHAxFV8VWbFyv0ahcO+B+
	I104pZCc3c26vMFvV6eHLrklxnIQintkEiMCNq3Q=
X-Gm-Gg: ASbGncvrY5gAQgwHEGxhscq+Tu9Kdsf+JI1HtNSgPaV56RyT9uaklee63Q2VJNpr0dT
	qVD3lxDsKofDOf7p+7dA9JsiLBECaX3i5J0F6OzHpibQWwXWZCUEbgwvwMqDtxjKZ6J0M13fxvt
	WZUGXWvSLjC0wuUgrCDO2pllGnP2t4e4m40CuMxYnFTg3wN/19KK7fb/JqPPuqHzZWZCbd0nGYd
	LkFot2e5BcVaENXhuazc/1ytfeXH79WCOeTgzwF/mOOksm588A66bzDlRWp7ienjE08vA==
X-Google-Smtp-Source: AGHT+IGqwnjgmfy7EqzITV88vMnRPycjMmKiyI5mIf529ef5ciB182DPeOKwE99J/PSeSRK6P2V8fdv2RyhwoORqyXM=
X-Received: by 2002:a05:620a:31a6:b0:8b2:ed02:21ea with SMTP id
 af79cd13be357-8b33d49b0f2mr4792072885a.67.1764575167356; Sun, 30 Nov 2025
 23:46:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128025315.3520689-1-wangzicheng@honor.com>
 <aSm800KsCAptVZKu@casper.infradead.org> <ti7h5cbrg5s3zf7surof3zmxb6supnl34x7hsbziqutm7r2laf@zuunap5hwsbx>
 <CAGsJ_4xJ5qMght93FQOYrk1OiJTh-wFC4e8Nd4K0A156N3ZEBQ@mail.gmail.com> <86c62472b5874ea2833587f1847958df@honor.com>
In-Reply-To: <86c62472b5874ea2833587f1847958df@honor.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 1 Dec 2025 15:45:56 +0800
X-Gm-Features: AWmQ_bn9tH9Nt6hi5IKbA74esNHYlxcCTecj4tqskduI27poYGIU-ulp06YqJ6E
Message-ID: <CAGsJ_4w1jEej+ROuLta3MSuo4pKuA5yq7=6HS5yzgK39-4SLoA@mail.gmail.com>
Subject: Re: [PATCH 0/3] mm/lru_gen: move lru_gen control interface from
 debugfs to procfs
To: wangzicheng <wangzicheng@honor.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, 
	"david@redhat.com" <david@redhat.com>, "axelrasmussen@google.com" <axelrasmussen@google.com>, 
	"yuanchu@google.com" <yuanchu@google.com>, "mhocko@kernel.org" <mhocko@kernel.org>, 
	"zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, 
	"shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "weixugc@google.com" <weixugc@google.com>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, 
	"surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, wangtao <tao.wangtao@honor.com>, 
	wangzhen 00021541 <wangzhen5@honor.com>, zhongjinji 00025326 <zhongjinji@honor.com>, 
	Kairui Song <ryncsn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 2:50=E2=80=AFPM wangzicheng <wangzicheng@honor.com> =
wrote:
>
> Hi Barry,
>
> > Hi Liam,
> >
> > I saw you mentioned me, so I just wanted to join in :-)
> >
> > On Sat, Nov 29, 2025 at 12:16=E2=80=AFAM Liam R. Howlett <Liam.Howlett@=
oracle.com>
> > wrote:
> > >
> > > * Matthew Wilcox <willy@infradead.org> [251128 10:16]:
> > > > On Fri, Nov 28, 2025 at 10:53:12AM +0800, Zicheng Wang wrote:
> > > > > Case study:
> > > > > A widely observed issue on Android is that after application
> > > > > launch,
> > >
> > > What do you mean by application launch?  What does this mean in the
> > > kernel context?
> >
> > I think there are two cases. First, a cold start: a new process is fork=
ed to
> > launch the app. Second, when the app switches from background to
> > foreground, for example when we bring it back to the screen after it ha=
s
> > been running in the background.
> >
> > In the first case, you reboot your phone and tap the YouTube icon to st=
art
> > the app (cold launch). In the second case, you are watching a video in
> > YouTube, then switch to Facebook, and later tap the YouTube icon again =
to
> > bring it from background to foreground.
> >
> Thanks for the explain, that's exactly what I meant.
>
> Android lifecycle model isn't obvious outside the Android context. I=E2=
=80=99ll make that
> clearer in the next version.
> > >
> > > > > the oldest anon generation often becomes empty, and file pages ar=
e
> > > > > over-reclaimed.
> > > >
> > > > You should fix the bug, not move the debug interface to procfs.  NA=
CK.
> > >
> > > Barry recently sent an RFC [1] to affect LRU in the exit path for
> > > Android.  This was proven incorrect by Johannes, iirc, in another
> > > thread I cannot find (destroys performance of calling the same comman=
d).
> >
> > My understanding is that affecting the LRU in the exit path is not gene=
rally
> > correct, but it still highlights a requirement: Linux LRU needs a way t=
o
> > understand app-cycling behavior in an Android-like system.
> >
> > >
> > > These ideas seem both related as it points to a suboptimal LRU in the
> > > Android ecosystem, at least.  It seems to stem from Androids life
> > > (cycle) choices :)
> > >
> > > I strongly agree with Willy.  We don't want another userspace daemon
> > > and/or interface, but this time to play with the LRU to avoid trying
> > > to define and fix the problem.
> > >
> > > Do you know if this affects others or why it is android specific?
> >
> > The behavior Zicheng probably wants is a proactive memory reclamation
> > interface. For example, since each app may be in a different memcg, if =
an
> > app has been in the background for a long time, he wants to reclaim its
> > memory proactively rather than waiting until kswapd hits the watermarks=
.
> >
> > This may help a newly launched app obtain memory more quickly, avoiding
> > delays from reclamation, since a new app typically requires a substanti=
al
> > amount of memory.
> >
> > Zicheng, please let me know if I=E2=80=99m misunderstanding anything.
>
> Yes, but not least.
>
> 1. proactive memory reclaim: yes, that's we are after.
> When an app is swiped away and kept in the background and not use for a w=
hile,
> proactively reclaiming its memcg can help new foreground apps get memory
> faster (instead of paying the cost of direct reclaim).
>
> 2. Anon v.s. File: *bias more towards anonymous* pages for background app=
s.
> With mglru, however, the oldest generations often contain almost no anon =
pages,
> so simply tuning swappiness cannot achieve that -- reclaim will still cle=
ar file cache
> in the old generations first.
> To some extent, file caches are `over-reclaimed` in such senario, leading=
 to a disaster
> when user=E2=80=91interaction threads get stuck in direct reclaim of anon=
 pages.

I strongly recommend separating this from your patchset. Avoid including
unrelated changes in a single patchset.

MGLRU has a mechanism to ensure that file and anon pages can keep pace
with each other. In the newest kernel, the minimum generation is 2. For
example, if anon has only 2 generations left and we decide to reclaim
anon folios, we will fall back to reclaiming file pages. Sometimes,
this means that anon reclamation is insufficient while file pages are
over-reclaimed.

static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
                       struct scan_control *sc, int type, int tier,
                       struct list_head *list)
{
        ...
        if (get_nr_gens(lruvec, type) =3D=3D MIN_NR_GENS)
                return 0;
        ...
}

This is probably not a bug, but this design can sometimes work
suboptimally.

Regarding this issue, both Kairui (from the Linux server side, cc-ed) and I
(from the Android side) have observed it. This should be addressed in
MGLRU's code, and we already have kernel code for that. It is unrelated
to your patchset, so you shouldn=E2=80=99t include so many unrelated change=
s in
a single patchset.

Please keep your patchset focused solely on whether the MGLRU proactive
reclamation interface should be promoted to sysfs (LRU_GEN already has a
folder in sysfs) instead of debugfs, if there is a v2.

The following is quoted from
`Documentation/admin-guide/mm/multigen_lru.rst`.

Proactive reclaim
-----------------
Proactive reclaim induces page reclaim when there is no memory
pressure. It usually targets cold pages only. E.g., when a new job
comes in, the job scheduler wants to proactively reclaim cold pages on
the server it selected, to improve the chance of successfully landing
this new job.

Users can write the following command to ``lru_gen`` to evict
generations less than or equal to ``min_gen_nr``.

    ``- memcg_id node_id min_gen_nr [swappiness [nr_to_reclaim]]``


>
> See the case in the cover letter.
> ```
> memcg    54 /apps/some_app
> node     0
> 1     119804          0       85461
> 2     119804          0           5
> 3     119804     181719       18667
> 4       1752        392         244
> ```
>
>
> Since the semantic gap between user/kernel space will always exist.
> It would be great benefits for leaving some APIs for user hints, just lik=
e
> mmadvise/userfault/para-virtualization.

Nope. This is just an internal detail of MGLRU and shouldn=E2=80=99t be exp=
osed
as an interface.
Hopefully, Kairui or I will send a patchset soon to address the balance
issue between file and anon pages. For now, you can use `swappiness=3D201`
as a temporary workaround. Take a look at bytedance's patchset.[1]

> Exposing such hints to the kernel can help improve overall system perform=
ance.

[1] https://lore.kernel.org/linux-mm/cover.1744169302.git.hezhongkun.hzk@by=
tedance.com/

Thanks
Barry
