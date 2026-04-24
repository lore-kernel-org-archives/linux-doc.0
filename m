Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAE23FA5DB
	for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 19:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777060337; cv=pass; b=DNY2ImpPbD19djOEZbqCRbhZXsqmyYjHlVUzOjUBIaTy9OkSKQJ+sn4QuOWWbxi1e2SQNQDXVfexRUgeD3bB5R4qKct2tmPXjoa2pXs0rQoaYoUcwflgzqBRie6yIin7c9Y1KYJLQYIoQbND7WEmSPdD3eXybufSIFr/knQtQJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777060337; c=relaxed/simple;
	bh=wE/7ErAGo72joNqsxPMrNEQEyJ7t+edUI6j7ULKzBaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P72GdCmjavs7h6Afxia6/rtsVZKy/TvdhzAqqaQ4WV6CAfXcjmJ4c/F/ypjS0fZzOQoo9GmOytP8dEvzOyx2NUvlFxlkKCobhmjhG7BIqXQ0hKgtG2u1JDQdmYznLNJkNEeaVWv8cXEPJwxIn1IP5TrCfZyIRHiT+SI4tTxzwsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8DP27ri; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8DP27ri"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso10326262a12.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 12:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777060327; cv=none;
        d=google.com; s=arc-20240605;
        b=Idoo3W0tvtiMJzET9Tqtes9PtW6R+i0fwsOCJ+pyOiQnjgL8BkS7ZdNuaenCSx72Dv
         eSYSX5NlTMv4JjAdzgiCRcyGGvr/y8s9N/147iKyI3HClOtel/6rZDtEdZYcxd39k8an
         YpQCsQeZeouBOSRE3krMHZc4mMCdulQ4ALEr0PM82XGvYZg7ayEzU35JvbRWYGY7+dLm
         /4hQ7pY9uwmpNX1eaG91eyIB0kS3mV+8eeyzyXuBOos3+nLZwbeGkJho9Z/nrgfA9sjX
         sa4sLQIlX8jTtnHKXSBLPxGSMEPyxY3PNHZJOZAbm0yLX68LZW6Hknl5K3gZgksm5vJd
         yByw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wE/7ErAGo72joNqsxPMrNEQEyJ7t+edUI6j7ULKzBaM=;
        fh=Eq9sAJR2EHeuBugOcHkKr7Pdnq5XmUyhhsZN8QXpMNQ=;
        b=KNYBMFBLitT0w7nhUo9h6FVUs8r0zYcUZu74fCF8vZn7M8j8aYhn4f2B7v9bbyBTaM
         GhwduFmQ76KxCxWgqjwHL2zl/GZ9p3nz0ojb8lZzFxeGp+TjT2nt64bU8yWDyGSS8ZEu
         s5RpOHRxUUR0Xwp+ws0Fq0T+n5r10/0g+IVmsJYfuqW5bTCBk9XtqKZJZdvoRdE/eQj3
         CveEI7y9UnZth/4Wnj2lcjs4y1oYHhFqCstMMwgOxn8xT8lwZaamFZq44lm3DXYGLx9/
         JrKSlv+9Fj3ns6LWOpfcrBquxQHhBNcIvEDFQfRIKAcYvowEcjcsD2yaWJHySD8puga7
         IlVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777060327; x=1777665127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wE/7ErAGo72joNqsxPMrNEQEyJ7t+edUI6j7ULKzBaM=;
        b=P8DP27riXPbV32Oz8Ko4j9Ee73SVG6wBWOCcDL7dVsYxi/Mk2R+1ikwDZUE9wRnYXj
         MaEX31iCZztxlp3HjqViGs2/AFYQPpy3rfDnvCePd9Ty/UZ/KBd+3SxTGDpNhn6qPW0E
         ojgS7m4EhAoBjEyZ4SimQ9dLkLA13F/96EWtIkn7EKiaO5PnI4BHFt2idi4UrAvCuTlF
         f4mudn26z/DUyeXlW5WSX/ZUT30lNdU9COrB9yrgd59BWpnf63FKaLCLDHDytbr24OpW
         d89crHgsj7iMsQQ3umdTDsnKqtZWljzQU7IyrO8sXEXeQFpy3ab+LBBsRmb1eVr/4PSS
         xS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777060327; x=1777665127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wE/7ErAGo72joNqsxPMrNEQEyJ7t+edUI6j7ULKzBaM=;
        b=UtP7DqHACf54j10awEbG67fNyzjUqn12CGFUetnm3KloSxolFkc4uYtdCSWd1fTAVc
         KXu9kdm2XID9G8YjptZWtBdmcnxvG/ZVLSk4Jh3AmitkXwkkKUHHu/0QRxf4wii7Ot5C
         9BFlEUXy1KvRXrrM0R8dDXMSsRgp3ksEiQLMLE+sZX2hwdmiMdddNse3Nrj7OZFooaZo
         0AosTFkV5elVSNX3GZKTF/x/xB79nZE7qzgbrnLf0yehfxvZXG8zVQh8aeLylmug46OJ
         Y9y8SFpE3AR7O0C8U60vs25uSFX/TLx6skwdtGxEEu2G3QzgmmVG8tyHAm5vzSGT22k7
         oOIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SEeZtMtbbBhLYycVFB5ovTMq7NadNiLb8lTXffuj1gVeJhNdK9e4CyePb9xjOCK0s1KP6rJ28kxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVMnyU8/MGNddq+uU5oo6Z60zoH5C8OLmA142TrgRTbZH2bBSM
	64Z/TCLOFS8DaPj+4Quay9Gu8UBfoLb9dQRG18U/XIVUqyMMxg2EZ0wNVlIWLW9JMYPBfF37+vw
	VGpemYwGWBtuR2YTlK+Xh9FgutOW3dVk=
