Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618A037881C
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 20:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771879625; cv=pass; b=L2Z9jium8dqWGum6ky8chEW7eSKqbae/smRZMmM7xLr6K4O4+Sv87uyp2VOByEluG01c24H4A8P6bKgmzL2e7qJ1EWZkSciUr6VGz98iE1FQ64HpkSodn3ow5mRXVRSUFk3IEhZPiTcFUJh8d/pXSDjsB4fIdpSR1nz4f6DnOe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771879625; c=relaxed/simple;
	bh=EVemFSQFzNJxJhu0+Ux/v0A4lvPBlu5NCCP1e1e9qzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DE6f7FhKAlsPlK0SNzcVEv69/ZC0JI+VeySVvkYCFMbP5fkNlexOkyJug0pN2prw/NQX2fq+Mb8G8g3Od79AQ6QWKO2Q63tf2IEZTToKvoNsQWqEyZ3knuWQ2je30ERviVdYF4M9sjBDadOOt7QD0F+ZIrhokv5kBBmdkb/XVU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y4eByC9T; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y4eByC9T"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806b0963a9so16355e9.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 12:47:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771879623; cv=none;
        d=google.com; s=arc-20240605;
        b=AmBR3V+huALN7xp6yyvx9WHJ9NvCXpk192v/Rx0hZh+kOT0q83J5sBUyBxwTWAgr/q
         wDZgmySUJegw470eMeTp++YD+rXhkLBWaAcdqeX+FA2b6AO8sOBqk9lAMx4mug/My7C3
         WeuoWlHVhV4kt4ibn+Mu/ltA0YDUyDbM8tvxpaTK8zU1aABxBHmj/ygpGuUx3nRhsUIS
         zU2YzZDRp4WMOJXLBSrSZgOBnCKu2UmNpJ9Y5QL0C/OmRwH4xBR2jadOPjFRWl4fnXHT
         RvN6bka8avoaHOCxq5+CnUYgnEWmGniOxPxfCwM+noyrweXXnFzrptYIblQPI+VQhVGM
         5IlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LLvPmAWJUbvsu9W27Db/ZOo45wfaEQF3rbARD4LQ3sw=;
        fh=hhSFgThMle5XvNxx6rfLrys20CXBxl5PyeNnduZSZqM=;
        b=GONOsk/lTHvQC/5L7fhZT6wt5xLKb10dTTfc/tWjHmZ0CmNxgxe8sNrpvRMcLgA3zd
         45dr8oNCeVmlru5/VRWJmubD017S0v8JcSnDSihb/lQDMIHyRxD4JoGg+SYdy++FYG9P
         1NoymDWbkIPf3EHam3hBjw/gunwDs0MBHF5mYiv4eRzvC6WY+5aG5kHa6shViNvtP03I
         XUvyJZ2BTbC8U9JgIop63/15rysHhErmRhNXJNZlB1dtdqUx1XLUoI8a4OIxWTmsBol/
         CwnlQ4JPDbjJwEH25Pbv5bGkuAZsp1/YxE4O4ACiNOMMToC0+AsOJ/CsekPBCKK/hHam
         SEug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771879623; x=1772484423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLvPmAWJUbvsu9W27Db/ZOo45wfaEQF3rbARD4LQ3sw=;
        b=Y4eByC9ThwScsNoPS/SS3tx2dR9BQY/NsJWPiceip0Pc1PFpEzNDc9flPUAiKMw6l2
         iCJQhNXwhY4CudBcgf3hdmnDpCiqCKVrn/Tsa5JTuuwvEMQ9CA+1004GACxBsaCt8Hnk
         xAdFdSJSDz8G53rIlZ2ytUNpqZTzcmCn78FMRokWfqeVRzVdOOlg9xE3xuSPkl2c/2ZG
         cxV72eAnqo7hizXsKogbHG7KnbI/4zGEzdhzFJWHVPLawj67pEDDi/n3/t812i0hI0ZN
         RiVxUswr9prPYAWCGLybDHtBwMw+wj5pSy1zSzUCTFtE6sPas5zYuIWruABWxnBKE2Oi
         Q0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771879623; x=1772484423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LLvPmAWJUbvsu9W27Db/ZOo45wfaEQF3rbARD4LQ3sw=;
        b=H8U0ztEM5rlAVY6s6Y6QYrqo3rzE+7fZmbsKnt7f4Z9W6o7BuYptfLLoPQKCr7HYU/
         cyspjLF6ZmK7pJ4zsfGJ6z4FGkfyLDiT4+hXuGTPt+LZYkR7JOTA/kYWaGYGzQD5RjbH
         byuOR9i9tCxnE+0Epg11ODqFPizVGzJwOAy2ddbgpEidvFBEdTW91L6IsA396QBLRAVY
         yROF88HS5vtzrJgxNz1wWlsJCmpZKQyv8zOxwOrKd/M3NeHSxP0wn9qgjNtLLro6iewn
         I5BEDjaR1OPgqH6B2Fv5T+Vaqpd/lAgPVhBscwi4dFSAIbklfdLeN9YntXGKuO9R9jZ/
         yfvA==
