Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBA42FFDEE
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766390321; cv=none; b=novubLpriOQFj544hp3tVUYWb2ZldMFCYpwIVwogxtaBgnU/GjRL2RGztUJDGlKQ1rmgxBHq8Z0AdodfmxgDCR8EZDt1YKODt8yoeAz88t8lnA4WqAuwokkA84GtmnpfQVo97wLywmX4YutS5xpUyOBjtckDP3b/yLm6WtSuT3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766390321; c=relaxed/simple;
	bh=ylWioNhICSSpBRob2bsrVLxiTy6B4jhPYZz39fA3Tlk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=RTcdH9DRIty9iGh8Qa/GMPbtEFZ/PtLIbzX40mBXooidlZS7vcDr9tYlXab+JdLC8J0KCJzrj3F1I7VFdaUP9dCZABHngvPofLHxJICDmkOBWNk06YKi1amH0YCz2WLnjh4QTo8WK36dVy7/t3FyHjEL2PVEm0QqBXuVILWncTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KGqu3qj9; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KGqu3qj9"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766390312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylWioNhICSSpBRob2bsrVLxiTy6B4jhPYZz39fA3Tlk=;
	b=KGqu3qj9PBEfdH6tBRkNtw3gXVqHf7LSyqjNSB4UEMGOaSTbM1wDeVDQPhYXpVQoRk+gwR
	wlqqV5X58Pb1aLFtRuuRDMYWOnxFJUBSDkjpMsO+aDD1+rS/26u4eFXxDucRG85Dd2khdm
	UBMS0VKISsnp5U1RUJXf39HkzQCS+QE=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCHv2 06/14] mm: Rework compound_head() for power-of-2
 sizeof(struct page)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20251218150949.721480-7-kas@kernel.org>
Date: Mon, 22 Dec 2025 15:57:40 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>,
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
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <34BED0AB-22AF-4107-84FB-543D11BCA136@linux.dev>
References: <20251218150949.721480-1-kas@kernel.org>
 <20251218150949.721480-7-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 18, 2025, at 23:09, Kiryl Shutsemau <kas@kernel.org> wrote:
>=20
> For tail pages, the kernel uses the 'compound_info' field to get to =
the
> head page. The bit 0 of the field indicates whether the page is a
> tail page, and if set, the remaining bits represent a pointer to the
> head page.
>=20
> For cases when size of struct page is power-of-2, change the encoding =
of
> compound_info to store a mask that can be applied to the virtual =
address
> of the tail page in order to access the head page. It is possible
> because struct page of the head page is naturally aligned with regards
> to order of the page.
>=20
> The significant impact of this modification is that all tail pages of
> the same order will now have identical 'compound_info', regardless of
> the compound page they are associated with. This paves the way for
> eliminating fake heads.
>=20
> The HugeTLB Vmemmap Optimization (HVO) creates fake heads and it is =
only
> applied when the sizeof(struct page) is power-of-2. Having identical
> tail pages allows the same page to be mapped into the vmemmap of all
> pages, maintaining memory savings without fake heads.
>=20
> If sizeof(struct page) is not power-of-2, there is no functional
> changes.
>=20

Forgot to mention, I believe I stated in the previous version that this
mechanism only applies when CONFIG_SPARSEMEM_VMEMMAP is configured.
Therefore, you need to wrap the entire mechanism within =
CONFIG_SPARSEMEM_VMEMMAP.
For other configurations, it's difficult to guarantee alignment to a =
very
large size (for example, in the case of CONFIG_SPARSEMEM && =
!CONFIG_SPARSEMEM_VMEMMAP,
vmemmap allocation uses kvmalloc, which only guarantees PAGE_SIZE =
alignment
for the returned address).


