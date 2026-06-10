Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E73286D56;
	Wed, 10 Jun 2026 01:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056202; cv=none; b=IZlcETe0GH7RTlVPPBK4EwypJ2T2iN+8UQ2hJ4Kxassruov00KsTMaO7iN10C1iv89bQLCMYPmHeiWCxIStAYXjIJPduCYe1mU6FuT5IbJM+ooKLyERC0iN5F0ikM+kgnzmpnr9SgPIeUds6dylI8eXfA1rquegkNvxdM7h5Eqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056202; c=relaxed/simple;
	bh=zlGMzXyJff/N20TrQHOhY/5fdoy2b1caRQtRuLkRff8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qb/B7kW1bqU+db33Pnpl6TMrD5IzLSx2V0ubpzHDxrVBNP7rcSAMOdrSvqph0rvpeUesvDvIbxTxu7WOjAa5Y/G2o7fmqqc/lTRXGLnxpaxp4wYD6uYeMXZ9iXftXYbKGf3l475q7p/1HyqqzOFcNVm3XW3nlKy6OuwrKM9Q3hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xAdWg7qm; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xAdWg7qm"
Message-ID: <65926655-ab44-473f-b322-254f59769575@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781056196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YdUOSbCjHz0ggGNKJqKyfd3B90NV6CdYw/nifUVVcrs=;
	b=xAdWg7qmnV1kzmSJQzLQ1J2DVb+ReGV94fBwVoBi2vnY6KVhk60ylukGLL3Vv1jBD1N/iR
	CH6obf6pbUSFodRIOS4QPD4iGTd8tYrGKRFIOWHhjoRNXRKuFc0kwulW6kCUaNCcnd+GhZ
	HnvwkO6lbSnEqcgBSDFzAkLWixVrw+Q=
Date: Wed, 10 Jun 2026 09:49:05 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/6] alloc_tag: add size-based filtering to ioctl
To: Abhishek Bapat <abhishekbapat@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sourav Panda <souravpanda@google.com>
References: <cover.1781042698.git.abhishekbapat@google.com>
 <4e2a75c69fe350358e1fef3e4e25435f6a3d4e77.1781042698.git.abhishekbapat@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <4e2a75c69fe350358e1fef3e4e25435f6a3d4e77.1781042698.git.abhishekbapat@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 2026/6/10 08:12, Abhishek Bapat wrote:
> Extend the allocinfo filtering mechanism to allow users to filter tags
> based on the total number of bytes allocated [min_size, max_size]. The
> size range is inclusive.
>
> Filtering by size involves retrieving allocinfo per-CPU counters, which
> is an expensive operation. Hence, the performance of size-based
> filtering will be worse than other filters.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>


Acked-by: Hao Ge <hao.ge@linux.dev>


