Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983B05D8F0
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 03:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769655940; cv=none; b=CJ+nx3Z7vPP4TGH1aArHTpk/ZcyXcOFhH9Tb4OcbdA6LXmVzQWg2doFi0BO79gHnZYEELzUGMVKDuThAifbgtJorPwT2fyo3KPWESUN3mKhvU6Zuv2n/xLIo0NTkrzAb7TduShoV4psBBEGNANAg1j/sEMdBQA1QP08coO72e3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769655940; c=relaxed/simple;
	bh=Ue039tEnrJrYlpQldK4S01STMT/eR+TB40AwD3WMwU4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=IWPoXnbOMt6lFiLRk/fA9zvxRmHcbDYNcYQmuO2przchF9HtI/Eu4Qjsk6zrn7NPPZupW74GOwchQm5LwbXSZ2SYqPi/ogfQGq4btGeROXgXJo5ZcYx5pAXvfrc/tf+fGV+Ul/cPdXklpzx8OeBwOWnw4eapF2daW+KonoZ3QgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=huWhiz1w; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="huWhiz1w"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769655932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=an0cSs0GytVePatdoHmbGbyCizuHZjF2ab0BxwHmZLU=;
	b=huWhiz1wekIwHSdbnJbtxQhrvvGoKBz9P5Qnh5MFrkRE4/aIY2UhUCfsqagQMlYsYnfb7/
	v8deIDW5nWZ26ZpvuZf1+WS1BBDhtE/rjb50VwIMP4Nnc8uluXO+7rJ7tp1Eikp59O5dxJ
	de0tQUCZRH2ZcTwTOtMAKATYFLeZ3sk=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv4 09/14] mm/hugetlb: Remove fake head pages
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <aXoHb5fYfZNQxmMe@thinkstation>
Date: Thu, 29 Jan 2026 11:04:53 +0800
Cc: Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7BD81F46-74A0-4991-8B32-67E5DBC682B3@linux.dev>
References: <20260121162253.2216580-1-kas@kernel.org>
 <20260121162253.2216580-10-kas@kernel.org>
 <ffe9811b-d7f8-4924-9ad6-96057a16b693@linux.dev>
 <aXjPf_fIWX74YVWD@thinkstation>
 <25C01EB2-FC77-43A5-A737-7BD3D2D98EDE@linux.dev>
 <aXoHb5fYfZNQxmMe@thinkstation>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Jan 28, 2026, at 20:59, Kiryl Shutsemau <kas@kernel.org> wrote:
>=20
> On Wed, Jan 28, 2026 at 10:43:13AM +0800, Muchun Song wrote:
>>=20
>>=20
>>> On Jan 27, 2026, at 22:51, Kiryl Shutsemau <kas@kernel.org> wrote:
>>>=20
>>> On Thu, Jan 22, 2026 at 03:00:03PM +0800, Muchun Song wrote:
>>>>> + if (pfn)
>>>>> +  return pfn_to_page(pfn);
>>>>> +
>>>>> + tail =3D alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
>>>>> + if (!tail)
>>>>> +  return NULL;
>>>>> +
>>>>> + p =3D page_to_virt(tail);
>>>>> + for (int i =3D 0; i < PAGE_SIZE / sizeof(struct page); i++)
>>>>> +  prep_compound_tail(p + i, NULL, order);
>>>>> +
>>>>> + spin_lock(&hugetlb_lock);
>>>>=20
>>>> hugetlb_lock is considered a contended lock, better not to abuse =
it.
>>>> cmpxchg() is enought in this case.
>>>=20
>>> We hit the lock once per node (excluding races). Its contribution to =
the
>>> lock contention is negligible. spin_lock() is easier to follow. I =
will
>>> keep it.
>>=20
>> I don't think cmpxchg() is hard to follow. It=E2=80=99s precisely =
because of
>> your abuse that interrupts still have to be disabled =
here=E2=80=94hugetlb_lock
>> must be an irq-off lock. Are you really going to use spin_lock_irq =
just
>> because =E2=80=9Cit feels simpler=E2=80=9D to you?
>=20
> I looked again at it and reconsidered. I will use cmpxchg(), but =
mostly
> because hugetlb_lock is a bad fit to protect anything in pg_data_t.
> vmemmap_tails can be used by code outside hugetlb.
>=20
> Here's the fixup.
>=20
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 29e9bbb43178..63e7ca85c8c9 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -512,18 +512,11 @@ static struct page *vmemmap_get_tail(unsigned =
int order, int node)
> 	for (int i =3D 0; i < PAGE_SIZE / sizeof(struct page); i++)
> 		prep_compound_tail(p + i, NULL, order);
>=20
> - 	spin_lock(&hugetlb_lock);
> - 	if (!NODE_DATA(node)->vmemmap_tails[idx]) {
> - 		pfn =3D PHYS_PFN(virt_to_phys(p));
> - 		NODE_DATA(node)->vmemmap_tails[idx] =3D pfn;
> - 		tail =3D NULL;
> - 	} else {
> - 		pfn =3D NODE_DATA(node)->vmemmap_tails[idx];
> - 	}
> - 	spin_unlock(&hugetlb_lock);
> -
> - 	if (tail)
> + 	pfn =3D PHYS_PFN(virt_to_phys(p));
> + 	if (cmpxchg(&NODE_DATA(node)->vmemmap_tails[idx], 0, pfn)) {
> 		__free_page(tail);
> + 		pfn =3D READ_ONCE(NODE_DATA(node)->vmemmap_tails[idx]);
> + 	}

Simpler than before.

>=20
> 	return pfn_to_page(pfn);
> }
> --=20
>  Kiryl Shutsemau / Kirill A. Shutemov


