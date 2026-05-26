Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949C53A8741
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 03:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779765159; cv=none; b=Yb9a2c7diPPGRG0AMYo/1a84tcNgcGQE7syWFxb1AwJRYWLZGguwwx3x7Q6YfvByWwS1VEF0WBu0YoJdvQYTHh7XlfzqH2aELgKbLEoBTI0k68G0/1EPYbBL/QqFmqaCnxpkE+hvEoZJ6u1In8S/tsCYTqOuuxgVJbbO2td6R2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779765159; c=relaxed/simple;
	bh=2+AVVSQaPmlGB4Y0wY3BRcks0wPszSb+jkXQdlKYTes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G1VEhQ+X3ws5oDAbZeEHnF0ubsQNbu3QXS3URJDbNNvR9cvTdSoPN40Fw2WO0IOmdPH7hLb2Yhqzmrls+PZMwXg4N9mB7D8xLVp2ubV8Ma5rTxgF5/jQrHvCOKqfmNcCeGp3rI6Cw1qHmcVE5OD/S9curHmwUB2CZGj1AVMj+Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dnCSa+lf; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dnCSa+lf"
Message-ID: <de0f2984-44ea-4098-9d19-c63ee035cdaf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779765145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B7fYZUv8jUz3LpuMJ3igYxrWXq5kDxizbxy8SIukcuk=;
	b=dnCSa+lf6J4YpqA1F/oml2kyJgci5cZ58eOEnYBqKE0UtgWMYCewjMuX5Z+cOmiiMRdC+9
	HkCk8E6c4jPBJNtZFv2okluKn9sW21bAQ4VTHqpbKD08ghX61T3uw/6VYB771obobAF0Nl
	u7fyjwW9XFiasnsecsX608hrWrHRG80=
Date: Tue, 26 May 2026 11:11:33 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/6] alloc_tag: add size-based filtering to ioctl
To: Abhishek Bapat <abhishekbapat@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sourav Panda <souravpanda@google.com>
References: <cover.1779471082.git.abhishekbapat@google.com>
 <c4b425d1f9192caca3cad830f322aa048ed26d45.1779471082.git.abhishekbapat@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <c4b425d1f9192caca3cad830f322aa048ed26d45.1779471082.git.abhishekbapat@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Abhishek