> ---
>   include/uapi/linux/alloc_tag.h |  8 ++++-
>   lib/alloc_tag.c                | 63 ++++++++++++++++++++++++++++------
>   2 files changed, 59 insertions(+), 12 deletions(-)
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
> index 3b11877955b9..7f5acbb44c14 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -45,13 +45,17 @@ enum {
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
> @@ -59,6 +63,8 @@ enum {
>   struct allocinfo_filter {
>   	__u64 mask; /* bitmask of the filter fields used */
>   	struct allocinfo_tag fields;
> +	__u64 min_size;
> +	__u64 max_size;
>   };
>   
>   struct allocinfo_get_at {
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index 378fcd63b6c9..a936cf18611a 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -191,15 +191,26 @@ static int allocinfo_cmp_str(const char *str, const char *template)
>   	return strncmp(allocinfo_str(str), template, ALLOCINFO_STR_SIZE);
>   }
>   
> +/* Fetch the per-CPU counters */
> +static inline struct alloc_tag_counters allocinfo_prefetch_counters(struct codetag *ct)
> +{
> +	return alloc_tag_read(ct_to_alloc_tag(ct));
> +}
> +
>   /*
>    * Populates the UAPI allocinfo_tag_data structure with active runtime
>    * profiling counters extracted from the given kernel codetag.
>    */
>   static void allocinfo_to_params(struct codetag *ct,
> -				struct allocinfo_tag_data *data)
> +				struct allocinfo_tag_data *data,
> +				struct alloc_tag_counters *counters)
>   {
> -	struct alloc_tag *tag = ct_to_alloc_tag(ct);
> -	struct alloc_tag_counters counter = alloc_tag_read(tag);
> +	struct alloc_tag_counters local_counters;
> +
> +	if (!counters) {
> +		local_counters = allocinfo_prefetch_counters(ct);
> +		counters = &local_counters;
> +	}
>   
>   	if (ct->modname)
>   		allocinfo_copy_str(data->tag.modname, ct->modname);
> @@ -208,9 +219,9 @@ static void allocinfo_to_params(struct codetag *ct,
>   	allocinfo_copy_str(data->tag.function, ct->function);
>   	allocinfo_copy_str(data->tag.filename, ct->filename);
>   	data->tag.lineno = ct->lineno;
> -	data->counter.bytes = counter.bytes;
> -	data->counter.calls = counter.calls;
> -	data->counter.accurate = !alloc_tag_is_inaccurate(tag);
> +	data->counter.bytes = counters->bytes;
> +	data->counter.calls = counters->calls;
> +	data->counter.accurate = !alloc_tag_is_inaccurate(ct_to_alloc_tag(ct));
>   }
>   
>   /*
> @@ -234,7 +245,9 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
>    * Verifies whether a given codetag satisfies the active filtering criteria by
>    * matching its characteristics against the specified filter.
>    */
> -static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
> +static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
> +			   struct alloc_tag_counters *counters,
> +			   bool *fetched_counters)
>   {
>   	if (!filter || !filter->mask)
>   		return true;
> @@ -261,6 +274,19 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
>   	    ct->lineno != filter->fields.lineno)
>   		return false;
>   
> +	if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
> +		if (!*fetched_counters) {
> +			*counters = allocinfo_prefetch_counters(ct);
> +			*fetched_counters = true;
> +		}
> +		if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
> +		    counters->bytes < filter->min_size)
> +			return false;
> +		if ((filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
> +		    counters->bytes > filter->max_size)
> +			return false;
> +	}
> +
>   	return true;
>   }
>   
> @@ -274,6 +300,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
>   	struct codetag *ct;
>   	struct allocinfo_get_at params = {0};
>   	__u64 skip_count;
> +	struct alloc_tag_counters counters;
> +	bool fetched_counters;
>   
>   	if (copy_from_user(&params, arg, sizeof(params)))
>   		return -EFAULT;
> @@ -281,6 +309,11 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
>   	if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
>   		return -EINVAL;
>   
> +	if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
> +	    (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
> +	    params.filter.min_size > params.filter.max_size)
> +		return -EINVAL;
> +
>   	priv = m->private;
>   
>   	mutex_lock(&priv->ioctl_lock);
> @@ -304,7 +337,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
>   	ct = codetag_next_ct(&priv->ioctl_iter);
>   
>   	while (ct) {
> -		if (matches_filter(ct, &priv->filter)) {
> +		fetched_counters = false;
> +		if (matches_filter(ct, &priv->filter, &counters, &fetched_counters)) {
>   			if (skip_count == 0)
>   				break;
>   			skip_count--;
> @@ -313,7 +347,7 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
>   	}
>   
>   	if (ct) {
> -		allocinfo_to_params(ct, &params.data);
> +		allocinfo_to_params(ct, &params.data, fetched_counters ? &counters : NULL);
>   		priv->positioned = true;
>   	}
>   
> @@ -339,6 +373,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
>   	struct codetag *ct;
>   	struct allocinfo_tag_data params;
>   	int ret = 0;
> +	struct alloc_tag_counters counters;
> +	bool fetched_counters;
>   
>   	memset(&params, 0, sizeof(params));
>   	priv = m->private;
> @@ -352,10 +388,15 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
>   	}
>   
>   	ct = codetag_next_ct(&priv->ioctl_iter);
> -	while (ct && !matches_filter(ct, &priv->filter))
> +	while (ct) {
> +		fetched_counters = false;
> +		if (matches_filter(ct, &priv->filter, &counters, &fetched_counters))
> +			break;
>   		ct = codetag_next_ct(&priv->ioctl_iter);
> +	}
> +
>   	if (ct)
> -		allocinfo_to_params(ct, &params);
> +		allocinfo_to_params(ct, &params, fetched_counters ? &counters : NULL);
>   
>   	if (!ct) {
>   		priv->positioned = false;
