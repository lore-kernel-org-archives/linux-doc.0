Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6DC4071C5
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538754; cv=none; b=RokoTddZqyisu92JrzvdQ9I/6p/xKF9FIUsS1E0hRuK2Lbp5jeGKmGuWMZHXkpp7opWlNuCRp44lMjyWca/vA0hIVZsNVfgUsv3x+YY59yyBHdHpnNIs4d4u7nmOgtQVfO1nODXbZff+7QqZpuxTbfSEsZmnoylm6NHiERIt310=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538754; c=relaxed/simple;
	bh=9zvR7d2bxGBv+6jx2yOWEKLbgx5o/0Xfw3q2VZIx1hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gdNMWXRqX+gsJH7X3xF1kGa/UkPii5LjEIFKImbxHl+TSu70/oKP0R+be0vTh1fblASvK/BxOYV0Y1Vnf2Q2RYwqvHb+eOYyRk0REFr63RdWkJMIw8Lx5winjcapHTc2qV2YNbbRxdo3HDetteihrqm+cRoVMPf6wiDrLIH+s1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=umzFcqov; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="umzFcqov"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=jYaV5WCXzBUAdoXR+h71EK4mIBc5FZDr4Uq9Fy4JLYA=; b=umzFcqovUxlfNwPfAhBF703Kh3
	aW3la5uuEFqbzcmlrD1+g1ePSmRbsCUGGwLHETDELn0Bll0s4QlIlxoQLlU/3CG9dbFcRv4z9i6d/
	qs/xywBJdJU8YyVAEZ8aMDamAZb3dXLWdAmfi4WWSs0PmjhcSvYGw7NTqeS3zVrvUza7LaVfdKGAT
	wG/MjQ8s9ddfGKlypZEiqb+djCim0xERl4HVHJoDO2LbaeGvOOJ82orgXJHrEpSzcssvJnBTYMoLB
	QuQUTuSrABcF/PDixkUY6VZEvvL6CWg+nMb+L+q6smrqWWzWXtGDVIUlIsf/eWU1BKifhwhlu6jnh
	RLqktzPA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9by-0000000EWhY-3Gk3;
	Mon, 15 Jun 2026 15:52:30 +0000
Message-ID: <a0979be3-60ab-42f5-b0c5-20bbf1dec1f2@infradead.org>
Date: Mon, 15 Jun 2026 08:52:28 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kdoc_parser: Move __acquires and friends to
 function_xforms
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <20260615153340.2154110-1-willy@infradead.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260615153340.2154110-1-willy@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/15/26 8:33 AM, Matthew Wilcox (Oracle) wrote:
> These were originally added to "Transforms for structs and unions"
> which led to warnings like:
> 
> ./include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
>   int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)
> 
> and the documentation was a little messed up as a result.  They should
> have been added to "Transforms for function prototypes" since they are
> not valid decorations for unions or structs.
> 
> Fixes: 85c2a51357f7 ("docs: kdoc_parser: move nested match transforms to xforms_lists.py")
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

I hope that this same patch is in docs-next:
  https://lore.kernel.org/all/20260505221548.163751-1-rdunlap@infradead.org/

Jon replied with "Applied".

> ---
>  tools/lib/python/kdoc/xforms_lists.py | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
> index f6ea9efb11ae..150fbc90f085 100644
> --- a/tools/lib/python/kdoc/xforms_lists.py
> +++ b/tools/lib/python/kdoc/xforms_lists.py
> @@ -48,16 +48,6 @@ class CTransforms:
>          (CMatch("DEFINE_DMA_UNMAP_ADDR"), r"dma_addr_t \1"),
>          (CMatch("DEFINE_DMA_UNMAP_LEN"), r"__u32 \1"),
>          (CMatch("VIRTIO_DECLARE_FEATURES"), r"union { u64 \1; u64 \1_array[VIRTIO_FEATURES_U64S]; }"),
> -        (CMatch("__cond_acquires"), ""),
> -        (CMatch("__cond_releases"), ""),
> -        (CMatch("__acquires"), ""),
> -        (CMatch("__releases"), ""),
> -        (CMatch("__must_hold"), ""),
> -        (CMatch("__must_not_hold"), ""),
> -        (CMatch("__must_hold_shared"), ""),
> -        (CMatch("__cond_acquires_shared"), ""),
> -        (CMatch("__acquires_shared"), ""),
> -        (CMatch("__releases_shared"), ""),
>          (CMatch("__attribute__"), ""),
>  
>          #
> @@ -98,6 +88,16 @@ class CTransforms:
>          (CMatch("__diagnose_as"), ""),
>          (CMatch("DECL_BUCKET_PARAMS"), r"\1, \2"),
>          (CMatch("__no_context_analysis"), ""),
> +        (CMatch("__cond_acquires"), ""),
> +        (CMatch("__cond_releases"), ""),
> +        (CMatch("__acquires"), ""),
> +        (CMatch("__releases"), ""),
> +        (CMatch("__must_hold"), ""),
> +        (CMatch("__must_not_hold"), ""),
> +        (CMatch("__must_hold_shared"), ""),
> +        (CMatch("__cond_acquires_shared"), ""),
> +        (CMatch("__acquires_shared"), ""),
> +        (CMatch("__releases_shared"), ""),
>          (CMatch("__attribute_const__"), ""),
>          (CMatch("__attribute__"), ""),
>  


-- 
~Randy

