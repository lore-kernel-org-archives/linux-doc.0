Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC843625;
	Thu, 14 May 2026 02:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778724385; cv=none; b=lewVrVfEtLFsymAKL9Kf0zYbI+eEqvDT/TYES1BW6qNA6h1Hv3pqjL/2FrDT2EHUxo7binX+Wo0yjV/rFW+DeGO7t6eRKFi2XhvNZziWZeijNU+SrNlnu0iCoILPC+TZjS9AKqgrGw7HjA5nHMU9KlxR8CUQSu/ieCz7XWgRAuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778724385; c=relaxed/simple;
	bh=ZQF7neJbiHMnHThZXGemUYK10kTVVZf41ejnQ0Xn0cU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPnoC/jpgJUitxseyuNwt9HCPGbEX+1v4p/ziOAcmS/z7ye/sT9Fmu27NVo7r9/p+zyL0d48fw+cS29wbW4lURKvS2q5sb7QwXYqMnvUeetCBfBKvCxSf0QOlkp/93/VhSHOddqAQt5VEq+MujHEnlZP3JrFRpvNYu6aSQxWNwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tANEEKSk; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tANEEKSk"
Message-ID: <e5db0262-7ee8-4a9f-bfb2-c66a86b9ac7b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778724381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NgwK++d+KiHykF7iybtMJFLF9OtaIvcBvOsHU3SZwak=;
	b=tANEEKSkUFW8wAQHH0N22iPB/YMbs9ZotHhr54v0cPKFMGgF43vUDYkbaTxSQV0qIxRLOg
	d1XAADKMuK6hqc8M9Gxvsmp2YfbBLF5IxZcAtWUYfl2GgW7FHV+2PxR+1y3O2BC36ic+r9
	QAAcpDAt04+6g1MSOcUQ8gdPpTR0gc0=
Date: Thu, 14 May 2026 10:05:39 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
To: Suren Baghdasaryan <surenb@google.com>
Cc: Abhishek Bapat <abhishekbapat@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sourav Panda <souravpanda@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
References: <cover.1777936301.git.abhishekbapat@google.com>
 <9bff01a8-eb97-4d09-81a4-f4dbf9b59b73@linux.dev>
 <CAJuCfpE9_Njy7Tm4DnNin9HEVoqqfKzTRgxYkEEyzm+OCc49sw@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <CAJuCfpE9_Njy7Tm4DnNin9HEVoqqfKzTRgxYkEEyzm+OCc49sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 2026/5/13 03:58, Suren Baghdasaryan wrote:
> On Wed, May 6, 2026 at 1:45 AM Hao Ge<hao.ge@linux.dev>  wrote:
>> Hi Abhishek and Suren
>>
>>
>> On 2026/5/5 07:36, Abhishek Bapat wrote:
>>> Currently, memory allocation profiling data is primarily exposed through
>>> /proc/allocinfo. While useful for manual inspection, this text-based
>>> interface poses challenges for production monitoring and large-scale
>>> analysis:
>>>
>>> 1. Userspace must parse large amounts of text to extract specific
>>> fields.
>>> 2. To find specific tags, userspace must read the entire dataset,
>>> requiring many context switches and high data copying.
>>> 3. The kernel currently aggregates per-CPU counters for every allocation
>>> size, even those the user intends to filter out immediately.
>>>
>>> This series introduces a new IOCTL-based binary interface for allocinfo
>>> that supports kernel-side filtering. By allowing the user to specify a
>>> filter mask, we significantly reduce the work performed in-kernel and
>>> the amount of data transferred to userspace.
>>>
>>> Performance measurements were conducted on an Intel Xeon Platinum 8481C
>>> (224 CPUs) with caches dropped before each run.
>>>
>>> The IOCTL mechanism shows a ~20x performance improvement for
>>> filtered queries. The kernel avoids the expensive per-CPU counter
>>> aggregation (alloc_tag_read) for any tags that fail the initial string
>>> or location filters.
>>>
>>> Scenario 1: Specific File Filtering (arch/x86/events/rapl.c)
>>> 1. Traditional (cat /proc/allocinfo | grep): 22ms (sys)
>>> 2. IOCTL Interface: 1ms (sys)
>>>
>>> Scenario 2: Compound Filtering (Filename + Size)
>>> 1. Traditional: (cat ... | grep | awk): 21ms (sys)
>>> 2. IOCTL Interface: 1ms (sys)
>>>
>>> Scenario 3: Size-Based Filtering (min_size = 1MB)
>>> 1. Traditional: (cat ... | awk): 21ms (sys)
>>> 2. IOCTL Interface: 14ms (sys)
>> What a coincidence! I was just about to send an email to Suren
>>
>> asking about plans for upstreaming a filtering tool for /proc/allocinfo,
>>
>> and then I came across this patchset.
>>
>> I have been following and using memory allocation profiling since
>>
>> it was first introduced. It has been very helpful for our memory
>>
>> analysis by providing clear visibility into allocation data. However,
>>
>> we have always wanted a tool to efficiently filter this data to get
>>
>> exactly what we need, so I previously developed a userspace tool [1]
>>
>> to help with that.
>>
>> [1]https://lore.kernel.org/all/20250106112103.25401-1-hao.ge@linux.dev/
>>
>> So this patchset provides efficient filtering of allocinfo data via ioctl.
>>
>> Would the next step be to develop a general-purpose tool under
>>
>> tools/mm that leverages these ioctls instead of parsing /proc/allocinfo
>> text output?
> Hi Hao,
> Sorry for the delay, I was travelling for LSFMM and missed a bunch of emails.
> Yes, we are planning to upstream alloctop tool
> (https://android-review.googlesource.com/c/platform/system/memory/libmeminfo/+/3431860)
> and now with ioctl support it becomes more relevant. Once this
> patchset is merged, we will prepare the tool and post the patch.
> Thanks,
> Suren.

Hi Suren

Thanks for the info! The alloctop tool looks great, looking forward to it.

I'd be happy to help review or test it once it's posted.

Best Regards

Hao

