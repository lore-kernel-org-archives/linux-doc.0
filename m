Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281D831ED68
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 05:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766383045; cv=none; b=GLBuZd4+7ZKBsahsFoBpqWY7QpJ2P0gJLrG85p9PHG290FYwkeZSqcqCUpZTDjiklqYvfuQygbTzT3Q8qYUpAq/xMazvwkumBGMrrqbSwXqWQmS19EE4qm7PueI0tXN7i7F6D/DGOingODHhL7TUO2nLFxUJnsDqhYTYP96xIaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766383045; c=relaxed/simple;
	bh=M2Rp9gglET4JHEu5TnTDixKzBu7p8ieW8jV0WAMrz00=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=bwt1q/2qIU1r4p54+fAyOIhjeE+57TboeX5GW7a0kYf+kzb4TQuqLes2/sbLBURY6Cnkc4XMixVkdKera+PKFcJDzID/9XSOkZV3Qfuzq1+IG+v4d0oujxsxFOJU3mc05ud/9tjAri43/BoSAhULaveIfKewSDSOK82XRY+6DZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=n6bo2KzN; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="n6bo2KzN"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766383026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WVeKoBMBLx8hWDfGjFnYOboKEJqD6vtX332hwypLAQ0=;
	b=n6bo2KzNzuDV0QONoVz74ohKZIircu59lQvoar4w+OorHluDTi7UO0Dq7AFwG1RJSbgBYT
	PoUnqvTvlaiw5wUIO3/B9F68bvudg/HyQVtfhaCujlDVg8b5tRH5pqykc7Ib70+3JaMe2k
	+sVT61EDxvLxAVL1lHKLS55E1Lm9CQg=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCHv2 10/14] mm: Drop fake head checks
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20251218150949.721480-11-kas@kernel.org>
Date: Mon, 22 Dec 2025 13:56:25 +0800
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
Message-Id: <976A9938-0228-4230-92B2-7F6708E96199@linux.dev>
References: <20251218150949.721480-1-kas@kernel.org>
 <20251218150949.721480-11-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 18, 2025, at 23:09, Kiryl Shutsemau <kas@kernel.org> wrote:
> 
> With fake head pages eliminated in the previous commit, remove the
> supporting infrastructure:
> 
>  - page_fixed_fake_head(): no longer needed to detect fake heads;
>  - page_is_fake_head(): no longer needed;
>  - page_count_writable(): no longer needed for RCU protection;
>  - RCU read_lock in page_ref_add_unless(): no longer needed;
> 
> This substantially simplifies compound_head() and page_ref_add_unless(),
> removing both branches and RCU overhead from these hot paths.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.

