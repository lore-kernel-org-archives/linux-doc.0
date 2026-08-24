Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7463468C0E
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 16:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787590314; cv=none; b=sHBmA+2AI6spMoQqF7c7o8rz0GspX1XQvsW/jHb0lLDQY6ccqZag2BXsIa5Mlg8ZFYNIoSiOdU+7O6rNnRkx96+ZtnPBgcwN6TUSa2vP+jBqt6cEVTVOncyRZU0OcVhItuJL+DL3MrdIIAU9PbeAt20ZTyOYmTf9z6Tmq53x+XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787590314; c=relaxed/simple;
	bh=KFlqA2gUyV3JMnR54UZpHgN2Pl0cnTXQe/Lvl2YZkE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxoUofkFm2JJMfAo62KF51q/NTYaFVGWy7cBwb7lKEwxJ7tGIvtXzKUFQPMzlTQFMUCuSYtFnuAcjUUiHtCc/zzReCngb+UFoQdzq1ISD9rV3Mwa9ZPEjHlwy2jdJXPQ/ZAbIUoPDtjBCZiTy+aSAHR7DMS97QUb7IkKpMtEjnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bG+n8mRv; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bG+n8mRv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/pRcrUPOXsyrdeVukIWc4SE+545428m5LfB8zUsy5Ao=; b=bG+n8mRvz3YPeVpOAFdo2e8pEs
	G5B5WFMth9vxiAb8J4pdP2TPxa0bunQlK+XfFvGl2wRkWoAoOcNe+z2J9cpH9wCzBa6RvgMP/3613
	JsL4Gkm6bxP+/zz1mhs+NssNNrrfwVjKnrxpg3ZHtjG6qsfMOMh+PV1Pf/ftzXJQNFN0ivrhTb/ug
	+lTiI1/a5a3HzNUl/SR12F0tVZ4xDLsUo7RWgVT3cUC17ZseFBYFvdhd7F2DmN/AqPr1uG45kbO+9
	rp7ArQwdOb3Jq85FUCrBVqHZ7ZfxNqBb4aH3CreWqPWyEgHvbxc/cn+dysHn5fvTN0y62hAURNCEm
	JGfv3Juw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXtX-0000000H59U-3tBK;
	Mon, 24 Aug 2026 16:51:36 +0000
Message-ID: <6075472a-9ec5-48b9-bfbd-c3d8ac29d98d@infradead.org>
Date: Mon, 24 Aug 2026 09:51:35 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] docs: ksm: fix typos in sysfs knob names
To: Jinjiang Tu <tujinjiang@huawei.com>, akpm@linux-foundation.org,
 david@kernel.org, xu.xin16@zte.com.cn, chengming.zhou@linux.dev,
 ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, corbet@lwn.net,
 skhan@linuxfoundation.org, shr@devkernel.io, linux-mm@kvack.org,
 linux-doc@vger.kernel.org
Cc: wangkefeng.wang@huawei.com, sunnanyong@huawei.com
References: <20260824061010.3343959-1-tujinjiang@huawei.com>
 <20260824061010.3343959-2-tujinjiang@huawei.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260824061010.3343959-2-tujinjiang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/23/26 11:10 PM, Jinjiang Tu wrote:
> The sysfs knob names in mm/ksm.c are "advisor_max_cpu" and
> "advisor_max_pages_to_scan", but the ksm.rst documentation spelled
> both as "adivsor_*", fix the two typos.
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/admin-guide/mm/ksm.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-guide/mm/ksm.rst
> index ad8e7a41f3b5..c9f533b10f6f 100644
> --- a/Documentation/admin-guide/mm/ksm.rst
> +++ b/Documentation/admin-guide/mm/ksm.rst
> @@ -174,7 +174,7 @@ advisor_mode
>          The section about ``advisor`` explains in detail how the scan time
>          advisor works.
>  
> -adivsor_max_cpu
> +advisor_max_cpu
>          specifies the upper limit of the cpu percent usage of the ksmd
>          background thread. The default is 70.
>  
> @@ -186,7 +186,7 @@ advisor_min_pages_to_scan
>          specifies the lower limit of the ``pages_to_scan`` parameter of the
>          scan time advisor. The default is 500.
>  
> -adivsor_max_pages_to_scan
> +advisor_max_pages_to_scan
>          specifies the upper limit of the ``pages_to_scan`` parameter of the
>          scan time advisor. The default is 30000.
>  

-- 
~Randy
