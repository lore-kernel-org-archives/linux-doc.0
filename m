Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091595383
	for <linux-doc@vger.kernel.org>; Thu, 10 Jul 2025 05:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752126855; cv=none; b=dHEUB7SY13iPtV0w7RtNeM0tv7Z4pq9ByRamG/CYvimsiOq13wWSwh5BU5En4Py/u7F4oBeueHbolEmDZhS+wrPyDX+751XBRSUN9F7H7JkD9W7ug4irbUkKv2djh+5lTp/+h2Blgo7O1sxA22GgjrU4WiIuXxC/RrnR1sEgcg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752126855; c=relaxed/simple;
	bh=iXjJt3i1fOL8WrpeIhOpImCoA8MMVW5QWjWp5ixWSvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PFhczUztsFCFBCNzw8mAQ1L+8RCxsVnoqvPQQzD8vcCwXZLnJP/7z0QUNT0krEC/in/CWFHlwc5LfuWl+ztTxunnBLNZNDbpJrpwgLl0cwurBZIKicXlLyEzcZRvyefWH5fKt8LaXQ4lvwIUSMT/G+gqx3qonlh2bik6TMr/hv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NtDKxAY5; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NtDKxAY5"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a7fc24ed5cso151051cf.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Jul 2025 22:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752126853; x=1752731653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HelAxtimgRzObN608eoZdcv1cFYYfoEA/RL9Fs/79Nc=;
        b=NtDKxAY5jXZsGDPzex5GFK1S8YXAXsoXUWbT50hstUOYik5xLsjtADS458VnsJ9bA5
         akdQ7kSCmDbEAuAGDoqaULfMrdpKB8QQqO0OjxMaJzFELSOwDMTWInvfY+fjaD84emvA
         3ZaS7WcoK6BKas/drtXJusGONg+VbPJ597/ic5/+ZX7lvOcsqyEo24kt01Kbz8p+7FdM
         hdlmwqizq8skuNyNX1GsDJXjVL6NIW02+0Idscaf8sdxhTiHiMCkiGhNoIEi7L2WOquy
         b0+QmZUS4H5xglvcbCx4qICTKF6V43kBbkCKW/ZZlBXCbLZfVtHtxeQ9kbd8C1bJNm2A
         8tSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752126853; x=1752731653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HelAxtimgRzObN608eoZdcv1cFYYfoEA/RL9Fs/79Nc=;
        b=pYKpH4sMxOIPINuA5hzcaR7JVDt6VMNwmDeV7/Uv49rxRTkKuM4FY0NKUdMwktu3xh
         /TXZGVCISgwbkiJVnP9yfEZ/6nMEMJ4Zqm+ihC6qa2vPsNoNmtTTfgp8UlnvQOfh3Mty
         Y4RwYyjnDYno4k2y8y7bazZ09M5fc8qJ0x225HDlrhWuiX5K/ahI80WjK8k2BvUWDIHW
         JO8obryC15eluFNj5mHeBpPrwXS+SkfrDpGpy32T0fdc0xSvC81/a+3xWPy9k3H5KfGI
         vwr1dlixpHu0n8619c7nzXdPEX/19h8LOZgVc/eSxhB28IQmiB7shkxuehRgdiWI2rbV
         4AcA==
X-Forwarded-Encrypted: i=1; AJvYcCXGDafgkc2WY4/6q0rz8B0RIRP0yIi9S0LWOdMEMPoX07bGNe1V89x4vc83JQMjc+BRCUDTDEFWgJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEVnpJ6sTdTIVRRofdLRmbEh5h2wuFQ1VfUp0oyjlH6guJUfbc
	SeAG92JL7Vah+EkPJ6Asg+m0OaiQ+OckJJyT9Yu4uEtt29LegDMpe0cDFVnNdy0OlUzSasy8FEm
	KTLi4Xon6NMg2jXWha2Xwa/GGlQ1PHA+bb6PLO44Q
X-Gm-Gg: ASbGncuKpdbq06hX+HaId9LS2S3ZUMaRMhEfl3n8/fc+gbzz/XqBiCWyBQG0eCjhVFi
	f0OLendUKD6Bk0VYQI7hENKkfI1zgnWYpM1NiqWozlKz6alzzPn39DxsE7+MjGfQAYmhXwiNkOP
	tI5KijZdTWTn8S/VM8iJFUUXKneuuEEAgDYpcFlZynxQptnLD78M7DQIMkqGbadAUXulmUhccJE
	ps=
