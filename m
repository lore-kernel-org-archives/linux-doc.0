Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6633B1B0F1C
	for <linux-doc@vger.kernel.org>; Fri, 25 Oct 2024 19:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729883477; cv=none; b=bFlO+UF5jGaezv3Vx+eoUKp8AsWNfyfTkmqPL2joSSUbah6kO00YRtgVsy0uMY3nrsEm/mQklWDUmgJjYOwPzjKweKX7720AurKoxvJic/9NcfRkBKPOpfVMB32GnJ/330wHRuCzslsDrK/BKjFyWqY+yEv5ox5eAeWhI0zVdlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729883477; c=relaxed/simple;
	bh=C8IWUZ38YCW1xMDD3Caq6nmzSnDsA5GpEHUxOYRTKa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G1wjZiwT1huCyhvv6KNGXNZBGKvQJaikas0n+bM/Eqgv4YfAlEfDA9Y9rksJ8GQNdnp3VUost3Wu9jKmE4hNToor2C1+1EMa1U64MIIGr1AzLkCP+DI3Fe9GMqomkddnwgS8NN2XylG6z8MNMjq9Lu5DPy/OcntKHPL1IYMHW2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pXGmRDVO; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pXGmRDVO"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a0f198d38so331172566b.1
        for <linux-doc@vger.kernel.org>; Fri, 25 Oct 2024 12:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729883474; x=1730488274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+V2gicBaBl7PEEs6aTCwYwoLlKwlg1ivy8jDgkDE+I=;
        b=pXGmRDVOMz5DDQgkhi3t9/Vv+rFWe+60VpBxnUSvuyzjp8WqjAWDdZDdyp0DZtkuGF
         hQjY/G1MGWU1/HQvnpM14wrOYTlfVgD2chY6Md41/meklwY9mOIYQd6a7LZj6jGgbmVa
         11gyBjXFnmUxKeLPdF3mfgV+eBeq//khgO2wX2iA0APQB2jJfDmK4FUv8NgFoowcZGy8
         uCpqcMXLTU9tZkx9Kz8gIM5FGlN/YdRxAqZ8PzitmFQiztBblWAq5RaWI11qlF7aAwW4
         8Nwvf2MNRB3KmTMO9BBT5/PFiydsgDo99yLKs9iL4mdMKv3nu4HU5ZAXD2B1bIZQIgWC
         5Tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729883474; x=1730488274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+V2gicBaBl7PEEs6aTCwYwoLlKwlg1ivy8jDgkDE+I=;
        b=hEsKSlnDBJ7RqnSXpiGwuN1GW4WIsAOkKGFbyiMkURRMXpLACwox3t3SWvUMAzMv5I
         DcGbXhKlWEs8tgH55VZcqwbhTyfw0/bBB7XzuKAI/Ffd/dhjVKaq9VMoJm8agUH926P9
         6q6y6BuHuxJizoFpBzyQZaBisukNBhYEQ4hJYrjW7/BKOZOksT1xvtSaV4Qmlg646uwH
         IZcGdjq0sVahTSKCvFs+fn7xG5IoDayj0S1gyCrwwHc1ajEfF0NEEEj9vryHzbg/uLGN
         NqGEMAyVzaSIHD9SPVvf4IfR4DGkLZLx40ylW2TqWSi2A9YW+/Bzg7fe9DYYCkvPRego
         IdVw==
X-Forwarded-Encrypted: i=1; AJvYcCUJO0afdp9JuoP3KNyWGsyWRzTe2gUaIceeMEFywVTy9B1Un5T7yU7ivOc9oDB6IsrDweuXFnqwZc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSAFZ2fOpAP/ykGDSU4jkrQMT2J/vjqW4sBmazL0SaaiaTAvaM
	hBPICBQm07aLCk+RSAO8f0Dcpp/M2ahjqR2JhC2USWzLU7DjPVsaUCogF+C4PlC4mWdAvSxB52a
	HWSinIglkm3UQKrUh2Y4T1SH6DH84xOojRNXp
X-Google-Smtp-Source: AGHT+IFhPUBKlnDRmyDDdYmN45BuvAFdxY8aPcUUJgzYOw8ZupqUu2AZb0uq8uR0DYvoOi89Mv4qDmTjd0Sm7BdWRTU=
X-Received: by 2002:a17:907:3f04:b0:a9a:11f5:8cd9 with SMTP id
 a640c23a62f3a-a9de61ea9f8mr14067466b.56.1729883473609; Fri, 25 Oct 2024
 12:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018105026.2521366-1-usamaarif642@gmail.com>
 <20241018105026.2521366-2-usamaarif642@gmail.com> <CAJD7tkYEe10Xw-8azM-80pHv6YjvosZDHTdZfYttAuD5u1+s8A@mail.gmail.com>
 <07e6018b-bc6f-4e1e-9bc3-07a4b5a384fc@gmail.com> <CAJD7tkaD0m7ciiy6Nj7CZb2_26Dv4T=2cRW7h728vLxczOVkYg@mail.gmail.com>
 <CAKEwX=PVbiEd9_4NAvLrHG9dr3k-25c4AB1iEagi4ZBcYRX24w@mail.gmail.com>
