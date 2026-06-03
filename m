Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B0B40B6DC
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 17:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780507341; cv=pass; b=Tjoj0eABsmELsR+J9ZDKTrwm/tPFcZ/VTxpfIbaPQ4Jlesab2SbOrcnMibfA4yIgPbIGHAdaVp2I2Pb5CdlQ1frbpLupZN9dwnItcNcwQ6YfBIlYQkpPEKhH8jOGFv4CCzw2mDFRB+y2bci6mmXOZQjY/nKIGWY0bG/xkN/IzoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780507341; c=relaxed/simple;
	bh=obQ852KQ5RkWHiPyLM3amJF1QYPTjvpbYuS0RF+/CM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ao3x1bdLiceYgFvKY7WS5e3zTsVovdXjewGmtM7DbN+18jYT9F1b6dFpKozy5dOoath3KyoJ8zgJ4muTcFnbe9s/0VarCA6mq0qNyWsHWli3qiY4XXGGdSaig/gZZbLyPV7lYFObNhUdQ2BF92KAv3IKAqqVFD8KBM4nxPKXAdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6TAsOEI; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6TAsOEI"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so5118648f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 10:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780507338; cv=none;
        d=google.com; s=arc-20240605;
        b=W/OQXE9RlmSFJ2pfCm1xN+UURprAM+eEW3LkxSJgEKmUQOEO4foIRFgM3rbwXVr1Xe
         E+KorGA4Yet2OdkHrdAQIenSMsegdFwZ+DH5bx9zTNDx1itpgLFsfCYXIIjwKBAkahx1
         4wHXyWrdRCOw2oMDHwNXnOl2lE79YAzJqiUyouychGURZp5Neu/MJuT3IOZ0ECuCl6SM
         wVQtjsI+hvQzLlXyAxhHNwZLEmohOZIrzw2s8eX3SgQ/Si80iwZ4nAUsaZ8uAHVxsL8b
         +ClS9r5mgFEZ+5fOmGn6TRDkuMublAzFQNEDVFDLJUAWJA8gDxRm/o6ZY8QKA4+CSK0P
         x+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QurlemtwF1MwjB3Mim+A5D9PlrrHZn+JXZYlsobwsxA=;
        fh=MO8XL0O7svIJHPjhxLnBjg3DAumMVA8IiD+S7I+nZiM=;
        b=d+RNiZGXdYxmQrBuLK/yIkuc/Qsnko5Uajd/hdf8+U5wYB+ogbtEaWoixYEAFyTZRL
         ZEYw4p4qz6UcILozVOL4O85Or8ZHkEdtVEecbPxq3+oo4AgyswFRUJ1nb4Y6r0452ul4
         FvgOdYh1aob1hus9lrFIqu9YSUcIy4JNEg10/VXxwgYoB5bvQzzx/WOA5n9bMulmpCuZ
         uIkFt7IguzAwG3a9dTfy3GXbBoYoQVs7HxykGOBBIFbrPH38FIT2nV5u5CIAKcMzlsqX
         Sxt4M4rmgaOwKG1r9k+gdI/UeYcuwUYberUoomuR6hZfNGV9lZkKMe4vxGXzhqTbneZ8
         ij+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780507338; x=1781112138; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QurlemtwF1MwjB3Mim+A5D9PlrrHZn+JXZYlsobwsxA=;
        b=Y6TAsOEIPpuz3JagKDc/yRxPMAklegv9OxyHz+3xVCZ+tN28NUhqI9sCTZmsZWVaKt
         K2mxieYqM4kCFlt0O2xmJC0qTg4o6UZ3/QT4jhcNkI5/Met9OwK2tkEsyTicMe2IVh2K
         w0EjDU62evwxHTLyPMq1wgdjJFvhmtG70lzt8Wq7Fqu0TLQ1Q/gqFdVFc1ONXeRf+eKv
         PXnvE3jVWr7lmCW+kGvUBNJNmOzdp3Ww7UfI142y1jqoKYaEVIZ9TC48GvZszgWNS7py
         zdGmDz1ptSd6wwWuvDm1URT7xW2EbZ2QZiWVd9xpfH1olZXazD/87rCuEiGzaoRsLrSo
         n2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780507338; x=1781112138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QurlemtwF1MwjB3Mim+A5D9PlrrHZn+JXZYlsobwsxA=;
        b=OX++V+1LZQfJozkb23CwlgSLsXczfuGPq6XAhoyuBIK1AX3apg2I6lRPGJD6YaSmLx
         27qW7o/567knTXqTb+CsL1HT4sKsUAaBdaS+iJ+LjjdxNvKqGL4J28ru5tNLGL3EHTWz
         nwDOAYwFwAVix08i+uUWuaN1G5ysQl+KOPCiq7iifFPtTJZduR9l4I6KhghsaxE2UTos
         3BwvToKn4z/MoXrWVaVzsYaFLRU3Fq66zeqZVM0TwS3tE7vSU7U0O6viwLjhIAqG9BPz
         ZuQ6KCwXSoRYqICl9pvbW1dfymxhDODKc0lxb8rMGZc4fPYqQ+30G1b+xarP4RDNZ/mq
         WGSA==
