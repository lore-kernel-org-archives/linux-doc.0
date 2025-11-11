Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5412BD5AD
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 06:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762841581; cv=none; b=HelNidPZZUOTzxSkX/Aaj8wQzjpRg0a+9l+/17nAqofJ3uvP/5UmbfHHwbfROuTQEk180y9ZvYxKqKHJTQIJaASk2SeM9lIHqaGa/FI9XHbdypLmYwFJlkn86jvnbU8Ii3MuJDxV21tNYC43XYOrLJBh2HawnNqEkCSmIfW53yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762841581; c=relaxed/simple;
	bh=8rhcgK/uhFz5i+qhvU5QkcxFYGJ70HuDlKM0CIE/z1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EOjyrh+TFaYRr2JdbypyOF/kLeBsoNJAxylXrsm+6ZO1wOpbb1kYmRCF8ZSpioZ55SbpizZu2N6ukRJgNF3voGCmat6Dtpjioc+fg0MErAedFJr/ke9lcgjI94TichH8vuR+6illjLASBAVT+c+kkQ/NIFxQjZsHJmbrc5N0Ohs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=GxQbPH2t; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="GxQbPH2t"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29555b384acso35810505ad.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 22:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1762841578; x=1763446378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rhcgK/uhFz5i+qhvU5QkcxFYGJ70HuDlKM0CIE/z1s=;
        b=GxQbPH2tyxPcDPvVNUzGdo1a5EvMcuz/29m3gDhVvnHfP+GdmwY601QT+ibTwX7yn4
         RZkGIXWW7sUmOdb++U+5PiqU34g8qBFpGXl0m8epcHDdWOG0Nh2h8jX5rgUoy1WlPYYk
         tPQinxizh9XNeZfdIDpd9frQTjg26+WdohQ7Cr0uIugB5TZOldlPzzNjTGp23xFYirf8
         pzA0dtpsDXR+unPrs4CSAhAF2Oz1bx9Aqrafjw6zRoQ055MmcCYdi5sADfnFNMxKvPax
         FJRfyQG53qHW428nszW7p/ItW9SSNmODcEea8F6IKrM5eaWnSGvamX7M0toCow1VfGE7
         +d3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762841578; x=1763446378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8rhcgK/uhFz5i+qhvU5QkcxFYGJ70HuDlKM0CIE/z1s=;
        b=QH49VbCagCBotiQsXJS4MVuTDv1QRIe7k9xA7FHXUOqbxNQeQ+4rsz7T3xtAyXzK1v
         7OW/fr/4OcYNRTXCGAkeQcJM/NSyLOEnoDvNBTx906uPx1ijvKK0auF+sUtNarLnOupi
         wdmIJJuuoOhZddcOo5b3M1CzUuoelQJWuB06eDD+/8ejyONffSXjNWn/GShOC8RXDysU
         idNE2akCiaM6Dg67Iq23pmbWzmhnyLWGRiFQI7tT9MwyMYu2ad7YOBIFWGAsWmETD7xg
         1AYc2xmgzt+1x0LPv8FgHAM6xoqbFzC025tjIXbNE655ShIxf4vuDb2tVxZaWnzLMPgW
         /m5g==
X-Forwarded-Encrypted: i=1; AJvYcCXCuzXdOxuE8IV6aaUBgaB727ccY5OlOB+BLBgQhVeEaFzSX8GGND5XxdrfxEv0fXZPY0JCo4e6tDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyppnlKtAAX+dWeVbYRQ1kkwDnF6O+NY7WviBwf4U54ZCIs2wxJ
	nPU27SUmKxYfAInL7albSzetB6z+ZpPZ7+5pQstaZkpF/LBrvj5s/77KftuJmrmPrpU=
