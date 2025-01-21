Received: from invmail3.skhynix.com (exvmail3.hynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF0E1BF24;
	Tue, 21 Jan 2025 01:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737424105; cv=none; b=UWNc89p1yazMd/n5AgZs0dF/BHnyIHwS9LMoX15a8As1em7PGhu/XbhIx5yrPaiVSMMDskAQUNHdP42wOEqkCqQYufcwNDXsm8pCyuexXPb+hXTRrh8CtI5CuOSc2WNOPFA40vnBdZ5OiBmtaFG81CM/x4Gu9VgDJk1cnDTrQaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737424105; c=relaxed/simple;
	bh=2/mEdBE2yvlCpmTN78UoMnQ+o/YZsUHSaie3PxaVDBM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UzirpO3Niu8lXSRPVFk6gKSQFMhAudOEGDK3z5szrqaH55TBXAUfCXeDjLcF78ZIsguohT3moyFiJkr4AClwmvC0WhKXA2jdHA0cWogBu/fSilO6eNgrr56OurH3xddyikdIT8YlZYUtsuWwEx3/G93HMePdet9d3bng+FwdaOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-791ff700000194b3-74-678efcd88b78
Message-ID: <1495dc28-f16c-4990-ad89-2a90b79a80b8@sk.com>
Date: Tue, 21 Jan 2025 10:48:08 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: kernel_team@skhynix.com,
 "janghyuck.kim@samsung.com" <janghyuck.kim@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Vlastimil Babka <vbabka@suse.cz>, Roman Gushchin <roman.gushchin@linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm: slub: Panic if the object corruption is checked.
To: Hyesoo Yu <hyesoo.yu@samsung.com>, Hyeonggon Yoo <42.hyeyoo@gmail.com>
References: <CGME20250120083041epcas2p30d61ee801c1db5a7ebdf26fdc642883f@epcas2p3.samsung.com>
 <20250120082908.4162780-1-hyesoo.yu@samsung.com>
 <CAB=+i9R-9LQWJFGSJJ5dUqwkoFQK8VDxEwi-4Sb73pTP+xw+wQ@mail.gmail.com>
 <20250121005452.GB610565@tiffany>
Content-Language: en-US
From: Hyeonggon Yoo <hyeonggon.yoo@sk.com>
In-Reply-To: <20250121005452.GB610565@tiffany>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRmVeSWpSXmKPExsXC9ZZnoe6NP33pBkemKVpM7DGwmLN+DZvF
	9W9vGC2eHGhntPjbeYHVYmV3M5vF5jnFFgvblrBYXN41h83i3pr/rBZtn/8BiSUbmSwmrhG1
	mN3Yx+jA57Fz1l12jwWbSj02repk89j0aRK7R9fbK0weJ2b8ZvF4cmU6k8fChqnMHov7JrN6
	9G1ZxehxZsERdo/Pm+QCeKK4bFJSczLLUov07RK4MpYcXstS8IavYueSI2wNjK08XYycHBIC
	JhK3Hm5khbFvfH3AAmLzClhKnNjdyAhiswioSlzbfgYqLihxcuYTMFtUQF7i/q0Z7F2MXBzM
	AptYJNqXHANrEBbwlFj1fgXYUBEBL4mzPR9YQYqEBH4zSvy73c4OkmAWEJe49WQ+UxcjBweb
	gJbEjs5UkDCngJ5E15GDbBAlZhJdW7sYIWx5ieats5lB5kgILGKXOPenhRniakmJgytusExg
	FJyF5MBZSFbMQjJrFpJZCxhZVjGKZOaV5SZm5hjrFWdnVOZlVugl5+duYgRG5rLaP5E7GL9d
	CD7EKMDBqMTDe8CqL12INbGsuDL3EKMEB7OSCK/oh550Id6UxMqq1KL8+KLSnNTiQ4zSHCxK
	4rxG38pThATSE0tSs1NTC1KLYLJMHJxSDYx+uWfmlkhoOsimSb/ffGDe7z+aGW9ecx+f/ary
	zLdkrZlFEgqVKTZnLuWULF2/N/TP28Bvu/vsftrzhimf/johocZ4Ynpwa+TZa9wvo3orWRM/
	Jp/ulOdR657WJVXDzTPhxh2f9OnLtcSePz3z+q3Zgc9x3v8d1G6pNglPZl7GeVyhqmWfeaoS
	S3FGoqEWc1FxIgDlBbJAyAIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRmVeSWpSXmKPExsXCNUOnRPfGn750g/52EYuJPQYWc9avYbO4
	/u0No8WTA+2MFn87L7BarOxuZrPYPKfY4vDck6wWC9uWsFhc3jWHzeLemv+sFm2f/wGJJRuZ
	LCauEbWY3djH6MDvsXPWXXaPBZtKPTat6mTz2PRpErtH19srTB4nZvxm8XhyZTqTx8KGqcwe
	i/sms3r0bVnF6LH4xQcmjzMLjrB7fN4kF8AbxWWTkpqTWZZapG+XwJWx5PBaloI3fBU7lxxh
	a2Bs5eli5OSQEDCRuPH1AQuIzStgKXFidyMjiM0ioCpxbfsZqLigxMmZT8BsUQF5ifu3ZrB3
	MXJxMAtsYpFoX3IMrEFYwFNi1fsVrCC2iICXxNmeD6wgRUICvxkl/t1uZwdJMAuIS9x6Mp+p
	i5GDg01AS2JHZypImFNAT6LryEE2iBIzia6tXYwQtrxE89bZzBMY+WYhuWMWkkmzkLTMQtKy
	gJFlFaNIZl5ZbmJmjplecXZGZV5mhV5yfu4mRmCMLav9M2kH47fL7ocYBTgYlXh4D1j1pQux
	JpYVV+YeYpTgYFYS4RX90JMuxJuSWFmVWpQfX1Sak1p8iFGag0VJnNcrPDVBSCA9sSQ1OzW1
	ILUIJsvEwSnVwDjhfE3/+Qvftuve339qbqfGmRcioc2r5CwMjBgqWGvnfrVf1fUzoW/Cbj3O
	h8En44NcfaYqnL3st2zKtXlX07YqGNy1fnRu2rzb5bNf98R2vUk4+Zrxn1/VwaiQ5VUOV73r
	c1mONFecD1gqyt/GKHfSTUjz9XNTnaiJUdbXaqwPvgyaUVWk+lyJpTgj0VCLuag4EQA+y8Bc
	rQIAAA==
X-CFilter-Loop: Reflected



On 1/21/2025 9:54 AM, Hyesoo Yu wrote:
> On Tue, Jan 21, 2025 at 12:41:01AM +0900, Hyeonggon Yoo wrote:
>> On Mon, Jan 20, 2025 at 5:30 PM Hyesoo Yu <hyesoo.yu@samsung.com> wrote:
>>>
>>> If a slab object is corrupted or an error occurs in its internal
>>> value, continuing after restoration may cause other side effects.
>>> At this point, it is difficult to debug because the problem occurred
>>> in the past. A flag has been added that can cause a panic when there
>>> is a problem with the object.
>>
>> Hi Hyesoo,
>>
>> I'm concerned about this because it goes against the effort to avoid
>> introducing new BUG() calls [1].
>>
>> And I think it would be more appropriate to use existing panic_on_warn
>> functionality [2] which causes
>> a panic on WARN(), rather than introducing a SLUB-specific knob to do
>> the same thing.
>>
>> However SLUB does not call WARN() and uses pr_err() instead when
>> reporting an error.
>> Vlastimil and I talked about changing it to use WARN() a while ago
>> [3], but neither of us
>> have done that yet.
>>
>> Probably you may want to look at it, as it also aligns with your purpose?
>> FYI, if you would like to work on it, please make sure that it WARN()
>> is suppressed during kunit test.
>>
>> [1] https://docs.kernel.org/process/deprecated.html#bug-and-bug-on
>> [2] https://www.kernel.org/doc/html/v6.9/admin-guide/sysctl/kernel.html#panic-on-warn
>> [3] https://lore.kernel.org/linux-mm/d4219cd9-32d3-4697-93b9-6a44bf77d50c@suse.cz
>>
>> Best,
>> Hyeonggon
> 
> Thanks for response.
> 
> Using warn() instead of panic, is a great idea.
> Thanks for pointing out what I missed.

Just for clarification, I think changing the common error reporting
logic (like, slab_bug()) to use WARN() will be preferable to inserting
new WARN()s at random points, which is what this patch does now.

Best,
Hyeonggon
