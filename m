Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ED335B631
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 08:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057146; cv=none; b=bJKiaz94mAqbZHIYdKgIavkYIcNXqFGHICT/nH7ql8BC1rHlFTFWMmoo8YX8DAjjNnFIO71iAdHiFF+LkwAw3pC7UjgNEL4YpiBruHCbr/jmQHJU8ubUc2FHFm3u5fKZR32ZvzoCTOWWw14O9yL/qoOEYNtGC44Mb7rhnm/6hpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057146; c=relaxed/simple;
	bh=zfOe0ewoNd40PSwESoyTa7we45pISc0KWGQkjtGsAAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSbF3govuc6aoOPHWAJ/6JJO05MFq+AcgV8QlPBGZ8uimZ9A9nvvYdJ26DES+1WbrfZ9sAwRWqJdwTCrbUCiVAXTHa7qA3Nhn833NP664Q52zTm752AQO+X5+tZJelXoxk/JIMSFyfL3x62oQSrQK+cBK3+Opuon9qcyrMguG9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WLJYvYXz; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WLJYvYXz"
Message-ID: <9bff01a8-eb97-4d09-81a4-f4dbf9b59b73@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778057142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FyBSdoaYXNxV7svjP8Gx2sTmbQnB/STZugwK800JzDE=;
	b=WLJYvYXzy5QXWDKFOm0KLjcnEIM1zL7bS17d32jOy99sxWhPdqlQur5F5zd2W4dB8tR9Yy
	YrUYlROye7A4tOPFQGXPUnsBUulqp2+GjxS6jBIc5jP/pXFySk0XujN0AFRmO7yxvohXwr
	jin5mAa6iYkZ44q9WIwZd7JXwhkhLcE=
Date: Wed, 6 May 2026 16:44:37 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
To: Abhishek Bapat <abhishekbapat@google.com>,
 Suren Baghdasaryan <surenb@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sourav Panda <souravpanda@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
References: <cover.1777936301.git.abhishekbapat@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <cover.1777936301.git.abhishekbapat@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi Abhishek and Suren


On 2026/5/5 07:36, Abhishek Bapat wrote:
> Currently, memory allocation profiling data is primarily exposed through
> /proc/allocinfo. While useful for manual inspection, this text-based
> interface poses challenges for production monitoring and large-scale
> analysis:
>
> 1. Userspace must parse large amounts of text to extract specific
> fields.
> 2. To find specific tags, userspace must read the entire dataset,
> requiring many context switches and high data copying.
> 3. The kernel currently aggregates per-CPU counters for every allocation
> size, even those the user intends to filter out immediately.
>
> This series introduces a new IOCTL-based binary interface for allocinfo
> that supports kernel-side filtering. By allowing the user to specify a
> filter mask, we significantly reduce the work performed in-kernel and
> the amount of data transferred to userspace.
>
> Performance measurements were conducted on an Intel Xeon Platinum 8481C
> (224 CPUs) with caches dropped before each run.
>
> The IOCTL mechanism shows a ~20x performance improvement for
> filtered queries. The kernel avoids the expensive per-CPU counter
> aggregation (alloc_tag_read) for any tags that fail the initial string
> or location filters.
>
> Scenario 1: Specific File Filtering (arch/x86/events/rapl.c)
> 1. Traditional (cat /proc/allocinfo | grep): 22ms (sys)
> 2. IOCTL Interface: 1ms (sys)
>
> Scenario 2: Compound Filtering (Filename + Size)
> 1. Traditional: (cat ... | grep | awk): 21ms (sys)
> 2. IOCTL Interface: 1ms (sys)
>
> Scenario 3: Size-Based Filtering (min_size = 1MB)
> 1. Traditional: (cat ... | awk): 21ms (sys)
> 2. IOCTL Interface: 14ms (sys)

What a coincidence! I was just about to send an email to Suren

asking about plans for upstreaming a filtering tool for /proc/allocinfo,

and then I came across this patchset.

I have been following and using memory allocation profiling since

it was first introduced. It has been very helpful for our memory

analysis by providing clear visibility into allocation data. However,

we have always wanted a tool to efficiently filter this data to get

exactly what we need, so I previously developed a userspace tool [1]

to help with that.

[1] https://lore.kernel.org/all/20250106112103.25401-1-hao.ge@linux.dev/

So this patchset provides efficient filtering of allocinfo data via ioctl.

Would the next step be to develop a general-purpose tool under

tools/mm that leverages these ioctls instead of parsing /proc/allocinfo 
text output?

Thanks

Best Regards

Hao

> Abhishek Bapat (5):
>    alloc_tag: add ioctl filters to /proc/allocinfo
>    alloc_tag: add size-based filtering to ioctl
>    alloc_tag: add accuracy based filtering to ioctl
>    kselftest: alloc_tag: add kselftest for ioctl interface
>    kselftest: alloc_tag: extend the allocinfo ioctl kselftest
>
> Suren Baghdasaryan (1):
>    alloc_tag: add ioctl to /proc/allocinfo
>
>   .../userspace-api/ioctl/ioctl-number.rst      |   2 +
>   include/linux/codetag.h                       |   1 +
>   include/uapi/linux/alloc_tag.h                |  87 +++
>   lib/alloc_tag.c                               | 249 ++++++++-
>   lib/codetag.c                                 |  11 +
>   tools/testing/selftests/alloc_tag/Makefile    |   9 +
>   .../alloc_tag/allocinfo_ioctl_test.c          | 508 ++++++++++++++++++
>   7 files changed, 865 insertions(+), 2 deletions(-)
>   create mode 100644 include/uapi/linux/alloc_tag.h
>   create mode 100644 tools/testing/selftests/alloc_tag/Makefile
>   create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
>
