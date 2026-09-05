Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187F039061D
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 19:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788637796; cv=none; b=pT2pQcjiQn62DVIxYvTnBUevffWsnZvI2fCFrX8sXsGbbELZUivug52QUUm5l05MG6tGfD6c7qa38W+Jcttej/WDEggfCoqUnZaEDYsECLznZJ0tr5AyNcP0GpNBFjtMKRqxpLebWmaHFJBKVtRLpblnlHRBkPIy9APcMQgL5Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788637796; c=relaxed/simple;
	bh=62u2tRdSsmZLgkAmw8XKLKBQgigDiZvScIWpaj/xiCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCf/CKUuMVZTDiR4mThC8kXAWlItyenu2WDvmJoFYdQY9QBoPkr7giKkfDF31C+3LwTibQqDJUZzQaRVfrDZAZPhCVZZb2rP/utYoXHfPgd0IOeS9ElWarTk41YyY0KTuD1kH6n7GaFV9HrVUBNIphR2tkzpT8MIwncb90FnGZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Nc126gF/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Nc126gF/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=dOlJOC5zpBu6MtL41vNbLB5DikFdEvej+QPJFEZWO4w=; b=Nc126gF/TGG7yeI+pCV3ydxzEM
	KZfq/OLCtVZBNokaXhRKhH6qyXIUNjtrbtIK5TweJrv2xoWQH3ZsW3fyB4dm8Qejfm7qq+OkA+ipB
	1agDCfYTlf4+lOkqo9XNurXjeWmQ40On/t8exft5mt0noaJyFA84eyHYvoTtlC9F6kKqffaTgOejC
	ki2k+njoPWB59k2LJEOlFC1s5qFnsUIJy7hO/By44TIlrf2mS5W+BjHN3B+Hd9HvfGH5YoTycud/Q
	HrJ3J8eWxmAeW2IKx2lLx3m4pc364qR5owwuTfvXBFB8jpUZ5253KCji3yXpDAzF1BHidngEtXjrT
	Va1oIdHw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2wOY-00000004NjQ-2uog;
	Sat, 05 Sep 2026 19:49:46 +0000
Message-ID: <97f80aaf-fe16-4557-a4bc-7eddaf406ee5@infradead.org>
Date: Sat, 5 Sep 2026 12:49:46 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/mm: ksm: Use the renamed ksm structure names
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>,
 linux-mm@kvack.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <20260905084034.39521-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260905084034.39521-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/5/26 1:40 AM, Karl Mehltretter wrote:
> The Reference section of ksm.rst asks mm/ksm.c for mm_slot, stable_node
> and rmap_item. Commit 21fbd59136e0 ("ksm: add the ksm prefix to the
> names of the ksm private structures") renamed them to ksm_mm_slot,
> ksm_stable_node and ksm_rmap_item. Since then only ksm_scan is rendered
> and the three structures are missing from the generated documentation.
> 
> Use the current names.
> 
> Fixes: 21fbd59136e0 ("ksm: add the ksm prefix to the names of the ksm private structures")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/mm/ksm.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/mm/ksm.rst b/Documentation/mm/ksm.rst
> index 2b4f72f1f953..5a80573162de 100644
> --- a/Documentation/mm/ksm.rst
> +++ b/Documentation/mm/ksm.rst
> @@ -78,7 +78,7 @@ The frequency of such scans is defined by
>  Reference
>  ---------
>  .. kernel-doc:: mm/ksm.c
> -   :functions: mm_slot ksm_scan stable_node rmap_item
> +   :functions: ksm_mm_slot ksm_scan ksm_stable_node ksm_rmap_item
>  
>  --
>  Izik Eidus,

eh?

-- 
~Randy
