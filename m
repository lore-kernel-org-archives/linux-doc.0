Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6011498939
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 18:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150495; cv=pass; b=qew9lj/rN1qDE3sOn3yCWuyW/I5Kbl+orPsdQqb72NriXAsFrmxIlePLZR4Wbe7G1wyAcnwEsrI6LyivagpbT6ElcrpapwBo5/ba1Sqk5cGtGwjtA9M0uFgke7/Y806zu6SKyHrePfHTbkX47GUu/CdvsEX/xz6IzM0F8JCFN68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150495; c=relaxed/simple;
	bh=GBuxWMSsg4wZZ3OpOH0+odAqCmKuZujhQPqIzTdn0Yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0rPq7iwar/TGaS0w0d0+aHlwmOoWwzPjfvib/Pg6UmygZ0SeJhau/TKIO1Np0Z96iN8zoC2NR9nDPzvZtJF72cdsLG4102yqfR8APDtomjWG/9eddmJ+dbtJpq1c1XsKmYdI87QhLTarPCNdv4a/KmKEV6Iojbl50/tzdk4ioo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VX0N/ICf; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VX0N/ICf"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c262204cc80so181327166b.3
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 11:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789150492; cv=none;
        d=google.com; s=arc-20260327;
        b=ATxm1+ALEBPWWGBBFzePbl/+8In0GktcWvBslfKlJitJ8FW/S4omSFex5JYSH1A4k8
         AaiP3ljWSnsDzM7YEay6LSjvVwSLVYkZrvZbAc4iAxsHq4f78CYJes104YP4cEQXdTJJ
         oHiuAs3JEE+SpEebIMmnJB16PQjeZt9pUxeckTuzA2tyBOxTSdCq1zndIzaVWP0bvUMd
         W2as7EQI3qJX0TlddRepJdevTU5v3/mZbZZccoqSJj3j7qmsT6TyrbPNcZ+YLc4X/ex7
         1/QExH2QqqBDnv4Qryxs2rQUL35b8X2O/VK/WMWPydbHVp3iaKGSS1ai6uldv95nQuYM
         vDuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sgMffH9c4Ut5GzZRUzz1jul/MtsWXNFvANxlyz2Cqvc=;
        fh=Q4paFLjhqmD+vNPqWQiFIHhWdswf3Jn4aaO7pAxQI4c=;
        b=bgvr1LAxoDeOdZr//kzJ24AlowrQ7ehRSTsxSza5Ylnpu/h3ce+BwBa6ml5z8HE+Qb
         D20Bs4sOZjGOygbCB3PgLJ6Z8xu4tqYpPC3xLzrlopcL8PADq6PRi1k3FWu11d8hWlRO
         GqBnCO8MQgQG3/zSMFz61bus2Ke2rJ6ia7F25iek5tz7p7COJIH1zdGxxhY0sWpmqkKL
         vzHTk276ZYkTTB5IMYyosIKSG8Fv//zON5K0kKvvChqp+pEc0EQ3OIIIlzj0TS7p6Kfe
         T7PRhxLtowI0gjvwZ3bhnwtIE/c/U+Jn6vtTUrwaQWGWTIjlaAhMI7mUfNOcw093SIkZ
         PRvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150492; x=1789755292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sgMffH9c4Ut5GzZRUzz1jul/MtsWXNFvANxlyz2Cqvc=;
        b=VX0N/ICfu6nRhxaCAHv2F/9u4G0ce6Yvyyj9kYf6yKwcgmh4mGHhVrKRzUUGrUe82e
         dBSCR9VM4bbbucXmQuVRNwen9qIBQbUC5lhp/BJhA6uozTYw3JJ6C3hY61Bc8V2N0oMH
         OsenC7xrPsCNjt4k17SfnYGAnwLGIXuWASqa3KcopYNNdixArZx47YK8Wn6LzSXzvDJX
         x1NsCnbmPvYJES2RR+9eDOEqUPc0DMcZd2UUzDR+6XBPvO+0zHxNEKNqw1xrCN+LHBha
         tcZ3NcfQQ/VmrXX0AlN2GTuAzmN1CX+k2fKbafpWss5W//1XDE4S+Nyi3zOpUrriKaLu
         wWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150492; x=1789755292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgMffH9c4Ut5GzZRUzz1jul/MtsWXNFvANxlyz2Cqvc=;
        b=pNR6xpKZkVja3aVetlhQRUzcYjU3YV687a763KJw8yBySpIQd4RBjRYYehcHWcSIgt
         WEI1ufCTw5i3JgJVssLK2WopJYXkyU2XBR0zV6zxKoaIHnAFgxyWJ4U9YR2IgXEE06qM
         cR2Tn6JGBvsuY6nhHTPRPRWMvHw29KhgoS1PiglRLsOYEm1iU+2iIZWd7aXqAegNdFPr
         cFdDNE6t5kuoYrB7pStSryRmu2jjTxdkuOm1Usd50B20Adk4HWIDg/us/AMXjRKNaMgu
         pz1qSIP59fNNF1c5N6/VJWCQ/BmyclT/UanQCzujG3VSb/EITtZzDySWDJd3uUgiCpGA
         q1+w==
X-Forwarded-Encrypted: i=1; AKwUvBz6zfs4jGqSilfO0IwEob+aCwiAfBCCy/drey/PnegnfL1MmLbdnzqAff5T+xH02TD2wmDa6my4Lzs=@vger.kernel.org
X-Gm-Message-State: AFuF++kkm2xqbPwXp4mu6NJnFjJyu2OxoIurLzF8ARsFWgFLqglI/RVV
	YFvbleFczVsCaLeh/kVdvEezDKAX3C/hj4vlNP37SEaDEnnQPmkcNokBFyOaLsvJ6sszYoEQG7/
	dDH9RuWVShs9BVXhjjoNTaaxMPMe14ek=
