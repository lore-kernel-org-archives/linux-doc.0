Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE27288C30
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 07:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742380; cv=none; b=SLeDW4dYjojL+D+zLEE67kg1bc50btxa7O522oZSd2XBNpFqcIQujdP5yhuibIiWS0vf0NNM7Aas0wHqMhzMD0hBh/aDTA+F2T+VZDwABhRhxfaRtEUqdtghA/y+fYxjxbBkTB5/vF8o1PkDpTx3EsU0iYk2tsTrtzpi05H7RUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742380; c=relaxed/simple;
	bh=Uw1kCiIOH16q7tj2xTEkxsjfwws4aCdh8QyTxXxoOuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCtFVWpOr6vfnvl27Q5Ka7nYvb1uHTOubHr5RQ1m57MTs8zcU4mJz+b1INKfRuYsU8WpW8Y3HMD3rEE671uRB7z0kH71/i7GzBLQzWzMDZuUeqTLgJQaV0KzgGn2ZtmS4X+5Q2juWv/PeB0GzTw0yyplN08E+apTZqBhm+mu/uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cztgAZfE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cztgAZfE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A807F1F000E9;
	Mon,  3 Aug 2026 07:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785742379;
	bh=Sc3ti9VahDQD+o7JET/jvG499uuDfICvW9Jpo401Cww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cztgAZfEmYTOrL8/HN5y0Tqx9RlVBCjGy0NB4QPs1EtIp+pbpOPpxQAKmPNEf5XjL
	 iLZ3k2g+Q4pMQuCogHdLGTNpPrBFknM5Cl9BR7ULlPxjLw5cem27D4LiF755dyETIS
	 O5QlV5MHCtIbh3K4Jffxtlxu/tht28sF3TburoHUY3f5jvngPfC6BwyeZw7OXUYek2
	 6Jwa387Vj9LUpvRu35yR5buDduvlFdwJ82cGRXs3YXfHg88KUrVuLTMmiEtfpRSVby
	 9hfm3mOnMBaSbBrQak6FARwj26RmHR80wBDOTOYusGIubEyvxeA/GR7Ma/1gQ+O6Ko
	 qBrW0LQFkAcjQ==
Date: Mon, 3 Aug 2026 08:32:40 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Jinjiang Tu <tujinjiang@huawei.com>
Cc: akpm@linux-foundation.org, david@kernel.org, xu.xin16@zte.com.cn, 
	chengming.zhou@linux.dev, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	shr@devkernel.io, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	wangkefeng.wang@huawei.com, sunnanyong@huawei.com
Subject: Re: [PATCH 1/2] docs: ksm: fix typos in sysfs knob names
Message-ID: <anBD-_khxIX-FzW-@lucifer>
References: <20260731083526.3953421-1-tujinjiang@huawei.com>
 <20260731083526.3953421-2-tujinjiang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731083526.3953421-2-tujinjiang@huawei.com>

On Fri, Jul 31, 2026 at 04:35:25PM +0800, Jinjiang Tu wrote:
> The sysfs knob names in mm/ksm.c are "advisor_max_cpu" and
> "advisor_max_pages_to_scan", but the ksm.rst documentation spelled
> both as "adivsor_*", fix the two typos.
>
> Fixes: 0710f38ad26a ("mm/ksm: document ksm advisor and its sysfs knobs")

Same comment as David :)

> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>

Anyway LGTM, so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

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
> --
> 2.54.0
>

--
Cheers, Lorenzo