In-Reply-To: <CAKEwX=PVbiEd9_4NAvLrHG9dr3k-25c4AB1iEagi4ZBcYRX24w@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Fri, 25 Oct 2024 12:10:37 -0700
Message-ID: <CAJD7tkaMThYdgBNJnm913u0MYGnh73pzKd8wDbOX0T6nxxdvqA@mail.gmail.com>
Subject: Re: [RFC 1/4] mm/zswap: skip swapcache for swapping in zswap pages
To: Nhat Pham <nphamcs@gmail.com>
Cc: Usama Arif <usamaarif642@gmail.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	hannes@cmpxchg.org, david@redhat.com, willy@infradead.org, 
	kanchana.p.sridhar@intel.com, chengming.zhou@linux.dev, ryan.roberts@arm.com, 
	ying.huang@intel.com, 21cnbao@gmail.com, riel@surriel.com, 
	shakeel.butt@linux.dev, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Kairui Song <kasong@tencent.com>, 
	Kairui Song <ryncsn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 11:19=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Tue, Oct 22, 2024 at 5:46=E2=80=AFPM Yosry Ahmed <yosryahmed@google.co=
m> wrote:
> >
> > [..]
> > > >> @@ -1576,6 +1576,52 @@ bool zswap_store(struct folio *folio)
> > > >>         return ret;
> > > >>  }
> > > >>
> > > >> +static bool swp_offset_in_zswap(unsigned int type, pgoff_t offset=
)
> > > >> +{
> > > >> +       return (offset >> SWAP_ADDRESS_SPACE_SHIFT) <  nr_zswap_tr=
ees[type];
> > > >
> > > > I am not sure I understand what we are looking for here. When does
> > > > this return false? Aren't the zswap trees always allocated during
> > > > swapon?
> > > >
> > >
> > > Hi Yosry,
> > >
> > > Thanks for the review!
> > >
> > > It becomes useful in patch 3 when trying to determine if a large foli=
o can be allocated.
> > >
> > > For e.g. if the swap entry is the last entry of the last tree, and 1M=
 folios are enabled
> > > (nr_pages =3D 256), then the while loop in zswap_present_test will tr=
y to access a tree
> > > that doesn't exist from the 2nd 4K page onwards if we dont have this =
check in
> > > zswap_present_test.
> >
> > Doesn't swap_pte_batch() make sure that the range of swap entries
> > passed here all corresponds to existing swap entries, and those
> > entries should always have a corresponding zswap tree? How can the
> > passed in range contain an entry that is not in any zswap tree?
> >
> > I feel like I am missing something.
> >
> > >
> > > >> +}
> > > >> +
> > > >> +/* Returns true if the entire folio is in zswap */
> > > >
> > > > There isn't really a folio at this point, maybe "Returns true if th=
e
> > > > entire range is in zswap"?
> > >
> > > Will change, Thanks!
> > >
> > > >
> > > > Also, this is racy because an exclusive load, invalidation, or
> > > > writeback can cause an entry to be removed from zswap. Under what
> > > > conditions is this safe? The caller can probably guarantee we don't
> > > > race against invalidation, but can we guarantee that concurrent
> > > > exclusive loads or writebacks don't happen?
> > > >
> > > > If the answer is yes, this needs to be properly documented.
> > >
> > > swapcache_prepare should stop things from becoming racy.
> > >
> > > lets say trying to swapin a mTHP of size 32 pages:
> > > - T1 is doing do_swap_page, T2 is doing zswap_writeback.
> > > - T1 - Check if the entire 32 pages is in zswap, swapcache_prepare(en=
try, nr_pages) in do_swap_page is not yet called.
> > > - T2 - zswap_writeback_entry starts and lets say writes page 2 to swa=
p. it calls __read_swap_cache_async -> swapcache_prepare increments swap_ma=
p count, writes page to swap.
> >
> > Can the folio be dropped from the swapcache at this point (e.g. by
> > reclaim)? If yes, it seems like swapcache_prepare() can succeed and
> > try to read it from zswap.
> >
>
> I think you're onto something.
>
> Can this happen: say T2 writebacks a couple of tail pages, but not all
> of them, then drops everything from swap cache. Then T1 can definitely
> proceed. It would then check again in zswap_load(), which returns
> false (thanks to zswap_present()) test.
>
> All fine and good so far, but then in swap_read_folio(), it would try
> to fall back to reading the entire large folio from swapfile, which
> will contain bogus data in pages that have not been written back by
> T2.
>
> I think the problem is swap_read_folio() assumes it always succeeds,
> and a precondition for successful reading is the large folio must have
> no mixed backing state for its subpages, which we fail to guarantee
> before entering swap_read_folio(). This can lead to memory corruption.
>
> Buuut, I think all we need to do is just check the backing state again
> after T1's swapcache_prepare() call. At this point, we are guaranteed
> to have a stable backing state. If it fails here, then we can just
> exit and fall back to individual page swapping in.

I think this should work, but we need to take a closer look for other
things that can go wrong along this path.
