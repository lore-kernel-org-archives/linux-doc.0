Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F4/J1NV8"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1CD010F
	for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 10:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702577027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KV6ZB3o2DsttdivkrpbVEQo8ahsA1p8sk0He110IETY=;
	b=F4/J1NV8Z88pVOp4Fnhk7GLtmwL2Isn2VIiPmao+bgxn0c7/QckUja9TLx++eNUTSPsuwc
	cqsOvM4+Sre7tucS/3y6qu4J7CxJQl6FbZyaHPoper+Okv/S1d4GOM6xVlk/XIToEjETmS
	lmRb74FCRjywaA0p0FXLKGe5qisCawI=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-M05HQ-vAMJm1zJdUoU6SKg-1; Thu, 14 Dec 2023 13:03:46 -0500
X-MC-Unique: M05HQ-vAMJm1zJdUoU6SKg-1
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-dbcec98047bso608227276.3
        for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 10:03:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702577025; x=1703181825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KV6ZB3o2DsttdivkrpbVEQo8ahsA1p8sk0He110IETY=;
        b=FcMkE/aphFvYMOMwMFilulFfTMDZKNq9mvQBlv6Ta2xInPEb2YcpHf9DNC33IcGvCp
         tLDjeypO+YcIw66wNgqK+afb7TyFw8itk6t158Of02iC9uNcFe/4jaJhQBdnSuLVohob
         P9zImTs7SB8mSd8BrSkyukSMf0hQBkLHPD/HInNoRqo0LHj0Lh9kWa6NResZU/AS4BI9
         enPcZaPO4fVBsqi6Ma0SErfmlF5Wzf6x6uYejTiVxN4VFBgbEuycZjfE9enG4zTllNzI
         wrGVrjpgBjLvtvy688VmCTZBseVlaJF4XJY3ZtOELhLo+MjM6hLHFjwjAOWiceCuT3LY
         vQ5Q==
X-Gm-Message-State: AOJu0YzNtTTuL6S1SyLWswEZmxC6SsBvz18HfPzjpewLPtkdE9dFUbzq
	IWBRqwNe6dlK0nxYa1+RxJjSK9PfnkB6R8rqZ+85svfdF1ITFYRVcWhPHAsMsdEfmMI4K87Wl4y
	qJ4i548HIHiyQVHqlhxjXSb0e5t7Q/sKI3KOg
X-Received: by 2002:a25:8b82:0:b0:da0:7d1e:6e0 with SMTP id j2-20020a258b82000000b00da07d1e06e0mr6217163ybl.20.1702577025477;
        Thu, 14 Dec 2023 10:03:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOtTvkZAGQiIIv+g8QO+ItWnLPDGZBYRujSgmnUfQr/bqu7pkE9KVJpcDeQugMue98gzjpMs0GUsyYEi7yQ54=
X-Received: by 2002:a25:8b82:0:b0:da0:7d1e:6e0 with SMTP id
 j2-20020a258b82000000b00da07d1e06e0mr6217125ybl.20.1702577024965; Thu, 14 Dec
 2023 10:03:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207192406.3809579-1-nphamcs@gmail.com> <CAF8kJuPEKWbr_1a-OzqrYKSPmuty==KhC2vbTPAmm9xcJHo4cg@mail.gmail.com>
 <CAKEwX=Oj0Rur8i9Oo7y2Py7svx-g11sEj3GKQfMVL62x=4hvdA@mail.gmail.com>
 <CAF8kJuNpnqTM5x1QmQ7h-FaRWVnHBdNGvGvB3txohSOmZhYA-Q@mail.gmail.com>
 <20231209034229.GA1001962@cmpxchg.org> <ZXeTb_ACou7TEVsa@google.com>
 <20231214171137.GA261942@cmpxchg.org> <CAOUHufbvafDiURT9qBjKPpRSNwc60S-bDg2yMH_m4bNSWQcV4g@mail.gmail.com>
In-Reply-To: <CAOUHufbvafDiURT9qBjKPpRSNwc60S-bDg2yMH_m4bNSWQcV4g@mail.gmail.com>
From: Fabian Deutsch <fdeutsch@redhat.com>
Date: Thu, 14 Dec 2023 19:03:28 +0100
Message-ID: <CA+PVUaRmTDbVE+CP3AQXEzcucRG3mgXSG5Yj-LbCBX=kkZM18g@mail.gmail.com>
Subject: Re: [PATCH v6] zswap: memcontrol: implement zswap writeback disabling
To: Yu Zhao <yuzhao@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Minchan Kim <minchan@kernel.org>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org, tj@kernel.org, 
	lizefan.x@bytedance.com, cerasuolodomenico@gmail.com, yosryahmed@google.com, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, 
	muchun.song@linux.dev, hughd@google.com, corbet@lwn.net, 
	konrad.wilk@oracle.com, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm@kvack.org, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, david@ixit.cz, Kairui Song <kasong@tencent.com>, 
	Zhongkun He <hezhongkun.hzk@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 6:24=E2=80=AFPM Yu Zhao <yuzhao@google.com> wrote:
