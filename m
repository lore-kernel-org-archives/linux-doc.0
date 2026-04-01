Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAEB2FD1AA
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 17:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775066340; cv=none; b=RdFhWiPW0rQ/Jv6Y2VeyjjAzrSAWJRBaQPmRQYA4YiKjZZIscU+iKAq3efnmud1ohtDEBiONlLpqiWP8Y4Se/KTj6XpvqxadPGspQ71KALoTViNzHABoQkkPmqbig1oGwdBIUVEAAgp3BSOo98cjMKUTyydBYQpwhKHHIHWYN20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775066340; c=relaxed/simple;
	bh=fYH0RQesCifdagWKiU2XfG7la8xWFJnvOPrH23vuGr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qlMbCdssHT/32vjUdX+t4V8cX+ZDzbQhr+kNi0Wwm3IxuHj5x7GBzvXcpuhxvmBRpshRP/coOE4ujIduCtXomSGxAtiCT87jBfSED/9W2doJS4Aq9nbsr7ZxhddOkxJ5jYTzr+KPh0UWQDi5wuiPSgm8slei990mwv3Q2kjeor8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=brVwg4Ls; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="brVwg4Ls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775066338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xR4zZT/ej/HzBzSkpmqCgfenqLuStcJxwlMPjkzAacE=;
	b=brVwg4Lsf3Qc2YW5vpH/J1EfFflDSMLz442wkqwqMfi+exlKQ9+jznt/r0M15JkiFzbbyh
	nfG97FBujvmhhMN6rJJ4Ql0A2gPAF+Cq7iyJEmRgkQV++qxlGOpQHBdfDR3sjx4IQRzUUu
	4qdb5xWvi1Dy5kvdEOm3P30RhohXBQ0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-eVuSYXizML68Z3Yn9CBGnQ-1; Wed,
 01 Apr 2026 13:58:56 -0400
X-MC-Unique: eVuSYXizML68Z3Yn9CBGnQ-1
X-Mimecast-MFC-AGG-ID: eVuSYXizML68Z3Yn9CBGnQ_1775066334
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D3A781956094;
	Wed,  1 Apr 2026 17:58:53 +0000 (UTC)
Received: from [10.22.81.104] (unknown [10.22.81.104])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F044C19560AB;
	Wed,  1 Apr 2026 17:58:49 +0000 (UTC)
Message-ID: <81745651-b9ae-4b95-9f6a-26bf8c502eb9@redhat.com>
Date: Wed, 1 Apr 2026 13:58:49 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] doc: Add CPU Isolation documentation
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Gabriele Monaco <gmonaco@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marcelo Tosatti <mtosatti@redhat.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-doc@vger.kernel.org, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Bagas Sanjaya <bagasdotme@gmail.com>
References: <20260326140055.41555-1-frederic@kernel.org>
 <90a6512f-5b6b-4781-87f3-4580ac426c37@redhat.com>
 <ac0-LzTrOJIECLoH@localhost.localdomain>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ac0-LzTrOJIECLoH@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 4/1/26 11:47 AM, Frederic Weisbecker wrote:
> Le Thu, Mar 26, 2026 at 03:17:48PM -0400, Waiman Long a écrit :
>> On 3/26/26 10:00 AM, Frederic Weisbecker wrote:
>>> nohz_full was introduced in v3.10 in 2013, which means this
>>> documentation is overdue for 13 years.
>>>
>>> Fortunately Paul wrote a part of the needed documentation a while ago,
>>> especially concerning nohz_full in Documentation/timers/no_hz.rst and
>>> also about per-CPU kthreads in
>>> Documentation/admin-guide/kernel-per-CPU-kthreads.rst
>>>
>>> Introduce a new page that gives an overview of CPU isolation in general.
>>>
>>> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
>>> ---
>>> v2:
>>>      - Fix links and code blocks (Bagas and Sebastian)
>>>      - Isolation is not only about userspace, rephrase accordingly (Valentin)
>>>      - Paste BIOS issues suggestion from Valentin
>>>      - Include the whole rtla suite (Valentin)
>>>      - Rephrase a few details (Waiman)
>>>      - Talk about RCU induced overhead rather than slower RCU (Sebastian)
>>>
>>>    Documentation/admin-guide/cpu-isolation.rst | 357 ++++++++++++++++++++
>>>    Documentation/admin-guide/index.rst         |   1 +
>>>    2 files changed, 358 insertions(+)
>>>    create mode 100644 Documentation/admin-guide/cpu-isolation.rst
>>>
>>> diff --git a/Documentation/admin-guide/cpu-isolation.rst b/Documentation/admin-guide/cpu-isolation.rst
>>> new file mode 100644
>>> index 000000000000..886dec79b056
>>> --- /dev/null
>>> +++ b/Documentation/admin-guide/cpu-isolation.rst
>>> @@ -0,0 +1,357 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +=============
>>> +CPU Isolation
>>> +=============
>>> +
>>> +Introduction
>>> +============
>>> +
>>> +"CPU Isolation" means leaving a CPU exclusive to a given workload
>>> +without any undesired code interference from the kernel.
>>> +
>>> +Those interferences, commonly pointed out as "noise", can be triggered
>>> +by asynchronous events (interrupts, timers, scheduler preemption by
>>> +workqueues and kthreads, ...) or synchronous events (syscalls and page
>>> +faults).
>>> +
>>> +Such noise usually goes unnoticed. After all synchronous events are a
>>> +component of the requested kernel service. And asynchronous events are
>>> +either sufficiently well distributed by the scheduler when executed
>>> +as tasks or reasonably fast when executed as interrupt. The timer
>>> +interrupt can even execute 1024 times per seconds without a significant
>>> +and measurable impact most of the time.
>>> +
>>> +However some rare and extreme workloads can be quite sensitive to
>>> +those kinds of noise. This is the case, for example, with high
>>> +bandwidth network processing that can't afford losing a single packet
>>> +or very low latency network processing. Typically those usecases
>>> +involve DPDK, bypassing the kernel networking stack and performing
>>> +direct access to the networking device from userscace.
>> As also pointed by by Sashiko, there is a typo "userscace" -> "userspace".
>> There are also typos reported in
>>
>> https://sashiko.dev/#/patchset/20260326140055.41555-1-frederic%40kernel.org
> Thanks!
>
> What do you think about these lines of Sashiko's review:
>
> """
> Does this script violate the cgroup v2 "no internal process" constraint?
> By enabling the cpuset controller on the test directory's
> cgroup.subtree_control file, the cgroup cannot also contain processes.
> """
>
> That is confusing me...

I would say that the "no internal process" is a suggestion for the 
cgroup setup. The real world is actually more complicated. So I will 
just ignore that.

Cheers,
Longman

