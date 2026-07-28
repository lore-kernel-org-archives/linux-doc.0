Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E78470EAD;
	Tue, 28 Jul 2026 18:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785264958; cv=none; b=Ve8AEJzphoBCkxmtRldJ1X0EIpJZfkRLDh3EXz5IWcGy70IjdOUu7biVOYu7aLiM0Fw/8ls9TD2ckcATMjZZ/VNu+zAiUnwlUhM3vZHe+xZ9cUHbHlisb3It0/LPcx8Lx8y8Guz4rTISMLqRhuxCdI8WrR7qPzhR159xnsjS3a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785264958; c=relaxed/simple;
	bh=AgsjISV7Zlwr2AIsccSiFmgmy0pKqU+9P7pZE26q6oc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaGPwHZUYjNzkDMTj7+XXax3caLlUo8yTC5Yqx45eUkyZ4i/pdpdEWjY9Sg3s8h1ZxGM+qlxWJaKYoMz4Ul/6hOXAi5lKecfhlLJnBdyu7j3SlF+TUgkWyg2OWl9NjmYVHyFojZYvORT6S5r2rGBbzrLo2vfEFnMaW8R9qx0+yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJkspsqW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJkspsqW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390521F000E9;
	Tue, 28 Jul 2026 18:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785264955;
	bh=xyDi5xQA1AMyz6Holti/bfjxIF++j2+pJzGhsHUHlqw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZJkspsqWXjWjFcbFYiktTjt1XKmKGc8738BdLNGQ0FnV5wYHoEdUZuY5EJmD+ATGF
	 R5AZmBSuh+BLQNox+qjFxERXMl/iNswBFSN1mJ8hA2GxfsnzZdIGTC+S4lE0ypvYMp
	 E92zF7hQc3nOn7QX9SMS6fFLOyF5bxw2Q3ySZeErMn7jJo3mzXbB8yGysJQAiAjAIs
	 5yUuNU/zKJMz8755pkFjLE3dGh6Paw3Q0J4QX93kt+jantx2f8LQqtMPJfzJcUvF+I
	 lthrriD7UbeIE3no9F1ZfV6tPuujFJoxald8/LXO9INq+L3V0baPqZQtrwB1XtwG7w
	 k3Pdsz5VRQiOg==
Message-ID: <91b61f02-c533-41b9-b680-7de52a5c6918@kernel.org>
Date: Tue, 28 Jul 2026 20:55:47 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm/page_reporting: Add page_reporting_delay_ms module
 parameter
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, pratmal@google.com
Cc: akpm@linux-foundation.org, vbabka@kernel.org, sj@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, anshuman.khandual@arm.com,
 gthelen@google.com, surenb@google.com, mhocko@suse.com, jackmanb@google.com,
 hannes@cmpxchg.org, ziy@nvidia.com, liam@infradead.org, rppt@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260727230545.262579-1-pratmal@google.com>
 <amiN82J8p5z9l_Rm@lucifer>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzS5EYXZpZCBIaWxk
 ZW5icmFuZCAoQ3VycmVudCkgPGRhdmlkQGtlcm5lbC5vcmc+wsGQBBMBCAA6AhsDBQkmWAik
 AgsJBBUKCQgCFgICHgUCF4AWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaYJt/AIZAQAKCRBN
 3hD3AP+DWriiD/9BLGEKG+N8L2AXhikJg6YmXom9ytRwPqDgpHpVg2xdhopoWdMRXjzOrIKD
 g4LSnFaKneQD0hZhoArEeamG5tyo32xoRsPwkbpIzL0OKSZ8G6mVbFGpjmyDLQCAxteXCLXz
 ZI0VbsuJKelYnKcXWOIndOrNRvE5eoOfTt2XfBnAapxMYY2IsV+qaUXlO63GgfIOg8RBaj7x
 3NxkI3rV0SHhI4GU9K6jCvGghxeS1QX6L/XI9mfAYaIwGy5B68kF26piAVYv/QZDEVIpo3t7
 /fjSpxKT8plJH6rhhR0epy8dWRHk3qT5tk2P85twasdloWtkMZ7FsCJRKWscm1BLpsDn6EQ4
 jeMHECiY9kGKKi8dQpv3FRyo2QApZ49NNDbwcR0ZndK0XFo15iH708H5Qja/8TuXCwnPWAcJ
 DQoNIDFyaxe26Rx3ZwUkRALa3iPcVjE0//TrQ4KnFf+lMBSrS33xDDBfevW9+Dk6IISmDH1R
 HFq2jpkN+FX/PE8eVhV68B2DsAPZ5rUwyCKUXPTJ/irrCCmAAb5Jpv11S7hUSpqtM/6oVESC
 3z/7CzrVtRODzLtNgV4r5EI+wAv/3PgJLlMwgJM90Fb3CB2IgbxhjvmB1WNdvXACVydx55V7
 LPPKodSTF29rlnQAf9HLgCphuuSrrPn5VQDaYZl4N/7zc2wcWM7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <amiN82J8p5z9l_Rm@lucifer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/28/26 13:13, Lorenzo Stoakes (ARM) wrote:
