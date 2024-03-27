Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C212D4E1DC
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711555133; cv=none; b=e5bh+6hqH6g3cUKh1F8pXBswHRBgcwiDZu7PYGdSdv4oMokcnu8ViC5eGwiS2Sao1MlRVtyPUeejeX1w3G2785sKIWSe4SRFYSk2cUj+DTTP36M4DQS+8Uhn/BKgMpEOhvhw943tvg8Hy3AX0RvzuqeUZ3SNX+UeWucDAmwIAT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711555133; c=relaxed/simple;
	bh=9AAM3SwY/913U0dCh0TBFbHESskmqcu4yaUiH8E+sTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fneZIajVubZFtDHtvnbCrgqzSiVpp+5g/7q+OpSDi15Isi1AHu1fvR1pADC9G5Fy+4j+aQEgsDRx89sWTgcVfp2pVzyiDqCkaXF4Oj4RtuhmVAa+nne/XQl/AVzyJSC/yRPEuENZoSKSK0cY4ubMf+ykIZxyr18RwfwERcfaqmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Gs3Exdbx; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Gs3Exdbx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O8YcRfB/DoKgecCwPFQi2t+GXFIKHrKPT+FPBZjiUo0=; b=Gs3ExdbxglDssmjyTTl7sU8tKt
	ycLVT1eYch+I5f/R87BVhPLMpnJYjnnd66AM5N8XNakNKopbMjVKvBQ6rzmQm6OujGbAoc/4GAZpX
	OQYmMjAUVkXYvqnAGDpns3TK5dRR9P1XgecIM+pfPUBPwIWVqzhDNLWOy61FUdrkr7xBw7BvHjpHb
	9HxvEzrnZHVmcE5HBcNU0vGbUEOCIr5qczVhHjUnyrKpJaBXhJWn6Y7NOE37BoyRcHSA0blKmcsSM
	LSXCzyBxtyp73NF2dS0YXRyIgVrj7IO88vDjAGLeAU5BBfzP/Imi4xr0go0hfjKc4DTc0DPlLfEXW
	pS1+SKqQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVfe-00000004C6l-3pGJ;
	Wed, 27 Mar 2024 15:58:34 +0000
Date: Wed, 27 Mar 2024 15:58:34 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>, Hugh Dickins <hughd@google.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH 2/6] mm: memory_hotplug: use more folio in
 do_migrate_range()
Message-ID: <ZgRCKkU4xLgnpHG8@casper.infradead.org>
References: <20240327141034.3712697-1-wangkefeng.wang@huawei.com>
 <20240327141034.3712697-3-wangkefeng.wang@huawei.com>
 <01BB19DC-3807-4954-A04A-55518301B6BA@nvidia.com>
 <ZgQzPVdfF4lFaqs5@casper.infradead.org>
 <1AF9E259-6189-4558-8929-598679808C06@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1AF9E259-6189-4558-8929-598679808C06@nvidia.com>

On Wed, Mar 27, 2024 at 11:10:48AM -0400, Zi Yan wrote:
> On 27 Mar 2024, at 10:54, Matthew Wilcox wrote:
> > How much of this is safe without a refcount on the folio?
> 
> folio_to_pfn() should be fine, isolate_hugetlb() checks the folio
> under hugetlb_lock, but folio_nr_pages() might return a bogus number
> that makes pfn go beyond end_pfn and ends for loop early. The code
> below increases the refcount, so it might be better to move this
> part of the code after refcount is increased.

I really want to instill a little bit of fear in Kefeng.

This is all really subtle code because it's running without a refcount.
I've mostly stayed away from it because I know that I don't know what
I'm doing.  Kefeng has no idea that he doesn't know what he's doing.

And so we get these patches, and they're sometimes subtly wrong, and it
takes a lot of arguing and revision and thinking and Kefeng is doing
very little of the thinking part!

Kefeng, please stick to working on code that you understand.  Or take
the time to learn code you don't understand before sending patches to
it.  This kind of Leeroy Jenkins approach to development is not good.
