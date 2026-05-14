Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8E7EEBA
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 06:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778739353; cv=none; b=ewyj0Lrf2t0ZUwDRdRgxmb9Is7O9G2540nXNF3V+vvHmoJOcxCNuyMrptuRJyIjhcWUGFG0zUVhy/i1OgIwJxTOeWDMFxXTs2tAMGo0+FVGIoe1Y6jTBtMsTgyKQgP3HD2C3VHUCWpD9rNQEHhg8Ck4bXeslGsMSHemrnNyLrGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778739353; c=relaxed/simple;
	bh=O/LGF0vM59UNpQ7kzy+LqynmqQ6zPkgu18idRauLntU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fS3wzdYnW43o9Y3ffS3upS0kCd/UHHZyQNupbQuEmeQbBYFjrzDjNxiD9D0qUt5/x4WWey4BRlystvkw4pPWTcnwKR8GSIYDYqBXyvkfTBjEBdOJiKV6tl0fzad8NCn/j0cCy2m8pHzxDcOkbwdFTOnhdjSusZdek38T05EVu9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HUqgbeGo; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HUqgbeGo"
Message-ID: <7e4881af-3fca-474a-abb7-daa75986e3ad@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778739348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t8w6MPzA/h1sN1RH63AkkshacZX+EDpu8/E4H7LtmUQ=;
	b=HUqgbeGoKgH9eKrPki0bzHX/ThkrCPokSGe0ZMwxWcPfxruZXDEscAwskg75PywEvfXr4T
	6PEXQJtAB5lcDXtlyT/bInVU4kVhpZoZTVXT7Uv1RNCQDAeeycK0q8fVFsED8VnmykzGHB
	sIQk/PfOvBKoF+Om728f0N/qnDmX3V4=
Date: Thu, 14 May 2026 14:15:06 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/6] alloc_tag: add ioctl filters to /proc/allocinfo
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sourav Panda <souravpanda@google.com>, Suren Baghdasaryan
 <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
References: <cover.1777936301.git.abhishekbapat@google.com>
 <2d1cbd93b987198d9569ff54b7fee4ae6aad5ff6.1777936301.git.abhishekbapat@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <2d1cbd93b987198d9569ff54b7fee4ae6aad5ff6.1777936301.git.abhishekbapat@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Abhishek

