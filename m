Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF252EEE60
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 01:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056416; cv=none; b=tKPCgi0GLiPRrW1+4xOgF9BnDjZNiGjRY9CkzQe+0hKpfExsjePzvD2HCVvFwkMytBmYLGkSrYD9aAdn/PEVoffRzAem2y28hhfa7PCCcuKYmAZ/9vrWEzqElJC8cfU4iFoigIE8HoVkwi03YNsBZfFX14dXMcvFC/rJiqqmIWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056416; c=relaxed/simple;
	bh=Aniz0i7zS31nm6ZpK5d4LZjgaKVO86jYotANxdvO/Q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pi7a0I5Cl8evjQwPJ3LTdX3oW68gKCuYClAxgaMAOujK/bmyoGqkXW0yMEzfQorwo5+iq4Yse4SQyqo/e503Q2Ca92ZcwcKQk7877S8/wnctpIfj/oZZG0wwWfjU0L01emi+Ol6uSqz3AdqWT68bRqOC5THCwqxmiijhUp59TDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bbsvwp/d; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bbsvwp/d"
Message-ID: <c7a83b2f-ee5e-4de1-807c-311db839b4d5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781056410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FrmWqzviIqBB3IDNdu15PDEAaOUICtqvo3B9Gs8vRaM=;
	b=bbsvwp/dxTTGFU3RSHnkuoHl/y+d0uyW4xm7CWNpqBW1pML/tXksWqhJhsHBKFqph+sFH1
	VUw2Jhbbk3xza8B43C6LX8sOiyplrt59k6ZZYcMcrt9rkM/VF+k1vNX9igbWdCfqr9KFh/
	KJAYQiN60SoRDXVMnxifP1B3OyY5p0c=
Date: Wed, 10 Jun 2026 09:52:52 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 4/6] alloc_tag: add accuracy based filtering to ioctl
To: Abhishek Bapat <abhishekbapat@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sourav Panda <souravpanda@google.com>
References: <cover.1781042698.git.abhishekbapat@google.com>
 <7f3a4ddb3f132464f17716eaae657a6367d6dd05.1781042698.git.abhishekbapat@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <7f3a4ddb3f132464f17716eaae657a6367d6dd05.1781042698.git.abhishekbapat@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 2026/6/10 08:12, Abhishek Bapat wrote:
> Extend the allocinfo filtering mechanism to allow users to filter tags
> based on their accuracy.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>


Acked-by: Hao Ge <hao.ge@linux.dev>


> ---
>   include/uapi/linux/alloc_tag.h | 4 ++++
>   lib/alloc_tag.c                | 8 ++++++++
>   2 files changed, 12 insertions(+)
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
> index 7f5acbb44c14..6ea39c4869fe 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -26,6 +26,8 @@ struct allocinfo_tag {
>   	char function[ALLOCINFO_STR_SIZE];
>   	char filename[ALLOCINFO_STR_SIZE];
>   	__u64 lineno;
> +	/* filter criteria only; see allocinfo_counter.accurate for actual accuracy */
> +	__u64 inaccurate;
>   };
>   
>   /* The alignment ensures 32-bit compatible interfaces are not broken */
> @@ -45,6 +47,7 @@ enum {
>   	ALLOCINFO_FILTER_FUNCTION,
>   	ALLOCINFO_FILTER_FILENAME,
>   	ALLOCINFO_FILTER_LINENO,
> +	ALLOCINFO_FILTER_INACCURATE,
>   	ALLOCINFO_FILTER_MIN_SIZE,
>   	ALLOCINFO_FILTER_MAX_SIZE,
>   	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
> @@ -54,6 +57,7 @@ enum {
>   #define ALLOCINFO_FILTER_MASK_FUNCTION		(1 << ALLOCINFO_FILTER_FUNCTION)
>   #define ALLOCINFO_FILTER_MASK_FILENAME		(1 << ALLOCINFO_FILTER_FILENAME)
>   #define ALLOCINFO_FILTER_MASK_LINENO		(1 << ALLOCINFO_FILTER_LINENO)
> +#define ALLOCINFO_FILTER_MASK_INACCURATE	(1 << ALLOCINFO_FILTER_INACCURATE)
>   #define ALLOCINFO_FILTER_MASK_MIN_SIZE		(1 << ALLOCINFO_FILTER_MIN_SIZE)
>   #define ALLOCINFO_FILTER_MASK_MAX_SIZE		(1 << ALLOCINFO_FILTER_MAX_SIZE)
>   
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index a936cf18611a..73fb3d0ab821 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -249,6 +249,8 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
>   			   struct alloc_tag_counters *counters,
>   			   bool *fetched_counters)
>   {
> +	bool inaccurate;
> +
>   	if (!filter || !filter->mask)
>   		return true;
>   
> @@ -274,6 +276,12 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
>   	    ct->lineno != filter->fields.lineno)
>   		return false;
>   
> +	if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
> +		inaccurate = !!(ct->flags & CODETAG_FLAG_INACCURATE);
> +		if (inaccurate != !!(filter->fields.inaccurate))
> +			return false;
> +	}
> +
>   	if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
>   		if (!*fetched_counters) {
>   			*counters = allocinfo_prefetch_counters(ct);