X-Forwarded-Encrypted: i=1; AFNElJ9Nme0D5IfvQjWE2JLA4BdRw1vS7DLDPCD3TDbhh241o5zSpUGLb5ytewmsFEp5UweM/7DdpQrYCTM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ymTJOzptCQqeGPjjHGet0FjH9wY9eQeYxBNAeqprudJzxSmc
	gTe8FcUaEmUy7X3CykbZQFHfoKYS54I2M5Jb9Q4Yxhc7s2v5zr7fOQ0XCVsf+T05003DQ8GVXux
	rq0nb3pUFLoA19IgD7jWjilFW5p6Dv8U=
X-Gm-Gg: Acq92OHyv9h15M7xMI4B4k7bZ0ZgFLPlmx1rdqJ44WyePitIUw8zo3IEJiunAnkdroS
	hHSrLMdBbOyj1zQViXr00vbxO/6zX+iHjE2W2RJG5c+yJtTN+NyR3JCs74Yh0g1mX6qBM7XLa/X
	3JRpHJXt8WEBPUpoR+de9SZD6lutZz9EdQLKJ6Xj2Vl7fzGby9Y5UeX8udIvFS5vEerQCuTHACa
	dotQV9O8/TcVknzfLv+z2FjeGq94bQbMqFs4OE2wDY1tQ+Dgoc5+Tn1sIH4eX6bnbHJF1cVde9N
	4gM0Xr8Q7Vj7brhs/Zr9XGZmU65PUAOf5vCyfINuPFtFdpCnrQ==
X-Received: by 2002:a5d:5389:0:b0:45e:f2bd:2b16 with SMTP id
 ffacd0b85a97d-4602182dbb8mr5117557f8f.18.1780507338055; Wed, 03 Jun 2026
 10:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528212955.1912856-1-nphamcs@gmail.com> <ah-A2gQ0GPgerXop@google.com>
 <CAKEwX=MWX9KkSFAoN4xEMg3b+gZUN9=yd7rirAWG5NOBf26eAg@mail.gmail.com>
In-Reply-To: <CAKEwX=MWX9KkSFAoN4xEMg3b+gZUN9=yd7rirAWG5NOBf26eAg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 3 Jun 2026 10:22:06 -0700
X-Gm-Features: AVHnY4Jot3ddq7cPj22412q3gHwkkENggrGX_amw9Mz9wfEQGbpRGNvPeRfBzHk
Message-ID: <CAKEwX=MZQJLHNNU0tUqnihdhdPdVd19KhC-HtJxfbQ_d8OezzQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] mm, swap: Virtual Swap Space (Swap Table Edition)
To: Yosry Ahmed <yosry@kernel.org>
Cc: kasong@tencent.com, Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	apopple@nvidia.com, axelrasmussen@google.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, bhe@redhat.com, byungchul@sk.com, 
	cgroups@vger.kernel.org, chengming.zhou@linux.dev, chrisl@kernel.org, 
	corbet@lwn.net, david@kernel.org, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jannh@google.com, 
	joshua.hahnjy@gmail.com, lance.yang@linux.dev, lenb@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pm@vger.kernel.org, lorenzo.stoakes@oracle.com, matthew.brost@intel.com, 
	mhocko@suse.com, muchun.song@linux.dev, npache@redhat.com, pavel@kernel.org, 
	peterx@redhat.com, peterz@infradead.org, pfalcato@suse.de, rafael@kernel.org, 
	rakie.kim@sk.com, roman.gushchin@linux.dev, rppt@kernel.org, 
	ryan.roberts@arm.com, shakeel.butt@linux.dev, shikemeng@huaweicloud.com, 
	surenb@google.com, tglx@kernel.org, vbabka@suse.cz, weixugc@google.com, 
	ying.huang@linux.alibaba.com, yosry.ahmed@linux.dev, yuanchu@google.com, 
	zhengqi.arch@bytedance.com, ziy@nvidia.com, kernel-team@meta.com, 
	riel@surriel.com, haowenchao22@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 10:12=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Tue, Jun 2, 2026 at 6:29=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wro=
