Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1463DA7D0
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 08:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226267; cv=none; b=gNN+vNzrbfTIjNza+s6vAzFi10MgLfAHqMTvIU27IzcOqNoEfCY+m/h15/YZF+oGn35E8QZvCVhjWah/e0VJGeWE5/BnSrXznDMDmH4OFYlfu6rYulMw7G2/nEOfohfrRqbWZctQprGMCpiYlRx0P9RQnnsgYsnysq4FzTtqxoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226267; c=relaxed/simple;
	bh=bGEmrgMWen4LV6Ltqv8pga9VpCzXyLWcq7aWOwB3udA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Uw84X05XkKyEV00dsaLCaaqsqYVuB5ZI7+XJiVXnqI+caYCzKy9mIyZFSu69GZcHXPVAj2YJbkB0NlCX1cRFNkJjznltJKo9gt5CNopRkI/HD5HIKciQwvKexejhY5sivP+5hyoOzCM0Etr79aKPPdIZa39kJbPbRUyyXx3hxAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=st0KsTwo; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="st0KsTwo"
Message-ID: <8027838a-0618-4310-ab8a-8e749624de1a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785226253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tLjOwqbAm7TosLcOO9wf/KeqJnGFq11zCgMEk9cxeVA=;
	b=st0KsTwoLyssF9jelbLeTHnFva0vcG7cNGrq76vZS3DNPrt1Tdl/CvCn65QHR83jzRgehV
	1QiRjg0AKNMyhmwG4j50jYPI5Ok1aT1XTdX9T3gqMVDcpvwHOJfOoYaNJPyG0S7JQs0oZr
	VLUaLvtfmNqM/AL5Rbzw1f3RYD+lzus=
Date: Tue, 28 Jul 2026 16:10:28 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: cui.tao@linux.dev, Johannes Weiner <hannes@cmpxchg.org>,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Jonathan Corbet <corbet@lwn.net>, Tao Cui <cuitao@kylinos.cn>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: accounting/psi: drop stale 500ms window minimum
 from trigger docs
To: Suren Baghdasaryan <surenb@google.com>
References: <20260723125025.457841-1-cui.tao@linux.dev>
 <CAJuCfpGhijcg1N2AxbRbTHf7FvtaTG_xYL1fPVUA=k7snPYtzA@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <CAJuCfpGhijcg1N2AxbRbTHf7FvtaTG_xYL1fPVUA=k7snPYtzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



在 2026/7/27 14:08, Suren Baghdasaryan 写道:
> On Thu, Jul 23, 2026 at 5:51 AM Tao Cui <cui.tao@linux.dev> wrote:
>>
>> From: Tao Cui <cuitao@kylinos.cn>
>>
>> psi.rst says trigger windows range "from 500ms to 10s" with a 50ms min
>> polling interval. That minimum was removed in commit 519fabc7aaba ("psi:
>> remove 500ms min window size limitation for triggers"): the polling-rate
>> protection moved to gating trigger creation behind CAP_SYS_RESOURCE,
>> which also stopped capping psi event latency.
>>
>> Update the wording accordingly: windows up to 10s with no enforced
>> minimum; trigger creation requires CAP_SYS_RESOURCE on cgroup pressure
>> files, while unprivileged users on /proc/pressure/ are limited to 2s
>> multiples.
>>
>> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
>> ---
>>  Documentation/accounting/psi.rst | 17 ++++++++---------
>>  1 file changed, 8 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/accounting/psi.rst b/Documentation/accounting/psi.rst
>> index d455db3e5808..aae57fb5f15c 100644
>> --- a/Documentation/accounting/psi.rst
>> +++ b/Documentation/accounting/psi.rst
>> @@ -99,15 +99,14 @@ psi metric and deactivates upon exit from the stall state. While system is
>>  in the stall state psi signal growth is monitored at a rate of 10 times per
>>  tracking window.
>>
>> -The kernel accepts window sizes ranging from 500ms to 10s, therefore min
>> -monitoring update interval is 50ms and max is 1s. Min limit is set to
>> -prevent overly frequent polling. Max limit is chosen as a high enough number
>> -after which monitors are most likely not needed and psi averages can be used
>> -instead.
>> -
>> -Unprivileged users can also create monitors, with the only limitation that the
>> -window size must be a multiple of 2s, in order to prevent excessive resource
>> -usage.
>> +The kernel accepts window sizes up to 10s. The 10s maximum is chosen as a
>> +high enough number after which monitors are most likely not needed and psi
>> +averages can be used instead.
>> +
>> +To prevent excessive resource usage, trigger creation is restricted to
>> +privileged users (CAP_SYS_RESOURCE) on cgroup pressure files; on the
>> +system-wide /proc/pressure/ files unprivileged users can create monitors
>> +as well, limited to window sizes that are a multiple of 2s.
> 
> Hmm. From this wording it sounds like we have different trigger
> creation rules for system-wide vs cgroup pressure files, which I think
> is not true. AFAICT, for both types, we restrict unprivileged users to
> creating triggers with 2s window size multiples.
> 

Sorry, I missed part of the history here. 8b39d20eceed reverted the
cgroup-specific gating that 519fabc7aaba added, so the 2s-multiple rule
applies the same way to both system-wide and cgroup files. I'll send a
v2 that keeps the window-range fix but restores the original unified
wording.

Thanks,
Tao

>>
>>  When activated, psi monitor stays active for at least the duration of one
>>  tracking window to avoid repeated activations/deactivations when system is
>> --
>> 2.43.0
>>

