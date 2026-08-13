Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F325A44E658
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 10:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618642; cv=none; b=f0tBRfe3KWi9f6XRICiuLlOwg9LJLxzEBp60euLVaQKYihBjnq40Z6gGCKUhkx6CTO370xwCXQEUWhZaa5lAD4coCnhlM9r62zn2cEg6kWSvWJsrFHMxz/vad0b88CYootWTb80cwJAWvvLhjXI1wvdwZjz5CNraN1wgsYQnszg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618642; c=relaxed/simple;
	bh=IPlO4xV2cwGD2IfRqTye6UKfbsTHf8Ditc5Cpm6ZzbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kU8XoIKrsbPb54PpLQnvPx4nfWf+U5xR1Kj9Yyu+RBaXklMDEU/92CvrO8i8VhbBR9M0aptjLfjw6jQwnSfCRA20NqF+fRpdzMp5srj86dgKwrL15u84dKHGeObDD3KVyj6NrjO0lz49dcURxvTLeavqffh3ExrZKRuSw3lImrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ol/Kn2uX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ol/Kn2uX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F3F1F00A3A;
	Thu, 13 Aug 2026 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786618637;
	bh=x3PUUrqbx4pAIfw/w8kq9f3y/Qy+5L/Ufomk1TKExJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ol/Kn2uXAXCgR27vYXHk10DyHcKN7KT7WISF0mvFFbJJGvravkomKlMF1RIbhZvoY
	 6YmrfCutOUmBb6wwdUqOEyXyD42rfTA1qPMO2kQitiMpNvpj7aGIKWWgYhNUhOFzq1
	 zUY5/0BcxSIarGfjTzcMiUxIXZp7Xt6ZPDfoKT0QBpfXkFaEA/HmZQH9dvDoCtshiK
	 z6PCbhfO7HVn29XPGFeKdJvKWGYhRK/pYBeHbNgIVOwccLNIDEz8z2SPUPZmc96jOz
	 FKMiptdwUZaJRuFGXKPjPJ1LXrW+qBVTxfx4k4rtpaToT7DW/dXxrXUVD1MmYRr1iV
	 xw+kvzWm20rJw==
Date: Thu, 13 Aug 2026 11:56:56 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Jinjiang Tu <tujinjiang@huawei.com>
Cc: akpm@linux-foundation.org, david@kernel.org, xu.xin16@zte.com.cn, 
	chengming.zhou@linux.dev, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	shr@devkernel.io, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	wangkefeng.wang@huawei.com, sunnanyong@huawei.com
Subject: Re: [PATCH v2 2/2] mm/ksm: fix advisor_min_pages_to_scan description
Message-ID: <an2g39TIN9v87enG@lucifer>
References: <20260813031722.569983-1-tujinjiang@huawei.com>
 <20260813031722.569983-3-tujinjiang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813031722.569983-3-tujinjiang@huawei.com>

On Thu, Aug 13, 2026 at 11:17:22AM +0800, Jinjiang Tu wrote:
> Both Documentation/admin-guide/mm/ksm.rst and the comment next to the
> variable definition in mm/ksm.c describe advisor_min_pages_to_scan as a
> lower limit of the pages_to_scan parameter, but that is not how the
> scan-time advisor actually uses it. commit 4e5fa4f5eff6 ("mm/ksm: add ksm
> advisor") only uses it to initialize ksm_thread_pages_to_scan when the
> scan-time advisor is enabled. This will mislead the users.
>
> The semantics of advisor_min_pages_to_scan was updated in the v2 patchset
> [1], but the documentation wasn't updated.
>
> Update the documentation and comment to match the semantics of
> advisor_min_pages_to_scan.

Umm, firstly if this were wrong you'd need to change the name of the variable
too instad of documenting it as something completely distinct.

But secondly AFAICT the logic in scan_time_advisor() suggests that it truly does
act as a minimum bound as well as being the initial value for
ksm_thread_pages_to_scan.

So this patch just looks wrong to me.

But in any case, you are making a claim here yet have provided no evidence for
it. 'It is just the initial assignment' means nothing - if the logic can then
only increase it up to the maximum value then it still acts as a minimum.

A brief look at the logic suggests so.

But in any case - the onus is on _you_ to prove that that's not happening.

And even if you could do that, since it is _intended to be a lower bound_, the
fix wouldn't be alterting comments or documentation, it would be to re-establish
the minimum as a minimum.

>
> Link: https://lore.kernel.org/linux-mm/20231028000945.2428830-2-shr@devkernel.io/ [1]

This patch repeatedly states that it is the minimum time. You have failed to
provide any analysis to suggest otherwise.

> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>

Assisted-by: ?

> ---
>  Documentation/admin-guide/mm/ksm.rst | 4 ++--
>  mm/ksm.c                             | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-guide/mm/ksm.rst
> index c9f533b10f6f..c329ca747b8c 100644
> --- a/Documentation/admin-guide/mm/ksm.rst
> +++ b/Documentation/admin-guide/mm/ksm.rst
> @@ -183,8 +183,8 @@ advisor_target_scan_time
>          pages. The default value is 200 seconds.
>
>  advisor_min_pages_to_scan
> -        specifies the lower limit of the ``pages_to_scan`` parameter of the
> -        scan time advisor. The default is 500.
> +        specifies the initial value of the ``pages_to_scan`` parameter of
> +        the scan time advisor. The default is 500.
>
>  advisor_max_pages_to_scan
>          specifies the upper limit of the ``pages_to_scan`` parameter of the
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 7d5b76478f0b..4a6cf8cf5d60 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -342,7 +342,7 @@ static enum ksm_advisor_type ksm_advisor;
>   * Only called through the sysfs control interface:
>   */
>
> -/* At least scan this many pages per batch. */
> +/* Initial number of pages to scan per batch. */
>  static unsigned long ksm_advisor_min_pages_to_scan = 500;
>
>  static void set_advisor_defaults(void)
> --
> 2.43.0
>

--
Cheers, Lorenzo
