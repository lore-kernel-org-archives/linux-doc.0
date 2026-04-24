Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D903F7A9B
	for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 18:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777057128; cv=pass; b=uA0WSyQDb5Kz9hXPGh6dfddYJIm3D+Vg6xb7K8Qzet/97ESKUToYQkYPPe/UGkCEIg0RupRBmxGG7cVOdwnMa3h3EoCrEtThG8gZ85GAHefSZ/upi3z7kYV12QrCqtHOoJaGDwA/aeUiXr5TBS3QRNpHoyAgO9932bttjgE5kFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777057128; c=relaxed/simple;
	bh=k6t4eZkeokPoyA8oRZ55oWxWJC7v0XmU5akNG3U8o98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KVRit6ly4kqBGa0lbqsImY1LF4/C38LPIDdwfaWyIyyEvnhDsjkPqbahq71V0MNXpTll2z1jZSwVbApkl/fn4cZJY58/3K35n49F28ZjQjQn1pQq49/VGveCyu/jIG6951VG7jjVusB/ckUHiYULQH3D8E1U3VxfQwPXgkUyON4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCo859/T; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCo859/T"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6764e36dc88so8344967a12.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 11:58:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777057124; cv=none;
        d=google.com; s=arc-20240605;
        b=av1PsOHU6saPdqllLiaju4T7Zdci7OIImMFuMWjOrZ8v5rmPw4rjW+O1AEgccNzwTX
         OM+nOpDAEpBE5uvMXSfQAu64ON0dL2SfEeCAB2v45Ej/OPhizir+LKqprAz5OuPIbwlC
         hMfiXxsMTfMqm+O3TDE7HRhRn8q/uZtwWpQRlA8UjoEX1EtoLigJXtoDgBczugYJypiK
         FoR1gHScLpbICqZ7ZH71OZ0KVHUiSXmTUm2AvMI7qLFEBxruS9xwmQRGBbqhvpafa8F1
         r94kXq9potYrluwuyu2rfuBGdvMk4FfRIaRpWdMWChVeQkXf9G/3JMEWFR2AcbXyIy94
         DxVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k6t4eZkeokPoyA8oRZ55oWxWJC7v0XmU5akNG3U8o98=;
        fh=jq/xe7nOJRxuRrcveQ/1Npj01hTpvQxM1A7X7OZu7ws=;
        b=IwY2SFFkHbRShMC8KRoCwL+RXmKluUEiObagbwwHhVbOWcS56avpeEHVN1F3NkJrMc
         8I3APf//J7IA7uIzEhKC4huoyMTlLK182XGK38vZANedHH+P6bSbkdfwzgVwRwqPXNN7
         oSuKaXHpWR1idc9iyc3Ax8RO0Rjl/8SUWEWAILcsFqNjR1kKkS44NGrnkCayCVcVlq8w
         YPOGHBhqazoqOAaGTWiRjSFMibKEFOjGdYOaLNuQ/xpvv6XmK0sK+iCSIRHxA/RuDgmh
         JvkfqN9vRPIXtkxRzJsi2xbQnsf896SSNwmqSlHMTFJtYVri6ZRJNUePVQwJixGFVTnU
         pvgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777057124; x=1777661924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6t4eZkeokPoyA8oRZ55oWxWJC7v0XmU5akNG3U8o98=;
        b=iCo859/T5ds85sLELgY5369MrC+xE6q6KwtoDJvqmpHWp5krA9ok9kra+L/VVWkTd+
         tbmonnQpA6mB9dZUUMnfTM7AzawvaMA25e7jhxrcpojIonHim5HjaTxBIW05fcHh68KL
         GWj1tr/5RvjCdpvKOr5R1ABkgCUjaKvszC0pmTvVd2UVTeVpCVdOUq5d1Je+x3S8z5sj
         Gf81N9+UzKQjdjhi9gRLm3pVm5N6SxeX3zhDVdH06uFfryy59F68weDZ9zsLrQJQr97S
         JtiWjiik1nuvJ3efIHegf4ifZUB2lpgzywohR2ymN8gVt6Vmtj46sCPSJk2/GxIinbfZ
         tP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777057124; x=1777661924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k6t4eZkeokPoyA8oRZ55oWxWJC7v0XmU5akNG3U8o98=;
        b=RdSa/x7wAmnofiien2G9Cj8ff/7idSETyBHBxlmK/bvYDzKHmbrPIuPjTOzPacEyZZ
         36ZpJt07IfAJBf+oBjYkOlLheetZQmjEcJ1w3S5js/VHT94JFZSqUqJ4NHl7ZjnjDJnF
         WHCYk6TbSnQqMxo8r4MeICSoubRrvUMIhAgjmwBdZSL8WNfpWEfiJhg36yuSNRcEs7XK
         irNdOkkjjukP6d9EGB1YOybw4mnX8VRHEcOkp/eED9vOwxii35Uw810Wj746L3pKE4vI
         Mxkf4HMzXrig8q0yeF9iB7xcNd0MbU7Dxdq1Wae2zDAEdkplF2ru9RT7BmygIGSqQo00
         Wo/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9XIeK9rqyzl6tYKDWeG7BUcOJLFurL0FjswW5mpaV6+iuYGYdKh0hODDcbkjKu0PZM2/AqZ77TFrU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx00Mq0CDQWhnhQpRz7MlXgM86JUpZJ3Diu7TGFqIldYjS9B4iT
	Y15V2jHzGLwpn/IkDoXnqZLymhZ+b/rwS07VNiP4hYbVnmHRshzwGsmfEGM+uGNiLUCreO3diOO
	Nt/oxajg9MqYaDOToOzXiWFcBJPtgNIc=
