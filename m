Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778763ACA5C
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 06:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741681; cv=none; b=rtfSSUCbgyFtXAH3I2Fu98g3tAtLtikRP2oh7x1NzUmY3d/PiLcxXm4j/qiosRRp06Dw3u9jeSdrhdjGsvjEm9LJ2o338G1ThQidbKhMANevfcIScrUOVgYs0Fy1v0oJ7L205A1MwLt0rqyBr8YVb+PBHDu7P3bfNco/bGxALyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741681; c=relaxed/simple;
	bh=M+glQwZV1yWSRnJeD4vuiIwphRCO9fxU5bCAp/L8tkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oOJs7FeXYO2rtqQPs0st5gPs6akzlk3dp011XmD60XUw7zX0rGhEfZSQnwdNeoutufWdZO220CxL5H3IIcgMZZGhze6U9/VihM0N3tW/XedcI9YqnDulPXEzAwGDoS17btpWmG/8EjGF8luhP7c20kJeGKKK96BBaYNgeMQI6yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X6Wi76qT; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X6Wi76qT"
Message-ID: <b681fad1-1a27-47fa-b58a-1f639eb3f3d9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778741676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kij2xOO3qtTmYfkoE+CYJd5YmiCf+9U/Mw+qhSKp5qo=;
	b=X6Wi76qTXoS3Rz71tK3B1xmR2vWuhPuLMH2oZxhvhV3dMwUYATyJOmRRxzSeEqW1sWZaq2
	Gk8Q146afLxCkqun/eAO8VKrhsrt4PIM/hmnYqLXaLnUzUOcidHp4NTOrnNtZ0+9nyNHvm
	8L1XkK9V+PTogJsthV0vrCszTFfSeQI=
Date: Thu, 14 May 2026 14:53:56 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/6] alloc_tag: add size-based filtering to ioctl
To: Abhishek Bapat <abhishekbapat@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sourav Panda <souravpanda@google.com>
References: <cover.1777936301.git.abhishekbapat@google.com>
 <06b4fc2457fb4b75eb1ef18320a8722ddb5a850f.1777936301.git.abhishekbapat@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <06b4fc2457fb4b75eb1ef18320a8722ddb5a850f.1777936301.git.abhishekbapat@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Abhishek


On 2026/5/5 07:36, Abhishek Bapat wrote:
> Extend the allocinfo filtering mechanism to allow users to filter tags
> based on the total number of bytes allocated [min_size, max_size]. The
> size range is inclusive.
>
> Filtering by size involves retrieving allocinfo per-CPU counters, which
> is an expensive operation. Hence, the performance of size-based
> filtering will be worse than other filters.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> ---
>   include/uapi/linux/alloc_tag.h |  8 +++++++-
>   lib/alloc_tag.c                | 15 +++++++++++++++
>   2 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
> index 0cc9db5298c6..229068efd24c 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -20,6 +20,8 @@ struct allocinfo_tag {
>   	char function[ALLOCINFO_STR_SIZE];
>   	char filename[ALLOCINFO_STR_SIZE];
>   	__u64 lineno;
> +	__u64 min_size;
> +	__u64 max_size;
>   };

allocinfo_tag is used both as a tag identifier in the output data

(allocinfo_tag_data.tag) and as filter criteria

(allocinfo_filter.fields). min_size and max_size are filter

parameters, not tag identity. Also, allocinfo_to_params() does not

fill these fields, so userspace gets zeros in the output, which is

a bit confusing. Might be cleaner to separate filter parameters

from tag identity.

>   struct allocinfo_counter {
> @@ -39,13 +41,17 @@ enum {
>   	ALLOCINFO_FILTER_FUNCTION,
>   	ALLOCINFO_FILTER_FILENAME,
>   	ALLOCINFO_FILTER_LINENO,
> -	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_LINENO
> +	ALLOCINFO_FILTER_MIN_SIZE,
> +	ALLOCINFO_FILTER_MAX_SIZE,
> +	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
>   };
>   
>   #define ALLOCINFO_FILTER_MASK_MODNAME		(1 << ALLOCINFO_FILTER_MODNAME)
>   #define ALLOCINFO_FILTER_MASK_FUNCTION		(1 << ALLOCINFO_FILTER_FUNCTION)
>   #define ALLOCINFO_FILTER_MASK_FILENAME		(1 << ALLOCINFO_FILTER_FILENAME)
>   #define ALLOCINFO_FILTER_MASK_LINENO		(1 << ALLOCINFO_FILTER_LINENO)
> +#define ALLOCINFO_FILTER_MASK_MIN_SIZE		(1 << ALLOCINFO_FILTER_MIN_SIZE)
> +#define ALLOCINFO_FILTER_MASK_MAX_SIZE		(1 << ALLOCINFO_FILTER_MAX_SIZE)
>   
>   #define ALLOCINFO_FILTER_MASKS \
>   	((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index 7ff936e15e97..98a27c302928 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -195,6 +195,9 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
>   
>   static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
>   {
> +	struct alloc_tag *tag;
> +	struct alloc_tag_counters counters;
> +
>   	if (!ct || !filter || !filter->mask)
>   		return true;
>   
> @@ -214,6 +217,18 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
>   	    ct->lineno != filter->fields.lineno)
>   		return false;
>   
> +	if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) ||
> +	    (filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
> +		tag = ct_to_alloc_tag(ct);
> +		counters = alloc_tag_read(tag);

alloc_tag_read() is called twice for matching tags

When size filtering is enabled, matches_filter() calls alloc_tag_read()

to check the size, and then allocinfo_to_params() calls it again to

fill the output data:

matches_filter():

     counters = alloc_tag_read(tag);        // 1st read

     if (counters.bytes < min_size)

         return false;

allocinfo_to_params():

     counter = alloc_tag_read(tag);         // 2nd read (same tag)

     data->counter.bytes = counter.bytes;

For matching tags, the same per-CPU counter aggregation is done twice.

On large machines this is not trivial. Would it make sense to cache

the counters from matches_filter() and reuse them in allocinfo_to_params()?


> +		if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
> +		    counters.bytes < filter->fields.min_size)
> +			return false;
> +		if ((filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
> +		    counters.bytes > filter->fields.max_size)
> +			return false;
> +	}
> +

No validation for min_size > max_size.

If both MIN_SIZE and MAX_SIZE are set but min_size > max_size,

no records will match and the user gets no indication of the

invalid input. This could be checked alongside the existing

mask validation in allocinfo_ioctl_get_at():

     if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)

         return -EINVAL;

     +   if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&

     +       (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&

     +       params.filter.fields.min_size > params.filter.fields.max_size)

     +            return -EINVAL;

Thanks

Best Regards

Hao

>   	return true;
>   }
>   