On 2026/5/5 07:36, Abhishek Bapat wrote:
> Extend the capability of the IOCTL mechanism to filter allocations based
> on tag's module name, function name, file name and line number.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> ---
>   include/uapi/linux/alloc_tag.h | 26 +++++++++++++++-
>   lib/alloc_tag.c                | 55 ++++++++++++++++++++++++++++++++--
>   2 files changed, 77 insertions(+), 4 deletions(-)
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
> index e9a5b55fcc7a..0cc9db5298c6 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -34,8 +34,32 @@ struct allocinfo_tag_data {
>   	struct allocinfo_counter counter;
>   };
>   
> +enum {
> +	ALLOCINFO_FILTER_MODNAME,
> +	ALLOCINFO_FILTER_FUNCTION,
> +	ALLOCINFO_FILTER_FILENAME,
> +	ALLOCINFO_FILTER_LINENO,
> +	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_LINENO
> +};
> +
> +#define ALLOCINFO_FILTER_MASK_MODNAME		(1 << ALLOCINFO_FILTER_MODNAME)
> +#define ALLOCINFO_FILTER_MASK_FUNCTION		(1 << ALLOCINFO_FILTER_FUNCTION)
> +#define ALLOCINFO_FILTER_MASK_FILENAME		(1 << ALLOCINFO_FILTER_FILENAME)
> +#define ALLOCINFO_FILTER_MASK_LINENO		(1 << ALLOCINFO_FILTER_LINENO)
> +
> +#define ALLOCINFO_FILTER_MASKS \
> +	((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> +
> +struct allocinfo_filter {
> +	__u64 mask; /* bitmask of the filter fields used */
> +	struct allocinfo_tag fields;
> +};
> +
>   struct allocinfo_get_at {
> -	__u64 pos;	/* input */
> +	/* inputs */
> +	__u64 pos;
> +	struct allocinfo_filter filter;
> +	/* output */
>   	struct allocinfo_tag_data data;
>   };
>   
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index 5c24d2f954d4..7ff936e15e97 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -47,6 +47,7 @@ int alloc_tag_ref_offs;
>   struct allocinfo_private {
>   	struct codetag_iterator iter;
>   	bool print_header;
> +	struct allocinfo_filter filter;
>   	/* ioctl uses a separate iterator not to interfere with reads */
>   	struct codetag_iterator ioctl_iter;
>   	bool positioned; /* seq_open_private() sets to 0 */
> @@ -156,6 +157,11 @@ static void allocinfo_copy_str(char *dest, const char *src)
>   	strscpy(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE);
>   }
>   
> +static int allocinfo_cmp_str(const char *str, const char *template)
> +{
> +	return strncmp(allocinfo_str(str), template, ALLOCINFO_STR_SIZE);
> +}
> +
>   static void allocinfo_to_params(struct codetag *ct,
>   				struct allocinfo_tag_data *data)
>   {
> @@ -187,26 +193,67 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
>   	return 0;
>   }
>   
> +static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
> +{
> +	if (!ct || !filter || !filter->mask)
> +		return true;
> +

Minor: in matches_filter(), returning true when ct is NULL seems

semantically odd since both callers already check for ct != NULL

before calling this function. Not a real issue though.

> +	if ((filter->mask & ALLOCINFO_FILTER_MASK_MODNAME) &&
> +	    ct->modname && (allocinfo_cmp_str(ct->modname, filter->fields.modname)))
> +		return false;
> +

In matches_filter(), when ct->modname is NULL (built-in kernel code),

the modname filter is skipped due to

ct->modname && (allocinfo_cmp_str(...))

This means built-in allocations always pass the modname filter. Since

built-in code doesn't belong to any module, maybe it should not match

when a modname filter is set:

if (filter->mask & ALLOCINFO_FILTER_MASK_MODNAME) {

     if (!ct->modname)

         return false;

if (allocinfo_cmp_str(ct->modname, filter->fields.modname))

     return false;

}

Thanks

Best Regards

Hao

> +	if ((filter->mask & ALLOCINFO_FILTER_MASK_FUNCTION) &&
> +	    ct->function && (allocinfo_cmp_str(ct->function, filter->fields.function)))
> +		return false;
> +
> +	if ((filter->mask & ALLOCINFO_FILTER_MASK_FILENAME) &&
> +	    ct->filename && (allocinfo_cmp_str(ct->filename, filter->fields.filename)))
> +		return false;
> +
> +	if ((filter->mask & ALLOCINFO_FILTER_MASK_LINENO) &&
> +	    ct->lineno != filter->fields.lineno)
> +		return false;
> +
> +	return true;
> +}
> +
>   static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
>   {
>   	struct allocinfo_private *priv;
>   	struct codetag *ct;
> -	__u64 pos;
>   	struct allocinfo_get_at params = {0};
> +	__u64 skip_count;
>   
>   	if (copy_from_user(&params, arg, sizeof(params)))
>   		return -EFAULT;
>   
> +	if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
> +		return -EINVAL;
> +
>   	priv = (struct allocinfo_private *)m->private;
> -	pos = params.pos;
> +
> +	skip_count = params.pos;
>   
>   	codetag_lock_module_list(alloc_tag_cttype, true);
>   
> +	if (params.filter.mask)
> +		priv->filter = params.filter;
> +	else
> +		priv->filter.mask = 0;
> +
>   	/* Find the codetag */
>   	priv->ioctl_iter = codetag_get_ct_iter(alloc_tag_cttype);
>   	ct = codetag_next_ct(&priv->ioctl_iter);
> -	while (ct && pos--)
> +
> +	while (ct) {
> +		if (matches_filter(ct, &priv->filter)) {
> +			if (skip_count == 0)
> +				break;
> +			skip_count--;
> +		}
>   		ct = codetag_next_ct(&priv->ioctl_iter);
> +	}
> +
>   	if (ct) {
>   		allocinfo_to_params(ct, &params.data);
>   		priv->positioned = true;
> @@ -240,6 +287,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
>   	}
>   
>   	ct = codetag_next_ct(&priv->ioctl_iter);
> +	while (ct && !matches_filter(ct, &priv->filter))
> +		ct = codetag_next_ct(&priv->ioctl_iter);
>   	if (ct)
>   		allocinfo_to_params(ct, &params);
>   