X-Gm-Gg: ASbGncvwaQbDVTyjKhFKRUAORxtWNen3dPzdHFqGKxLTA4kA/mWE7ugosYjX8sL1BPc
	ruItWaqRqalEgAicw5FXdbUmcOd1BOvWdD2pVrGBbkW7yB2WBynA0Vd7Vt1G78x4+DJqfRFFOt5
	TIoyd0zDiJyMt7Npi9SDoeAcIifA5uB3rQAfDcDOpd2gE5eZ2EvO9/F8zZ20vhV6KmJdi/aOQZK
	fHeiAWnUdKXbxzw8DRqCvscZlutUo05ZtBcu6Kl+5nwojuzgo+OzbgHqfbopOjWR9kQOmw5QORD
	apQjy7Rx6+agiOfJX5wdAgonzwI1eROMny5WiVKwqy6u1S/Id8ebeGXYE3nL0c9haaX9x6m01P1
	RUnGESOpmtQ1kqo7PjuqsoTY+rDgLeomBJ+sn6G/ykPzm1PARU9gfKOBaRpXlC4f6dGOZ319Kku
	St4DZkbfuN5h6mjEPoaOUkU1x3
X-Google-Smtp-Source: AGHT+IELhVS7nb73OxbKeEmwDpZqhH0jCXP0hL6eUPlcCMaV+4//v9rB3bD5Gbbb7H8J9XLzDYxOIQ==
X-Received: by 2002:a17:902:cf42:b0:295:bedb:8d7 with SMTP id d9443c01a7336-297e56f6f5amr132204345ad.48.1762841577982;
        Mon, 10 Nov 2025 22:12:57 -0800 (PST)
