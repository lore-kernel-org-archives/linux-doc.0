Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3539525A2A2;
	Fri,  5 Dec 2025 20:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764965776; cv=none; b=V8k9WHDXsLLwNBYCsd3KsmhXUUPTPIjPkJ9uVN5vUfO68hF7zYaCETWO9jdENW65iDSEsFX2OiKl8Fy1YN7stOQF6sX1EE1S2KqZ5Q94KzaTZ6j3rZf4GF+6t10w4FjhnsW6XlJncEBCdnkbI6UAnVB7CBjOrgNqzIwVFU43rOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764965776; c=relaxed/simple;
	bh=E4s57Tz9tzxIMU0MBRYjGC3Nt6sR6FLq2/tAjqCyDJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ewfRc5SzJ/GH7tkCFCEkTILxnU79ESSfL/AGSYsMn1ooXTglltdF+Njdap8q7yRKeSQU5q3rYcL1W+9L/XaB90wx9Z5KW3erXMwjNNl4TaEiHoK9t2uDOyeDp+HTjR1CGaoyRgT7j5rR21SoeAG8ubeIMBSqJJSRRN77IyDtad0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0rdE2Lv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0rdE2Lv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687B3C4CEF1;
	Fri,  5 Dec 2025 20:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764965776;
	bh=E4s57Tz9tzxIMU0MBRYjGC3Nt6sR6FLq2/tAjqCyDJQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l0rdE2Lvq0UaVW47Slc6FIFIGZOx418XTGKhAETZ5dqpJSeXbmfhyRsV5WPiOZ15j
	 OAzaxT8UeP8NTDe46ldPvIizY6p35Ei5ROnAvPvC1qfQf0m7uyRQurgM67Nm4nuN+Y
	 IHViwqbWJBdJwhBqcKR2ohAp/o3Rgl7JR3o9RHM8DWfkYO2FrcHGW3q2qkG4dod6pd
	 3AQ9bi87HrVN2LhxtPoghHZqZ00CawFFtPmurtCpot3gwBsh/L80OPzHvfYCbYFgix
	 +6F8VBEmS2gYPjp+LuST+E3bgrOV4xI+canQctQZ4vebIj81x1m27qd/5bu0R8qLJQ
	 zyYZyvs1aEVrA==
Message-ID: <e1c50f7e-cec4-4676-b5d6-f6446cd64ba5@kernel.org>
Date: Fri, 5 Dec 2025 21:16:08 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] mm/hugetlb: Eliminate fake head pages from vmemmap
 optimization
To: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Usama Arif <usamaarif642@gmail.com>, kernel-team@meta.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251205194351.1646318-1-kas@kernel.org>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251205194351.1646318-1-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/5/25 20:43, Kiryl Shutsemau wrote:
> This series removes "fake head pages" from the HugeTLB vmemmap
> optimization (HVO) by changing how tail pages encode their relationship
> to the head page.
> 
> It simplifies compound_head() and page_ref_add_unless(). Both are in the
> hot path.
> 
> Background
> ==========
> 
> HVO reduces memory overhead by freeing vmemmap pages for HugeTLB pages
> and remapping the freed virtual addresses to a single physical page.
> Previously, all tail page vmemmap entries were remapped to the first
> vmemmap page (containing the head struct page), creating "fake heads" -
> tail pages that appear to have PG_head set when accessed through the
> deduplicated vmemmap.
> 
> This required special handling in compound_head() to detect and work
> around fake heads, adding complexity and overhead to a very hot path.
> 
> New Approach
> ============
> 
> For architectures/configs where sizeof(struct page) is a power of 2 (the
> common case), this series changes how position of the head page is encoded
> in the tail pages.
> 
> Instead of storing a pointer to the head page, the ->compound_info
> (renamed from ->compound_head) now stores a mask.

(we're in the merge window)

That doesn't seem to be suitable for the memdesc plans, where we want 
all tail pages do directly point at the allocated memdesc (e.g., struct 
folio), no?

@Willy what's your take?

-- 
Cheers

David
