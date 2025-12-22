Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ABB3242AA
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 03:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766372453; cv=none; b=HHBAnga8t8IzFGXv5CY8x9ynf2XgXd9qqba+qnc6yKE8vnhxNOM9WmEKsblr6KEkLWBcpGnaSdryEtG3WiYi1vU1YO7RVQVVll5N6q8C8tq3yLxfL5xYpzYTx31n8WWxfjBkMImcOAoHJuptJhG9+SB2VyLNC4cpub7/K62CIYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766372453; c=relaxed/simple;
	bh=tz6WBPbMsCl3k+S3Jc2NovD1ezIMKzUfTdTk78TVn9U=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qgHHKygTE+41r3etDUPxhUl/O9iOKUSQ+H6rAMStXsUVfOlwvgTWcEv7mGoHbHaATZa2ascPA0F9YVqkQjTsGJegIMgn5t0VGEwCNifChFQuyI2W7xs4TNF6XNEMlivIxsiSTxckV6zWrRlDrOh8GIbEpJTOC9B/8lmcxzFjr8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vxbPEKyu; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vxbPEKyu"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766372444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YSeHczoqP12Y8AVomaqptrBKs4j+Qk5o6drkuI0H/pg=;
	b=vxbPEKyuOY5d8vxLynCKQE55Fcn0Urid3Ha7WmyBAGR/dOPhxVv+AMF4ezxsZMOmalwc44
	/n6ZUGcVuW7St/bI9SobajzvxsZJzqyJ6TriQHiDuVDb/FUilFDCoxsI29GAG8R1EbT4+d
	CKLliPY55UW8YFdhTdeqBVlHHqeCiQc=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCHv2 04/14] mm: Rename the 'compound_head' field in the
 'struct page' to 'compound_info'
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20251218150949.721480-5-kas@kernel.org>
Date: Mon, 22 Dec 2025 11:00:00 +0800
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
Content-Transfer-Encoding: 7bit
Message-Id: <98BDC08B-9A77-44BE-8BBD-FF9F8E4A6DF4@linux.dev>
References: <20251218150949.721480-1-kas@kernel.org>
 <20251218150949.721480-5-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 18, 2025, at 23:09, Kiryl Shutsemau <kas@kernel.org> wrote:
> 
> The 'compound_head' field in the 'struct page' encodes whether the page
> is a tail and where to locate the head page. Bit 0 is set if the page is
> a tail, and the remaining bits in the field point to the head page.
> 
> As preparation for changing how the field encodes information about the
> head page, rename the field to 'compound_info'.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.

