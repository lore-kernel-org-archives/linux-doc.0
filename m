Received: from mta1.migadu.com (out-216.mta1.migadu.com [95.215.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A24395D9F
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 22:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786661553; cv=none; b=AdRQ7x3WdRSnQngvNR4EwGrGks8NITIamyPZAv9S74YmIUP869UhqWsS4cN5TC5mHvzyulEnRBsBtyuJzjdmd5mlk5m6Yge2gFT3wdm8SvGYez6VOK/VlUOjxgu+SH5qe7GjCHIu9cuCQz8BR3LclcEStwNdRoVgWs4Bi/ZHubA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786661553; c=relaxed/simple;
	bh=re9+XxLw1TkeBInlOnI7QiXrhpgAnrA1aQ0J6jxleZc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O1dKfDUtxR6iHP7uMzOty38Qma09aPRzVuih9mqSKw9L4l/BYCZKkRamqDz8QAZkyqw/aRfZtc3hWqA4mQANKe5dXhswy1yjUHUGqQaSOjAGrSMY20kCgkNhnMT3K+41WMFgDn75+OfCeFM4Z2lwWfAJMmA8QOIHR7iDqUqYpwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QIrkGpOZ; arc=none smtp.client-ip=95.215.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QIrkGpOZ"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=re9+XxLw1TkeBInlOnI7QiXrhpgAnrA1aQ0J6jxleZc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786661549; v=1; x=1787266349;
 b=QIrkGpOZp18slea+Gno071DxQPWBlyycSVTn2BjdlPyJhx3rNFodVi2cDJOMFe7GObTGD3Aj
 cMLRvFskMvY9Dw+xdOJB5Ruv4C4irIPP0WZVI55FkiAhQQ2CKxRraenOK+0UuxNQWPk7Igx+mQL
 BA5PpIZKwblzaUK7vLSPtDmc=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from [192.168.1.116] (111.162.215.50)
	by smtp.migadu.com with ESMTPS id 97929fad141b3a25;
	Thu, 13 Aug 2026 22:52:29 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <2a12e8f3-e954-4e1a-b12f-667dcdb8c011@linux.dev>
Date: Fri, 14 Aug 2026 06:52:23 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: cui.tao@linux.dev, corbet@lwn.net, rdunlap@infradead.org,
 skhan@linuxfoundation.org, arighi@nvidia.com, yphbchou0911@gmail.com,
 jpiecuch@google.com, ihor.solodrai@linux.dev, suzhidao@xiaomi.com,
 luoliang@kylinos.cn, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, cuitao@kylinos.cn
Subject: Re: [PATCH 2/2] sched_ext: fix stale references in doc comments
To: Tejun Heo <tj@kernel.org>
References: <20260811073801.342165-1-cui.tao@linux.dev>
 <20260811073801.342165-3-cui.tao@linux.dev>
 <7496accfcf61b49e8fe5675a3d941c48@kernel.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <7496accfcf61b49e8fe5675a3d941c48@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello, Tejun.

在 2026/8/13 02:38, Tejun Heo 写道:
> Hello, Tao.
> 
> On Tue, Aug 11, 2026 at 03:38:01PM +0800, Tao Cui wrote:
>> - * One user of this function is scx_bpf_dispatch() which can be called
>> + * One user of this function is scx_bpf_dsq_insert() which can be called
>>   * recursively as sub-sched dispatches nest. Always inline to reduce stack usage
>>   * from the call frame.
> 
> This one isn't a leftover of the scx_bpf_dispatch() rename.
> scx_bpf_dsq_insert() doesn't call scx_dispatch_sched() and can't nest.
> The comment is a typo for scx_bpf_sub_dispatch(), which a parent's
> ops.dispatch() calls to trigger dispatching on a child scheduler, so the
> calls nest as sub-scheds do. Please use scx_bpf_sub_dispatch() instead.
Ah, I wrongly assumed it was a rename leftover, thanks for the
explanation. scx_bpf_sub_dispatch() makes sense given the nesting. Will
fix these up and send a v2 rebased on sched_ext/for-7.3.
> 
>> 	 * - sleeping (%SCX_DEQ_SLEEP)
>> 	 * - being moved to another CPU
>> 	 * - being temporarily taken off the queue for an attribute change
>> -	 *   (%SCX_DEQ_SAVE)
> 
> SCX_DEQ_SAVE was never defined, but these dequeues are flagged with
> %SCX_DEQ_SCHED_CHANGE which ops.quiescent() does receive. Please replace
> the reference instead of dropping it.
> 
>> +	 * '_' and '.' chars. Exposed via
>> +	 * /sys/kernel/sched_ext/root/ops while the BPF scheduler is enabled.
> 
> @name applies to sub-schedulers too and they show it the same way under
> their own directories. Maybe something like "Exposed via the ops file in
> the scheduler's sysfs directory, /sys/kernel/sched_ext/root/ops for the
> root scheduler, while the BPF scheduler is enabled."
> 
> The first hunk no longer applies to sched_ext/for-7.3. Please base v2 on
> that branch.
> 
> Thanks.
> 