>
> On Thu, Dec 14, 2023 at 10:11=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.=
org> wrote:
> >
> > On Mon, Dec 11, 2023 at 02:55:43PM -0800, Minchan Kim wrote:
> > > On Fri, Dec 08, 2023 at 10:42:29PM -0500, Johannes Weiner wrote:
> > > > On Fri, Dec 08, 2023 at 03:55:59PM -0800, Chris Li wrote:
> > > > > I can give you three usage cases right now:
> > > > > 1) Google producting kernel uses SSD only swap, it is currently o=
n
> > > > > pilot. This is not expressible by the memory.zswap.writeback. You=
 can
> > > > > set the memory.zswap.max =3D 0 and memory.zswap.writeback =3D 1, =
then SSD
> > > > > backed swapfile. But the whole thing feels very clunky, especiall=
y
> > > > > what you really want is SSD only swap, you need to do all this zs=
wap
> > > > > config dance. Google has an internal memory.swapfile feature
> > > > > implemented per cgroup swap file type by "zswap only", "real swap=
 file
> > > > > only", "both", "none" (the exact keyword might be different). run=
ning
> > > > > in the production for almost 10 years. The need for more than zsw=
ap
> > > > > type of per cgroup control is really there.
> > > >
> > > > We use regular swap on SSD without zswap just fine. Of course it's
> > > > expressible.
> > > >
> > > > On dedicated systems, zswap is disabled in sysfs. On shared hosts
> > > > where it's determined based on which workload is scheduled, zswap i=
s
> > > > generally enabled through sysfs, and individual cgroup access is
> > > > controlled via memory.zswap.max - which is what this knob is for.
> > > >
> > > > This is analogous to enabling swap globally, and then opting
> > > > individual cgroups in and out with memory.swap.max.
> > > >
> > > > So this usecase is very much already supported, and it's expressed =
in
> > > > a way that's pretty natural for how cgroups express access and lack=
 of
> > > > access to certain resources.
> > > >
> > > > I don't see how memory.swap.type or memory.swap.tiers would improve
> > > > this in any way. On the contrary, it would overlap and conflict wit=
h
> > > > existing controls to manage swap and zswap on a per-cgroup basis.
> > > >
> > > > > 2) As indicated by this discussion, Tencent has a usage case for =
SSD
> > > > > and hard disk swap as overflow.
> > > > > https://lore.kernel.org/linux-mm/20231119194740.94101-9-ryncsn@gm=
ail.com/
> > > > > +Kairui
> > > >
> > > > Multiple swap devices for round robin or with different priorities
> > > > aren't new, they have been supported for a very, very long time. So
> > > > far nobody has proposed to control the exact behavior on a per-cgro=
up
> > > > basis, and I didn't see anybody in this thread asking for it either=
.
> > > >
> > > > So I don't see how this counts as an obvious and automatic usecase =
for
> > > > memory.swap.tiers.
> > > >
> > > > > 3) Android has some fancy swap ideas led by those patches.
> > > > > https://lore.kernel.org/linux-mm/20230710221659.2473460-1-minchan=
@kernel.org/
> > > > > It got shot down due to removal of frontswap. But the usage case =
and
> > > > > product requirement is there.
> > > > > +Minchan
> > > >
> > > > This looks like an optimization for zram to bypass the block layer =
and
> > > > hook directly into the swap code. Correct me if I'm wrong, but this
> > > > doesn't appear to have anything to do with per-cgroup backend contr=
ol.
> > >
> > > Hi Johannes,
> > >
> > > I haven't been following the thread closely, but I noticed the discus=
sion
> > > about potential use cases for zram with memcg.
> > >
> > > One interesting idea I have is to implement a swap controller per cgr=
oup.
> > > This would allow us to tailor the zram swap behavior to the specific =
needs of
> > > different groups.
> > >
> > > For example, Group A, which is sensitive to swap latency, could use z=
ram swap
> > > with a fast compression setting, even if it sacrifices some compressi=
on ratio.
> > > This would prioritize quick access to swapped data, even if it takes =
up more space.
> > >
> > > On the other hand, Group B, which can tolerate higher swap latency, c=
ould benefit
> > > from a slower compression setting that achieves a higher compression =
ratio.
> > > This would maximize memory efficiency at the cost of slightly slower =
data access.
> > >
> > > This approach could provide a more nuanced and flexible way to manage=
 swap usage
> > > within different cgroups.
> >
> > That makes sense to me.
> >
> > It sounds to me like per-cgroup swapfiles would be the easiest
> > solution to this.
>
> Someone posted it about 10 years ago :)
> https://lwn.net/Articles/592923/
>
> +fdeutsch@redhat.com
> Fabian recently asked me about its status.


Thanks Yu!

Yes, I was interested due to container use-cases.

Now a few thoughts in this direction:
- With swap per cgroup you loose the big "statistical" benefit of
having swap on a node level. well, it depends on the size of the
cgroup (i.e. system.slice is quite large).
- With todays node level swap, and setting memory.swap.max=3D0 for all
cgroups allows you toachieve a similar behavior (only opt-in cgroups
will get swap).
- the above approach however will still have a shared swap backend for
all cgroups.