X-Gm-Gg: AeBDieuof8HNL2CeYYBacWib3ewsOmTbgWAx9tM9W/IbzwQc2db3Hc6tsMmPIypuvgL
	H2aI4RqQ6086nsjq8hoe5X/eIZftOY6JzmydtGCi6Ye3dPWsIL+wO6ceyi2pSCz8XSNE/OJj71P
	0D7EpErtZofwiA3fpQi8k3n4LcFEbbZRDwwamCZh/A5iM/JbHuazgKfZxzpUlGQogk+z3ciRAW4
	5Y+4j5YfcS8cYjXDvjTEOPTyg9DRUKzYUoHBZCpHxgYdCr6nn9YvOoZUIH3ncLSvWqBOVqJCz+E
	2jNkCGGPgPZbZaEEJX8Lp8j4vXy0+k3+hHhsi+RDnF7QaQFXFtk=
X-Received: by 2002:a05:6402:24a2:b0:670:8d90:e861 with SMTP id
 4fb4d7f45d1cf-672bfd82177mr15503860a12.6.1777060326795; Fri, 24 Apr 2026
 12:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320192735.748051-1-nphamcs@gmail.com> <aegUoOiUbjUAH5aT@google.com>
 <CAMgjq7C53WRS5oYxO157mX7JxhfoPoi34k+taiKLrMah-b-iRg@mail.gmail.com>
 <aektdlD4npMVThu3@google.com> <CAMgjq7DRrz4Hdy-s4y-C=3BmPt50LKOfdWjjf2mWmCybdRaJ4w@mail.gmail.com>
 <CAO9r8zPvApgxKiVy5NhiWup_m57huF3MTuPvo=iq5kAxjRZC8Q@mail.gmail.com>
 <CAMgjq7AGzBubCkmv7LubBjPLN1DzL472d4zUm+sGxo8ZptMgRw@mail.gmail.com>
 <CAO9r8zO+tm2J0FRC64VKCYOSuKPXX8cQG7C07SwMWKoLiwoV+w@mail.gmail.com>
 <CAMgjq7D1WXUHqAV1yuXvrUmEsE_m_+yx0mBq6teJhipx6mySbA@mail.gmail.com> <CAO9r8zMk7xTi-Txmj1+Z9=250fD8HuMQFyT1iwjTW9coLXgqoA@mail.gmail.com>
In-Reply-To: <CAO9r8zMk7xTi-Txmj1+Z9=250fD8HuMQFyT1iwjTW9coLXgqoA@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 25 Apr 2026 03:51:29 +0800
X-Gm-Features: AQROBzCsso3pTVLRZNMTqiOUBfD8dT5yym5C4wDmzSyyd7Bc0ZTx2dDcUA3zHto
Message-ID: <CAMgjq7A4+Sac9-CYkig1LFfEh5rq-4vLka8AXREei_m3svzJ7w@mail.gmail.com>
Subject: Re: [PATCH v5 00/21] Virtual Swap Space
To: Yosry Ahmed <yosry@kernel.org>
Cc: Nhat Pham <nphamcs@gmail.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	akpm@linux-foundation.org, Alistair Popple <apopple@nvidia.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Barry Song <baohua@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Baoquan He <bhe@redhat.com>, 
	Byungchul Park <byungchul@sk.com>, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Chris Li <chrisl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, David Hildenbrand <david@kernel.org>, 
	Dev Jain <dev.jain@arm.com>, Gregory Price <gourry@gourry.net>, 
	Johannes Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Lance Yang <lance.yang@linux.dev>, lenb@kernel.org, 
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Brost <matthew.brost@intel.com>, 
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, 
	Mariano Pache <npache@redhat.com>, Pavel Machek <pavel@kernel.org>, Peter Xu <peterx@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Pedro Falcato <pfalcato@suse.de>, 
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Rakie Kim <rakie.kim@sk.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Suren Baghdasaryan <surenb@google.com>, tglx@kernel.org, 
	Vlastimil Babka <vbabka@suse.cz>, Wei Xu <weixugc@google.com>, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Yuanchu Xie <yuanchu@google.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Zi Yan <ziy@nvidia.com>, 
	Meta kernel team <kernel-team@meta.com>, Rik van Riel <riel@surriel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 25, 2026 at 3:12=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e