X-Gm-Gg: AeBDieuThPNoPM+/E9WQ8ewTkRNzQ/TR/IP7ZteHnG/yQHvy+v8BiSSaJVpaMfJ2NEl
	Mwz2YbA2/YyNvW+XCPOUcRlHtMpewkZubHHNg8Ukecrp7+DCnB2wmgR2PwBdWsUDjNlB0mTEorA
	o8MFBL0hIXP+XQY3urCiBaGxPP5gn4IcrYgBmUVv3Itz4J8AV2f3423wj0PLAokwNfvjz6BtxX0
	V6yBczgZk6gT6grJoKyCeeCqYN5WXUQKk84ky42oJAYAYzgPpFY1ZmQRRhzGg5hwmevgyISOnWL
	NhQ6s9RJkb+OcdS2YKh+836ZI9Vq306WSbEBq6a21kxSPDKDR80=
X-Received: by 2002:a17:907:7209:b0:baa:67b9:57a0 with SMTP id
 a640c23a62f3a-baa67b95a5fmr713004866b.3.1777057123475; Fri, 24 Apr 2026
 11:58:43 -0700 (PDT)
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
 <CAMgjq7AGzBubCkmv7LubBjPLN1DzL472d4zUm+sGxo8ZptMgRw@mail.gmail.com> <CAO9r8zO+tm2J0FRC64VKCYOSuKPXX8cQG7C07SwMWKoLiwoV+w@mail.gmail.com>
In-Reply-To: <CAO9r8zO+tm2J0FRC64VKCYOSuKPXX8cQG7C07SwMWKoLiwoV+w@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 25 Apr 2026 02:58:06 +0800
X-Gm-Features: AQROBzAaIu04DPxOg3P-cwpIEdvMhxhii3pwiMT8HK0UdOYxD8nmrK7NsGSDAaE
Message-ID: <CAMgjq7D1WXUHqAV1yuXvrUmEsE_m_+yx0mBq6teJhipx6mySbA@mail.gmail.com>
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

On Sat, Apr 25, 2026 at 2:08=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Thu, Apr 23, 2026 at 9:16=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > Yosry Ahmed <yosry@kernel.org> =E4=BA=8E 2026=E5=B9=B44=E6=9C=8824=E6=
=97=A5=E5=91=A8=E4=BA=94 04:48=E5=86=99=E9=81=93=EF=BC=9A
> > > > Using a swapfile does have its benefits, though. For example, the
> > > > virtual layer could act as an ordinary tier following YoungJun's
> > > > design:
> > > > https://lore.kernel.org/linux-mm/20260421055323.940344-1-youngjun.p=
ark@lge.com/
> > >
> > > Hmm I didn't look too closely at this but I don't understand how
> > > making it a swapfile helps with tiering? If anything, I think it make=
s
> > > tiering more difficult. For tiering to work, we need an
> > > abstraction/redirection layer, such that we don't need to update the
> > > page tables (or shmem pagecache) if we demote/promote pages. That is
> > > exactly the use case for a virtual swap layer. The page tables point
> > > at a virtual swap ID and the backend could change transparently (e.g.
> > > for zswap writeback, or tiering).
> > >
> > > If we make the virtual layer a swapfile, how do we demote/promote
> > > without updating page tables?
> > >
> > > IOW, I think the whole reason we want a virtual layer is to separate
> > > the backends, which would facilitate tiering. If the virtual layer is
> > > itself a swapfile, wouldn't it become one of the tiers?
> >
> > That's exactly what I hoped, virtual layer being part of the tier.
> > Tier could be set up per task / cgroup. So is the virtual tier.
>
> Just to clarify. I don't think virtual swap should be one of the
> tiers. I think it should be the mechanism through which we implement
> tiering (see above). I am not sure if that's what you meant.

