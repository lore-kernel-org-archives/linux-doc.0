Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A889846C844;
	Wed,  5 Aug 2026 12:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931429; cv=none; b=XG2Beab6FHj/KiYtQGA837TLJG+qIHWtf/UgNNS8OqnkAQmhtrrY+s+AkzrZ6GYASgWLm+n19Xj4us4neBwo1H/+l3Hux5zQwzmlCJZ9svreFGQLbSld0m5jzpDMuC6e8xWmz8Bw3Mqr1t2ShnrC+0vOazC7d0gs2tV0cc6lP5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931429; c=relaxed/simple;
	bh=A5HLaSgjhgjPaEmz5Bda1jcHu9p18ZGtwEN522g1xE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qwxxCH0e0VA55W3lBV3meMAJdB2dETLzW/pCaUjwQz6jjJtw5eK5u1we9myPD8FUWt6LxaxJ1n99g/uOENItnjvXY9hfNkQf1Xo8gkiwTvRkbQyV1ftyxi8KWkOfneq1yRtLM5WYsrRdlbN4RM6zZB75L9nEgKaXdvxKsfcCiUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDYF/i3G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDYF/i3G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB64C1F00ACA;
	Wed,  5 Aug 2026 12:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785931428;
	bh=/TxnOeGfIBpnExbybgGUK7PctnBzRbPKKrr+zPKrO7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NDYF/i3GHNA+/IHT24tL5hwQavM5fu/ZoSDW+J9bbFkcuRP8SsjnM15hTBdETAfkV
	 Wakg7UP63JLO7jYu2GYy/+4FSFdzK2IX6KKeddR7B26sh1Db8DtfOj2SQ5wVgBi2xx
	 uW2Wail8EKoiFOuj38AdJp+kl07jMXgbGa2gbY0HVGuxg/0BPNAouvXX7dqzRdnOnx
	 jvR41xDH0Vp4VOFDL3/uzlyafGPdiBMP7uhbK8fTFRY+zsXgkILJeXMIZuVAkDDIxP
	 vn6U11lvFwg0nP2qEx2bNvUcI/86FTiemcTKX/YLgMiuWe2OpWdeUnd3/s3WIBfnQm
	 2WmAhmyrhRrOQ==
Message-ID: <0b48002f-8e2c-41b3-b8ef-69f200b02330@kernel.org>
Date: Wed, 5 Aug 2026 14:03:41 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mm/page_reporting: Add page_reporting_delay_ms module
 parameter
To: Andrew Morton <akpm@linux-foundation.org>, pratmal@google.com
Cc: vbabka@kernel.org, sj@kernel.org, corbet@lwn.net, ljs@kernel.org,
 skhan@linuxfoundation.org, anshuman.khandual@arm.com, gthelen@google.com,
 surenb@google.com, mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org,
 ziy@nvidia.com, liam@infradead.org, rppt@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260731193705.2902728-1-pratmal@google.com>
 <20260731143420.0787387ce2ca120ecee15338@linux-foundation.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260731143420.0787387ce2ca120ecee15338@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/31/26 23:34, Andrew Morton wrote:
> On Fri, 31 Jul 2026 19:37:05 +0000 pratmal@google.com wrote:
> 
>> Free page reporting currently hardcodes a 2-second interval between
>> reports. This rigid delay cannot accommodate diverse guest workloads.
>>
>> This patch introduces a module parameter, page_reporting_delay_ms
>> (default: 2000), allowing users to tune the reporting rate:
>>  - Lower values enable aggressive memory reclamation by returning unused
>>    pages to the host immediately.
>>  - Higher values help batch pages during spiky allocation/free churn,
>>    reducing hypercalls and nested page fault overheads.
>>
>> Setting the delay to 0 is safe and execution is strictly gated by:
>>  - reporting is only triggered by high-order page frees.
>>  - expensive hypercalls are bounded by a slot capacity watermark check
>>    before proceeding.
> 
> This conflcits with the just-upstreamed 0b45f6927a1
> ("mm/page_reporting: use system_freezable_wq to fix UAF during
> suspend")
> (https://lore.kernel.org/20260721005603.1710551-1-linkl@google.com).
> 
> Please review my resolution:
> 
> --- a/mm/page_reporting.c~mm-page_reporting-add-page_reporting_delay_ms-module-parameter
> +++ a/mm/page_reporting.c
> @@ -48,7 +48,11 @@ MODULE_PARM_DESC(page_reporting_order, "
>   */
>  EXPORT_SYMBOL_GPL(page_reporting_order);
>  
> -#define PAGE_REPORTING_DELAY	(2 * HZ)
> +static unsigned int page_reporting_delay_ms = 2 * MSEC_PER_SEC;
> +module_param(page_reporting_delay_ms, uint, 0644);
> +MODULE_PARM_DESC(page_reporting_delay_ms,
> +		 "Set page reporting delay in milliseconds");
> +
>  static struct page_reporting_dev_info __rcu *pr_dev_info __read_mostly;
>  
>  enum {
> @@ -57,6 +61,13 @@ enum {
>  	PAGE_REPORTING_ACTIVE
>  };
>  
> +/* schedule work for page reporting */
> +static void page_reporting_schedule_work(struct page_reporting_dev_info *prdev)
> +{
> +	queue_delayed_work(system_freezable_wq, &prdev->work,
> +			      msecs_to_jiffies(page_reporting_delay_ms));

^ just double checking whether that is indented properly .


Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
