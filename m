Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7B12222CC;
	Thu, 23 Apr 2026 14:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776956167; cv=none; b=Ezv+UOltTJMY/944rDef0lrmkKD/zTjOXkBkqTnkXZHfFo26RtuuG0wdJODXUMBvm9pmw4fl/e4BrHt97RdcssVy1iMPTLgRG6rHmGnhNdYY0El0iOH9hk1Ch+c8D0kdU3JstTsZYO7IehYOI380CtfUQ7glKCwhE+xE5DncBXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776956167; c=relaxed/simple;
	bh=CeMhdelt5czqqTO730HjnJPTqVhPo3eTn0Mb9MHp1EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGQTOFk8mCI/ZPC50vnIJUyHZGLHZmtyFcPJqGBNcnWHwTEzjvfxPKN5M56wzXWukNubmVY8JzQLGHs/juM51R7069ITW0vGHIuc/jg1ryelZ8s/GyyKqS59cHHwwtdySmKQGH2iGWK27LVbjWXG1vq0DSFIP8PdJ0dsTOD7d8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dlt8wuZH; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dlt8wuZH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=md3vwdpmlssvZFcgZRzQuot8Bl5GX3XA4NSgv9I5fQM=; b=dlt8wuZH9TZw+MoGGFG/U/kEZy
	ykrl89jcpQsUxGtWM3vJvmGimgdWpf9K37J81FP11c41XcmUpSQZvkh+aql6VzJ/qxRImxWWDao3D
	+DOAwuiMjpNcd08wLm/Pwkl3D51BdvClgjynFDizo299cMJ6BKTexPwF0oi2TSj5RqPovD3M3Oeey
	/q/G6tr7PtRwwtu3vG6qSK0P7Yz59Z5I5aexPWHOt6zSJ7A6Vxs+fsYY/i/zrLh9WJ60QE46PrqBa
	/sMJ6ryxq0DAuVwV+lF9qivR9QF1tsuHN/o+iMo4m6QegJHxByH58U++oCg+wljhTJGi9aq6MrHwq
	2aXW/0Zg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvT1-0000000Dcwn-175y;
	Thu, 23 Apr 2026 14:55:47 +0000
Date: Thu, 23 Apr 2026 15:55:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: jane.chu@oracle.com
Cc: akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
	osalvador@suse.de, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, corbet@lwn.net,
	skhan@linuxfoundation.org, hughd@google.com,
	baolin.wang@linux.alibaba.com, peterx@redhat.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] hugetlb: open-code hugetlb folio lookup index
 conversion
Message-ID: <aeoy86Klh-07s7lu@casper.infradead.org>
References: <20260409234158.837786-1-jane.chu@oracle.com>
 <20260409234158.837786-2-jane.chu@oracle.com>
 <aeZwAz6PcdlqSnJ2@casper.infradead.org>
 <a36c592b-0456-4551-9a53-f513233cc129@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a36c592b-0456-4551-9a53-f513233cc129@oracle.com>

On Wed, Apr 22, 2026 at 09:44:40AM -0700, jane.chu@oracle.com wrote:
> Thanks Matthew, these are great suggestions and I am looking into them.
> Main concern is potential performance impact, will find out.

I doubt we'll see any performance impact to be honest.  We're doing a
small amount of extra work, but these are not commonly used code paths
and I can't imagine we'll notice it on any benchmark.  This is about
cleanup; a pgoff_t is supposed to be a file position divided by PAGE_SIZE.
Hugetlb mostly doesn't do that, it indexes in hpage_size() which it
doesn't need to do any more.  It's confusing for people coming to hugetlb
from other parts of the kernel, so it really needs to be cleaned up.