> On Mon, Jul 27, 2026 at 11:05:45PM +0000, pratmal@google.com wrote:
>> From: Pratyush Mallick <pratmal@google.com>
>>
>> Currently, the free page reporting uses a hardcoded delay of
>> (2 HZ) between reporting intervals. While this is a reasonable
>> default, it lacks the flexibility to adapt to varying guest workloads.
>>
>> A low delay allows aggressive memory reclamation, returning unused
>> pages to the host as quickly as possible. However, during spiky
>> allocation/free churn, this immediate reporting can lead to a severe
>> performance penalty (nested page faults) as the guest re-allocates memory
>> that the host has just unmapped. In these scenarios, there is benefit
>> from increasing the delay to batch free pages over a longer window,
>> absorbing the churn without hypercall and re-fault overhead.
> 
> Since you're talking about increasing it, maybe set the floor at the current
> value of 2s?
> 
>>
>> This patch exposes the delay as a module parameter:
>> /sys/module/page_reporting/parameters/page_reporting_delay_ms, measured
>> in milliseconds and defaults to 2000ms.
> 
> I'm not sure this is great as it means we now have a parameter we have to
> support forever and autotuning becomes harder to implement, also if later the
> implementation is changed, this might prevent a reimplementation.

While I'd prefer to keep the implementation as simple as possible unless really
required, I guess auto-tune could be enabled by setting the parameter to e.g.,
-1 in the future.

> 
> Have you considered actually adding logic to detect the problem you're having
> and delay in that case?
> 
> It seems like this is the "easy" solution but it has a price too.
> 
>>
>> Signed-off-by: Pratyush Mallick <pratmal@google.com>
>> ---
>> v3:
>>  - Converted page_reporting_delay_ms from a sysctl to a module parameter.
>>  - Dropped the max value cap (PAGE_REPORTING_DELAY_MS_MAX).
>>  - Documented page_reporting_delay_ms in kernel-parameters.txt.
>>  - Updated code comments in mm/page_reporting.c.
>>  - v2: https://lore.kernel.org/linux-mm/3da27fde-25dc-4cb8-8e05-74cd26fc2f7c@kernel.org/T/#t
>>
>> v2:
>>  - Documented page_reporting_delay_ms in Documentation/admin-guide/sysctl/vm.rst.
>>  - v1: https://lore.kernel.org/linux-mm/20260722192935.1646848-1-pratmal@google.com/T/#u
>>
>> v1: Fixed feedback from RFC.
>>  - Added lower and upper cap to sysctl value.
>>  - Reverted the reordering on page_reporting_delay_ms.
>>  - Dropped the mod_delayed_work() change.
>>  - RFC: https://lore.kernel.org/linux-mm/20260714171456.2350037-1-pratmal@google.com/T/#u
>>  .../admin-guide/kernel-parameters.txt         |  6 ++++++
>>  mm/page_reporting.c                           | 21 ++++++++++++-------
>>  2 files changed, 19 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index b5493a7f8f22..364c2dce8e70 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -4810,6 +4810,12 @@ Kernel parameters
>>  			Adjust the minimal page reporting order. The page
>>  			reporting is disabled when it exceeds MAX_PAGE_ORDER.
>>
>> +	page_reporting.page_reporting_delay_ms=
>> +			[KNL] Free page reporting delay in milliseconds
>> +			Format: <unsigned integer>
>> +			Adjust the delay in milliseconds between free page
>> +			reporting intervals. Default is 2000 (2 seconds).
>> +
>>  	panic=		[KNL] Kernel behaviour on panic: delay <timeout>
>>  			timeout > 0: seconds before rebooting
>>  			timeout = 0: wait forever
>> diff --git a/mm/page_reporting.c b/mm/page_reporting.c
>> index 942e84b6908a..a67311468204 100644
>> --- a/mm/page_reporting.c
>> +++ b/mm/page_reporting.c
>> @@ -47,7 +47,11 @@ MODULE_PARM_DESC(page_reporting_order, "Set page reporting order");
>>   */
>>  EXPORT_SYMBOL_GPL(page_reporting_order);
>>
>> -#define PAGE_REPORTING_DELAY	(2 * HZ)
>> +static unsigned int page_reporting_delay_ms = 2 * MSEC_PER_SEC;
>> +module_param(page_reporting_delay_ms, uint, 0644);
>> +MODULE_PARM_DESC(page_reporting_delay_ms,
>> +		 "Set page reporting delay in milliseconds");
>> +
>>  static struct page_reporting_dev_info __rcu *pr_dev_info __read_mostly;
>>
>>  enum {
>> @@ -76,11 +80,11 @@ __page_reporting_request(struct page_reporting_dev_info *prdev)
>>  		return;
>>
>>  	/*
>> -	 * Delay the start of work to allow a sizable queue to build. For
>> -	 * now we are limiting this to running no more than once every
>> -	 * couple of seconds.
>> +	 * Delay the start of work to allow a sizable queue to build.
>> +	 * We limit this based on page_reporting_delay_ms.
>>  	 */
>> -	schedule_delayed_work(&prdev->work, PAGE_REPORTING_DELAY);
>> +	schedule_delayed_work(&prdev->work,
>> +			      msecs_to_jiffies(page_reporting_delay_ms));
> 
> Err, do we not want to limit this to something sensible? What if the user
> specifies 0 does it just hammer the system at that stage?

IIUC, 0 just means "as soon there is a suitable free page block to report, start
reporting immediately".

With 2s, we wait 2s before we start reporting immediately by kicking the
workqueue immediately.

So "0" does not mean "report all the time", rather "start reporting immediately
as we are notified about a pageblock to report".

-- 
Cheers,

David