On 2026/5/23 01:45, Abhishek Bapat wrote:
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
>   include/uapi/linux/alloc_tag.h |  8 +++-
>   lib/alloc_tag.c                | 72 ++++++++++++++++++++++++++++------
>   2 files changed, 68 insertions(+), 12 deletions(-)
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
> index 0cc9db5298c6..45f158bee0a6 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -39,13 +39,17 @@ enum {
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
> @@ -53,6 +57,8 @@ enum {
>   struct allocinfo_filter {
>   	__u64 mask; /* bitmask of the filter fields used */
>   	struct allocinfo_tag fields;
> +	__u64 min_size;
> +	__u64 max_size;
>   };
>   
>   struct allocinfo_get_at {
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index 56c394ef721f..6c8743eead2d 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -173,11 +173,21 @@ static int allocinfo_cmp_str(const char *str, const char *template)
>   	return strncmp(allocinfo_str(str), template, ALLOCINFO_STR_SIZE);
>   }
>   
> +static inline struct alloc_tag_counters allocinfo_prefetch_counters(struct codetag *ct)
> +{
> +	return alloc_tag_read(ct_to_alloc_tag(ct));
> +}
> +
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
> @@ -186,9 +196,9 @@ static void allocinfo_to_params(struct codetag *ct,
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
>   static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
> @@ -204,7 +214,8 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
>   	return 0;
>   }
>   
> -static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
> +static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
> +			   struct alloc_tag_counters *counters)
>   {
>   	if (!filter || !filter->mask)
>   		return true;
> @@ -228,6 +239,17 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
>   	    ct->lineno != filter->fields.lineno)
>   		return false;
>   
> +	if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) ||
> +	    (filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
> +		/* We assume counters is not NULL here as per caller logic */
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
> @@ -237,6 +259,9 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
>   	struct codetag *ct;
>   	struct allocinfo_get_at params = {0};
>   	__u64 skip_count;
> +	bool sizes_set;
> +	struct alloc_tag_counters counters;
> +	struct alloc_tag_counters *counters_ptr = NULL;
>   
>   	if (copy_from_user(&params, arg, sizeof(params)))
>   		return -EFAULT;
> @@ -244,9 +269,16 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
>   	if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
>   		return -EINVAL;
>   
> +	if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
> +	    (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
> +	    params.filter.min_size > params.filter.max_size)
> +		return -EINVAL;
> +
>   	priv = (struct allocinfo_private *)m->private;
>   
>   	skip_count = params.pos;
> +	sizes_set = (params.filter.mask &
> +		     (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE));
>   
>   	mutex_lock(&priv->ioctl_lock);
>   	codetag_lock_module_list(alloc_tag_cttype, true);
> @@ -261,7 +293,11 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
>   	ct = codetag_next_ct(&priv->ioctl_iter);
>   
>   	while (ct) {
> -		if (matches_filter(ct, &priv->filter)) {
> +		if (sizes_set) {
> +			counters = allocinfo_prefetch_counters(ct);
> +			counters_ptr = &counters;
> +		}
> +		if (matches_filter(ct, &priv->filter, counters_ptr)) {

alloc_tag_read() walks all per-CPU counters which is not cheap, but here

it's called for every codetag unconditionally when sizes_set is true,

even when the tag would be rejected by modname/function/filename checks

that are plain string comparisons.

For example, say the user filters with MODNAME | MIN_SIZE on a system

with 10000 tags, 100 of which belong to the target module. Today the

code would call alloc_tag_read() 10000 times (once per tag), but only

100 of those tags pass the modname check — the other 9900 per-CPU walks

are wasted.

Would it make sense to split the filter check so that per-CPU counter reads

only happen after tag-based checks pass? Something like:

static bool allocinfo_match_tag(struct codetag *ct,

                         struct allocinfo_filter *filter) { ... }

static bool allocinfo_match_size(struct alloc_tag_counters *counters,

                                    struct allocinfo_filter *filter) { ... }

And in the caller:

bool match = allocinfo_match_tag(ct, &priv->filter);

/* Add comments to help subsequent developers understand the purpose of 
this modification. */

if (match && sizes_set) {

            counters = allocinfo_prefetch_counters(ct);

            counters_ptr = &counters;

             match = allocinfo_match_size(counters_ptr, &priv->filter);

}

You may find a more elegant approach to resolve this issue.

Thanks

Best Regards

Hao

>   			if (skip_count == 0)
>   				break;
>   			skip_count--;
> @@ -270,7 +306,7 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
>   	}
>   
>   	if (ct) {
> -		allocinfo_to_params(ct, &params.data);
> +		allocinfo_to_params(ct, &params.data, counters_ptr);
>   		priv->positioned = true;
>   	}
>   
> @@ -292,9 +328,15 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
>   	struct codetag *ct;
>   	struct allocinfo_tag_data params = {0};
>   	int ret = 0;
> +	bool sizes_set;
> +	struct alloc_tag_counters counters;
> +	struct alloc_tag_counters *counters_ptr = NULL;
>   
>   	priv = (struct allocinfo_private *)m->private;
>   
> +	sizes_set = (priv->filter.mask &
> +		     (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE));
> +
>   	mutex_lock(&priv->ioctl_lock);
>   	codetag_lock_module_list(alloc_tag_cttype, true);
>   
> @@ -304,10 +346,18 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
>   	}
>   
>   	ct = codetag_next_ct(&priv->ioctl_iter);
> -	while (ct && !matches_filter(ct, &priv->filter))
> +	while (ct) {
> +		if (sizes_set) {
> +			counters = allocinfo_prefetch_counters(ct);
> +			counters_ptr = &counters;
> +		}
> +		if (matches_filter(ct, &priv->filter, counters_ptr))
> +			break;
>   		ct = codetag_next_ct(&priv->ioctl_iter);
> +	}
> +
>   	if (ct)
> -		allocinfo_to_params(ct, &params);
> +		allocinfo_to_params(ct, &params, counters_ptr);
>   
>   	if (!ct) {
>   		priv->positioned = false;
