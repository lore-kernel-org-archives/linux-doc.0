Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087204;
	b=EzPNy8OJBI5mBtKvj7cgqo0+63Hd8L1y/pfUD/eOWMvcACJsaFh3IG6Y4O2BljiO8Fsw
	 AiQXaAblIbsfy+vc/XLVVQHxeY3Jr7UogOdxaWcQmDcqraFn6ARyE3xiF/j12C3gIJarv
	 5PSG6XMcjWvEd3EMj1o/DXvIu/4mqCOSdgHoqpvAUZ+xmj+jQbnPdQs4+Y/VxutWX2l8t
	 JY4AMBgCfaGKGZrPXmMeETOD3XhzS+9LWDkrr3pOgP9JmSqmFFmQ9wE8OBDt3PNuX7wEZ
	 RL9k7Sss/SAYEZbaKAhQ7pJJt6wfIi2fYVroTgZquXJDYotg50W9VEhCygQC7JsqE+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087204;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=QjhX4svqgENH27PAAoOn+DesXkt70aYnU/WTBMxaRlI=;
	b=Z1P0YVcbYGi6vtWsalLbTfmLrS5HvbmM8UnKOnI7/KIfYSz10h+an3eggepSwPbzcwQW
	 fMFEmMbHSfxWY6VgP+lRptmr5D1bISs5pPP4zS6aHT9/E2+h35u3pt8U1GB5hpXYKJkXN
	 9eD34TclqOYnTJczoP7MmLl0aOnGvigz5iFmZT2Vl3GvytxSk+PLNLuVPQn+3tS6FNdqW
	 DL3KJ+jtg+d7o/6YwPqJa0Gw1OrlL0jMd6M1ljgHr9JK9E6n0khBrlfxmfC6V9cUG70Os
	 VecHQbi35WlhrHWe36n3BahzVT9bSmxOIBJPajE0OrYKKMD9qbZ4TFlxLiF85h7PgEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=qPqvot4d;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1AE606A325
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 11:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E1AE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=qPqvot4d
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261119112000euoutp02b6c8019d69cf5ecaf3b34c4b22c1d783~pbkw_jS5w0917709177euoutp02-
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 11:20:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261119112000euoutp02b6c8019d69cf5ecaf3b34c4b22c1d783~pbkw_jS5w0917709177euoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795087200;
	bh=QjhX4svqgENH27PAAoOn+DesXkt70aYnU/WTBMxaRlI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=qPqvot4d9oG/iUwx+maS5xSX5X6XoywUKZkobSFZ98vTznvDeQMcEYOwy0iWW8oWm
	 /Gy9af7GwuNK0BXMNEWESJdOLJAtysBA3piqxHZOIWBPykY8Aye2lYL6YUzUmJLAhb
	 IkRymHot4ISztBj69JwR4JvLdW7dhTwgmmqIM/Ro=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261119111959eucas1p2bd4a85981864901886c2f6e9681855f3~pbkwmyhTr0716707167eucas1p2y;
	Thu, 19 Nov 2026 11:19:59 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261119111959eusmtip2279ca40ca3a7bf37097daea13deb112f~pbkv7OMEZ1620516205eusmtip2I;
	Thu, 19 Nov 2026 11:19:59 +0000 (GMT)
Message-ID: <fa38a878-1735-4682-b208-5de1616f7e4f@samsung.com>
Date: Thu, 19 Nov 2026 12:19:58 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] dma-contiguous: support percentage sizes in
 cma_pernuma= and numa_cma=
To: Alexander Graf <graf@amazon.com>, linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Robin
	Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, David
	Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	nh-open-source@amazon.com, linux-mm@kvack.org, The AWS Nitro Enclaves Team
	<aws-nitro-enclaves-devel@amazon.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261114145328.1307-1-graf@amazon.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261119111959eucas1p2bd4a85981864901886c2f6e9681855f3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261114145340eucas1p2f7699b88eae34f7904cf68109dc3eb4f
X-EPHeader: CA
X-CMS-RootMailID: 20261114145340eucas1p2f7699b88eae34f7904cf68109dc3eb4f
References: <CGME20261114145340eucas1p2f7699b88eae34f7904cf68109dc3eb4f@eucas1p2.samsung.com>
	<20261114145328.1307-1-graf@amazon.com>

On 14.11.2026 15:53, Alexander Graf wrote:
> While CMA_SIZE_PERCENTAGE supports percentages for built-in defaults, the
> CMA allocation kernel parameters currently only take a fixed size argument.
> That makes it difficult to have a single system image that sizes its CMA
> allocation based on the available memory. To use CMA as backing pool for
> large, physically contiguous guest memory, I want to be able to say
> "allocate 90% of system RAM minus 1 GiB for CMA". Per NUMA node.
>
> Extend the CMA parser logic to accept command line options like this:
>
>   cma_pernuma=80% numa_cma=0:95%-1G,1:4G
>
> To avoid incomplete allocations on parsing errors, check for them
> before actually allocating.


This looks like an over-engineered feature. I doubt that kernel is the right
place to implement such advanced sizing. If You need to explicitly control
the amount of CMA on the target machines, maybe You could do it in some
scripts deploying the kernel configuration? Calculating it there should be
much more flexible imho...


> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---
> v1 -> v2:
>
>   - Reject an empty numa_cma= and a trailing comma (Sashiko)
>   - Keep the last valid size for each option or node, so an explicit 0
>     now overrides a percentage (Sashiko)
>   - Parse percentages as plain decimal, and reject sizes that a 32-bit
>     phys_addr_t cannot hold
>   - Reject a bare cma_pernuma or numa_cma without "=", which mainline
>     dereferences as NULL
>   - Rework the kernel-parameters.txt text accordingly
>
> v1: https://lore.kernel.org/all/20261111140440.43024-1-graf@amazon.com/
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

