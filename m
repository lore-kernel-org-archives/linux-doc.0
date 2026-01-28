Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4680A29D27A
	for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 02:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769568238; cv=none; b=V+mKrC1vgY1c3XarLQm8adEHz+eICvYXgM/ujeOJBS2vaS7QQGt8LDmYVCp3ZZXvZpL3FZGJnKBJ/0LdF3J5kdka+Djxs4JEbkjwmcr5IGKpT/+PDjVQo0EWe879l2j375Tr8y2eA3hWNK06sJFHpBO9nkvNOcikqZjij7DOMGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769568238; c=relaxed/simple;
	bh=rmlBWbrpLJmuGyDEJz4UqJEQ2w0YUoxYuDKSKgdVkng=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dXNrjx6bbEu6IqSwGY+tOqxVzrJ8P08SAS27EaVBmeXbZQM+Vfe93p+QMxjpmQNk4YRM47lB4Unnj0b9iaAE37o7EcgtZkH6vHC3QQb63EBpjrT0QMSRF0ZGE1vWZiog52oplEltFJVIbQwJ9AZgOT56G0vYR4CSgp7uo2O4ga8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AwSz2b3e; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AwSz2b3e"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769568235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I3hcu+djTXiL86WSU47ccNO5VGh/Ab4OkQ+kc4ZUgqM=;
	b=AwSz2b3eZt+OrN40xQ2hPCXZjqKMFP4j6YuyJdyfettfaftqWvuFEN/iY9ks5CzOKdOoA9
	Iclm9/h8yjrGsQNL6rs8nKgDY7NuyBQySNnuzqpgQScwCeNVFwihRh4cgpR0ijobcxTogB
	AJBZ+EY+WnFDqY9Pih0rAefDsVBcOVo=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv4 09/14] mm/hugetlb: Remove fake head pages
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <aXjPf_fIWX74YVWD@thinkstation>
Date: Wed, 28 Jan 2026 10:43:13 +0800
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
Message-Id: <25C01EB2-FC77-43A5-A737-7BD3D2D98EDE@linux.dev>
References: <20260121162253.2216580-1-kas@kernel.org>
 <20260121162253.2216580-10-kas@kernel.org>
 <ffe9811b-d7f8-4924-9ad6-96057a16b693@linux.dev>
 <aXjPf_fIWX74YVWD@thinkstation>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Jan 27, 2026, at 22:51, Kiryl Shutsemau <kas@kernel.org> wrote:
>=20
> On Thu, Jan 22, 2026 at 03:00:03PM +0800, Muchun Song wrote:
>>> + if (pfn)
>>> + 	return pfn_to_page(pfn);
>>> +
>>> + tail =3D alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
>>> + if (!tail)
>>> + 	return NULL;
>>> +
>>> + p =3D page_to_virt(tail);
>>> + for (int i =3D 0; i < PAGE_SIZE / sizeof(struct page); i++)
>>> + 	prep_compound_tail(p + i, NULL, order);
>>> +
>>> + spin_lock(&hugetlb_lock);
>>=20
>> hugetlb_lock is considered a contended lock, better not to abuse it.
>> cmpxchg() is enought in this case.
>=20
> We hit the lock once per node (excluding races). Its contribution to =
the
> lock contention is negligible. spin_lock() is easier to follow. I will
> keep it.

I don't think cmpxchg() is hard to follow. It=E2=80=99s precisely =
because of
your abuse that interrupts still have to be disabled here=E2=80=94hugetlb_=
lock
must be an irq-off lock. Are you really going to use spin_lock_irq just
because =E2=80=9Cit feels simpler=E2=80=9D to you?

>=20
> Ack for the rest of your comments.
>=20
>=20
> --=20
>  Kiryl Shutsemau / Kirill A. Shutemov

