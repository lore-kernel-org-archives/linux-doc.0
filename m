Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930551427B
	for <linux-doc@vger.kernel.org>; Sun, 19 Nov 2023 21:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHl3hRuS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E9FC433C9
	for <linux-doc@vger.kernel.org>; Sun, 19 Nov 2023 21:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700430650;
	bh=zgiu7PKewyccP8U06neS5ipWocpbmMeaRIGLyeoZXWs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cHl3hRuSnpEYQyOt/yDeEBZciZg96QDrijvu1yCxemF6c6mDRz1pXdpdf1kGc6o2f
	 j6H5WG/TAR3kOShK1iTA3LLiObfWUrAuv5SX9wNUEXu+QIVqxtA0W95EwISdhzaciF
	 pZHy1d2WMXb6LFoe9IHi0etunN53faWhl3rWZQUvFwaPifiTO0EcDX+paE8DmMth7Y
	 SuU3njCKzFjO9rXmceBYhhwv8/MoamumbRgdqJF7WpHjbK47YlLqhDcSv9etmpphcp
	 y55KICu5IPaWqR+vDW7opigzs0fQjiLyPAO6ng7rm+VLB80egQcMTEHWDOIzbj/frx
	 SyS4S2MDy8pVw==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-77bb668d941so244098285a.3
        for <linux-doc@vger.kernel.org>; Sun, 19 Nov 2023 13:50:50 -0800 (PST)
X-Gm-Message-State: AOJu0YwD1B3Zxo4LV5FFviEMwMmVeQ+RX1GJCTQlRhuG2FjYwX6J/G2b
	RiAM0drq8obew2DHnyxQ2iJgfGpdQ+zmWeXngXPTvQ==
X-Google-Smtp-Source: AGHT+IGDSa3b6V1ktCcAlvz3eC3dX3eWzMsSdTIQeDuOrw7uz0Sm3h1kayllweq+7zBObq98O0kPxMILbaU8L6e9KgQ=
X-Received: by 2002:a17:90b:1645:b0:262:f449:4497 with SMTP id
 il5-20020a17090b164500b00262f4494497mr6088865pjb.2.1700430628843; Sun, 19 Nov
 2023 13:50:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115172344.4155593-1-nphamcs@gmail.com> <CAF8kJuN-4UE0skVHvjUzpGefavkLULMonjgkXUZSBVJrcGFXCA@mail.gmail.com>
 <CAJD7tkZ1U+YuvoBAnrXFxQDiQV2hXdbMG-gbzu64R8GLAtNAPA@mail.gmail.com>
 <CAF8kJuPTNwQM413UdeQTkMQ8HkJFyF4OWVrxJSf7uWbege0CXQ@mail.gmail.com>
 <CAKEwX=O5M-vZE5YhYQ5_CbCmXovS1XECO4ROXKWo06K880M1Mg@mail.gmail.com>
 <CAF8kJuOD6zq2VPcVdoZGvkzYX8iXn1akuYhNDJx-LUdS+Sx3GA@mail.gmail.com> <CAKEwX=NdFjemcmf27PVpgHpVHWQEo19KfApepWJBRYeyVCWvCw@mail.gmail.com>
In-Reply-To: <CAKEwX=NdFjemcmf27PVpgHpVHWQEo19KfApepWJBRYeyVCWvCw@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Sun, 19 Nov 2023 13:50:17 -0800
X-Gmail-Original-Message-ID: <CAF8kJuOCyd5r0LQ3m8fQp0GtxxNUKSmwURJH6V9aApefvX8xCA@mail.gmail.com>
Message-ID: <CAF8kJuOCyd5r0LQ3m8fQp0GtxxNUKSmwURJH6V9aApefvX8xCA@mail.gmail.com>
Subject: Re: [PATCH v5] zswap: memcontrol: implement zswap writeback disabling
To: Nhat Pham <nphamcs@gmail.com>
Cc: Yosry Ahmed <yosryahmed@google.com>, Andrew Morton <akpm@linux-foundation.org>, tj@kernel.org, 
	lizefan.x@bytedance.com, Johannes Weiner <hannes@cmpxchg.org>, 
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>, Seth Jennings <sjenning@redhat.com>, 
	Dan Streetman <ddstreet@ieee.org>, Vitaly Wool <vitaly.wool@konsulko.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeelb@google.com>, Muchun Song <muchun.song@linux.dev>, 
	Hugh Dickins <hughd@google.com>, corbet@lwn.net, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm <linux-mm@kvack.org>, kernel-team@meta.com, 
	LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 19, 2023 at 11:08=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Sun, Nov 19, 2023 at 1:39=E2=80=AFAM Chris Li <chrisl@kernel.org> wrot=
