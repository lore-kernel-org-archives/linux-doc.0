Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91369173
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 06:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766383257; cv=none; b=o9G6ZAB9CCAyslflYxR+i8sPIKqj9YRwonOmHzgB7ob6+8xxnAFP6IgcqeCauwT5/m0jbVCXvydlBYikQ9xuLYP/YPKBLbSaL18RiHai1XtkX2kU0b9aDFw5/lo7kKomwsZeejR5cVeWavMhuh9rlQN8xNTav43/c9X1716YPXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766383257; c=relaxed/simple;
	bh=o8y1CWN2EuV9Ih7JQZtkhVY5yoTfAnN7idKMq57LXcI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qHuzMaihloyujK6UsxT69nJc8GbOe8VJaYTEtE3yBsMbV/d+Gd8AF7y9QKU3k52PS/pUldBeIsbCg4PGAyUBczEsmmoVbUs2UQgu88HvF2k6YjAydWKA4bE4nKrMHTnkHnEG40B+oWGnDbE63hSOUqEDGsi69XAFyUQyG7/v8JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vCJCZ7o8; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vCJCZ7o8"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766383253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YnoYetntYAKPTmqMpJsArUchXzDuI0E7C6KJhIP8qU=;
	b=vCJCZ7o8DllOX7DhHQAOSMjpud6aq+CN2IihG311TfQhv+av3UubulNaD4JSFsSEdBcOGh
	k6nDd5vsE24k8HuNJMnH2bXYy5zpCtpbg1nq0o9pDRlpJWTM4CW5OBrhkChuZpY23svjWc
	C2qAK0G5/0NANd9hQtXBveEyohdXQb8=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCHv2 11/14] hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20251218150949.721480-12-kas@kernel.org>
Date: Mon, 22 Dec 2025 14:00:09 +0800
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
Message-Id: <48BA4DA6-DE9D-4F07-B347-19D2F68B357A@linux.dev>
References: <20251218150949.721480-1-kas@kernel.org>
 <20251218150949.721480-12-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 18, 2025, at 23:09, Kiryl Shutsemau <kas@kernel.org> wrote:
> 
> The VMEMMAP_SYNCHRONIZE_RCU flag triggered synchronize_rcu() calls to
> prevent a race between HVO remapping and page_ref_add_unless(). The
> race could occur when a speculative PFN walker tried to modify the
> refcount on a struct page that was in the process of being remapped
> to a fake head.
> 
> With fake heads eliminated, page_ref_add_unless() no longer needs RCU
> protection.
> 
> Remove the flag and synchronize_rcu() calls.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.

