Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5112DFA5B
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 02:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769048606; cv=none; b=G+npCWfveOlI1fn1an2oeTgG8h4Atcekg9iWn8Rl2q2IffzFekKIMQkR7BF86s2eryRpzCArCPghZsiuuNGOcbKc+uuxum0tDg/bBxhYvDSCED11T1ehihWbz/qyvnnvi/dd82DGUyWLAeXOBEMGbynFCjKnUWxoAy77JJKxA2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769048606; c=relaxed/simple;
	bh=xR7v9VuCRSMJi5oRkoNaxBn3EU8tODLYJSqTPmnYYDQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dqt2VWvkDP6sbCM5fztTjK6qVdiXB2nWjVpcH1xRwSf8DWyh9UaJLHcx1wMIzW4pzU/XAQhC65xHz836vJIKL8uUigx687fwZVP4BVIMmxhd8VUYSiW1n7NcxIV0J69dreJ+yLbpe/f1DUYfWBsABfVhednd95RK0TExTXvPQd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bNnN+GwT; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bNnN+GwT"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769048593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bmiF8TW43ZnSou9pgCsnR1V6kCn/RdefnmsG8Ds8z2o=;
	b=bNnN+GwT+bN5BoNeArtLq1vGEBoMkCINtSJT2U6wT57wr0hFyp6KTmhsbVQ69A05kmZ0bY
	lXw5fVrGTmsqyClAs8vdbKy/nWbbOuhGxLKtjORbt+pFfMIGbq6ddWUnWZi515oj0sxdA8
	KaAJSttz0Ocbu3sPdlMuKQ7FWrDCIpo=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv4 14/14] hugetlb: Update vmemmap_dedup.rst
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260121162253.2216580-15-kas@kernel.org>
Date: Thu, 22 Jan 2026 10:22:08 +0800
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
Message-Id: <17A1336D-2D78-4F00-9164-D90BB7EBB707@linux.dev>
References: <20260121162253.2216580-1-kas@kernel.org>
 <20260121162253.2216580-15-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Jan 22, 2026, at 00:22, Kiryl Shutsemau <kas@kernel.org> wrote:
> 
> Update the documentation regarding vmemmap optimization for hugetlb to
> reflect the changes in how the kernel maps the tail pages.
> 
> Fake heads no longer exist. Remove their description.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>

Reviewed-by: Muchun Song <muchun.song@linux.dev>