X-Gm-Gg: AYBFou0MTomo+VFasWGYZiu7RFl13uTn8M1l33DxWrGGbz4EUIQZdrHG/uasksNZtOr
	LGMm2qlbTpT95wAaDvFY72KInm9MX8c35Fbk0OaCaTyYyg5hlKbBts4bh5JqqBodQ+0vSiXm0ws
	fOYW3w0IEB0oIN5b5eNgBSTMwJjtRWTafmi7uvhXfZD/bO15oGi0VtNri/q7W3XB95+PeGEgOtP
	eBk2xwZHFW968bFG2JRM0NzkPctz5lP6aDa98sFsPL8JUxSyq+bD7HJguMKdwecCtIiM0LMgA0/
	VEl7sr2Gmz8grFrHnj6bNAvZ/GfVMTjkSkpUOh0NO1ou/zjLcT6891NfEQ4VpAICVFDc3UmZPu1
	AEw+Jxr2GfUuU
X-Received: by 2002:a17:907:1c10:b0:c29:286e:2e3e with SMTP id
 a640c23a62f3a-c29666d5f9dmr241723566b.38.1789150491872; Fri, 11 Sep 2026
 11:14:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com>
 <CAKEwX=O8i+OsP6BJXNZNk07hveN9HDT+PoyMTAU6gOc-xp0Ppg@mail.gmail.com>
 <CAMgjq7BQeQQOZMDPFJ+8LS2N4t3x53r6Nm+9o0_pi92oVUgjgQ@mail.gmail.com> <CAKEwX=MS-7C96i4tzBijHN=-xuZgny_wQEa_0YjfHzhoNysdYQ@mail.gmail.com>
In-Reply-To: <CAKEwX=MS-7C96i4tzBijHN=-xuZgny_wQEa_0YjfHzhoNysdYQ@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 12 Sep 2026 02:14:13 +0800
X-Gm-Features: AcwNN1X_Mr5nGygMYASuHxKAbKSbuoEdUvrKDUVcI7Vk1_FQ39e_c44cG1FLDGc
Message-ID: <CAMgjq7B7Mc7vpQN0gBknsSrfZWXdif5L7nU29YskG9mzS-_jsA@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Nhat Pham <nphamcs@gmail.com>, YoungJun Park <youngjun.park@lge.com>
Cc: Chris Li <chrisl@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
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

On Sat, Sep 12, 2026 at 12:57=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Fri, Sep 11, 2026 at 9:10=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > A boot time bool will cause real trouble for us, at least. We have
> > many VMs with fixed boot images and fixed cmdlines. However, the VM
> > itself is used by different customers, some are ZRAM only users, and
> > quite a lot don't want any kind of compression (e.g. their data is
> > dense compression is just waste of CPU) and prefer plain swap. So I do
> > hope we can have a runtime tunable instead of modifying the cmdline
> > and rebooting or rebuilding the base image for different cases, and we
> > have already seen that a runtime toggle isn't hard at all.
>
> Ah yeah I see. But before moving back to runtime parameter, do you
> think we can come up with a heuristics for this that have does not
> require userspace input? In v4, I'm doing this at folio_alloc_swap()
> time:
>
> a. If the cgroup enables zswap, then always go vswap.
>
> b. If zswap is not available for the cgroup, then bypass vswap, and go
> straight for physical swap entries. My intuition is that we are not
> buying anything for these zram users, as we need a physical swap slot
> anyway. Thanks to your design, both can co-exist in the system now -
> that's something I actually did not envision possible in the original
> version of vswap. Pretty cool eh :)

Thanks for the test and idea! Yeah, I always hoped we could do this
because there are some very promising use cases for raw and plain
swap, not just ZRAM.

> Would something like this fix it for you? ZRAM users will not get
> vswap indirection overhead at all, because it would bypass vswap :)
> Down the line we can revisit this decision - for e.g, if there is a
> use case for vswap-on-top-of-swapfile. There might be other interface
> that makes more sense.

Hmm, this interface looks confusing though. you mean tangles vswap
with zswap through the cgroup's zswap limit? I originally expected
this to be a problem solved by tiering, skipping certain tiers seems
much more intuitive. Maybe Youngjun have some idea here?

> > > > doesn't conflict with what vswap is trying to do. Some other of the=
se
> > > > differences involve design decisions rather than just surface knobs=
,
> > > > and those are the parts we're stuck with once they ship.
> > > >
> > > > So a few current interface difference of vswap and xswap I've notic=
ed are:
> > > >
> > > >  - default size: somehow also tangled with VM_SPARSE, which
> > > > needs an initial virtual value. It's super cheap if not zero cost
> > > > (the only cost is occupying some vmalloc area, which is fine
> > > > I guess?). But we still have to pick a number, could be large
> > > > enough to satisfy everyone?
> > >
> > > 8PB? ;)
> >
> > Right I saw that at V1 :).
> >
> > I'm not sure if this is the reason that is in conflict with VM_SPARSE
> > in your mind? Techically, at least for 64 bit, we can just apply the
> > same limit to VM_SPARSE, for 64 bit machines we have a lot of virtual
> > space to consume and that should be fine (VM_SPARSE is just the
> > cluster map, which is much smaller compared to swap space).
> >
> > And another thing is do we really need that much in any case? Will
> > things like, e.g. 64 times the physical memory (max pfn) be enough? I
> > know Baoquan suggest just use the physical memory size. So that could
> > be tunable, it's really easy to tune, just a number.
>
> Potentially, but we have many users at Meta. There's a huge diversity
> of machine types, workingset size, access patterns (both frequency and
> file:anon split), compressibility, etc.

You can just set the number as 8PB? :)
