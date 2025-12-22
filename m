Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34FD2857CF
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 02:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766372173; cv=none; b=oKTH/shV4wl3Iby6uCZlkWY0PR5HxPGmRR7ctORAe9Lljla+LBdVGvPQWZArJ8cw7aLw4oRHPTjBnNl0306tkkXf/ukqPfIN+WYTho9yvbfRqYQK3veEvb89qrjsvlcpHDJ/1yj3L6e4QXLGYaRdsCwHkoJWhrIA5/+98O3rzOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766372173; c=relaxed/simple;
	bh=JpzxShXFLNg65tGq6mlMsiFX/3fntlXQumXJwhZZRmo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=g+ZWuOJ3Ph5KkGtbaiqEuEeRk9j8kncYOuPQgJWgWd06cMLxXNjcr1hKKDXzTfp5+E21EeBrSoyl8r90FLMDm4XHsLyNm+eYgq1dtTiKSMsjvHdPl9If+/RPRMDPW/sE1acqHAi+7ZbeUTGLvvhYciKAN2B4BAExq/tXM0zd0H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X+sI79a3; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X+sI79a3"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766372158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=may1VAVjkO+zB0UvFCBS01JYcKyy3lFkszihsMfdWYs=;
	b=X+sI79a3FlFoFhRdYSV/hUyZHjdEV9uc+F61polrYlodt7W7DYCBy5Ew9gGWEPZNl5grZr
	Xbl0hTwwzYRNb+9K/3+5JEiFPLSAM/kd/BauJFTO8kkiB3mdMkw4+lUXIOvl/ShCQZ8FWR
	HTCtndsplIG4A5DNm06wfivP/goFfpY=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCHv2 03/14] mm: Change the interface of prep_compound_tail()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20251218150949.721480-4-kas@kernel.org>
Date: Mon, 22 Dec 2025 10:55:18 +0800
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
Message-Id: <79633EDC-7CD1-4A2E-BEC9-44866F0D7741@linux.dev>
References: <20251218150949.721480-1-kas@kernel.org>
 <20251218150949.721480-4-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 18, 2025, at 23:09, Kiryl Shutsemau <kas@kernel.org> wrote:
> 
> Instead of passing down the head page and tail page index, pass the tail
> and head pages directly, as well as the order of the compound page.
> 
> This is a preparation for changing how the head position is encoded in
> the tail page.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.

