Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42BD306D3D;
	Mon, 15 Dec 2025 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807255; cv=none; b=Df3qHAzw6/MQT/05RcmX54wY6PSUOa5cbPccbs3ozi9K+HdUT3CXVJtv5LMTG8hHofwCjn2szm3T/++T7AjLXGr40PSt/7W5TuNSJpQGGZvnQ3ILJ+TkoLr+vVXfnWdivzngCdUDO/MoAl8UZvhr/TpXUD2FlTHFqKklPzoNydE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807255; c=relaxed/simple;
	bh=MeDjzuWAejZCJlBEzrOkLJRmynoQkvYrm/QMXWf4KLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTCx/RWLdCEPcCJBqw9inqEaL+7fJEEtOA6xteF6/MkuP00/ScMxWEekwh9ZVBOeGr54I/8ePEPt0UXPXcEPH3PuZgN/QCue9fTqmanSilg9hpyN7XZXYmwMqGLh5gXxo7AdBGUe6R5syM35O/IlEy2WtizNTOp7SlNkp8KvPfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=le4XRb1X; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="le4XRb1X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rkCYGiCYJi+miO4Sgpe6xzcq/dDOhFl6pIaaLHV9nqM=; b=le4XRb1X/irlAOoRpHp/4YebJK
	rDsR2KgG+emZE+CZTmEosUoyRJ8H/f6ngj/KdzlvvIq8eU00Rb8vD4ygnKsyBNCUMLfLodZCNORZX
	Fg5iafDkoVb5F1LIitOytK6BCojhwCPKGualr1r/Vyoqqr216nhpi8D7lKEvenSGCg1Irvb6y/lAI
	6mhXS2lgZ4/XpVgKuONdgPli87rt2Ilw2VOpEwlQfbY89E3ReoqkznnEGxLbs+CI8PhoQKRmkCNVL
	sG+dusE2nYM0rQJhm1RYxJWYCFKKlv+r+lOonynJRewO3VSUT1ChIQhsD08UMbEF0xzia4ybuec0E
	NxxLj5Cg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV97f-00000001zD9-3tD3;
	Mon, 15 Dec 2025 14:00:24 +0000
Date: Mon, 15 Dec 2025 14:00:23 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Zhang Qilong <zhangqilong3@huawei.com>
Cc: akpm@linux-foundation.org, david@kernel.org, lorenzo.stoakes@oracle.com,
	corbet@lwn.net, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
	vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	wangkefeng.wang@huawei.com, sunnanyong@huawei.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH next 0/2] THP COW support for private executable file mmap
Message-ID: <aUAUd_XJPVsl_CZL@casper.infradead.org>
References: <20251215123407.380813-1-zhangqilong3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215123407.380813-1-zhangqilong3@huawei.com>

On Mon, Dec 15, 2025 at 08:34:05PM +0800, Zhang Qilong wrote:
> This patch series implementate THP COW for private executable file
> mmap. It's major designed to increase the iTLB cache hit rate for
> hot patching application, and we add a new sysfs knob to disable or
> enable it.

You're going to have to provide data to get this patch in.  We've
deliberately not done this in the past due to memory consumption overhead.
So you need to prove that's now the wrong decision to make.

Microbenchmarks would be a bare minimum, but what are really needed are
numbers from actual workloads.