> > https://lore.kernel.org/linux-mm/20260421055323.940344-1-youngjun.park@=
lge.com/
>
> Does this do promotion/demotion of swap entries?

Not yet, let's do things step by step.

> > For example just reserve a type (e.g. type 0) as the virtual type?
> > (type is really a bad naming though).
> >
> > The that swap file (or swap mapping) will be
> >
> > I was trying that based on this:
> > https://lore.kernel.org/linux-mm/20260220-swap-table-p4-v1-15-104795d19=
815@tencent.com/
> >
> > It seems to work and the only thing we need is actually just something
> > like this one in VSS:
> > https://lore.kernel.org/linux-mm/20260320192735.748051-15-nphamcs@gmail=
.com/
> >
> > This part:
> > + /* fall back to physical swap device */
> > + if (!vswap_alloc_swap_slot(folio)) {
> >
> > We do a folio_realloc_swap if folio->swap have type 0.
> >
> > Which means, if there is no virtual device / mapping / file / space
> > (I'm not sure how to name it at this point :) ), the ordinary swap
> > routine is just still there untouched.
> >
> > If there is one, and it's being used, then, it is still the ordinary
> > swap routine, just do an extra allocation (and the extra allocation
> > strictly follows YoungJun's tier rule), which is same with VSS, but
> > everything is reused. From a user or high level interface perspective,
> > this can be designed with no difference as VSS. Just with a few
> > bonuses: being per memcg / task / runtime optional, zero overhead if
> > not enabled, and reusing all the infra.
> >
> > BTW this deferred allocation (in VSS or dynamic swap mapping, similar
> > thing) is actually a bit concerning to me as well. It changes the
> > common swapout routine and maybe worth reconsideration (e.g.
> > activate_locked_split and mTHP stats is now ignored?), being optional
> > for now also seems safer.
>
> I am not sure if I understand you correctly. I think what you're proposin=
g is:
>
> - Page tables either point directly to a swap slot, or to a virtual swap =
entry.
> - By default, page tables just point to swap slots maintaining current be=
havior.

I mean, they are all swap entries, nothing special from the page table
side. Swap subsystems handle things internally.

> - If we have multiple backends (e.g. zswap or tiering), we use virtual
> swap entry instead.

Actually that can just follow the swap priority, or tier rule. Even if
virtual mapping exists, it can be bypassed. e.g. you have a large NBD
and don't care about either fragmentation or compression for offline
workload cgroups, then why use a virtual layer for them which could
double the kmem usage or spend more CPU? Setup is a different issue
which can be discussed.

> - The physical swapfile has clusters and swap tables (status quo).
> - Virtual swap is implemented with clusters and swap tables in a
> virtual space, and each table entry points to an underlying swap slot
> or zswap entry.
> - If a page table has a physical swap slot, and we need to do tiering,
> we basically "make it virtual" by making the swap table of the
> physical swapfile point at a virtual swap entry? or another physical
> swapfile? Not sure.

They are still ordinary swap entries, nothing special. The virtual
space is also just a ordinary swap file (or swap mapping), which is
easy to do:
https://lore.kernel.org/linux-mm/20260220-swap-table-p4-v1-15-104795d19815@=
tencent.com/

Then its virtual_table will have a different set of swap entries. (I
left that part undone though).

> > Right... I mean with two layers you will likely have >16 bytes
> > overhead, and double lookup.
>
> Why >16 bytes? Do we need anything extra other than the reverse
> mapping? Also why do we need a double lookup?

You will have to store at least the following info: memcg (2 bytes),
shadow (8 bytes), count (at least 1 bytes), and revert mapping (8
bytes, since you have to address a full virtual swap space). And some
type info is also needed. Part of them can be shrinked but still,
scientifically, merging two layers into one is considered a kind of
optimization.

You need lookup the virtual layer, then the lower layer for many
decision making, is was discussed before to introduce more cache bit
or things like that and I think that is getting over complex, reminds
me of the slot cache or HAS_CACHE thing...:
https://lore.kernel.org/linux-mm/CAMgjq7DJrtE-jARik849kCufd0qNnZQs7C8fcyzVO=
KE14-O+Dw@mail.gmail.com/

> I don't think I quite understand it yet, maybe I am the problem :)

Haha, not at all! Blame me for the poor explanation. To be honest, the
design is still evolving and there are definitely details that need to
be improved. It's hard to discuss these abstractions purely in theory,
so it's probably best just keep the works moving forward in a clean
way, and make things simpler and better be opt-in first.