Received: from .shopee.com ([122.11.166.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343c4f6f78bsm650216a91.3.2025.11.10.22.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 22:12:57 -0800 (PST)
From: Leon Huang Fu <leon.huangfu@shopee.com>
To: harry.yoo@oracle.com
Cc: akpm@linux-foundation.org,
	cgroups@vger.kernel.org,
	corbet@lwn.net,
	hannes@cmpxchg.org,
	jack@suse.cz,
	joel.granados@kernel.org,
	kyle.meyer@hpe.com,
	lance.yang@linux.dev,
	laoar.shao@gmail.com,
	leon.huangfu@shopee.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	mclapinski@google.com,
	mhocko@kernel.org,
	mkoutny@suse.com,
	muchun.song@linux.dev,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	tj@kernel.org
Subject: Re: [PATCH mm-new v3] mm/memcontrol: Add memory.stat_refresh for on-demand stats flushing
Date: Tue, 11 Nov 2025 14:12:49 +0800
Message-ID: <20251111061251.70906-1-leon.huangfu@shopee.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <aRHR_zAx1HgyQJqR@hyeyoo>
References: <aRHR_zAx1HgyQJqR@hyeyoo>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Harry,

On Mon, Nov 10, 2025 at 7:52 PM Harry Yoo <harry.yoo@oracle.com> wrote:
>
> On Mon, Nov 10, 2025 at 06:19:48PM +0800, Leon Huang Fu wrote:
> > Memory cgroup statistics are updated asynchronously with periodic
> > flushing to reduce overhead. The current implementation uses a flush
> > threshold calculated as MEMCG_CHARGE_BATCH * num_online_cpus() for
> > determining when to aggregate per-CPU memory cgroup statistics. On
> > systems with high core counts, this threshold can become very large
> > (e.g., 64 * 256 = 16,384 on a 256-core system), leading to stale
> > statistics when userspace reads memory.stat files.
> >
> > This is particularly problematic for monitoring and management tools
> > that rely on reasonably fresh statistics, as they may observe data
> > that is thousands of updates out of date.
> >
> > Introduce a new write-only file, memory.stat_refresh, that allows
> > userspace to explicitly trigger an immediate flush of memory statistics.
> >
> > Writing any value to this file forces a synchronous flush via
> > __mem_cgroup_flush_stats(memcg, true) for the cgroup and all its
> > descendants, ensuring that subsequent reads of memory.stat and
> > memory.numa_stat reflect current data.
> >
> > This approach follows the pattern established by /proc/sys/vm/stat_refresh
> > and memory.peak, where the written value is ignored, keeping the
> > interface simple and consistent with existing kernel APIs.
> >
> > Usage example:
> >   echo 1 > /sys/fs/cgroup/mygroup/memory.stat_refresh
> >   cat /sys/fs/cgroup/mygroup/memory.stat
> >
> > The feature is available in both cgroup v1 and v2 for consistency.
> >
> > Signed-off-by: Leon Huang Fu <leon.huangfu@shopee.com>
> > ---
> > v2 -> v3:
> >   - Flush stats by memory.stat_refresh (per Michal)
> >   - https://lore.kernel.org/linux-mm/20251105074917.94531-1-leon.huangfu@shopee.com/
> >
> > v1 -> v2:
> >   - Flush stats when write the file (per Michal).
> >   - https://lore.kernel.org/linux-mm/20251104031908.77313-1-leon.huangfu@shopee.com/
> >
> >  Documentation/admin-guide/cgroup-v2.rst | 21 +++++++++++++++++--
> >  mm/memcontrol-v1.c                      |  4 ++++
> >  mm/memcontrol-v1.h                      |  2 ++
> >  mm/memcontrol.c                         | 27 ++++++++++++++++++-------
> >  4 files changed, 45 insertions(+), 9 deletions(-)
>
> Hi Leon, I have a few questions on the patch.
>
> > diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> > index 3345961c30ac..ca079932f957 100644
> > --- a/Documentation/admin-guide/cgroup-v2.rst
> > +++ b/Documentation/admin-guide/cgroup-v2.rst
> > @@ -1337,7 +1337,7 @@ PAGE_SIZE multiple when read back.
> >       cgroup is within its effective low boundary, the cgroup's
> >       memory won't be reclaimed unless there is no reclaimable
> >       memory available in unprotected cgroups.
> > -     Above the effective low boundary (or
> > +     Above the effective low boundary (or
>
> Is this whitespace change? it looks the same as before.
>

Yes, that hunk just trims the trailing whitespace.

If you'd prefer to avoid the churn, I'm happy to drop it from the series.

> >       effective min boundary if it is higher), pages are reclaimed
> >       proportionally to the overage, reducing reclaim pressure for
> >       smaller overages.
> > @@ -1785,6 +1785,23 @@ The following nested keys are defined.
> >               up if hugetlb usage is accounted for in memory.current (i.e.
> >               cgroup is mounted with the memory_hugetlb_accounting option).
> >
> > +  memory.stat_refresh
> > +     A write-only file which exists on non-root cgroups.
>
> Why don't we create the file for the root cgroup?
>

Thanks for pointing that out—I copied the wording from the memory.stat section without double-checking.

All three files, memory.{stat,numa_stat,stat_refresh}, are created for the root cgroup.

> > +     Writing any value to this file forces an immediate flush of
> > +     memory statistics for this cgroup and its descendants. This
> > +     ensures subsequent reads of memory.stat and memory.numa_stat
> > +     reflect the most current data.
> > +
> > +     This is useful on high-core count systems where per-CPU caching
> > +     can lead to stale statistics, or when precise memory usage
> > +     information is needed for monitoring or debugging purposes.
> > +
> > +     Example::
> > +
> > +       echo 1 > memory.stat_refresh
> > +       cat memory.stat
> > +
> >    memory.numa_stat
> >       A read-only nested-keyed file which exists on non-root cgroups.
> >
> > @@ -2173,7 +2190,7 @@ of the two is enforced.
> >
> >  cgroup writeback requires explicit support from the underlying
> >  filesystem.  Currently, cgroup writeback is implemented on ext2, ext4,
> > -btrfs, f2fs, and xfs.  On other filesystems, all writeback IOs are
> > +btrfs, f2fs, and xfs.  On other filesystems, all writeback IOs are
> >  attributed to the root cgroup.
>
> Same here, not sure what's changed...

That's just trimming the trailing whitespace.

>
> >  There are inherent differences in memory and writeback management
> > diff --git a/mm/memcontrol-v1.h b/mm/memcontrol-v1.h
> > index 6358464bb416..a14d4d74c9aa 100644
> > --- a/mm/memcontrol-v1.h
> > +++ b/mm/memcontrol-v1.h
> > @@ -4666,6 +4675,10 @@ static struct cftype memory_files[] = {
> >               .name = "stat",
> >               .seq_show = memory_stat_show,
> >       },
> > +     {
> > +             .name = "stat_refresh",
> > +             .write = memory_stat_refresh_write,
>
> I think we should use the CFTYPE_NOT_ON_ROOT flag to avoid creating
> the file for the root cgroup if that's intended?
>

I kept memory.stat_refresh aligned with the existing memory.stat entry, so
I left CFTYPE_NOT_ON_ROOT unset.

That said, the documentation is behind the current behavior; I'll update
it to spell out that the files exist on the root cgroup too.

Thanks,
Leon