X-Forwarded-Encrypted: i=1; AJvYcCWY0lXFAELgMWdfAYfDhjN/yYLvIqEOfKP79G4HBSzkRJm1ZsVjZMDOPDeqWo6UwDUhPu6vC3ffJ6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDmekcBD0YlSSg2fCb+gqm3IRLt8JEviAE3yh0fvFKDZHfOEsf
	9D9XR5P1agZJfzXHwx6prPo2OxsL/xPOeHzygYKpSqIuAHRim39v8cvgXaDliACodtkbmyQkQNl
	OQ972pP1KkBGrEhNtMeIV32v/PDeeYhrSyNvUCRE8
X-Gm-Gg: AZuq6aIxVSMzJKRHhFyE+XcXcxQKU9UOp0tXjgEdf4sMzu39nJM2akgJPiRRArceoXw
	enG2ymB07BledOYJEfwPIG71lQ4d0ZsGKvWWFgMXwosE9WJWo66Hs7mz0aIzQTKEy2Jx88Lrn6E
	zbhDra0gvEzYxAbUHy2qaQfJA36gNUKhfEKfQ51Y2ZJrhlo4xRwJe91WAU3swRNmq5LROGt4x1o
	cO4rwkVzbnNNITgPg3aIctPqIpTirv1QOO+M/IQ0yTg+VTArvmjSeE8mHEDMjJzCY36ttPcwhG0
	JdUoj/c=
X-Received: by 2002:a05:600c:4454:b0:477:86fd:fb1b with SMTP id
 5b1f17b1804b1-483b878837emr163415e9.11.1771879622202; Mon, 23 Feb 2026
 12:47:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202155634.650837-1-kas@kernel.org> <20260202155634.650837-9-kas@kernel.org>
 <aZJTLwV2SaaKu1k_@casper.infradead.org> <ec4a9a1e-8c08-4879-a787-3b9e0bc38160@kernel.org>
 <aZyZ2-7Xr-zUnInC@casper.infradead.org> <9a972701-00b4-440d-8bc2-24b8dc469843@kernel.org>
In-Reply-To: <9a972701-00b4-440d-8bc2-24b8dc469843@kernel.org>
From: Frank van der Linden <fvdl@google.com>
Date: Mon, 23 Feb 2026 12:46:50 -0800
X-Gm-Features: AaiRm53V0083kx17uKl1QJe6iH0-QHdntImophIuh0y8aAfRVd2RH3p-ebZ7RBQ
Message-ID: <CAPTztWbr7y0myXB17Vz5HEZTw8a3PJ4qaxRKgtZmt-qXx1ofeA@mail.gmail.com>
Subject: Re: [PATCHv6 08/17] mm: Make page_zonenum() use head page
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Kiryl Shutsemau <kas@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Muchun Song <muchun.song@linux.dev>, 
	Usama Arif <usamaarif642@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 11:32=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 2/23/26 19:18, Matthew Wilcox wrote:
> > On Mon, Feb 16, 2026 at 10:06:57AM +0100, David Hildenbrand (Arm) wrote=
:
> >> On 2/16/26 00:13, Matthew Wilcox wrote:
> >>>
> >>> You're right that different pages in the same folio can have differen=
t
> >>> zone number.  But does it matter ... or to put it another way, why is
> >>> returning the zone number of the head page the correct way to resolve
> >>> this?
> >>
> >> How can a folio cross zones?
> >
> > I thought 1GB pages in hugetlb could cross zones?  Maybe that used to b=
e
> > true and isn't any more, or maybe it was never true and I was just
> > confused.
>
> I recall that 1G folios could end up in ZONE_MOVABLE (comment in
> page_is_unmovable()), but my memory is fuzzy when it comes to crossing
> zones (ZONE_NORMAL -> ZONE_MOVABLE).
>
> Freeing+reinitializing the vmemmap for HVO with such folios would
> already be problematic I suppose: we would silently switch the zone for
> some of these pages.
>
> When freeing such (boottime) hugetlb folios to the buddy, we use
> free_frozen_pages(). In there we lookup the zone once.
>
> Likely also problematic :)

HugeTLB folios weren't supposed to cross zones, but they could do that
in some cases for bootmem (memblock) allocated pages, causing the
issue you describe.

I fixed that with 14ed3a595fa4 ("mm/hugetlb: check bootmem pages for
zone intersections"), so they won't cross zones anymore. The other
allocation methods used for HugeTLB folios, alloc_contig_pages() and
cma_alloc_folio, won't return anything that crosses a zone boundary by
their nature.

So I think that's all good.

- Frank
