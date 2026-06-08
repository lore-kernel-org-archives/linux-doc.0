Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744C93769E5
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 06:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899815; cv=none; b=aNvXKM28tKVZ9DalwbQz14oruBEDuYaRZjsZvraxGZwmNet1ZPzT5EMSGTbghJ2KokhKpX+U/rq+xxOTs8DvP1RvWwJQPsQbZ57QY10JPQDUljnfmDEnAh0JOjqWN66vBFt4nCgJ0wISR1nQTELJPqbn2qLmR+N5MaMDe8XLvj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899815; c=relaxed/simple;
	bh=bU4IjIabNLJiVJEgQJWDCsORtt/Tt7TvQKNCNbV7SQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GTcQzD3L+xIc1ndOnOWWIUiWfvCvcWnB48jk1GdTQDd4aXvFGX/vzfd2WT7TIlSFoGdCMe5lVsrnlPpdbIJ8PITNT91CILnuJwwmTw5wNAc/+jgke5FYiycEPySOnocAj19bZIy+IhTuWxw1CFP5Cswxsmhe7ejUX+omBeylRWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TwOlptSy; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TwOlptSy"
Message-ID: <1ec17313-cd2b-4389-a05d-998757af30b3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780899811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iabxNAjlCFgMo3PCIWOb5E5kf8/DsNZHurW4YcWP6NA=;
	b=TwOlptSyCuwlyz+cs+2cC+cgE72sF47EGRZ1CQFhbFsboWWqAliar9vg/zctPFBH40goI3
	pqo2JgW2wsFZ3JdI0nYrVLri78MR4YAUKvyfx355E0BxuSTEArINylbYjiNyYlMC30yPIB
	QmRLjQEpO4bLqWqNvSuBOINKk5DYo1c=
Date: Mon, 8 Jun 2026 14:22:59 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 4/6] alloc_tag: add accuracy based filtering to ioctl
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sourav Panda <souravpanda@google.com>, Suren Baghdasaryan
 <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
References: <cover.1780701922.git.abhishekbapat@google.com>
 <b608a6f7d71e3b728f766dbc6dfa1d1753ddcff5.1780701922.git.abhishekbapat@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <b608a6f7d71e3b728f766dbc6dfa1d1753ddcff5.1780701922.git.abhishekbapat@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Abhishek


On 2026/6/6 07:36, Abhishek Bapat wrote:
> Extend the allocinfo filtering mechanism to allow users to filter tags
> based on their accuracy.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> ---
>   include/uapi/linux/alloc_tag.h | 3 +++
>   lib/alloc_tag.c                | 8 ++++++++
>   2 files changed, 11 insertions(+)
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
> index 0e648192df4d..42445bdb11c5 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -20,6 +20,7 @@ struct allocinfo_tag {
>   	char function[ALLOCINFO_STR_SIZE];
>   	char filename[ALLOCINFO_STR_SIZE];
>   	__u64 lineno;
> +	__u64 inaccurate;


I was wondering if it would make sense to define inaccurate as a flags field

(e.g. __u64 flags with ALLOCINFO_TAG_F_INACCURATE (1 <<0)),

so that only bit 0 is used today and the upper bits are reserved for 
future use,

aligning with current kernel codebase.

This design also allows for better extensibility if we need to

add new flags for any reason in the future.

We also need to add flag validity checks if we go this route.


Thanks

Best Regards

Hao


>   };
>   
>   /* The alignment ensures 32-bit compatible interfaces are not broken */
> @@ -39,6 +40,7 @@ enum {
>   	ALLOCINFO_FILTER_FUNCTION,
>   	ALLOCINFO_FILTER_FILENAME,
>   	ALLOCINFO_FILTER_LINENO,
> +	ALLOCINFO_FILTER_INACCURATE,
>   	ALLOCINFO_FILTER_MIN_SIZE,
>   	ALLOCINFO_FILTER_MAX_SIZE,
>   	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
> @@ -48,6 +50,7 @@ enum {
>   #define ALLOCINFO_FILTER_MASK_FUNCTION		(1 << ALLOCINFO_FILTER_FUNCTION)
>   #define ALLOCINFO_FILTER_MASK_FILENAME		(1 << ALLOCINFO_FILTER_FILENAME)
>   #define ALLOCINFO_FILTER_MASK_LINENO		(1 << ALLOCINFO_FILTER_LINENO)
> +#define ALLOCINFO_FILTER_MASK_INACCURATE	(1 << ALLOCINFO_FILTER_INACCURATE)
>   #define ALLOCINFO_FILTER_MASK_MIN_SIZE		(1 << ALLOCINFO_FILTER_MIN_SIZE)
>   #define ALLOCINFO_FILTER_MASK_MAX_SIZE		(1 << ALLOCINFO_FILTER_MAX_SIZE)
>   
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index ddc6946f56ab..cbcd12c4ef9c 100644
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
> @@ -275,6 +277,12 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
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