X-Google-Smtp-Source: AGHT+IH6fVu3kc1LHhY0WLz6SMRAI1DYB0Qx1UNZHTLMuzqJ3eAvGOift1Je6fadKbOCVocb+sv+6Dh/tKBSZvaKClw=
X-Received: by 2002:a05:622a:8e0a:b0:4a7:ff6d:e956 with SMTP id
 d75a77b69052e-4a9ec7d20b7mr1720491cf.3.1752126852575; Wed, 09 Jul 2025
 22:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610233053.973796-1-cachen@purestorage.com>
 <cvrr3u7n424dhroqi7essjm53kqrqjomatly2b7us4b6rymcox@3ttbatss6ypy> <3c9b5773-83ed-4f13-11a8-fcc162c8c483@google.com>
In-Reply-To: <3c9b5773-83ed-4f13-11a8-fcc162c8c483@google.com>
From: Sourav Panda <souravpanda@google.com>
Date: Wed, 9 Jul 2025 22:54:00 -0700
X-Gm-Features: Ac12FXyaRdeLntAIQEIZ4cd__y1aYV_48k84kwCaGUCeCv7hvCMu5cSVNB4I6bI
Message-ID: <CANruzcRE_EtczNpwus65tpfqLuwSEU+xyRG-hs10PAsj=cP4ow@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: add per-NUMA node stats
To: David Rientjes <rientjes@google.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Casey Chen <cachen@purestorage.com>, 
	Andrew Morton <akpm@linux-foundation.org>, surenb@google.com, corbet@lwn.net, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, 
	Vlastimil Babka <vbabka@suse.cz>, mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, roman.gushchin@linux.dev, harry.yoo@oracle.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	yzhong@purestorage.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 2:52=E2=80=AFPM David Rientjes <rientjes@google.com>=
 wrote:
>
> On Wed, 18 Jun 2025, Kent Overstreet wrote:
>
> > On Tue, Jun 10, 2025 at 05:30:53PM -0600, Casey Chen wrote:
> > > Add support for tracking per-NUMA node statistics in /proc/allocinfo.
> > > Previously, each alloc_tag had a single set of counters (bytes and
> > > calls), aggregated across all CPUs. With this change, each CPU can
> > > maintain separate counters for each NUMA node, allowing finer-grained
> > > memory allocation profiling.
> > >
> > > This feature is controlled by the new
> > > CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS option:
> > >
> > > * When enabled (=3Dy), the output includes per-node statistics follow=
ing
> > >   the total bytes/calls:
> > >
> > > <size> <calls> <tag info>
> > > ...
> > > 315456       9858     mm/dmapool.c:338 func:pool_alloc_page
> > >         nid0     94912        2966
> > >         nid1     220544       6892
> > > 7680         60       mm/dmapool.c:254 func:dma_pool_create
> > >         nid0     4224         33
> > >         nid1     3456         27
> >
> > I just received a report of memory reclaim issues where it seems DMA32
> > is stuffed full.
> >
> > So naturally, instrumenting to see what's consuming DMA32 is going to b=
e
> > the first thing to do, which made me think of your patchset.
> >
> > I wonder if we should think about something a bit more general, so it's
> > easy to break out accounting different ways depending on what we want t=
o
> > debug.
> >
>
> Right, per-node memory attribution, or per zone, is very useful.
>
> Casey, what's the latest status of your patch?  Using alloc_tag for
> attributing memory overheads has been exceedingly useful for Google Cloud
> and adding better insight it for per-node breakdown would be even better.
>
> Our use case is quite simple: we sell guest memory to the customer as
> persistent hugetlb and keep some memory on the host for ourselves (VMM,
> host userspace, host kernel).  We track every page of that overhead memor=
y
> because memory pressure here can cause all sorts of issues like userspace
> unresponsiveness.  We also want to sell as much guest memory as possible
> to avoid stranding cpus.
>
> To do that, per-node breakdown of memory allocations would be a tremendou=
s
> help.  We have memory that is asymmetric for NUMA, even for memory that
> has affinity to the NIC.  Being able to inspect the origins of memory for
> a specific NUMA node that is under memory pressure where other NUMA nodes
> are not under memory pressure would be excellent.
>
> Adding Sourav Panda as well as he may have additional thoughts on this.

I agree with David, especially the point regarding NIC affinity. I was
dealing with a similar bug today, but pertaining to SSD where this
patchset would have helped in the investigation.

That being said, I think pgalloc_tag_swap() has to be modified as
well, which gets called by __migrate_folio().