e:
> >
> > On Sat, Nov 18, 2023 at 11:23=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> =
wrote:
> > >
> > > Hmm how about this - in the future, we support the following
> > > options:
> > >
> > > 1. zswap.writeback =3D=3D 1: no limitation to zswap writeback.
> > > All backing swap devices (sorted by priorities?) are fair game.
> > >
> > > 2. zswap.writeback =3D=3D 0: disable all forms of zswap writeback.
> > >
> > > 3. zswap.writeback =3D=3D <tiers description>:  attempt to write to e=
ach
> > > tier, one at a time.
> >
> > We can merge the zswap.writeback as it is for now to unblock you.
> >
> > For the future. I think we should remove zswap.writeback completely.
>
> I'm a bit weary about API changes, especially changes that affect
> backward compatibility. Breaking existing userspace programs simply
> with a kernel upgrade does not sound very nice to me.
>
> (although I've heard that the eventual plan is to deprecate cgroupv1
> - not sure how that is gonna proceed).
>
> Hence my attempt at creating something that can both serve the
> current use case, while still remaining (fairly) extensible for future
> ideas.

With that reasoning, the "swap.tiers" would serve better than "zswap.writeb=
ack",
do you think so?

>
> >
> > Instead we have:
> >
> > swap.tiers =3D=3D <swap_tier_list_name>
> > swap.tiers =3D=3D "all" all available swap tiers. "zswap + swap file".
> > This is the default.
> > swap.tiers =3D=3D "zswap" zswap only, no other swap file. Internally se=
t
> > zswap.writeback =3D 0
> > swap.tiers =3D=3D "foo" foo is a list of swap devices it can use. You c=
an
> > define your town custom swap tier list in
> > swap.tiers =3D=3D "none" or "disabled" Not allowed to swap.
>
> swap.tiers =3D=3D "none" or "disabled" means disallowing zswap as
> well, correct?

Correct, no swap at all.

>
> >
> > "all", "zswap", "none" are reserved keywords.
> > "foo", "bar" etc are custom lists of swap tiers. User define custom
> > tier list in sys/kernel/mm/swap/tiers:
> > ssd:zswap,/dev/nvme01p4
> > hdd:/dev/sda4,/dev/sdb4
>
> I don't have any major argument against this. It just seems a bit
> heavyweight for what we need at the moment (only disabling
> swap-to-disk usage).

The first milestone we just implement the reserved keywords without
the custom swap tier list.
That should be very similar to "zswap.writeback". Instead of writing 0
to "zswap.writeback".
You write "zswap" to "swap.tiers". Writing "none" will disable all
swap. Writing "all" will allow all swap devices.
I consider this conceptually cleaner than the "zswap.writeback" =3D=3D 0
will also disable other swap types behavior. "disabled zswap writeback
=3D=3D disable all swap" feels less natural.

> I'll let other people weigh in about this of course.
> Johannes, how do you feel about this proposed API?
>
> >
> > That would define two custom tiers. "ssd" can use zswap then /dev/nvme0=
1p4.
> > The exact name of the "swap.tiers" and tiers name are open to suggestio=
ns.
> >
> > >
> > > The first two are basically what we have for this patch.
> > > The last one will be added in a future patch.
> > >
> > > This is from the userspace perspective. Internally, we can modify
> > > memcg->writeback to be a pointer or a struct instead of this bool.
> > > (as you suggested).
> >
> > Internally I would suggest memcg->swaptiers, the write back name is
> > somewhat confusing. As your patch indicated. It has two situation:
> > 1. shrinking from zpool to real swapfile. The write back is appropriate=
 here.
> >  2. zswap store failed (compression ratio too low, out of memory etc).
> > The write back is confusing here. It is more like writing through or
> > skip.
> >
> > >
> > > This way, the API remains intact and backward compatible
> > > (and FWIW, I think there are still a lot of values in having simple
> > > options for the users who have simple memory hierarchies).
> >
> > swap.tiers can be simple. For example, you can modify your patch to
> > "swap.tires =3D=3D zswap" to
> > set zswap.writeback bool to 0 for now. Most of your patch is still re-u=
sable.
> >
>
> I'm less concerned about internals - that is always up to changes.
> I'm a bit more concerned with the API we're exposing to the users.

Me too. I think we are in agreement here. That is why I think
"swap.tiers" is more general.

>
> > I think we should discuss if we want to keep zswap.writeback in the
> > future because that would be some code undeletable and functionally
> > overlap with swap.tiers
>
> This is a fair point.

If you think we have the risk of not being able to obsolete
"zswap.writeback", then it would be much better not to introduce
"zswap.writeback" in the first place. Just have a minimal
implementation of "swap.tiers" instead. I believe from the code
complexity point of view, the complexity should be very similar.

Chris