YoungJun's swap tier have been working pretty well without the virtual part=
:
https://lore.kernel.org/linux-mm/20260421055323.940344-1-youngjun.park@lge.=
com/

> >
> > A standalone implementation of the virtual layer is more heavy than
> > being a swapfile. Actually I think at this point, it is the word
> > "swapfile" is misleading now. We may rename it to "swap mapping" or
> > something. A swap mapping could be physical or virtual. Virtual
> > mapping can realloc from physical ones (redirect), and swapoff of
> > physical ones just read its data into virtual mapping's swap cache.
>
> I don't understand this part, please clarify. In my mind, all
> references to swap entries from outside backend code should refer to a
> virtual swap ID, which could be pointing to physical swap or zswap or
> something else.

For example just reserve a type (e.g. type 0) as the virtual type?
(type is really a bad naming though).

The that swap file (or swap mapping) will be

I was trying that based on this:
https://lore.kernel.org/linux-mm/20260220-swap-table-p4-v1-15-104795d19815@=
tencent.com/

It seems to work and the only thing we need is actually just something
like this one in VSS:
https://lore.kernel.org/linux-mm/20260320192735.748051-15-nphamcs@gmail.com=
/

This part:
+ /* fall back to physical swap device */
+ if (!vswap_alloc_swap_slot(folio)) {

We do a folio_realloc_swap if folio->swap have type 0.

Which means, if there is no virtual device / mapping / file / space
(I'm not sure how to name it at this point :) ), the ordinary swap
routine is just still there untouched.

If there is one, and it's being used, then, it is still the ordinary
swap routine, just do an extra allocation (and the extra allocation
strictly follows YoungJun's tier rule), which is same with VSS, but
everything is reused. From a user or high level interface perspective,
this can be designed with no difference as VSS. Just with a few
bonuses: being per memcg / task / runtime optional, zero overhead if
not enabled, and reusing all the infra.

BTW this deferred allocation (in VSS or dynamic swap mapping, similar
thing) is actually a bit concerning to me as well. It changes the
common swapout routine and maybe worth reconsideration (e.g.
activate_locked_split and mTHP stats is now ignored?), being optional
for now also seems safer.

> I *think* what you're saying is that we should make that optional, but
> I don't see how this would work. If a page table is pointing at a swap
> slot in a swapfile, we cannot do tiering or zswap writeback or
> anything dynamic without updating page tables. So even if the system
> starts off with one swapfile, we cannot assume we won't add more and
> set up tiering (or enable zswap) after that, right?
>
> I guess we'll keep the swap table in the swapfile and then we'll have
> it point to a different backend, but I really don't like this design.
> It's unnecessarily complicated in my opinion. Page tables will either
> refer to a virtual swap ID or a physical swap slot.

Or in another word, they are all just swap entries, and the swap layer
handles things internally.

> I think we can simply have swap tables representing the virtual swap
> space and pointing at the backend directly, whether or not we have
> zswap or tiering set up or not. Is the overhead really that bad?

Right... I mean with two layers you will likely have >16 bytes
overhead, and double lookup. And I have been thinking about cutting
down the memory usage to 3 bytes. And you can't make the lower /
physical layer just a bitmap if you want a reverse mapping, and so far
many things do require that. If we make the reverse mapping optional
it might be more complicated than the thing we discussed.

I don't think the thing I described above is that complicated reading
all the code and solutions so far. Maybe some better abstraction can
help?

I've seen some vendors doing swap using UFFD just to cut down the
overhead or having a highly customized backend solution for swap, so I
was hoping the kernel part could be as minimal as possible.