te:
> >
> > > II. Design
> > >
> > > With vswap, pages are assigned virtual swap entries on a ghost device
> > > with no backing storage. These entries are backed by zswap, zero page=
s,
> > > or (lazily) physical swap slots. Physical backing is allocated only
> > > when needed =E2=80=94 on zswap writeback or reclaim writeout, after t=
he rmap
> > > step.
> > >
> > > Compared to the standalone v6 implementation [1], which introduces a
> > > 24-byte per-entry swap descriptor and its own cluster allocator, this
> > > edition uses swap_table infrastructure, and share a lot of the alloca=
tor
> > > logic. Per-slot metadata is stored in a tag-encoded virtual_table
> > > (atomic_long_t, 8 bytes per slot), and physical clusters store
> > > Pointer-tagged rmap entries in the swap_table for reverse lookup back=
 to
> > > the virtual cluster.
> > >
> > > Here are some data layout diagrams:
> > >
> > >   Case 1: vswap entry (virtualized)
> > >
> > >   PTE                  swap_cluster_info_dynamic
> > >   vswap_entry          +-------------------------+
> > >   (swp_entry_t) ------>| swap_cluster_info (ci)  |
> > >                        | +--------------------+  |
> > >                        | | swap_table         |  |
> > >                        | |   PFN / Shadow     |  |
> > >                        | | memcg_table        |  |
> > >                        | | count,flags,order  |  |
> > >                        | | lock, list         |  |
> > >                        | +--------------------+  |
> > >                        |                         |
> > >                        | virtual_table           |
> > >                        | +--------------------+  |
> > >                        | | NONE               |  |
> > >                        | | PHYS               |  |
> > >                        | | ZERO               |  |
> > >                        | | ZSWAP(entry*)      |  |
> > >                        | | FOLIO(folio*)      |  |
> > >                        | +--------------------+  |
> > >                        +-------------------------+
> > >                               |
> > >                               | PHYS resolves to
> > >                               v
> > >                        PHYSICAL CLUSTER (swap_cluster_info)
> > >                        +--------------------------+
> > >                        | swap_table per-slot:     |
> > >                        |   NULL   - free          |
> > >                        |   PFN    - cached folio  |
> > >                        |   Shadow - swapped out   |
> > >                        |   Pointer- vswap rmap    |
> > >                        |   Bad    - unusable      |
> > >                        |                          |
> > >                        | Vswap-backing slot:      |
> > >                        |   Pointer(C|swp_entry_t) |
> > >                        |     rmap back to vswap   |
> > >                        +--------------------------+
> > >
> > >   Case 2: direct-mapped physical entry (no vswap)
> > >
> > >   PTE                  PHYSICAL CLUSTER (swap_cluster_info)
> > >   phys_entry           +--------------------------+
> > >   (swp_entry_t) ------>| swap_table per-slot:     |
> > >                        |   NULL   - free          |
> > >                        |   PFN    - cached folio  |
> > >                        |   Shadow - swapped out   |
> > >                        |   Bad    - unusable      |
> > >                        +--------------------------+
> > >
> > > struct swap_cluster_info_dynamic {
> > >     struct swap_cluster_info ci;       /* swap_table, lock, etc. */
> > >     unsigned int index;                /* position in xarray */
> > >     struct rcu_head rcu;               /* kfree_rcu deferred free */
> > >     atomic_long_t *virtual_table;      /* backend info, 8 B/slot */
> > > };
> > >
> > > Each vswap cluster (swap_cluster_info_dynamic) extends the classic
> > > swap_cluster_info struct with a virtual_table array that stores the
> > > backend information for each virtual swap entry in the cluster. Each
> > > entry is tag-encoded in the low 3 bits to indicate backend types:
> > >
> > >   NONE:   |----- 0000 ------|000|  free / unbacked
> > >   PHYS:   |-- (type:5,off:N)|001|  on a physical swapfile (shifted)
> > >   ZERO:   |----- 0000 ------|010|  zero-filled page
> > >   ZSWAP:  |--- zswap_entry* |011|  compressed in zswap
> > >   FOLIO:  |--- folio* ------|100|  in-memory folio
> > >
> > > We still have room for 3 more future backend types, for e.g. CRAM, i.=
e
> > > compressed-CXL-as-swap, which is laid out in [10] and [11]. Worst
> > > case scenario, we can add more fields to this extended struct.
> > >
> > > Other design points:
> > > - Both vswap entries (Case 1) and directly-mapped physical entries
> > >   (Case 2) coexist as first-class citizens. All the common swap
> > >   code paths =E2=80=94 swapout, swapin, swap freeing, swapoff, zswap
> > >   writeback, THP swapin, etc. work for both. When CONFIG_VSWAP=3Dn,
> > >   the vswap branches compile out and behavior should be identical to
> > >   today's swap-table P4 (at least that is my intention).
> > > - Pointer-tagged swap_table on physical clusters for rmap (physical
> > >   -> virtual) lookup.
> > > - Virtual swap slots not backed by physical swap are not charged to
> > >   memcg swap counters =E2=80=94 only physical backing is charged (I m=
ade the
> > >   case for this in [7]).
> > > - Careful separation of vswap and physical swap allocation paths and
> > >   structures adds a lot of complexity, but is crucial to make sure
> > >   both paths are efficient and do not conflict with each other (for
> > >   correctness and performance). I do re-use a lot of the allocation
> > >   logic wherever possible though.
> >
> > Thanks for working on this! I mostly looked at the high-level design an=
d
>
> Thank you for initiating this effort in LSFMMBPF 2023 (god, time
> flies). I was very excited by your presentation and decided to take a
> stab at it :)
>
> (I'll be sure to mention the full context in a non-RFC version - it
> has a lot of gems in our technical discussions).
>
> > the zswap parts, as the swap code has changed a lot since I was familia=
r
> > with it :)
>
> It has changed a lot since 6.19, when I was working on v6. Very
> exciting time to be a (z)swap developer right now - we have new ideas
> and new features every other week :) Reviewing code has been quite a
> joy (albeit a lot of work).
>
> >
> > It seems like the direction being taken here is that we have one
> > (massive) vswap swap device, and we keep normal physical swap devices
> > around as well.
>
> Yep.
>
> >
> > A vswap entry can point at a physical swap entry, or zswap, or zeromap.
> > If a vswap entry points at a physical swap entry, then the physical swa=
p
> > entry points back at the vswap entry (a reverse mapping).
>
> Yep.
>
> >
> > I assume the main reason here is to avoid the extra overhead if
> > everything uses vswap, which would mainly be the reverse mapping
> > overhead? I guess there's also some simplicity that comes from reusing
> > the swap info infra as a whole, including the swap table.
>
> Yeah it helps a lot that we don't have to rewrite the whole allocator
> and swap entry reference counting logic again :)
>
> >
> > I don't like that the code bifurcates for vswap vs. normal swap entries
> > though. Not sure if this is an issue that can be fixed with proper
> > abstractions to hide it, or if the design needs modifications. I was
> > honestly really hoping we don't end up with this. I was hoping that the
> > physical swap device no longer uses a full swap table and all, and
> > everything goes through vswap.
> >
> > I hoping that if redirection isn't needed (e.g. zswap is disabled),
> > vswap can directly encode the physical swap slot so that the reverse
> > mapping isn't needed -- so we avoid the overhead without keeping the
> > physical swap device using a fully-fledged swap table.
>
> Can you expand on "vswap can directly encode the physical swap slot"?
> I'm not sure I follow here.
>
> >
> > All that being said, perhaps I am too out of touch with the code to
> > realize it's simply not possible.
> >
> > Honestly, if the main reason we can't have a single swap table for vswa=
p
> > is saving 8 bytes on the reverse mapping, it sounds like a weak-ish
> > argument, even if we can't optimize the reverse mapping away. But maybe
> > I am also out of touch with RAM prices :)
>
> In terms of the space overhead I do agree, FWIW :)
>
> I think the other concern is the indirection overhead with going
> through the xarray for every swap operation, hence the per-CPU vswap
> cluster lookup caching idea:
>
> https://lore.kernel.org/all/20260505153854.1612033-23-nphamcs@gmail.com/
>
> >
> > I at least hope that, the current design is not painting us into a
> > corner (e.g. through userspace interfaces), and we can still achieve a
> > vswap-for-all implementation in the future (maybe that's what you have
> > in mind already?).
>
> That's still my plan. Operationally speaking, I want to make this
> completely transparent to users, with minimal to no performance
> overhead.

I do want to add that, even without achieving this, the current design
already enables a lot of use cases. I think it is a good compromise to
maintain both virtual and directly mapped physical swap entries for
now, and revisit the conversation of whether we can afford a mandatory
vswap layer once all the optimizations have been done :)

We should strive to simplify the codebase, and it will naturally
happen when the original overhead concern is no longer there. A
swap-related example: a few years ago, everyone thought swap slot
cache was needed. But then, Kairui optimized the swap allocator's lock
contention issue away, and that swap slot cache is suddenly redundant.
That finally allowed us to get rid of it. Similar thing happened (or
is happening?) with the SWP_SYNCHRONOUS_IO swapcache-skipping
heuristics.
