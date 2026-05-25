Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489F035F176
	for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 07:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779694404; cv=none; b=K30+HMXZdysVQ3sliRD+ohhgat8S9EZBXxV5PT5+pExyqD2E8cX4teQWZOlK3iZA3BBnrhELe7LGgd8I8YAvtaeXt6Y4VcZ3gA7XUT4oh45flJiFy5jpQydcTlr2M1u53x5EOVHi06RwhK+gxNuyXC55ThOnKg3tDRVogD6wrnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779694404; c=relaxed/simple;
	bh=eX2JOwFSMPvpSnLf6hOHUE3cybqR0wHJ9MBEY/iFzxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cdQDSSniuMdQYgqM0lKoA5qakfa3kDKaDx5uSH8+eSErAcfq8ua/koRbV4XbPistwFPETcCe2LxG6ROHTo/tqC8RVCyVBgZ2D+z8J7wUKvrhyPE7TQ9C2vJGG4eJqZPU6aBki7Z/xB8l3JYmFZ2+Hmz8g56Xo40hOebFYJmB4pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r/SBF14q; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r/SBF14q"
Message-ID: <4ae038f0-cc33-4a60-b59b-ae86bb541735@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779694390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yqm4rDNS2ankd/7t9g3YNTaGGMsLoyuj9qmOESSwm50=;
	b=r/SBF14qubxprE8KtVNF0U6NxZfGNaN4kuZlJQaoTggj+nElvUGC6F/tdOwKbervVT+WQW
	FcHRP4lgkt7/yzigSfKqaFwAhT7WOQz1FVDDpKJWQ/DAYX3jnKU1yMdsp32nsf9NLzNr9k
	ZqKWM+EXClfz/oP5kcTDAeUIYGzpKGU=
Date: Mon, 25 May 2026 15:32:20 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
To: Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
 Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sourav Panda <souravpanda@google.com>,
 Abhishek Bapat <abhishekbapat@google.com>
References: <cover.1779471082.git.abhishekbapat@google.com>
 <20260522131108.f972659717367c67082f3766@linux-foundation.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <20260522131108.f972659717367c67082f3766@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Andrew and Suren


On 2026/5/23 04:11, Andrew Morton wrote:
> On Fri, 22 May 2026 17:45:32 +0000 Abhishek Bapat <abhishekbapat@google.com> wrote:
>
>> Currently, memory allocation profiling data is primarily exposed through
>> /proc/allocinfo. While useful for manual inspection, this text-based
>> interface poses challenges for production monitoring and large-scale
>> analysis:
>>
>> 1. Userspace must parse large amounts of text to extract specific
>> fields.
>> 2. To find specific tags, userspace must read the entire dataset,
>> requiring many context switches and high data copying.
>> 3. The kernel currently aggregates per-CPU counters for every allocation
>> size, even those the user intends to filter out immediately.
>>
>> This series introduces a new IOCTL-based binary interface for allocinfo
>> that supports kernel-side filtering. By allowing the user to specify a
>> filter mask, we significantly reduce the work performed in-kernel and
>> the amount of data transferred to userspace.
>>
>> Performance measurements were conducted on an Intel Xeon Platinum 8481C
>> (224 CPUs) with caches dropped before each run.
>>
>> The IOCTL mechanism shows a ~20x performance improvement for
>> filtered queries. The kernel avoids the expensive per-CPU counter
>> aggregation (alloc_tag_read) for any tags that fail the initial string
>> or location filters.
>>
>> Scenario 1: Specific File Filtering (arch/x86/events/rapl.c)
>> 1. Traditional (cat /proc/allocinfo | grep): 22ms (sys)
>> 2. IOCTL Interface: 1ms (sys)
>>
>> Scenario 2: Compound Filtering (Filename + Size)
>> 1. Traditional: (cat ... | grep | awk): 21ms (sys)
>> 2. IOCTL Interface: 1ms (sys)
>>
>> Scenario 3: Size-Based Filtering (min_size = 1MB)
>> 1. Traditional: (cat ... | awk): 21ms (sys)
>> 2. IOCTL Interface: 14ms (sys)
> Yup, textual interfaces aren't fast.
>
> And ioctl-baed interfaces aren't popular.  One would prefer to see an
> interface which uses read()/lseek(), pread(), etc.  It would be
> appropriate for this [0/N] to have a discussion of why that approach
> was not chosen.
>
>>   .../userspace-api/ioctl/ioctl-number.rst      |   2 +
>>   MAINTAINERS                                   |   2 +
>>   include/linux/codetag.h                       |   1 +
>>   include/uapi/linux/alloc_tag.h                |  87 +++
>>   lib/alloc_tag.c                               | 303 ++++++++++-
>>   lib/codetag.c                                 |  11 +
>>   tools/testing/selftests/alloc_tag/Makefile    |   9 +
>>   .../alloc_tag/allocinfo_ioctl_test.c          | 505 ++++++++++++++++++
>>   8 files changed, 918 insertions(+), 2 deletions(-)
>>   create mode 100644 include/uapi/linux/alloc_tag.h
>>   create mode 100644 tools/testing/selftests/alloc_tag/Makefile
>>   create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> At some point this should grow user-facing documentation, please.
>
> And the right time for that is now, because such documentation is
> useful for code review - it makes that review both easier and more
> useful.
>
> Sashiko had a few things to say:
>
> 	https://sashiko.dev/#/patchset/cover.1779471082.git.abhishekbapat@google.com

I notice that Sashiko has reported a pre-existing issue, as described below:


 >  static void *allocinfo_start(struct seq_file *m, loff_t *pos)
This is a pre-existing issue, but can resuming a sequential read on
/proc/allocinfo cause a use-after-free if a kernel module is unloaded
between read() system calls?
The seq_file read operation updates priv->iter.ct during allocinfo_next(),
stops iteration, and returns to userspace. If the module containing
priv->iter.ct is unloaded while the lock is dropped, the module's codetag
memory is freed.
On the next read() system call, allocinfo_start() with pos > 0 reacquires
the lock but returns priv without validating if priv->iter.ct still belongs
to a valid module. Does allocinfo_show() then dereference this dangling
pointer?
[ ... ]

This issue is unrelated to the current patch series and can be resolved

by reverting commit 9f44df50fee4.

Therefore, I have submitted a separate patch addressing this issue,

which is available at the link below:

https://lore.kernel.org/all/20260525072117.112779-1-hao.ge@linux.dev/

Thanks

Best Regards

Hao

